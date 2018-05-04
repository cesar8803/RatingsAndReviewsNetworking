//
//  TurnTo.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

public class TurnToService
{
    //private init() {}
    
    //public class func getRequestExecute<T:Mappable>(_ type:)
    
    /*class func getRequestExecute<T:Mappable>(_ type:BackendUrlMannager.ServiceUrlId, parameters: Parameters, completion:@escaping (_ dataResponse:T) -> Void, errorCompletition: @escaping (_ errorString:String) -> Void){
        
        let url = BackendUrlMannager.Current.getUrl(type)
        Alamofire.request(url, method: .get, parameters: parameters).responseObject { (response: DataResponse<T>) in
            
            if response.result.isSuccess{
                let responseService = response.result.value
                completion(responseService!)
            } else {
                errorCompletition((response.result.error?.localizedDescription)!)
            }
        }
    }*/
}
