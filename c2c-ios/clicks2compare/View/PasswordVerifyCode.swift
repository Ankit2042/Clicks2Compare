//
//  PasswordVerifyCode.swift
//  clicks2compare
//
//  Created by Nitin Singh on 16/12/23.
//

import SwiftUI

struct PasswordVerifyCode: View {
    
    @ObservedObject var passwordVerifyCodeViewModel = PasswordVerifyCodeViewModel()
    @ObservedObject var passwordEmailViewModel: PasswordEmailViewModel = PasswordEmailViewModel()
    @FocusState private var iskeyboardShowing: Bool
    
    var EmailID: String
    init(EmailID: String) {
        self.EmailID = EmailID
        self.passwordVerifyCodeViewModel.email = EmailID
        self.passwordEmailViewModel.value = EmailID
        
    }
    @State private var countdown: Int = 120
          @State private var isResendEnabled: Bool = false
          @State private var timer: Timer?
       
    
    var body: some View {
        
        ZStack {
            VStack {
                
                //            MARK: Header
                
                ZStack{
                    Image("top_background")
                        .resizable()
                        .scaledToFit()
                    
                    HStack{
                        
                        VStack(alignment: .leading) {
                            Text("Verify")
                                .font(.system(size: 30).bold())
                                .foregroundColor(.white)
                            
                            
                            
                        }
                        .padding(.top,-15)
                        .padding(.leading, 15)
                        
                        
                        Spacer()
                    }
                    
                }
                VStack{
                    
                    
                    Text("Please type verification code sent to your registered email ")
                        .multilineTextAlignment(.center)
                    
                    
                    Text("\(self.EmailID)")
                        .bold()
                    
                    
                    HStack(spacing: 0) {
                        ForEach(0..<6, id: \.self){index in
                            OTPTextBox(index)
                        }
                        
                    }.background(content : {
                        TextField("", text: $passwordVerifyCodeViewModel.code)
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                            .frame(width: 1, height: 1)
                            .opacity(0.001)
                            .blendMode(.screen)
                            .focused($iskeyboardShowing)
                    })
                    .contentShape(Rectangle())
                    .onTapGesture {
                        iskeyboardShowing.toggle()
                    }
                    .padding(.bottom,20)
                    .padding(.top,10)
                    .padding()
                    
                    
                    Button {
                        self.passwordVerifyCodeViewModel.VerifyCode()
                    } label: {
                        HStack{
                            Text("Verify OTP")
                                .padding(.vertical,13)
                                .frame(maxWidth: .infinity)
                                .background(Color.theme.buttonColor.cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.system(size: 20).bold())
                        }
                    }
                    .disableWithOpacity(passwordVerifyCodeViewModel.code.count < 6)
                    
                    .alert(isPresented: $passwordVerifyCodeViewModel.isPresentingErrorAlert) {
                        Alert(title: Text("Message"), message: Text(passwordVerifyCodeViewModel.message),
                              dismissButton: .default(Text("OK"))
                        )}
                    
                    NavigationLink(
                        destination: ForgotPass(Token: self.passwordVerifyCodeViewModel.code , emailID: self.EmailID),
                        isActive: self.$passwordVerifyCodeViewModel.ForgotPas,
                        label: {
                            EmptyView()
                        }
                    )
                    .isDetailLink(false)
                    .onDisappear {
                        // Stop the timer when navigating away from this view
                        resetTimer()
                    }

//                    MARK: Resend OTP
                    HStack {
                        Text("Resend Code in \(countdown) seconds")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                        Button(action: {
                            if isResendEnabled {
                                resetTimer()
                                startTimer()
                                // Add your logic to resend OTP here
                                //
                                passwordEmailViewModel.PasswordEmail()
                            }
                        }) {
                            Text("Resend")
                                .font(.system(size: 16))
                                .foregroundColor(isResendEnabled ? .blue : .gray)
                        }
                    }
                    .padding(.vertical, 20)
                    
                    
                    
                    
                    Spacer()
                }
                .padding(.horizontal,30)
                
                .navigationBarBackButtonHidden(true)
            }            
            
            
            if passwordVerifyCodeViewModel.isProgressView {
                HUDProgressView(placeHolder: "Please Wait", show: $passwordVerifyCodeViewModel.isProgressView)
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            // Start the timer when the view appears
            startTimer()
        }
    }
    
    @ViewBuilder
    func OTPTextBox(_ index: Int)-> some View{
        ZStack{
            if passwordVerifyCodeViewModel.code.count > index {
                let startIndex = passwordVerifyCodeViewModel.code.startIndex
                let charIndex = passwordVerifyCodeViewModel.code.index(startIndex, offsetBy: index)
                let charToString = String(passwordVerifyCodeViewModel.code[charIndex])
                Text(charToString)
                
            }else{
                Text(" ")
            }
            
        }
        .frame(width: 45, height: 45)
        .background{
            let status = (iskeyboardShowing && passwordVerifyCodeViewModel.code.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? Color.primary : .gray, lineWidth: status ? 1 : 0.5)
        }
        .frame(maxWidth: .infinity)
        
    }
    
    private func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if countdown > 0 {
                    countdown -= 1
                } else {
                    isResendEnabled = true
//                    resetTimer()
                }
            }
        }

        private func resetTimer() {
            countdown = 120
            isResendEnabled = false
            timer?.invalidate()
            timer = nil
        }
}

struct PasswordVerifyCode_Previews: PreviewProvider {
    static var previews: some View {
        PasswordVerifyCode(EmailID: "EmailID")
    }
}
