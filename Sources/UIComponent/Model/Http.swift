//
//  File.swift
//  
//
//  Created by YanunYang on 2022/11/1.
//

import Foundation

public struct Http {}

extension Http {
    public static func SendRequest<T>(toUrl path: String, type: T.Type, action: @escaping (URLRequest) -> URLRequest) -> T? where T: Decodable {
        guard let url = URL(string: path) else {
            print("failed to generate url from string: \(path)")
            return nil
        }
        let channel = DispatchSemaphore(value: 0)
        var result: T? = nil
        
        var request = URLRequest(url: url, timeoutInterval: 30)
        request = action(request)
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            defer { channel.signal() }
            guard
                let data = data,
                error == nil ,
                let responce = responce as? HTTPURLResponse,
                responce.statusCode == 200 else {
                print("Failed to download data")
                return
            }
            print("complete download, data length: \(data.count)")
            guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                print("decode data failed")
                return
            }
            result = decoded
            
        }.resume()
        channel.wait()
        return result
    }
    
    public func DumpRequest(toUrl path: String, action: @escaping (URLRequest) -> URLRequest) -> String {
        guard let url = URL(string: path) else {
            print("failed to generate url from string: \(path)")
            return ""
        }
        let channel = DispatchSemaphore(value: 0)
        var result: String = ""
        
        var request = URLRequest(url: url, timeoutInterval: 30)
        request = action(request)
        
        URLSession.shared.dataTask(with: request) { data, responce, error in
            defer { channel.signal() }
            guard
                let data = data,
                error == nil ,
                let responce = responce as? HTTPURLResponse,
                responce.statusCode == 200 else {
                print("Failed to download data")
                return
            }
            print("complete download, data length: \(data.count)")
            result = String(decoding: data, as: UTF8.self)
            
        }.resume()
        channel.wait()
        return result
    }
    
    public func RequestStatusCode(toUrl path: String, action: @escaping (URLRequest) -> URLRequest) -> Int? {
        guard let url = URL(string: path) else {
            print("failed to generate url from string: \(path)")
            return nil
        }
        let channel = DispatchSemaphore(value: 0)
        var result: Int? = nil
        
        var request = URLRequest(url: url, timeoutInterval: 30)
        request = action(request)
        
        URLSession.shared.dataTask(with: request) { _, responce, error in
            defer { channel.signal() }
            guard
                error == nil ,
                let responce = responce as? HTTPURLResponse else {
                print("Failed to download data")
                return
            }
            result = responce.statusCode
            
        }.resume()
        channel.wait()
        return result
    }
}
