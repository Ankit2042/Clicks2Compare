//
//  Profile.swift
//  clicks2compare
//
//  Created by Nitin Singh on 21/12/23.
//

import SwiftUI

struct Profile: View {
    @StateObject var deshboard = Deshboard()
    @StateObject var logOutViewModel = LogOutViewModel()
    @State var shareText: ShareText?
    @State var share: String = ""
    @AppStorage("loginToken") private var loginToken: String = ""
    var body: some View {
      
        ZStack {
            
            List{
                
                
                    Section {
                        HStack {
                            Text(deshboard.userProfile?.initials ?? " ")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 0){
                                Text(deshboard.userProfile?.name ?? " ")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(deshboard.userProfile?.email ?? " ")
                                    .font(.footnote)
                                    .accentColor(.black.opacity(0.8))
                                
                            }
                        }
                   
                        
                        
                        
                    }
                    
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            
                            Spacer()
                            
                            Text("1.0.0")
                                .font(.subheadline)
                                
                        }
                    }
                    
                    Section("Account") {
                        
                        NavigationLink(destination: ProfileContant()) {
                            SettingsRowView(imageName: "person.fill", title: "Profile", tintColor: .red)
                        }
                        
                        
                        NavigationLink(destination: ChangePassword()) {
                            SettingsRowView(imageName: "lock.rotation", title: "Change Password", tintColor: .red)
                        }
                        
                        VStack{
                            Button(action: {
                                fetchShareData()
                                shareText = ShareText(text: share)
                                
                            }, label: {
                                SettingsRowView(imageName: "square.and.arrow.up.fill", title: "Share & Earn", tintColor: .red)
                            })
                        }
                        // 5. Sheet to display Share Text
                        .sheet(item: $shareText) { shareText in
                            ActivityView(text: shareText.text)
                        }
                        
                        
                        Button{
                            self.logOutViewModel.LogOut()
                            
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Logout", tintColor: .red)
                        }
                        
                        .alert(isPresented: $logOutViewModel.isPresentingErrorAlert) {
                            Alert(title: Text("Alert"), message: Text(logOutViewModel.Message),
                                  dismissButton: .default(Text("OK")){
                                self.logOutViewModel.navigate = true
                                self.loginToken = ""
                            }
                            )}
                        
                 
                    }
                    
                   
                }
            
            NavigationLink(
                destination: Login(),
                isActive: self.$logOutViewModel.navigate,
                label: {
                    EmptyView()
                }
            )
            .isDetailLink(false)
            
            
            }
            
            
       
            
    }
    
    func fetchShareData() {
            // Fetch API data to get the name of the sharing person
            // Replace this with your actual API call
            // Assume you have a model named ShareData
            let shareData: ShareData = fetchData()
        let appStoreLink = "Download C2C referral and get amazing benifits : https://apps.apple.com/in/app/c2c-referral-partner/id6447002903"
            // Update the shareContent with the app store link and name
            
        share = "Hii i am \(shareData.name) \(appStoreLink)"
        }
    func fetchData() -> ShareData {
            
        return ShareData(name: deshboard.userProfile?.name ?? "")
        }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}


struct ShareData {
        let name: String
        // Add other properties as needed
    }
