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
        let stringData = getStringDataFromDatabase()
        print(stringData)
    }

}

private extension LoginServerBadCase {
    func requestLogin() -> Data {
        return Data()
    }

    func decodeUserInfom(data: Data) -> User {
        return User(
            name: "",
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

    func getStringDataFromDatabase() -> String {
        guard let data = UserDefaults.standard.string(forKey: userDefaultsKey) else { return ""}
        return data
    }
}
