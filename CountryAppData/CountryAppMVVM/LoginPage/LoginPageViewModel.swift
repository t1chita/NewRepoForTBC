//
//  LoginPageViewModel.swift
//  CountryAppMVVM
//
//  Created by Temur Chitashvili on 26.04.24.
//

import UIKit
import Security
class LoginPageViewModel {
    
    private enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case KCErrorWithCode(Int)
    }
    
    
    func save(
        userName: String,
        password: String
    ) throws {
        guard let passwordData = password.data(using: .utf8) else {
            print("Error Converting password to data")
            return
        }
        // service account password class
        let query: [String: AnyObject] = [
            kSecClass as String         : kSecClassInternetPassword,
            kSecAttrAccount as String   : userName as AnyObject,
            kSecValueData as String     : passwordData as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        ///......
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
        
        print("saved")
    }
    
    func deletePassword(userName: String) throws {
        let query: [String: AnyObject] = [
            kSecClass as String         : kSecClassInternetPassword,
            kSecAttrAccount as String   : userName as AnyObject,
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess else {
            throw KeyChainError.KCErrorWithCode(Int(status))
        }
    }
    
    
     func getAllKeyChainItemsOfClass(_ secClass: String) -> [String:String] {
        let query: [String: AnyObject] = [
            kSecClass as String : secClass as AnyObject,
            kSecReturnData as String  : kCFBooleanTrue as AnyObject,
            kSecReturnAttributes as String : kCFBooleanTrue as AnyObject,
            kSecReturnRef as String : kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitAll
        ]
        
        var result: AnyObject?
        
        let lastResultCode = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        var values = [String:String]()
        if lastResultCode == noErr {
            let array = result as? Array<Dictionary<String, Any>>
            
            for item in array! {
                if let key = item[kSecAttrAccount as String] as? String,
                   let value = item[kSecValueData as String] as? Data {
                    values[key] = String(data: value, encoding:.utf8)
                }
            }
        }
        
        return values
    }
}
