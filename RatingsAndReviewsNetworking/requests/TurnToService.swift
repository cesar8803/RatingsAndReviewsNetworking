//
//  TurnTo.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class TurnToService
{
    private init() {}
    
    /**
     Unica peticion generica para ser utilizada en todas las llamadas al servicio de TurnTo
    */
    public static func callServiceWith<T:Mappable>(typeRequest:URLRequestConvertible, completion:@escaping (_ dataResponse:T) -> Void, errorCompletion:@escaping (_ errorString:String)->Void)
    {
        Alamofire.request(typeRequest).responseObject { (response:DataResponse<T>) in
            if response.result.isSuccess
            {
                let responseService = response.result.value
                completion(responseService!)
            }
            else
            {
                errorCompletion((response.result.error?.localizedDescription)!)
            }
        }
    }
}
