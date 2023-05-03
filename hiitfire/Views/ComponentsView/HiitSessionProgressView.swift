//
//  HiitTRainingHeaderView.swift
//  hiitfire
//
//  Created by Jean Karel on 29/04/23.
//

import SwiftUI

struct HiitSessionProgressView: View {
    let theme: Theme
    var progressValue: Double
    
    var body: some View {
        VStack {
            ProgressView(value: progressValue)
                .progressViewStyle(SessionProgressViewStyle(theme: theme))
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
        HiitSessionProgressView(theme: .sky, progressValue: 0.0)
            .previewLayout(.sizeThatFits)
    }
}
