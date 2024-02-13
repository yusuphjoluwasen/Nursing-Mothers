//
//  NotificationView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel:NotificationViewModel = NotificationViewModel()
    var body: some View {
        VStack
        {
            Text("Notifications")
                .font(.custom("Poppins-Bold", size: 24))
                .padding()
            
            ScrollView{
                ForEach(viewModel.notificationlist) { item in
                    VStack{
                        HStack{
                            
                            Text(item.quote)
                                .font(.custom("Poppins-Regular", size: 10))
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                }
            }
        }
        .background(Color.bgColor)
        .frame(width: .infinity)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(viewModel: NotificationViewModel())
    }
}







