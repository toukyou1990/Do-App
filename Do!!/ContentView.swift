//
//  ContentView.swift
//  Do!!
//
//  Created by Notty on 2021/01/31.
//

import SwiftUI
import WidgetKit
import AVFoundation


struct ContentView: View {
    @State private var text = ""
    @State private var showingModal = false
    @State private var textField = ""

    struct ScaleButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.85 : 1)
        }
    }
    var body: some View {

        ZStack() {
            VStack() {
                ZStack(alignment: .topTrailing) {
                    Button(action: {
                        self.showingModal.toggle()
                    })
                    {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 20.0, height: 20.0, alignment: .leading)
                            .colorMultiply(Color.black)
                            .padding(.top, 12.0)
                            .padding(.trailing, 18.0)
                    }
                    .sheet(isPresented: $showingModal) {
                        SettingView()
                    }

                    TextField("What are you doing?", text: $text)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 32, weight: .bold, design: .rounded ))
                        .padding(.horizontal, 16.0)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.top, 48.0)
                        .padding(.trailing, 28.0)

                }
                Spacer()
            }
                Button(action: {
                    let userDefaults = UserDefaults(suiteName: "group.notty1990-gmail.com.Do--")
                    if let userDefaults = userDefaults {
                        userDefaults.synchronize()
                        userDefaults.setValue(text, forKeyPath: "inputText")
                    }
                    WidgetCenter.shared.reloadAllTimelines()
                    playSound(sound: "justdoit", type: "mp3")
                }) {
                    Image("logoB")
                        .renderingMode(.original)
                        .frame(alignment: .center)
                        .scaledToFit()
                }
                .buttonStyle(ScaleButtonStyle())
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
