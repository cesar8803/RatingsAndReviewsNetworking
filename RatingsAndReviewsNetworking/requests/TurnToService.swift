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
        func getTokenOfIsInvalid(number_try_request:Int, number_try_token_request:Int)
        {
            if number_try_token_request >= TurnToConfig.sharedInstance.max_try_get_request
            {
                errorCompletion("Se ha sobrepasado el número de intentos '\(TurnToConfig.sharedInstance.max_try_get_request)' de obtención de token de autenticacion para los servicios.")
                return
            }
            //
            self.getNewTokenAgain(completion: { (error) in
                if error != nil
                {
                    getTokenOfIsInvalid(number_try_request: number_try_request, number_try_token_request: number_try_token_request + 1)
                }
                else
                {
                    recursiveRequestWhenTokenInvalid(number_try_request: number_try_request + 1)
                }
            })
        }
        
        func recursiveRequestWhenTokenInvalid(number_try_request:Int)
        {
            if number_try_request >= TurnToConfig.sharedInstance.max_try_get_request
            {
                errorCompletion("Se ha sobrepasado el número de intentos '\(TurnToConfig.sharedInstance.max_try_get_request)' de invocación al servicio.")
                return
            }
            
            Alamofire.request(typeRequest).responseObject { (response:DataResponse<T>) in
                if response.result.isSuccess
                {
                    if let data = response.result.value?.toJSON()
                    {
                        if let errores = data["errors"] as? [[String:Any]]
                        {
                            if !errores.isEmpty
                            {
                                if let code = errores[0]["code"] as? Int, let message = errores[0]["message"] as? String
                                {
                                    if code == 117 && message.lowercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "invalid access token"
                                    {
                                        getTokenOfIsInvalid(number_try_request: number_try_request, number_try_token_request: 0)
                                    }
                                    else
                                    {
                                       completion(response.result.value!)
                                    }
                                }
                                else
                                {
                                    errorCompletion("Hay error, pero el servicio no identifica de que tipo, validar respuesta de errores")
                                }
                            }
                            else
                            {
                                errorCompletion("Hay error, pero el servicio no identifica los tipos disponibles, verificar.")
                            }
                        }
                        else
                        {
                           completion(response.result.value!)
                        }
                    }
                    else
                    {
                        errorCompletion("No hay datos de respuesta en el servicio, validar request")
                    }
                }
                else
                {
                    errorCompletion((response.result.error?.localizedDescription)!)
                }
            }
        }
        //
        recursiveRequestWhenTokenInvalid(number_try_request: 0)
    }
    
    /**
     Funcion para obtener autumaticamente nuevo token
    */
    private static func getNewTokenAgain(completion:@escaping(_ error:String?)->Void)
    {
        let accesData = TurnToObjAccessToken(client_id: TurnToConfig.sharedInstance.client_id, client_secret: TurnToConfig.sharedInstance.client_secret, grant_type: TurnToConfig.sharedInstance.grant_type)
        //
        TurnToService.callServiceWith(typeRequest: TurnToRouterRequest.accessToken(params: accesData), completion: { (response:TTGetAccessTokenObject) in
            if let error = response.errors
            {
                if !error.isEmpty
                {
                    completion(error[0].message ?? "no hay mensaje")
                }
                else
                {
                    completion("Hay error, pero no vienen para ser identificados")
                }
            }
            else
            {
                let token = "\(response.token_type ?? "xxx") \(response.access_token ?? "0")"
                TurnToConfig.sharedInstance.accesApiToken = "\(token)"
                //
                completion(nil)
            }
        }) { (error) in
            completion(error)
        }
    }
}
