//
//  DoButton.swift
//  Do!!
//
//  Created by Notty on 2021/02/02.
//

import SwiftUI
import WidgetKit

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}


struct DoButton: View {
    @State private var text = ""
    var body: some View {
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

struct DoButton_Previews: PreviewProvider {
    static var previews: some View {
        DoButton()
    }
}
