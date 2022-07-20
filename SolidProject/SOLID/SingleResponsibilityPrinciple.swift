//
//  SingleResponsibilityPrinciple.swift
//  SolidProject
//
//  Created by iMac on 2022/07/20.
//

struct User: Codable {
    var name: String
    var age: Int
}

import Foundation

class LoginServerBadCase {
    private let userDefaultsKey = "user"

    func login(id: String, pw: String) {
        let userData = requestLogin()
        let user = decodeUserInfom(data: userData)
        let data = encodeUserDataToJson(user: user)
        saveUserOnDatabase(data: data)
    }

    func loadUserInfo() {
        let savedData = getStringDataFromDatabase()
        decodeUserInfoFromData(data: savedData)
    }

}

private extension LoginServerBadCase {
    func requestLogin() -> Data {
        return Data()
    }

    func decodeUserInfom(data: Data) -> User {
        return User(
            name: "David",
            age: 10
        )
    }

    func saveUserOnDatabase(data: Data) {
        UserDefaults.standard.set(data, forKey: userDefaultsKey)
        print("UserDataSaved!")
    }

    func encodeUserDataToJson(user: User) -> Data {
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(user) else { return Data() }
        return encodedData
    }

    func getStringDataFromDatabase() -> Data {
        guard let data = UserDefaults.standard.object(forKey: userDefaultsKey) as? Data else { return Data() }
        return data
    }

    func decodeUserInfoFromData(data: Data) {
        let decoder = JSONDecoder()
        guard let userInfo = try? decoder.decode(User.self, from: data) else { return }
        print(userInfo)

    }
}

protocol APIHandlerProtocol {
    func requestLogin() -> Data
}

protocol DecodingHandlerProtocol {
    func decode<T: Decodable>(from data: Data) -> T
}

protocol DBHandlerProtocol {
    func saveOnDatabase<T: Codable>(inform: T)
}


class LoginServerNiceCase {
    let apiHandler: APIHandlerProtocol
    let decodingHandler: DecodingHandlerProtocol
    let dbHandler: DBHandlerProtocol

    init(
        apiHandler: APIHandlerProtocol,
        decodingHandler: DecodingHandlerProtocol,
        dbHandler: DBHandlerProtocol
    ) {
        self.apiHandler = apiHandler
        self.decodingHandler = decodingHandler
        self.dbHandler = dbHandler
    }

    func login() {
        let loginData = apiHandler.requestLogin()
        let user: User = decodingHandler.decode(from: loginData)
        dbHandler.saveOnDatabase(inform: user)
    }
}

class RequestHandler: APIHandlerProtocol {
    func requestLogin() -> Data {
        let user = User(name: "Test", age: 22)
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(user) else { return Data() }
        return encodedData
    }
}

class DecodingHandler: DecodingHandlerProtocol {
    func decode<T: Decodable>(from data: Data) -> T {
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(T.self, from: data)
        return decodedData!

    }
}

class DatabaseHandler: DBHandlerProtocol {
    func saveOnDatabase<T: Codable>(inform: T) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(inform) else { return }
        UserDefaults.standard.set(data, forKey: "userKey")
        print("LoginInfoSaved")
        guard let userInfo = UserDefaults.standard.object(forKey: "userKey") as? Data else { return }
        let decoder = JSONDecoder()
        let encodedInfo = try? decoder.decode(T.self, from: userInfo)
        print(encodedInfo)
    }
}

