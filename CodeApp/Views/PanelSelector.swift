//
//  langSelector.swift
//  Code App
//
//  Created by Ken Chung on 5/12/2020.
//

import SwiftUI

struct PanelSelector<T: Hashable>: View {

    @EnvironmentObject var App: MainApp

    @State var buttons: [ActionSheet.Button] = [ActionSheet.Button.cancel()]

    @Binding var selection: T
    let options: [T: String]

    var body: some View {
        Menu {
            Picker(selection: $selection, label: Text("Selection")) {
                ForEach(Array(options.keys), id: \.self) { value in
                    Text(options[value]!).tag(value)
                }
            }
        } label: {
            Text(options[selection]!)
                .foregroundColor(Color.init("T1"))
                .font(.system(size: 12, weight: .light))
                .padding(.vertical, 2)
                .padding(.leading, 4)
            Image(systemName: "chevron.down")
                .foregroundColor(Color.init("T1"))
                .font(.system(size: 8, weight: .light))
                .padding(.trailing, 4)
        }
        .frame(height: 18)
        .background(Color.init(id: "dropdown.background"))
        .cornerRadius(5)
        .padding(.trailing)
    }
}
