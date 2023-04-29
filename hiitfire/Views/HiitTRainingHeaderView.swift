//
//  HiitTRainingHeaderView.swift
//  hiitfire
//
//  Created by Jean Karel on 29/04/23.
//

import SwiftUI

struct HiitTRainingHeaderView: View {
    let timeElapsed: Int
    let timeRemaining: Int
    let theme: Theme
    
    private var totalSeconds: Int {
            timeElapsed + timeRemaining
        }
    
    private var progress: Double {
            guard totalSeconds > 0 else { return 1 }
            return Double(timeElapsed) / Double(totalSeconds)
        }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(SessionProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Time Elapsed")
                        .font(.caption)
                    Label("\(timeElapsed)", systemImage: "timer.circle")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Time Remaining")
                        .font(.caption)
                    Label("\(timeRemaining)", systemImage: "timer.circle.fill")
                }
            }
        }
        .padding([.top, .horizontal])
    }
}

//Hacer que se vea bonita la barrita de progreso
struct SessionProgressViewStyle: ProgressViewStyle {
    var theme: Theme

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            if #available(iOS 15.0, *) {
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
}



struct HiitTRainingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HiitTRainingHeaderView(timeElapsed: 60, timeRemaining: 180, theme: .seafoam)
            .previewLayout(.sizeThatFits)
    }
}
