//
//  ContentView.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import SwiftUI

struct RecipeAppView: View {
    var body: some View {
        RecipeTabView()
            .environmentObject(RecipeModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeAppView()
    }
}
