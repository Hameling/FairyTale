//
//  Keyword.swift
//  Fairytale
//
//  Created by window on 2018. 10. 14..
//  Copyright © 2018년 WunGim. All rights reserved.
//
import PySwiftyRegex

class Keyword{
    //키워드 이름
    var keyword_name:String = ""
    
    //키워드 내용
    var keyword_contents:String = ""
    var russia_contents:String = ""
    
    
    init(_ filename:String) {
        let bundlePath = Bundle.main.url(forResource: filename, withExtension: "txt", subdirectory: "keywords.bundle")
        do {
            //파일 오픈
            let contents = try String(contentsOf: (bundlePath)!, encoding: .utf8)
            //파일 전체 내용을 잘라서 저장
            let mainpatten = re.compile("name=([가-힣\\d\\s,]+)\\scontents=([가-힣\",.!?\\s\\d()]+)")
            let regexresult = mainpatten.search(contents)
            
            let russiapatten = re.compile("russia=([\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}\",.!?\\s\\d\\()]+)",flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            let russiaresult = russiapatten.search(contents)
            //키워드 제목
            if let title = regexresult?.group(1){
                self.keyword_name = title
            }
            //키워드 본문
            if let contents = regexresult?.group(2){
                self.keyword_contents = contents
            }
            if let cotents = russiaresult?.group(1){
                self.russia_contents = cotents
            }
        }catch let error as NSError{
            print("Error access directory: \(error)")
        }
    }
}

