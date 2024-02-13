//
//  AppointmentView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 25/07/2023.
//

import SwiftUI

struct BookAppointmentView: View {
    @ObservedObject var viewModel:AppointmentViewModel = AppointmentViewModel()
    @AppStorage("name") var name: String = ""
    @AppStorage("email") var email: String = ""
    @State var password = ""
    @State var date = ""
    @State var reason = ""
    @State private var selectedDate:Date = Date()
    @Binding var proffesional:UserProfile?
    @State private var isTimePickerShown = false
    @Binding var ispPresenting:Bool
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Appointment")
                    .font(.custom("Poppins-Bold", size: 24))
                    .padding(.bottom, 80)
                    .padding(.top)
                
                Group {
                    VStack{
                        TextField("Name", text: $name)
                            .frame(height:45)
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
                        TextField("Email", text: $email)
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
                        TextField("Date and Time", text: .constant(selectedDate.formattedDate()))
                            .frame(height:45)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.horizontal)
                            .onTapGesture {
                                isTimePickerShown = true
                                
                            }
                    }
                    .frame(height:50)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.borderColor, lineWidth: 1)
                            .frame(width: .infinity, height: 50)
                    }
                    .padding(.bottom)
                    
                    VStack{
                        TextField("Reason For Appointment", text: $reason)
                            .frame(height:65)
                            .keyboardType(.emailAddress)
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
                    
                    
                }
                
                .background(Color.white)
                
                Button(action: {
                    createAppointment()
                }) {
                    HStack {
                        Text("Book now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 12))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 53)
                    .background(Color.primaryColor)
                    .cornerRadius(10)
                }
                
                Text(viewModel.errorMessage)
                    .foregroundColor(Color.red)
                    .font(.custom("Poppins-Regular", size: 12))
                    .padding(.top, 15)
                
                Spacer()
            }
            .padding(20)
            .sheet(isPresented: $isTimePickerShown) {
                
                TimePicker(selectedDate: $selectedDate)
                
            }
            .onChange(of: viewModel.createAppointmentStatus) { newValue in
                //if created succesfully, leave the page
                if newValue{
                    ispPresenting = false
                }
            }
        }
    }
        
        func createAppointment(){
            viewModel.createAppointment(appointment: CreateAppointment(name: name, email: email, date: selectedDate.formattedDate(), reason: reason, professionalname: proffesional?.name ?? "", professionaltitle: proffesional?.jobtitle ?? "", professionalimage: proffesional?.profilepicture ?? ""))
        }
    
    
}

struct BookAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        BookAppointmentView(proffesional: .constant(nil), ispPresenting: .constant(false))
    }
}


struct TimePicker: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        VStack {
            Text("Select Date and Time")
                .font(.custom("Poppins-Bold", size: 18))
                .padding(.bottom, 1)
            
            
            DatePicker("", selection: $selectedDate)
                .datePickerStyle(.graphical)
                .padding()
        }
    }
}


