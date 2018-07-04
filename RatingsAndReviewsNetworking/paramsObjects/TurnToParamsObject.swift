//
//  TurnToParamsObject.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 04/07/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

/**************
 Estructuras de los objetos requeridos para la creacion
 de los request necesarios para el API de TurnTo
 *********************/

public struct TurnToObjAccessToken:TurnToGeneric
{
    //Properties
    public var client_id        : String
    public var client_secret    : String
    public var grant_type       : String
    
    public init(client_id:String, client_secret:String, grant_type:String)
    {
        self.client_id = client_id
        self.client_secret = client_secret
        self.grant_type = grant_type
    }
    
    public func getDict() -> [String : Any]
    {
        let dict:[String:Any] = [
            "client_id":        self.client_id,
            "client_secret":    self.client_secret,
            "grant_type":       self.grant_type
        ]
        //
        return dict
    }
}

public struct TurnToObjInvAccessToken:TurnToGeneric
{
    //Properties
    public var client_id       : String
    public var client_secret   : String
    public var access_token    : String
    
    public init(client_id:String, client_secret:String, access_token:String)
    {
        self.client_id = client_id
        self.client_secret = client_secret
        self.access_token = access_token
    }
    
    public func getDict() -> [String : Any]
    {
        let dict:[String:Any] = [
            "client_id":        self.client_id,
            "client_secret":    self.client_secret,
            "access_token":     self.access_token
        ]
        //
        return dict
    }
}

/**
 Este aplica para el servicio de RewviewList-ProductList-UgcSummary
*/
public struct TurnToObjAskSku:TurnToGeneric
{
    //Properties
    public var skuList  : [String]
    public var sku      : String
    
    public init(skuList:[String])
    {
        self.sku = ""
        self.skuList = skuList
        //
        for (index, item) in self.skuList.enumerated()
        {
            let separated = index != (self.skuList.count - 1) ? "," : ""
            //
            self.sku += "\(item)\(separated)"
        }
    }
    
    public func getDict() -> [String : Any]
    {
        let dict:[String:Any] = [
            "sku": self.sku
        ]
        //
        return dict
    }
}

public struct TurnToObjCreateReview:TurnToGeneric
{
    //Properties
    
    
    public func getDict() -> [String : Any] {
        return [:]
    }
}

public struct TurnToUpdateProduct:TurnToGeneric
{
    
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

































































































































