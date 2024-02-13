//
//  FeedbackView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import SwiftUI

struct FeedbackView: View {
    @ObservedObject var viewModel:ReportViewModel = ReportViewModel()
    @AppStorage("email") var email: String = ""
    @State var whattoimprove = ""
    @State var whatyoulike = ""
    @State var chattopic = ""

    var body: some View {
        VStack {
            Text("Feedback")
                .font(.custom("Poppins-Bold", size: 24))
                .padding(.bottom, 20)
                .padding(.top)
            
            HStack{
                Text("We  encourage our users to provide feedback and suggestions as this will be regularly reviewed to  enhance this platform")
                    .font(.custom("Poppins-Regular", size: 10))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            Group {
                VStack{
                    TextField("What do you like about this platform?", text: $whatyoulike)
                        .frame(height:70)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                       
                }
                .frame(height:70)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 70)
                }
                .padding(.bottom)
                
                VStack{
                    TextField("Tell us what can be improved?", text: $whattoimprove)
                        .frame(height:45)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                }
                .frame(height:50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 50)
                }
                .padding(.bottom)
                
                VStack{
                    TextField("Suggest Chat Topic", text: $chattopic)
                        .frame(height:45)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal)
                }
                .frame(height:50)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.borderColor, lineWidth: 1)
                        .frame(width: .infinity, height: 50)
                }
                .padding(.bottom)
    
    
            }
            .background(Color.white)
            
            Button(action: {
                createFeedback()
            }) {
                HStack {
                    Text("Submit")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: 53)
                .background(Color.primaryColor)
                .cornerRadius(10)
              
            }
            
            Spacer()
        }
        .padding(20)
    }
    
    func createFeedback(){
        viewModel.createFeedback(feedback: CreateFeedback(whattoimprove: whattoimprove, useremail: email, whatyoulike: whatyoulike, chattopic: chattopic))
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
