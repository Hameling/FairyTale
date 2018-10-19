//
//  Book.swift
//  Fairytale
//
//  Created by window on 2018. 10. 12..
//  Copyright © 2018년 WunGim. All rights reserved.
//

class Book {
    //책의 태그
    var book_tag : String
    //책의 이름
    var book_name : String
    //책에 사용될 단어들 리스트
    var keywordlist : [String]?
    //책의 본문
    
    init(book_name:String, book_tag:String){
        self.book_name = book_name
        self.book_tag = book_tag
    }
}
