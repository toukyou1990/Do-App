//
//  TabView.swift
//  Timer
//
//  Created by Notty on 2020/11/22.
//

import SwiftUI

struct TabView: View {
    
    @State var isShown = false
    
    var body: some View {

        VStack(alignment: .trailing) {
                Button(action: {
                }){
                    Image(systemName: "info.circle")
                        .resizable()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                        .frame(width: 24.0, height: 24.0, alignment: .topTrailing)
            }

        }
        .padding()
        .background(Color.white .edgesIgnoringSafeArea(.all))
    }
    
    
    struct TabView_Previews: PreviewProvider {
        static var previews: some View {
            TabView()
        }
    }
    
}
