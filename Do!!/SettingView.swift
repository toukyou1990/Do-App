//
//  SettingView.swift
//  Do!!
//
//  Created by Notty on 2021/02/03.
//

import SwiftUI

struct SettingView: View {
    @State private var showingModal = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {

        NavigationView {
            Form {
                Section(header: Text("About")) {
                NavigationLink(destination: WorkThroughView()) {

                    HStack {
                        Text("About Do!!")
                    }}
                    .sheet(isPresented: $showingModal) {
                        WorkThroughView()
                    }
                HStack {
                    Text("Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(Color.gray)
                }
                }

                Section(header: Text("SUPPORT")) {
                    

                    Text("Request Email" )
                    Text("Twitter")
                    Text("Review")
                }
            }
            .navigationBarTitle("Other", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }) {
                                        Text("Close")
                                            .font(.callout)

                                    }
            )
        }
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
