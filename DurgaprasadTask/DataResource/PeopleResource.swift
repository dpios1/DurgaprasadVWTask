//
//  PeopleResource.swift
//  DurgaprasadTask
//
//  Created by SPURGE on 23/03/22.
//

import Foundation

struct PeopleResource
{
    func peopleData(_ request: String, completion : @escaping (_ result: [People]?) -> Void)
    {
        guard let peopleUrl = URL(string: ApiEndpoints.baseUrl + request) else {return}
        let httpUtility = HttpUtility()
        do {

            httpUtility.getApiData(requestUrl: peopleUrl, resultType: People.self) { result in
                completion(result)
            }
        }

    }
}
