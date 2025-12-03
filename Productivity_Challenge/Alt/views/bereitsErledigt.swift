//
//  BereitsErledigt.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 02.12.25.
//

import SwiftUI

struct bereitsErledigt: View {
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            Text("Hier siehst du, was du bereits geschafft hast:")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .offset(y:-200)
            
                }
       
        }
    }

#Preview {
    bereitsErledigt()
}
