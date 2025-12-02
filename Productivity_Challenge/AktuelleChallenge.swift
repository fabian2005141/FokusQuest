//
//  SwiftUIView.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 02.12.25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
        VStack {
            Color(.black)
            }
        }
        NavigationView {
            Text("Das steht heute an:")
            Color.white
        }



    }
}

#Preview {
    SwiftUIView()
}
