//
//  MessagingForumView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import SwiftUI

struct MessagingForumView: View {
    @ObservedObject var viewModel:MeassagingViewModel = MeassagingViewModel()
    @State private var isPresenting = false
    @State private var currentRoom:MessagingRoom?
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    Text("Messaging Forum")
                        .font(.custom("Poppins-Bold", size: 24))
                        .padding()
                    
                    Image("messagingImage")
                        .resizable()
                        .frame(width: .infinity, height: 149)
                        .cornerRadius(20)
                        .padding(.horizontal)
                    
                    Text("Connect with other parents on various topics concerning your baby or topics you are generally interested in, we also have verified professionals in the forum that will contribute to discussions")
                        .font(.custom("Poppins-Regular", size: 14))
                        .padding()
                    
                    ScrollView{
                        VStack{
                            ForEach(viewModel.messagingrooms) { item in
                                Button{
                                    isPresenting = true
                                    currentRoom = item
                                }
                            label:{
                                MessageItemView(item: item)
                                    .padding(.top, 10)
                            }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .onAppear{
                viewModel.fetchRooms()
            }
            .navigationDestination(isPresented: $isPresenting, destination: {
                MessagingChatView(room: currentRoom)
            })
        }
    }
}

struct MessagingForumView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingForumView()
    }
}

struct MessageItemView: View{
    var item:MessagingRoom
    var body: some View{
        VStack{
            HStack{
                VStack{
                    Image("chat_icon")
                }
                .frame(width: 44, height: 44)
                .background(Color.lightPrimaryColor)
                .cornerRadius(10)
                
                
                Text(item.name)
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                
                Spacer()
            }
            .padding(.leading, 10)
            .frame(width: .infinity, height: 64)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.borderColor, lineWidth: 0.5)
                    .frame(width: .infinity, height: 66)
            }
            
        }
    }
}


