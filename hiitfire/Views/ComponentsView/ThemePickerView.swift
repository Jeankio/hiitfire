//
//  ThemePickerView.swift
//  hiitfire
//
//  Created by Jean Karel on 28/04/23.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Session Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                // Trae a ThemeView:
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        // selection: .constant
        ThemePickerView(selection: .constant(.periwinkle))
    }
}
