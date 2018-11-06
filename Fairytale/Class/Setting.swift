//
//  Setting.swift
//  Fairytale
//
//  Created by window on 2018. 10. 14..
//  Copyright © 2018년 WunGim. All rights reserved.
//

import UIKit
//전역 변수로서 UserDefalut 재정의
let defaults = UserDefaults.standard
class Setting{
    var isExist :Bool = false
    //언어 설정
    let language_list:[String] = ["kor,eng,rus"]    //지정 가능한 언어 리스트
    var main_language:String = ""                      //메인 언어
    var sub_language:String = ""                        //서브 언어
    
    //폰트 및 글자 크기
    var font_size:Int?                              //폰트 크기
    
    init(filename:String){
    }
}
