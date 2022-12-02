//
//  EditWordsView.swift
//  TestProject
//
//  Created by 茂田井雄輝 on 2022/12/02.
//

import SwiftUI

struct EditWordsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var english: String
    @State private var japanese: String
    private var word: Words
    
    init(word: Words) {
        self.word = word
        self.english = word.english_word ?? ""
        self.japanese = word.japanese_word ?? ""
    }
    var body: some View {
        VStack {
            TextField("英単語", text: $english)
                .font(.title)
            TextEditor(text: $japanese)
                .font(.body)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {saveWord()}) {
                    Text("編集確定")
                }
            }
        }
    }
    
    private func saveWord() {
        word.english_word = english
        word.japanese_word = japanese
        
        try? viewContext.save()
    }
}

struct EditWordsView_Previews: PreviewProvider {
    static var previews: some View {
        EditWordsView(word: Words())
    }
}
