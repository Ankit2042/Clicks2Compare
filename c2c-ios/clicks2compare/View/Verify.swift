//
//  Verify.swift
//  clicks2compare
//
//  Created by Nitin Singh on 15/12/23.
//

import SwiftUI

struct Verify: View {
    
    
    @ObservedObject var verifyViewModel: VerifyViewModel = VerifyViewModel()
    @State private var otpText: String = ""
    @FocusState private var iskeyboardShowing: Bool
    @ObservedObject var signupResentOTPViewModel: SignupResentOTPViewModel = SignupResentOTPViewModel()
    var email: String
    init(email: String) {
        self.email = email
        self.verifyViewModel.email = email
        self.signupResentOTPViewModel.email = email
         
    }
    @State private var countdown: Int = 5
       @State private var isResendEnabled: Bool = false
       @State private var timer: Timer?
    @Environment(\.sizeCategory) var sizeCategory
    var body: some View {
        VStack {
            
            // MARK: Header
            
            ZStack{
                Image("top_background")
                    .resizable()
                    .scaledToFit()
                
                HStack{

                    VStack(alignment: .leading) {
                        Text("Verify your")
                            .font(.system(size: 30).bold())
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                            
                           
                        
                        Text("Account")
                            .font(.system(size: 30).bold())
                            .lineLimit(1)
                            .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                            .foregroundColor(.white)
                           
                          
                    }
                    .padding(.top,-15)
                    .padding(.leading, 15)
                    
                    
                    Spacer()
                }
            }
            
            Image("verification")
            
            VStack{
                Text("Please type verification code sent to your registered email \(email)")
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
               
                
                HStack(spacing: 0) {
                    ForEach(0..<6, id: \.self){index in
                        OTPTextBox(index)
                    }
                    
                }.background(content : {
                    TextField("", text: $verifyViewModel.code)
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
                .padding()
                
                
                // MARK: Verify Button
                
                Button {
                    if verifyViewModel.VerifyInput(){
                        verifyViewModel.Verify()
                    }
                    
                } label: {
                    HStack{
                        Text("Verify")
                            .padding(.vertical,13)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.buttonColor.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.system(size: 20).bold())
                    }
                    
                    
                }
                .disableWithOpacity(verifyViewModel.code.count < 6)
                .alert(isPresented: $verifyViewModel.isPresentingErrorAlert) {
                    if self.verifyViewModel.issuccess {
                        return  Alert(title: Text("Message"), message: Text(self.verifyViewModel.message), dismissButton: .default(Text("OK")){
                            self.verifyViewModel.navigate = true
                        })
                    } else {
                        return  Alert(title: Text("Message"), message: Text("Invalid Code Try Again"), dismissButton: .default(Text("OK")))
                    }
                }
                

                NavigationLink(
                    destination: Login(),
                    isActive: $verifyViewModel.navigate,
                    label: {
                        EmptyView()
                    }
                )
                .isDetailLink(false)
            
//                MARK: Resend Button
                
                HStack {
                    Text("Resend OTP in \(countdown) seconds")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Spacer()
                    Button(action: {
                        if isResendEnabled {
                            resetTimer()
                            startTimer()
                            // Add your logic to resend OTP here
                            signupResentOTPViewModel.SentOTP()
                        }
                    }) {
                        Text("Resend")
                            .font(.system(size: 16))
                            .foregroundColor(isResendEnabled ? .blue : .gray)
                    }
                }
                .padding(.vertical, 20)

                HStack(spacing:5){
                   
                    NavigationLink {
                        Login()
                    } label: {
                        HStack{
                            Text("Back To Login")
                                .foregroundColor(Color.theme.loginTextColor)
                        }
                        
                        
                    }
                }
                .padding(.top)
                
            }
            .padding(.horizontal)
            
            Spacer()
                .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea()
        .onAppear(){
            startTimer()
        }
        
    }
    
    // MARK: OTP TEXT BOX
    
    @ViewBuilder
    func OTPTextBox(_ index: Int)-> some View{
        ZStack{
            if verifyViewModel.code.count > index {
                let startIndex = verifyViewModel.code.startIndex
                let charIndex = verifyViewModel.code.index(startIndex, offsetBy: index)
                let charToString = String(verifyViewModel.code[charIndex])
                Text(charToString)
                
            }else{
                Text(" ")
            }
            
        }
        .frame(width: 45, height: 45)
        .background{
            let status = (iskeyboardShowing && verifyViewModel.code.count == index)
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
            countdown = 5
            isResendEnabled = false
            timer?.invalidate()
            timer = nil
        }
}

struct Verify_Previews: PreviewProvider {
    static var previews: some View {
        Verify(email: "Test@Gmail.com")
    }
}


//    extension View {
//        func disableWithOpacity( condition: Bool)->some View{
//            self
//                .disabled(condition)
//                .opacity(condition ? 0.6 : 1)
//        }
//    }
//
//
//    extension Binding where Value == String {
//        func limit(_ length: Int)-> Self{
//            if self.wrappedValue.count > length{
//                DispatchQueue.main.async {
//                    self.wrappedValue = String(self.wrappedValue.prefix(length))
//                }
//            }
//            return self
//        }
//    }
