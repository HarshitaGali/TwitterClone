//
//  SideMenuRowView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 04/10/2022.
//

import SwiftUI

struct SideMenuRowView: View {
    let viewModel : SideMenuViewModel
    var body: some View {
        VStack{
            HStack(spacing: 16){
                Image(systemName : viewModel.image).font(.headline).foregroundColor(.gray)
                Text(viewModel.description)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .bold()
                    .padding(.vertical)
                
                Spacer()
            }
           
            
            
        }
        .frame(height:40)
        .padding(.vertical,4)
    
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}
