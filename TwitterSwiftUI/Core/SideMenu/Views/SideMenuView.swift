//
//  SideMenuView.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 04/10/2022.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @State private var selectedItem : SideMenuViewModel = .profile
    @EnvironmentObject var authViewModel : AuthViewModel
  var body: some View {
        
        if let user = authViewModel.currentUser{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    if !user.profileImageUrl.isEmpty{
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 56,height: 56)
                    }else{
                        Circle()
                            .frame(width: 56,height: 56)
                    }
                    
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text(user.fullname).font(.subheadline).bold()
                        Text("@\(user.username)").font(.caption).foregroundColor(.gray)
                    }

                    userFollowers
                    .padding(.vertical)

                    
                    ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                        if viewModel == .profile {
                            NavigationLink{
                                ProfileView(user: user)
                            }label: {
                               SideMenuRowView(viewModel: viewModel)
                            }
                        }else if viewModel == .logout {
                            Button {
                                print("Handle Logout")
                                authViewModel.signOut()
                            } label: {
                                SideMenuRowView(viewModel: viewModel)
                            }
                        }
                        else{
                            SideMenuRowView(viewModel: viewModel)
                        }
                    }
                    
                }
                .padding()
                Spacer()
            }
            
        }
        }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

extension SideMenuView {
    var userFollowers : some View{

        UserStatsView().userFollowers
            .padding(.vertical)
    }
}




