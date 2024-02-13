//
//  SupportLibraryView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 25/07/2023.
//

import SwiftUI

struct SupportLibraryView: View {
    @ObservedObject var viewModel:SupportLibraryViewModel = SupportLibraryViewModel()
    @State private var isPresenting = false
    @State private var currentlibrary:SupportLibrary?
    var body: some View {
        NavigationStack{
            VStack{
                Text("Support Library").padding()
                    .font(.custom("Poppins-Bold", size: 24))
                
                VStack{
                    TextField("Search", text: $viewModel.search)
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
                .padding(.horizontal)
                
                ScrollView{
                    VStack{
                        ForEach(viewModel.supportlibrarylist) { item in
                            Button{
                                isPresenting = true
                                currentlibrary = item
                            }
                        label:{
                            SupportLibraryItemView(item: item)
                                .padding(.top, 10)
                        }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationDestination(isPresented: $isPresenting, destination: {
                SupportLibraryDetailView(item: currentlibrary)
            })
            .onChange(of: viewModel.search) { newValue in
                viewModel.searchForALibrary()
            }
        }
        
    }
}

struct SupportLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        SupportLibraryView()
    }
}



struct SupportLibraryItemView: View{
    var item:SupportLibrary
    var body: some View{
        VStack{
            HStack{
                VStack{
                    Image("resourceimage")
                }
                .frame(width: 44, height: 44)
                .background(Color.lightPrimaryColor)
                .cornerRadius(10)
                
                
                Text(item.resource)
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
