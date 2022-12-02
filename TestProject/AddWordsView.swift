//
//  AddWordsView.swift
//  TestProject
//
//  Created by 茂田井雄輝 on 2022/12/01.
//

import SwiftUI

struct AddWordsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentation
    @State private var english: String = ""
    @State private var japanese: String = ""

    var body: some View {
        VStack{
            TextField("英単語追加", text: $english)
                .font(.title)
            TextEditor(text: $japanese)
            Spacer()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {addWord()}) {
                    Text("追加")
                }
            }
        }
    }
    
    private func addWord() {
        let word = Words(context: viewContext)
        word.english_word = english
        word.japanese_word = japanese
        
        try? viewContext.save()
        
        presentation.wrappedValue.dismiss()
    }
}

struct AddWordsView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordsView()
    }
}
