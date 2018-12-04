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
    var japanese_content:[String] = []
    
    init() {}
    
    init(_ filename:String){
        let bundlePath = Bundle.main.url(forResource: filename, withExtension: "txt", subdirectory: "fairytales.bundle")
        
        do {
            //파일 오픈
            let contents = try String(contentsOf: (bundlePath)!, encoding: .utf8)
            //print(contents)
            //파일 전체 내용을 잘라서 저장
            let mainpatten = re.compile("name=([가-힣\\d\\s,]+)\\skeyword=([가-힣\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}\\x{4E00}-\\x{9FFF}\\x{3040}-\\x{309F}ー\\x{30A0}-\\x{30FF}\\d\\s,]+)\\scontents=([\n가-힣a-z\",.!?\\s:~]+)")
            let russianpatten = re.compile("\\srussia=([\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}a-z\",.!?\\s\\d\\-:~]+)",flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            let japanpatten = re.compile("\\sjapan=([\\x{4E00}-\\x{9FFF}\\x{3040}-\\x{309F}ー\\x{30A0}-\\x{30FF}々「」（）、。！？：a-z\\d\\s]+)", flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            
            let regex_result = mainpatten.search(contents)
            let russian_result = russianpatten.search(contents)
            let japanese_result = japanpatten.search(contents)
            
            //제목
            if let title = regex_result?.group(1){
                self.book_name = title
                //print(title)
            }
            //키워드 처리
            let keyword_patten = re.compile("[가-힣\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}\\x{4E00}-\\x{9FFF}\\x{3040}-\\x{309F}ー\\x{30A0}-\\x{30FF}\\d\\s]+")
            if let keyword_result = regex_result?.group(2){
                let kwd_list = keyword_patten.findall(keyword_result)
                for i in kwd_list{
                    keyword_title_list.append(i)
                   //print(i)
                }
            }
            
            //본문
            let content_patten = re.compile("([가-힣\",.!?\\s\\d:~]+)t")
            if let content_result = regex_result?.group(3){
                let content_list = content_patten.findall(content_result)
                for i in content_list{
                    //print(i.trimmingCharacters(in: ["t"]))
                    main_content.append(i.trimmingCharacters(in: ["t"]))
                }
            }
            
            //러시아어
            let rus_patten = re.compile("([\\x{0410}-\\x{044F}\\x{0500}-\\x{052F}\\x{0400}-\\x{04FF}\",.!?\\s\\d\\-:~]+)", flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            if let rs_result = russian_result?.group(1){
                let rus_list = rus_patten.findall(rs_result)
                for i in rus_list{
                    //print(i.trimmingCharacters(in: ["t"]))
                    russian_content.append(i.trimmingCharacters(in: ["t"]))
                }
            }
            
            //일본어
            let jap_patten = re.compile("([\\x{4E00}-\\x{9FFF}\\x{3040}-\\x{309F}ー\\x{30A0}-\\x{30FF}々「」（）、。！？：\\d\\s]+)", flags: re.RegexObject.Flag.useUnicodeWordBoundaries)
            if let jp_result = japanese_result?.group(1){
                let jap_list = jap_patten.findall(jp_result)
                for i in jap_list{
                    japanese_content.append(i.trimmingCharacters(in: ["t"]))
                }
            }

        }catch let error as NSError{
            print("Error access directory: \(error)")
        }
    }
    
    func loadKeyword(){
        for i in keyword_title_list{
            if i != " "{
                var kwd : Keyword;
                let keyword_patten = re.compile("[가-힣\\d\\s]+")
                if keyword_patten.match(i) != nil{
                    kwd = Keyword(filename: i)
                }
                else {
                    kwd = Keyword(keyword: i,copy: keyword_list[keyword_list.count/3 + 2 * (keyword_list.count/3)])
                }
                keyword_list.append(kwd)
            }
        }
        
    }
}
