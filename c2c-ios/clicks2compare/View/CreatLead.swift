//
//  CreatLead.swift
//  clicks2compare
//
//  Created by Nitin Singh on 04/01/24.
//

import SwiftUI

struct CreateLead: View {
    @ObservedObject var createLeadViewModel = CreateLeadViewModel()
    var LeadType: String
    var DepartmentId: String
    
   var recommendedBy: String
    @State private var isEditing: Bool = false
    @State var height: CGFloat = 0
    init(LeadType: String, DepartmentId: String ,recommededby: String){
        self.LeadType = LeadType
        self.DepartmentId = DepartmentId
        self.recommendedBy = recommededby
        self.createLeadViewModel.leadType = LeadType
        self.createLeadViewModel.departmentId = DepartmentId
        self.createLeadViewModel.recommendedBy = recommededby
        
    }
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 0) {
                Text(createLeadViewModel.leadType)
                    .font(.title.weight(.semibold))
                    .padding(.bottom,40)
               
               
                
                customTextfFld(label: "Recommended By", PlaceHolder: "Recommended by", required: true, secure: false, bVariable: $createLeadViewModel.recommendedBy)
                    .disabled(true)
               
                customTextfFld(label: "Customer Name", PlaceHolder: "Customer Name", required: true, secure: false, bVariable: $createLeadViewModel.customerName)
                

                customTextfFld(label: "Customer Email", PlaceHolder: "Customer Email", required: true, secure: false, bVariable: $createLeadViewModel.customerEmail)
                    .autocapitalization(.none)
 
                    
                PhoneNumberWithCode(PhoneNumber: $createLeadViewModel.customerPhoneNo, CountryDialcode: $createLeadViewModel.customerPhoneCode, required: true, label: "Phone Number")
                    
                
//                MARK: Comment Text field
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Additional Comment (Optional)")
                        .font(.headline)
                        .offset(x:10)
                    ResizableTF(txt: $createLeadViewModel.comment, height: $height)
                        .frame(height: self.height)
                        .padding(.horizontal)
                        .padding(.vertical,10)
                        .frame(maxWidth: .infinity)
                        .background(Color(#colorLiteral(red: 0.8509803922, green: 0.8431372549, blue: 0.8549019608, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.02745098039, green: 0.1803921569, blue: 0.4078431373, alpha: 1)), lineWidth: 1)
                        )
                    
                }
                .padding(.top)
               
                Button(action: {
                    if createLeadViewModel.validateInputs(){
                        createLeadViewModel.CreateLead()
                    }
                }) {
                    Text("Submit")
                        .padding(.vertical,13)
                            .frame(maxWidth: .infinity)
                            .background(Color.theme.buttonColor.cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.system(size: 20).weight(.semibold))
                    
                }
                .padding(.top,22)
                
                
                
                .alert(isPresented: $createLeadViewModel.isPresentingErrorAlert) {
                    if self.createLeadViewModel.isSuccess {
                        return  Alert(title: Text("Message"), message: Text(self.createLeadViewModel.message), dismissButton: .default(Text("OK")){
                            self.createLeadViewModel.navigate = true
                        })
                    } else {
                        return  Alert(title: Text("Message"), message: Text("Try Again"), dismissButton: .default(Text("OK")))
                    }
                }
                
                NavigationLink(
                    destination: BottomBar(index: 0),
                    isActive: $createLeadViewModel.navigate,
                    label: {
                        EmptyView()
                    }
                )
                .isDetailLink(false)
                
                Spacer()
                
                    .navigationTitle("Create Lead")
            }
            .padding(.horizontal,30)

        }
            

    
       
    }
}

struct CreatLead_Previews: PreviewProvider {
    static var previews: some View {
        CreateLead(LeadType: "LeadType", DepartmentId: " ", recommededby: "Ashish")
    }
}



struct ResizableTF : UIViewRepresentable {
    
    @Binding var txt : String
    @Binding var height : CGFloat
    func makeCoordinator() -> Coordinator {
        return ResizableTF.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isEditable = true
        view.isScrollEnabled = true
        view.text = "Additional Comment"
        view.font = .systemFont(ofSize: 18)
        view.textColor = .gray
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        DispatchQueue.main.async{
            self.height = uiView.contentSize.height
        }
    }
    
    class Coordinator : NSObject, UITextViewDelegate{
        
        var parent : ResizableTF
        
        init(parent1 : ResizableTF) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if self.parent.txt == ""{
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            DispatchQueue.main.async {
                self.parent.height = textView.contentSize.height
                self.parent.txt = textView.text
            }
        }
    }
    
    
}

