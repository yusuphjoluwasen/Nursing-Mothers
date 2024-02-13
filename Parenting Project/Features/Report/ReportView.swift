//
//  ReportView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import SwiftUI

struct ReportView: View {
    
    @ObservedObject var viewModel:ReportViewModel = ReportViewModel()
    @AppStorage("email") var email: String = ""
    @State var report = ""
    @State var nametoreport = ""
    
    var body: some View {
        VStack {
            Text("Report Abuse")
                .font(.custom("Poppins-Bold", size: 24))
                .padding(.bottom, 20)
                .padding(.top)
            
            HStack{
                Text("We take our forums seriously and will take immediate actions to remove users who violates our terms, we will review as fast as we can")
                    .font(.custom("Poppins-Regular", size: 10))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            Group {
                VStack{
                    TextField("What do you want to report?", text: $report)
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
                    TextField("Name of person you will like to report?", text: $nametoreport)
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
                createReport()
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
    
    func createReport(){
        viewModel.createReport(report: CreateReport( nameofpersontoreport: nametoreport, useremail: email, whattoreport: report))
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
