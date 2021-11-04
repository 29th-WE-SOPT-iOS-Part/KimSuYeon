//
//  APIConstants.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/03.
//

import Foundation
struct APIConstants {
    //MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: Feature URL
    static let loginURL = baseURL + "/user/login"
    static let signUpURL = baseURL + "/user/signup"
    
}
