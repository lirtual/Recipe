//
//  RecipeFeaturedView.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/8.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var recipeModel: RecipeModel
    @State var selectedIndex:Int = 0
    @State var isShowDetail:Bool = false
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Featured Recipes")
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(25)
            
            GeometryReader{ geo in
                TabView (selection: $selectedIndex) {
                    ForEach( 0..<recipeModel.recipes.count, id: \.self ){ index in
                        if recipeModel.recipes[index].featured {
                            Button(action: {
                                self.isShowDetail = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack (spacing: 0) {
                                        Image(recipeModel.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(recipeModel.recipes[index].name)
                                            .font(Font.custom("Avenir", size: 16))
                                            .padding(5)
                                    }
                                }
                            })
                            .buttonStyle(PlainButtonStyle())
                            .tag(index)
                            .sheet(isPresented: $isShowDetail, content: {
                                RecipeDetailView(recipe: recipeModel.recipes[index])
                            })
                            .frame(width: geo.size.width - 70, height: geo.size.height - 260)
                            .cornerRadius(20)
                            .padding()
                            .shadow(color: .black, radius: 5)
                        }
                    }
                }
                .onAppear(perform: {
                    selectedIndex = getFirstFeaturedIndex()
                })
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                HStack(alignment: .top, spacing: 1.0) {
                    VStack (alignment: .leading){
                        Text("Preparation Time:")
                            .font(Font.custom("Avenir Heavy", size: 16))
                        Text(recipeModel.recipes[selectedIndex].prepTime)
                            .font(Font.custom("Avenir", size: 14))
                            .foregroundColor(.gray)
                    }.frame(maxWidth: geo.size.width / 2)
                    VStack (alignment: .leading){
                        Text("Highlights:")
                            .font(Font.custom("Avenir Heavy", size: 16))
                        Text(recipeModel.recipes[selectedIndex].getHighlightsString())
                            .font(Font.custom("Avenir", size: 14))
                            .foregroundColor(.gray)
                    }.frame(minWidth: geo.size.width / 2 + 1)
                }.padding(20.0)
            }
        }
    }
    
    func getFirstFeaturedIndex() -> Int {
        return recipeModel.recipes.firstIndex { recipe in
            recipe.featured
        } ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
