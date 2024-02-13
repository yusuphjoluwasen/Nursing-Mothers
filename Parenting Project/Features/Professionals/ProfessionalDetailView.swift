//
//  ProfessionalDetailView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import SwiftUI

struct ProfessionalDetailView: View {
    @State var professional:UserProfile?
    @State private var isPresenting = false
    var body: some View {
        NavigationStack{
            VStack {
                AsyncImage(url: URL(string: professional?.profilepicture ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                } placeholder: {
                    Image("userprofile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(35)
                }
                .padding(.leading)
                
                Text(professional?.name.capitalized ?? "")
                    .font(.custom("Poppins-Medium", size: 20))
                    .foregroundColor(.black)
                    .padding(.top, 1)
                
                Text(professional?.jobtitle ?? "")
                    .font(.custom("Poppins-Light", size: 12))
                    .foregroundColor(.black)
                
                Text(professional?.bio ?? "")
                    .font(.custom("Poppins-Regular", size: 10))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.bottom, 40)
                
                Button(action: {
                    isPresenting = true
                }) {
                    HStack {
                        Text("Book Appointment")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 53)
                    .background(Color.primaryColor)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .padding(20)
            .navigationDestination(isPresented: $isPresenting, destination: {
                BookAppointmentView(proffesional: $professional, ispPresenting: $isPresenting)
            })
        }}
}

struct ProfessionalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionalDetailView()
    }
}
