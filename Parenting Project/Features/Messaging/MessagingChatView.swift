//
//  MessagingChatView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import SwiftUI

struct MessagingChatView: View {
    @ObservedObject var viewModel = MeassagingViewModel()
    @State var newMessage = ""
    var room:MessagingRoom?
    @AppStorage("name") var name: String = ""
    
    var body: some View {
        VStack
        {
            Text("\((room?.name ?? "").capitalized)")
                .font(.custom("Poppins-Bold", size: 24))
                .padding()
            
            ScrollView{
                if viewModel.roommessages.isEmpty{
                    Text("No Messages")
                        .font(.custom("Poppins-Regular", size: 16))
                        .padding(.top, 50)
                } else{
                    VStack{
                        ForEach(viewModel.roommessages.reversed()) { message in
                            MessagingChatItem(message: message, uid: viewModel.getUserId())
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            ZStack{
                HStack {
                    VStack {
                        TextField("Enter Message", text: $newMessage)
                            .padding(10)
                            .font(.custom("InriaSerif-Regular", size: 16))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.secondary, lineWidth: 0.5)
                            ) .frame(width: 290, height: 45)
                        
                    }
                    .frame(height: 20)
                    
                    Button(action: {
                        createMessage()
                    }) {
                        ZStack{
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 40, height: 40)
                                .cornerRadius(14)
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
        .background(Color.bgColor)
        .frame(width: .infinity)
        .onAppear{
            viewModel.fetchRoomMessages(roomid: room?.id ?? "")
        }
    }
    
    func createMessage(){
        if !newMessage.isEmpty{
            viewModel.addToMessages(message: CreateMessage(item: newMessage, roomid: room?.id ?? "", username: name))
        }
    }
}

struct MessagingChatView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingChatView()
    }
}


struct MessagingChatItem: View{
    var message:Message
    var uid:String
    var body: some View{
        ZStack{
            if uid != message.userid{
                VStack{
                    HStack{
                        Text("James Hamilton")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                        
                        Spacer()
                    }
                    
                    HStack{
                        
                        Text(message.item)
                            .font(.custom("Poppins-Regular", size: 10))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                        
                        Spacer()
                    }
                }
                .padding(.vertical, 20)
                .background(Color.white)
                .padding(.horizontal)
            }else{
                
                VStack{
                    HStack{
                        Spacer()
                        
                        Text("Me")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(.black)
                            .padding(.trailing, 10)
                    }
                    
                    HStack{
                        
                        Spacer()
                        
                        Text(message.item)
                            .font(.custom("Poppins-Regular", size: 10))
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                    }
                }
                .padding(.vertical, 20)
                .background(Color.white)
                .padding(.horizontal)
            }
        }
    }
}

