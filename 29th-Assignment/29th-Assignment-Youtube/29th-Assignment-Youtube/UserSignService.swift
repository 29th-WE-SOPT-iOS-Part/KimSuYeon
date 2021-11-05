//
//  UserSignService.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/03.
//

import Foundation
import Alamofire

struct UserSignService{
    static let shared = UserSignService()
    
    // 로그인 통신할 때 사용할 함수 , 우리는 email과. pw를 받음.
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.loginURL // 통신할 api 주소
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json" // 요청 헤더
        ]
        
        let body: Parameters = [
            "email": email,
            "password": password // 요청 바디
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 우리가 만든 요청서의 responseData 함수를 호출함으로써 데이터 통신 시작 !
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    // 서버 통신 자체는 성공일지라도 응답 실패로 우리가원하는 데이터를 받지 못한 상태일 때를 분기처리하기 위한 함수.
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isVaildLoginData(data: data)
        case 400: return isPathErr(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    // 정말 원하는 데이터가 들어왔을 때, 데이터 처리를 위한 함수
    private func isVaildLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
        else { return .pathErr(data) }
        return .success(decodedData)
    }
    
    private func isPathErr(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
        else { return .pathErr(data)}
        return .pathErr(decodedData)
        
    }
    
    func signUp(email: String,
                name: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.signUpURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "name": name,
            "password": password // 요청 바디
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    // 서버 통신 자체는 성공일지라도 응답 실패로 우리가원하는 데이터를 받지 못한 상태일 때를 분기처리하기 위한 함수.
    private func judgeSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isVaildSignUpData(data: data)
        case 400: return isSignUpPathErr(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    // 정말 원하는 데이터가 들어왔을 때, 데이터 처리를 위한 함수
    private func isVaildSignUpData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data)
        else {return .pathErr(data)}
        return .success(decodedData)
    }
    
    private func isSignUpPathErr(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
        else { return .pathErr(data)}
        return .pathErr(decodedData)
    }
}
