//
//  WorkThroughView.swift
//  Timer
//
//  Created by Notty on 2020/11/23.
//

import SwiftUI

struct WorkThroughView: View {

    var body: some View {

        VStack {
            ScrollView {
                Text("Just Do It!!")
                    .font(.system(size: 56, weight: .bold, design: .rounded))
                Spacer()
                    .frame(height: 30)
                AnnounceView()
            }
            Spacer()

        }

        .padding(EdgeInsets(top: 0, leading: 20, bottom: 50, trailing: 20))
    }
}

struct WorkThroughView_Previews: PreviewProvider {
    var isLaunch = true
    static var previews: some View {
        Group {
            WorkThroughView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            WorkThroughView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}

struct CellView: View {
    let image: Image
    let headline: String
    let discription: String

    var body: some View {
        HStack(spacing: 16) {
            image
                .font(.largeTitle)
                .foregroundColor(.black)
            VStack(alignment: .leading, spacing: 10) {
                Text(headline)
                    .font(.headline)
                    .bold()
                Text(discription)
                    .font(.body)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CellView(image: Image(systemName: "clock.fill"),
                     headline: "XXXXXXXXXXXXXXX",
                     discription: "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}

struct AnnounceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 44) {
            CellView(image: Image(systemName: "highlighter"),
                     headline: "Don’t let your dreams be dreams",
                     discription: "Yesterday you said tomorrow")
            CellView(image: Image(systemName: "wand.and.stars"),
                     headline: "So just do it!",
                     discription: "Make your dreams come trues.")
            CellView(image: Image(systemName: "plus.app"),
                     headline: "Let's add it to the widget!",
                     discription: "Write what you need to do in front of you and it will appear in the widget.")
        }
        VStack {
            if let url = URL(string: "https://www.youtube.com/watch?v=ZXsQAXx_ao0") {
                Link("Inspired by Shia LaBeouf",destination: url)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 24.0)
                .padding(.bottom, 56.0)
                .font(.callout)
                .foregroundColor(Color.gray)

            }
        }
        DoneButton()
    }
}


struct AnnounceView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AnnounceView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}

struct DoneButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }
        ) {
            Text("OK")
                .bold()
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding([.top, .bottom], 15)
        .background(Color.black)
        .cornerRadius(10)
    }
}


struct DoneButton_Preview: PreviewProvider {
    static var previews: some View {
        DoneButton()
    }
}
