//
//  DeshBoard.swift
//  clicks2compare
//
//  Created by Nitin Singh on 05/12/23.
//

import SwiftUI



struct DashBoard: View {
    
    let helper = Helper()
    @StateObject var deshboard = Deshboard()
    
    @State var creatLeadisPresent: Bool = false
    @State var LeadType:[String] = ["Mortgage","SME Finacnce", "Account Opening","Company Formation","Insurance","Accounting & Bookkeeping","VAT Reg. & Corp. Tax Reg.","Audit"]
    @State var departmentId:[String] = ["1","2","11","5","4","8","15","16"]
    
    @State var sendLeadType: Int = 0
    
    let constant = Constant()
    @Environment(\.colorScheme) var colorScheme
    
    @State private var currentIndex = 0
        let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    var body: some View {
        
        ZStack {
            
            VStack{
                
                HStack {
                    Text("Welcome \(deshboard.userProfile?.name ?? "")")
                        .foregroundColor(Color.theme.blueWhite)
                        .font(.system(size: 20).weight(.semibold))
                    
                    Spacer()
                    
                    NavigationLink {
                        Report()
                    } label: {
                        HStack{
                            Text("Report")
                                .font(.system(size: 18).weight(.semibold))
                                .foregroundColor(Color.theme.blueWhite)  .padding(.vertical, 5)
                                .padding(.horizontal, 30)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                        }
                    }
                }
                
                
                
                VStack{
                    ScrollView(.vertical,showsIndicators: false){
                        VStack {
                            BannerCarousel()
                        }.frame(width: UIScreen.main.bounds.width, height: 250)
                        
                        VStack {
                            HStack {
                                Spacer()
                                LeadButton(dimension: 75, imageName: "mt", leadName: "Mortgage", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 0)
                                Spacer()
                                
                                LeadButton(dimension: 75, imageName: "smef", leadName: "SME Finance", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 1)
                                Spacer()
                                
                            }
                            
                            HStack  {
                                Spacer()
                                LeadButton(dimension: 75, imageName: "account opening 1", leadName: "Account Opening", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 2)
                                Spacer()
                                LeadButton(dimension: 75, imageName: "cf", leadName: "Company Formation", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 3)
                                Spacer()
                                
                                
                            }
                            HStack {
                                Spacer()
                                LeadButton(dimension: 75, imageName: "insurance", leadName: "Insurance", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 4)
                                Spacer()
                                LeadButton(dimension: 75, imageName: "aab1", leadName: "Accounting  & Bookkeeping", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 5)
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                LeadButton(dimension: 75, imageName: "vttc", leadName: "VAT Reg. & Corp. Tax Reg.", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 6)
                                Spacer()
                                LeadButton(dimension: 75, imageName: "Audit1", leadName: "Audit", createLeadisPresent: $creatLeadisPresent, sendLeadType: $sendLeadType, typeLead: 7)
                                Spacer()
                            }
                        }
                    }
                    
                    
                }
                
                Spacer()
                
                NavigationLink(
                    destination: CreateLead(LeadType: LeadType[sendLeadType], DepartmentId: departmentId[sendLeadType], recommededby: deshboard.userProfile?.recommendedBy ?? ""),
                    isActive: $creatLeadisPresent,
                    label: {
                        EmptyView()
                    }
                )
                .isDetailLink(false)
                
            }
            .padding(.horizontal)
            
            
            
        }
        
        
        .background(
            Group {
                if colorScheme == .dark {
                    Color.black
                        
                } else {
                    LinearGradient(gradient: Gradient(colors: [.white, .blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                }
            }
            
        )
        
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct DeshBoard_Previews: PreviewProvider {
    static var previews: some View {
        //        LeadButton(bgColor: Color.theme.buttonColor, title: "Hello", value: 52)
        DashBoard()
    }
}


struct LeadButton: View {
    
    var dimension: CGFloat
    var imageName: String
    var leadName: String
    @Binding var createLeadisPresent: Bool
    @Binding var sendLeadType: Int
    @State var typeLead: Int
    
    
    var body: some View {
        VStack(spacing : 0) {
            VStack(spacing : 0) {
                Button(action: {
                    createLeadisPresent.toggle()
                    sendLeadType = typeLead
                }) {
                    VStack(spacing: 3) {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimension, height: dimension)
                            .padding()
                    }
                    .frame(width: dimension)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.gray)
                            .opacity(0.2)
                    )
                }
                
                Text(leadName)
                    .font(.system(size: 12))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: dimension + 10, height: 30, alignment: .top)
            }
            
            
        }
        .frame(width: dimension, height: dimension + 30) // Adjust the height based on your preference
        .padding()
        .padding(.bottom)
    }
}
