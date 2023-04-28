//
//  ThemeChangerView.swift
//  hiitfire
//
//  Created by Jean Karel on 28/04/23.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
        //Corrige el contraste de colores:
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct ThemeChangerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .indigo)
    }
}
