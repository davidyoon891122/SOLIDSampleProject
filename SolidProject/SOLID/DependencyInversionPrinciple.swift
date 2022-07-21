//
//  DependencyInversionPrinciple.swift
//  SolidProject
//
//  Created by iMac on 2022/07/21.
//

import Foundation

class APIHandlerDIP {
    func request() -> Data {
        return Data(base64Encoded: "This Data") ?? Data()
    }
}

class LoginServiceForDIP {
    let apiHandler = APIHandlerDIP()

    func login() {
        let loginData = apiHandler.request()
        print(loginData)
    }
}

protocol APIHandlerProtocolForDIP {
    func requestAPI() -> Data
}

class LoginServiceForDIPNice {
    let apiHandler: APIHandlerProtocolForDIP

    init(
        apiHandler: APIHandlerProtocolForDIP
    ) {
        self.apiHandler = apiHandler
    }

    func login() {
        let loginData = apiHandler.requestAPI()
        print(loginData)
    }
}

class LoginAPI: APIHandlerProtocolForDIP {
    func requestAPI() -> Data {
        return Data(base64Encoded: "User") ?? Data()
    }
}


