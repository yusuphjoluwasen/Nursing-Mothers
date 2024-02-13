//
//  MyAppointmentView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import SwiftUI

struct MyAppointmentView: View {
    @ObservedObject var viewModel:ProfileViewModel = ProfileViewModel()
    var body: some View {
        VStack{
            Text("My Appointments")
                .font(.custom("Poppins-Bold", size: 24))
                .padding()
            
                ScrollView{
                    if viewModel.appointmentlist.isEmpty{
                        Text("No Appointments")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding(.top, 50)
                    } else{
                    VStack{
                        ForEach(viewModel.appointmentlist) { appointment in
                            Button{
                                // print(professional.profName)
                            }
                        label:{
                            AppointmentItemView(appointment: appointment)
                                .padding(.top)
                        }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.bgColor)
        .onAppear{
            viewModel.fetchAppointments()
        }
       
    }
}

struct MyAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        MyAppointmentView()
    }
}


struct AppointmentItemView: View{
    var appointment:Appointment
    var body: some View{
        VStack{
            HStack{
                AsyncImage(url: URL(string: appointment.professionalimage)) { image in
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
                        Text(appointment.professionalname.capitalized)
                            .font(.custom("Poppins-Medium", size: 20))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    HStack{
                        Text(appointment.professionaltitle)
                            .font(.custom("Poppins-Regular", size: 15))
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                    
                    HStack{
                        Text(appointment.date)
                            .font(.custom("Poppins-Regular", size: 10))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                    }
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                    
                    HStack{
                        Text("Reason: \(appointment.reason)")
                            .font(.custom("Poppins-Regular", size: 10))
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

