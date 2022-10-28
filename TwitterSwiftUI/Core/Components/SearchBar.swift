//
//  SearchBar.swift
//  TwitterSwiftUI
//
//  Created by Harshita Gali on 20/10/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text : String
    
    var body: some View {
        HStack{
            TextField("Search..", text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   alignment: .leading)
                    }
                }
        }
        .padding(.horizontal,4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
