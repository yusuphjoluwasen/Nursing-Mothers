//
//  BreastfeedingView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 26/07/2023.
//

import SwiftUI

struct SupportLibraryDetailView: View {
    var item:SupportLibrary?
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    Text(item?.resource ?? "")
                        .font(.custom("Poppins-Bold", size: 24))
                    
                    Image("BFImage")
                        .resizable()
                        .frame(width: .infinity, height: 140)
                        .cornerRadius(20)
                    
                    HStack{
                        Text(item?.info ?? "")
                           
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                    
                    
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SupportLibraryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SupportLibraryDetailView(item:   SupportLibrary( resource: "BreastFeeding", info: "Congratulations on becoming a new nursing mother! Breastfeeding is a wonderful and rewarding experience"))
    }
}
