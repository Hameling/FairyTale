//
//  Book.swift
//  Fairytale
//
//  Created by window on 2018. 10. 12..
//  Copyright © 2018년 WunGim. All rights reserved.
//

import PySwiftyRegex

class Book {
    //책의 태그
    var book_tag : String = ""
    //책의 이름
    var book_name : String = ""
    //책에 사용될 단어들 리스트
    var keyword_title_list : [String] = []
    var keyword_list : [Keyword] = []
    //책의 본문
    var main_content:[String] = []
    var russian_content:[String] = []
    
    init() {}
    
    init(_ filename:String){
        let bundlePath = Bundle.main.url(forResource: filename, withExtension: "txt", subdirectory: "fairytales.bundle")
        
        do {
            //파일 오픈
            let contents = try String(contentsOf: (bundlePath)!, encoding: .utf8)
            //print(contents)
            //파일 전체 내용을 잘라서 저장
            let mainpatten = re.compile("name=([가-힣\\d\\s,]+)\\skeyword=([가-힣\\d\\s,]+)\\scontents=([\n가-힣a-z\",.!?\\s:~]+)")
            let russianpatten = re.compile("\\srussia=([\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}a-z\",.!?\\s\\d\\-:~]+)",flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            let regexresult = mainpatten.search(contents)
            let russianresult = russianpatten.search(contents)
            
            //제목
            if let title = regexresult?.group(1){
                self.book_name = title
                //print(title)
            }
            //키워드 처리
            let keyword_patten = re.compile("[가-힣\\d\\s]+")
            if let keyword_result = regexresult?.group(2){
                let kwd_list = keyword_patten.findall(keyword_result)
                for i in kwd_list{
                    keyword_title_list.append(i)
                    print(i)
                }
            }
            
            //본문
            let content_patten = re.compile("([가-힣\",.!?\\s\\d:~]+)t")
            if let content_result = regexresult?.group(3){
                let content_list = content_patten.findall(content_result)
                for i in content_list{
                    //print(i.trimmingCharacters(in: ["t"]))
                    main_content.append(i.trimmingCharacters(in: ["t"]))
                }
            }
            
            //러시아어
            /*
            if let a = russianresult?.group(1){
                print(a)
            }*/
            let rus_patten = re.compile("([\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}\",.!?\\s\\d\\-:~]+)", flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            if let rs_result = russianresult?.group(1){
                let rus_list = rus_patten.findall(rs_result)
                for i in rus_list{
                    //print(i.trimmingCharacters(in: ["t"]))
                    russian_content.append(i.trimmingCharacters(in: ["t"]))
                }
            }

        }catch let error as NSError{
            print("Error access directory: \(error)")
        }
    }
    
    func loadKeyword(){
        for i in keyword_title_list{
            //let kwd = Keyword(i)
            //keyword_list.append(kwd)
            //keyword_list.append(Keyword(i))
            if i != " "{
                let k = Keyword(i)
                print(k.keyword_contents)
            }
        }
    }
}
