//
//  ContentView.swift
//  Github Profile Viewer
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var user: GithubUser?
    
    var body: some View {
        VStack(spacing:20) {
            AsyncImage(url: URL(string: user?.avatarUrl ?? "" )) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .clipShape(Circle())
                
            } placeholder: {
                Circle()
                    .foregroundStyle(Color.secondary)
            }
            .frame(width: 120,height: 120)

            Text(user?.login ?? "Username" )
                .foregroundStyle(Color.primary)
                .font(.largeTitle)
                .bold()
            Text(user?.bio ?? "This is where the bio displays,lets meke it to second Line")
                .foregroundStyle(Color.primary)
                .font(.system(size: 20))
                .padding(12)
            
            Text(user?.createdAt ?? "Email not public")
                .foregroundStyle(Color.primary)
                .font(.system(size: 20))
                .padding(12)
            
            
            
            Spacer()
        }
        .padding()
        .task {
            do{
                user = try await getUser()
            }
            catch GithubError.invalidResponse{
                print("Error Response")
            }catch GithubError.invalidData{
                print("Error Data")
            }catch GithubError.invalidURL{
                print("Error URL")
            }catch {
                print("Error")
            }
        }
    }
    
    func getUser() async throws -> GithubUser{
        let endpoint = "https://api.github.com/users/JoySwaroop"
        guard let url = URL(string: endpoint) else{throw GithubError.invalidURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
            throw GithubError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        }catch{
            throw GithubError.invalidData
        }
    }
}

#Preview {
    ContentView()
}

struct GithubUser: Codable{
    let login:String
    let avatarUrl:String
    let bio:String
    let followers: Int
    let createdAt:String
  
}

enum GithubError:Error{
    case invalidURL
    case invalidResponse
    case invalidData
    
}
