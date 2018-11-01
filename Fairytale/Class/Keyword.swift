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
    
    
    init(_ filename:String) {
        //차후 수정요먕
        let bundlePath = Bundle.main.url(forResource: filename, withExtension: "txt", subdirectory: "fairytales.bundle")
        do {
            //파일 오픈
            let contents = try String(contentsOf: (bundlePath)!, encoding: .utf8)
            
            //파일 전체 내용을 잘라서 저장
            let mainpatten = re.compile("name=([가-힣\\d\\s,]+)\\scontents=([가-힣\",.!?\\s\\d]+)")
            let regexresult = mainpatten.search(contents)
            
            //키워드 제목
            if let title = regexresult?.group(1){
                self.keyword_name = title
            }
            //키워드 본문
            if let contents = regexresult?.group(2){
                self.keyword_contents = contents
            }
        }catch let error as NSError{
            print("Error access directory: \(error)")
        }
    }
}

