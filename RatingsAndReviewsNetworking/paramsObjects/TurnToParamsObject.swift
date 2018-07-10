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

/*********
 Objjeto para optencion e Invalidacion de Token para API
*******************/
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
        let dict:[String:Any] =  [
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

/*********
 Este aplica para el servicio de RewviewList-ProductList-UgcSummary
*******************/
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

/*********
 Objeto para crear un review y calificar
 *******************/
public struct TurnToObjCreateReview:TurnToGeneric
{
    //required
    public var rating                       : Int
    public var user                         : TurnToObjUser
    public var catalogItems                 : [TurnToObjCatalogItems]
    
    //optionals
    public var externalId                   : String?
    public var dateCreated                  : String?
    public var title                        : String?
    public var text                         : String?
    public var locale                       : String?
    public var acceptedTermsAndConditions   : String?
    public var userIpAddr                   : String?
    public var userAgent                    : String?
    public var dimensions                   : [TurnToObjDimensions]?
    public var media                        : TurnToObjMedia?
    public var turntoTrackingToken          : String?
    
    public init(rating:Int, user:TurnToObjUser, catalogItems:[TurnToObjCatalogItems])
    {
        self.rating = rating
        self.user = user
        self.catalogItems = catalogItems
        //
        self.externalId = nil
        self.dateCreated = nil
        self.title = nil
        self.text = nil
        self.locale = nil
        self.acceptedTermsAndConditions = nil
        self.userIpAddr = nil
        self.userAgent = nil
        self.dimensions = nil
        self.media = nil
        self.turntoTrackingToken = nil
        //
        
    }
    
    public func getDict() -> [String : Any] {
        
        return [:]
    }
}

public struct TurnToObjUser :TurnToGeneric
{
    //required
    public var firstName        : String
    public var lastName         : String
    
    //optionals
    public var nickName         : String?
    public var emailAddress     : String?
    public var externalId       : String?
    public var city             : String?
    public var state            : String?
    public var country          : String?
    public var ageRange         : Int!
    public var shopperProfiles  : [TurnToObjShopperProfiles]?
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

public struct TurnToObjShopperProfiles:TurnToGeneric
{
    //optionals
    public var idShopper       : Int?
    public var value           : String?
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

public struct TurnToObjDimensions:TurnToGeneric
{
    //optionals
    public var valueDimension   : Int?
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

public struct TurnToObjMedia:TurnToGeneric
{
    //optionals
    public var ids      : [Int]?
    public var photos   : [TurnToObjPhotos]?
    public var videos   : [TurnToObjVideos]?
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

public struct TurnToObjPhotos:TurnToGeneric
{
    //required
    public var b64data      : String
    
    //optionals
    public var caption      : String?
    
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

public struct TurnToObjVideos:TurnToGeneric
{
    //required
    public var url          : String
    
    //optionals
    public var caption      : String?
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

public struct TurnToObjCatalogItems:TurnToGeneric
{
    //required
    public var sku         : String
    
    //optionals
    public var title       : String
    public var url         : String
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

/*********
 Objeto para actualizar item
 *******************/
public struct TurnToUpdateProduct:TurnToGeneric
{
    
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

































































































































