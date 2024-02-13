//
//  OnboardingView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 01/08/2023.
//

import SwiftUI

struct OnboardingView: View {
    @State var currentPage = 0
    @AppStorage("appstate") var appstate: String = ""
    var body: some View {
        VStack{
           
            
            TabView(selection: $currentPage){
                ForEach(0..<onboardingItems().count, id: \.self) { item in
                    VStack{
                        
                        HStack{
                            Text(onboardingItems()[item].headerone)
                                .font(.custom("Poppins-Bold", size: 30))
                                .foregroundColor(Color.black)
                                .padding(.top)
                            
                            Text(onboardingItems()[item].headertwo)
                                .font(.custom("Poppins-Bold", size: 30))
                                .foregroundColor(Color.primaryColor)
                                .padding(.top)
                        }
                        
                        Image(onboardingItems()[item].image)
                            .padding(.top, 50)
                        
                        Text(onboardingItems()[item].text)
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                            .padding(.top, 50)
                        
                        
                        
                        Spacer()
                    }
                    .tag(item)
                }
              
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            
           
            Button {
                appstate = AppState.welcome.rawValue
            } label: {
                HStack{
                    Text("SKIP")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color.black)
                        .padding(.top)
            }
  
                Spacer()
                
                Image(onboardingItems()[currentPage].indicatorimage)
                    .padding(.top)
                
                
                Spacer()
                
                Button {
                    withAnimation {
                        if currentPage != onboardingItems().count - 1{
                            currentPage += 1
                        }else{
                            appstate = AppState.welcome.rawValue
                        }
                    }
                } label: {
                    Text("NEXT")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color.black)
                        .padding(.top)
                }

             
            }
            .padding(.horizontal, 40)
            
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

func onboardingItems() -> [OnboardingItem]{
    return [
        OnboardingItem(headerone: "Support", headertwo: "Library", indicatorimage: "onboardingonedot", image: "pregtest", text: "The app will a content library with useful resources to support you on your parenting journey."),
        OnboardingItem(headerone: "Community", headertwo:"Support", indicatorimage:"onboardingtwodot", image: "communitysupport", text: "Th app will give you access to other parents, where you can connect and chat."),
        OnboardingItem(headerone: "Professional", headertwo: "Support", indicatorimage: "onboardingthreedot", image: "professionalsupport", text: "This app will allow you to book one to one appointments with healthcare professionals")
    ]
}


struct OnboardingItem:Identifiable{
    let id = UUID()
    let headerone: String
    let headertwo: String
    let indicatorimage: String
    let image:String
    let text:String
}
