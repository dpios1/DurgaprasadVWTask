//
//  HttpUtility.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//



import Foundation


struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: [T]?)-> Void)
    {
        LoadingView.show()
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            LoadingView.hide()
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(Array<T>.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }else{
                
            }

        }.resume()
    }
}


