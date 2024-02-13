//
//  ProfessionalsView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import SwiftUI

struct ProfessionalsView: View {
    
    @ObservedObject var viewModel:ProfessionalViewModel = ProfessionalViewModel()
    @State private var isPresenting = false
    @State private var currentProffesional:UserProfile?
    var body: some View {
        NavigationStack{
            VStack{
                Text("Professionals")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding()
                ScrollView{
                    VStack{
                        ForEach(viewModel.professionallist) { professional in
                            Button{
                                isPresenting = true
                                currentProffesional = professional
                            }
                        label:{
                            ProfessionalItemView(professional: professional)
                                .padding(.top)
                        }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color.bgColor)
            .onAppear{
                viewModel.fetchProfesssionals()
            }
            .navigationDestination(isPresented: $isPresenting, destination: {
                ProfessionalDetailView(professional: currentProffesional)
            })
            
            
            
        }
    }
}

struct ProfessionalsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionalsView()
    }
}


struct ProfessionalItemView: View{
    var professional:UserProfile
    var body: some View{
        VStack{
            HStack{
                AsyncImage(url: URL(string: professional.profilepicture)) { image in
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
                
                VStack{
                    
                    HStack{
                        Text(professional.name.capitalized)
                            .font(.custom("Poppins-Medium", size: 20))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    HStack{
                        Text(professional.jobtitle)
                            .font(.custom("Poppins", size: 15))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    HStack{
                        Text(professional.bio)
                            .font(.custom("Poppins", size: 10))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                }
                
                
            }
        }
        .frame(width: .infinity, height: 110)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.borderColor, lineWidth: 1)
                .frame(width: .infinity, height: 120)
        }
        
    }
}
