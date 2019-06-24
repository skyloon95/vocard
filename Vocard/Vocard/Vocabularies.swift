//
//  Vocabularies.swift
//  Vocard
//
//  Created by 모설아 on 24/06/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

/*
import Foundation
import CoreData

class Vocalist {
    static var index:Int = 0
    
    var name: String
    var unmemorizedVocabularies = [Vocabulary]()
    var memorizedVocabularies = [Vocabulary]()
    var memorizedIndex = [Int]()
    lazy var countAll: Int = {
        return self.countUnmemorized + self.countMemorized
    }()
    
    lazy var countUnmemorized: Int = {
        return self.unmemorizedVocabularies.count
    }()
    
    lazy var countMemorized: Int = {
       return self.memorizedVocabularies.count
    }()
    
    init(listName: String) {
        self.name = listName
    }
    
    let listIndex: Int = {
        let n = Vocalist.index
        Vocalist.index += 1
        return n
    }()
    
    func requestVoca() -> Vocabulary? {
        let randomNo: UInt32 = arc4random_uniform(UInt32(countUnmemorized))
        if countUnmemorized > 0 {
            let vocabulary = unmemorizedVocabularies.remove(at: Int(randomNo))
            countUnmemorized -= 1
            countMemorized += 1
            
            return vocabulary
        } else {
            return nil
        }
    }
    
    func addVoca(foreign: String, local: String) {
        unmemorizedVocabularies.append(Vocabulary(foreign: foreign, local: local, isMemorized: false, list: <#Int#>))
        countUnmemorized += 1
        countAll += 1
    }
    
}

class VocabulariesList {
    var list: [Vocalist]
    lazy var count: Int = {
        return self.list.count
    } ()
    
    init(vocaList: [Vocalist]) {
        self.list = vocaList
    }
    
    func addVocas(vocabularies: Vocalist) {
        list.append(vocabularies)
        count += 1
    }
    
}

class TodayVoca {
    var vocabularies:Vocalist
    var todayVocabularies = [Vocabulary]()
    let countVocas: Int = 0
    
    init(vocabularies: Vocalist) {
        self.vocabularies = vocabularies
    }
    
    func getNewVoca() -> Vocabulary? {
        let voca: Vocabulary? = vocabularies.requestVoca()
        return voca
    }
    
}

struct Vocabulary {
    var foreign: String //  외국어
    var local: String   //  자국어
    var isMemorized: Bool   //  외웠는지
    var list: Int   //  저장된 단어장
    
    init (foreign: String, local: String, isMemorized: Bool, list: Int) {
        self.foreign = foreign
        self.local = local
        self.isMemorized = isMemorized
        self.list = list
    }
}
*/
