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
    public static func callServiceWith<T:Mappable>(type:TurnToTypeRequest = TurnToTypeRequest.simpleObject, typeRequest:URLRequestConvertible, completion:((_ dataResponse:T) -> Void)?, completionList:((_ dataResponse:[T])->Void)?, errorCompletion:((_ errorString:String)->Void)?)
    {
        func getTokenOfIsInvalid(number_try_request:Int, number_try_token_request:Int)
        {
            if number_try_token_request >= TurnToConfig.sharedInstance.max_try_get_request
            {
                errorCompletion?("Se ha sobrepasado el número de intentos '\(TurnToConfig.sharedInstance.max_try_get_request)' de obtención de token de autenticacion para los servicios.")
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
                errorCompletion?("Se ha sobrepasado el número de intentos '\(TurnToConfig.sharedInstance.max_try_get_request)' de invocación al servicio.")
                return
            }
            
            Alamofire.request(typeRequest).responseObject { (response:DataResponse<T>) in
                if type  == TurnToTypeRequest.listObject
                {
                    /***
                     Caso especial el momento de serializar ya que este contiene como respuesta un arreglo
                     y no un objeto, por lo que confunde al Mapper, a lo cual hay que manejar de forma
                     diferente los datos obtenidos
                    *********/
                    if let data = response.data
                    {
                        do
                        {
                            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
                            //
                            if let customFields = Mapper<T>().mapArray(JSONObject: json)
                            {
                                if customFields.count > 0
                                {
                                    completionList?(customFields)
                                }
                            }
                            else
                            {
                                errorCompletion?("Error al mapear los datos de respuesta del servicio.")
                            }
                        }catch let error as NSError {
                            errorCompletion?(error.localizedDescription)
                        }
                    }
                    else
                    {
                        errorCompletion?("Error al obtener datos del servicio")
                    }
                }
                else
                {
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
                                            completion?(response.result.value!)
                                        }
                                    }
                                    else
                                    {
                                        errorCompletion?("Hay error, pero el servicio no identifica de que tipo, validar respuesta de errores")
                                    }
                                }
                                else
                                {
                                    errorCompletion?("Hay error, pero el servicio no identifica los tipos disponibles, verificar.")
                                }
                            }
                            else
                            {
                                completion?(response.result.value!)
                            }
                        }
                        else
                        {
                            errorCompletion?("No hay datos de respuesta en el servicio, validar request")
                        }
                    }
                    else
                    {
                        errorCompletion?(response.result.error?.localizedDescription ?? "error no especificado")
                    }
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
        }, completionList: nil) { (error) in
            completion(error)
        }
    }
}
