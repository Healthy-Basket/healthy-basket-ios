//
//  LoginViewModel.swift
//  Healthy basket
//
//  Created by Muktar Aisak on 09/12/2024.
//

import Foundation

enum LoginError: Error, LocalizedError {
      case serverError(String)
      case unknownError
      
      var errorDescription: String? {
          switch self {
          case .serverError(let message):
              return message
          case .unknownError:
              return "An unknown error occurred. Please try again."
          }
      }
  }

final class LoginViewModel {
    @Published var email: String = ""
    @Published var password: String = ""
    
    let loginURL = "https://healthybasketapi.onrender.com/login"
    
    func loginUser(email: String, password: String) async throws -> UserModel {
        guard let url = URL(string: loginURL) else {
            throw URLError(.badURL)
        }
        
        // request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = [
            "email": email,
            "password": password
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            request.httpBody = jsonData
        } catch {
            throw URLError(.cannotParseResponse)
        }
        
        // perfom network call
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // validate the network response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(httpResponse.statusCode) {
            let errorResponse = try JSONDecoder().decode(APIError.self, from: data)
            throw LoginError.serverError(errorResponse.message)
        }
        
        let userModel = try JSONDecoder().decode(UserModel.self, from: data)
        return userModel
    }
}
