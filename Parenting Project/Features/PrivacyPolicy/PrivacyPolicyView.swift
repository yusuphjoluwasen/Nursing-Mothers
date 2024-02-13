//
//  PrivacyPolicyView.swift
//  Parenting Project
//
//  Created by Flo Yeboah on 05/08/2023.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack
        {
            Text("Privacy Policy")
                .font(.custom("Poppins-Bold", size: 24))
                .padding()
            
            ScrollView{
              
                    VStack{
                        HStack{
                            Text("We value your privacy. Our app collects basic user information for personalization and communication purposes. We do not knowingly collect data from children under 13 without parental consent. Your data is secure, and we may use third-party services to enhance our features. By using our app, you consent to our Privacy Policy")
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
        .background(Color.bgColor)
        .frame(width: .infinity)
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}
