import UIKit

class AppService {
    static let shared = AppService()
    
    let API = "https://api.euprogramador.app/app-store/v1"
    
    func getFeaturedApps(completion: @escaping ([FeaturedApp]?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps/apps-em-destaque") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else { return }
                let apps = try JSONDecoder().decode([FeaturedApp].self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
    
    func getGroupApp(type: String, completion: @escaping (AppGrouop?, Error?) -> ()) {
        
        guard let url = URL(string: "\(API)/apps/\(type)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else { return }
                let apps = try JSONDecoder().decode(AppGrouop.self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
        
    }
    
    func searchAppId(appId: Int, completion: @escaping(App?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps/\(appId)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else { return }
                let app = try JSONDecoder().decode(App.self, from: data)
                completion(app, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
    
    func searchApps(completion: @escaping([App]?, Error?) -> ()) {
        guard let url = URL(string: "\(API)/apps") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else { return }
                let apps = try JSONDecoder().decode([App].self, from: data)
                completion(apps, nil)
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }

}
