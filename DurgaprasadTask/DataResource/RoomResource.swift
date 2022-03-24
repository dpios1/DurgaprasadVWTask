//
//  RoomResource.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 24/03/22.
//

import Foundation

struct RoomResource
{
    func roomData(_ request: String, completion : @escaping (_ result: [Rooms]?) -> Void)
    {
        guard let roomUrl = URL(string: ApiEndpoints.baseUrl + request) else {return}
        let httpUtility = HttpUtility()
        do {

            httpUtility.getApiData(requestUrl: roomUrl, resultType: Rooms.self) { result in
                completion(result)
            }
        }

    }
}
