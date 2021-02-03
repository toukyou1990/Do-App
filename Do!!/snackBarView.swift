//
//  SnackBarView.swift
//  Do!!
//
//  Created by Notty on 2021/02/04.
//

import SwiftUI

struct SnackBarView: View {
    var body: some View {
        Text("🎉 add Widget!!")
            .bold()
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([.top, .bottom], 15)
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.bottom, 24)
    }
}
    struct SnackBarView_Previews: PreviewProvider {
        static var previews: some View {
            SnackBarView()
        }
    }
