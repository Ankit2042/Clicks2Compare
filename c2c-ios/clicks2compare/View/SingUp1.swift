//
//  SingUp.swift
//  clicks2compare
//
//  Created by Nitin Singh on 02/12/23.
//

import SwiftUI
import Combine

struct SingUp1: View {
    
    @ObservedObject var signUpModel: SingUpViewModel = SingUpViewModel()
    
    
    @State var countryCode: String =  "+971"
    @State var referralPhone: String = ""
        
    @Environment(\.sizeCategory) var sizeCategory

        

    var body: some View {
        ZStack{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    // MARK: Header
                    ZStack{
                        Image("top_background")
                            .resizable()
                            .scaledToFit()

                        HStack{

                            VStack(alignment: .leading) {
                                Text("Create")
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
                    
                    CenterImage(light: Image("logo"), dark: Image("whitelogo"))
                        .padding(.top, -20)
                    
                   
                    // MARK: TextField
                    VStack{
                       
                        
                        customTextfFld(label: "Name", PlaceHolder: "Name", required: true, secure: false, bVariable: $signUpModel.name)
                        customTextfFld(label: "Email", PlaceHolder: "Email", required: true, secure: false, bVariable: $signUpModel.email)
                            .autocapitalization(.none)
//
                        
                        RecommendedBy(Selected: $signUpModel.recommendedby, label: "Recommended By", required: true)
                            
//
                        PhoneNumberWithCode(PhoneNumber: $referralPhone, CountryDialcode: $countryCode, required: true, label: "Phone Number")
                            .padding(.top,5)
                        
                        SecureInputView(title: "", text: $signUpModel.password, PlaceHolder: "Enter Password", label: "Password", required: true)
                            
                        
                        // MARK: SignUp Button
                        Spacer().frame(height: 15)
                        
                        Button(action: {
                            signUpModel.refralphone = countryCode+referralPhone
                            if signUpModel.validateInputs(){
                                self.signUpModel.SingUp()
                            }
                            
                        }) {
                            Text("Signup")
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color.theme.buttonColor.cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.system(size: 20).bold())
                        }
                        
                        
                        NavigationLink(
                            destination: Verify(email: signUpModel.email),
                            isActive: self.$signUpModel.OTPverify,
                            label: {
                                EmptyView()
                            }
                        ).isDetailLink(false)
                        
                        
//                        MARK: Alert
                        
                            .alert(isPresented: $signUpModel.isPresentingErrorAlert) {
                                Alert(title: Text("Message"), message: Text(signUpModel.message),
                                      dismissButton: .default(Text("OK"))
                                )}
                        
                        
                        
                        HStack(spacing:5) {
                            Text("Already have an account?")
                            NavigationLink(destination: Login()) {
                                HStack{
                                    Text("Sign in")
                                        
                                        .foregroundColor(Color.theme.loginTextColor)
                                        .fontWeight(.semibold)
                                }
                               
                            }
                        }.padding(.top)
                        
                        
                        
                    }
                    .padding(.horizontal, 30)
                    
                    
                    Spacer()
                }
            }
            .keyboardManagment()
            
            if signUpModel.isProgressView {
                HUDProgressView(placeHolder: "Please Wait", show: $signUpModel.isProgressView)
                       }

        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
       
        
    }
}
struct SingUp1_Previews: PreviewProvider {
    static var previews: some View {
        SingUp1()
    }
}

// For TextField Up when keyboard show on View
struct KeyboardManagment: ViewModifier {
    @State private var offset: CGFloat = 0
    func body(content: Content) -> some View {
        GeometryReader { geo in
            content
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                        withAnimation(Animation.easeOut(duration: 0.5)) {
                            offset = keyboardFrame.height - geo.safeAreaInsets.bottom
                        }
                    }
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
                        withAnimation(Animation.easeOut(duration: 0.1)) {
                            offset = 0
                        }
                    }
                }
                .padding(.bottom, offset)
        }
    }
}
extension View {
    func keyboardManagment() -> some View {
        self.modifier(KeyboardManagment())
    }}




