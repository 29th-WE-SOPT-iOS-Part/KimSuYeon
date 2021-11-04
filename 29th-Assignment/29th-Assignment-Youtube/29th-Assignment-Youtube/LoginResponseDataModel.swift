//
//  LoginResponseDataModel.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/03.
//

import Foundation

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}

// MARK: - SignUpResponseData
struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpResultData?
}

// MARK: - SignUpResultData
struct SignUpResultData: Codable {
    let id: Int
    let name, email: String
}

