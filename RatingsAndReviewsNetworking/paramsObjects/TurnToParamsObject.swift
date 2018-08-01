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
    public var limit    : Int
    public var offset   : Int
    
    public init(skuList:[String], limit:Int=50, offset:Int=0)
    {
        self.limit = limit
        self.offset = offset
        //
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
            "sku": self.sku,
            "limit": self.limit,
            "offset": self.offset
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
    public var title                        : String
    public var text                         : String
    public var dimensions                   : [TurnToObjDimensions]
    
    //optionals
    public var externalId                   : String?
    public var dateCreated                  : String?
    public var locale                       : String?
    public var acceptedTermsAndConditions   : String?
    public var userIpAddr                   : String?
    public var userAgent                    : String?
    public var media                        : TurnToObjMedia?
    public var turntoTrackingToken          : String?
    
    public init(rating:Int, user:TurnToObjUser, catalogItems:[TurnToObjCatalogItems], title:String, text:String, dimensions:[TurnToObjDimensions])
    {
        self.rating = rating
        self.user = user
        self.catalogItems = catalogItems
        self.title = title
        self.text = text
        self.dimensions = dimensions
        //
        self.externalId = nil
        self.dateCreated = nil
        self.locale = nil
        self.acceptedTermsAndConditions = nil
        self.userIpAddr = nil
        self.userAgent = nil
        self.media = nil
        self.turntoTrackingToken = nil
    }
    
    public func getDict() -> [String : Any]
    {
        var dict:[String:Any] = [
            "autoModerated": false,
            "catalogItems": self.catalogItems,
            "published": false,
            "rating": self.rating,
            "text": self.text,
            "title": self.title,
            "user":self.user.getDict()
        ]
        //
        var data:[[String:Any]] = []
        for item in self.dimensions
        {
            data.append(item.getDict())
        }
        //
        dict["dimensions"] = data
        //
        //"token":TurnToConfig.sharedInstance.token,
        //"typeToken":TurnToConfig.sharedInstance.typeToken,
        if self.media != nil
        {
            dict["media"] = self.media!.getDict()
        }
        //
        return dict
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
    public var ageRange         : Int?
    public var shopperProfiles  : [TurnToObjShopperProfiles]?
    
    public init(firstName:String, lastName:String)
    {
        self.firstName = firstName
        self.lastName = lastName
        //
        self.nickName = nil
        self.emailAddress = nil
        self.externalId = nil
        self.city = nil
        self.state = nil
        self.country = nil
        self.ageRange = nil
        self.shopperProfiles = nil
    }
    
    public func getDict() -> [String : Any]
    {
        var dict:[String:Any] = [
            "firstName": self.firstName,
            "lastName": self.lastName
        ]
        //
        if self.nickName != nil { dict["nickName"] = self.nickName! }
        if self.emailAddress != nil { dict["emailAddress"] = self.emailAddress! }
        if self.externalId != nil { dict["externalId"] = self.externalId! }
        if self.city != nil { dict["city"] = self.city!}
        if self.state != nil { dict["state"] = self.state }
        if self.country != nil { dict["country"] = self.country }
        if self.ageRange != nil { dict["ageRange"] = self.ageRange }
        
        return dict
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
    public var value        : Int
    public var type         : Int
    //
    public var dimensionId  : Int?
    
    public init(value:Int, type:Int)
    {
        self.value = value
        self.type = type
        //
        self.dimensionId = nil
    }
    
    public func getDict() -> [String : Any]
    {
        var dict:[String:Any] = [
            "value": self.value,
            "type": self.type
        ]
        //
        if self.dimensionId != nil
        {
            dict["dimensionId"] = self.dimensionId!
        }
        //
        return dict
    }
}

public struct TurnToObjMedia:TurnToGeneric
{
    //optionals
    //public var ids      : [Int]?//ids no se manda porque ya no se utilizara
    public var photos   : [TurnToObjPhotos]?
    //public var videos   : [TurnToObjVideos]?//Videos no se manda porque ya no se utilizara
    
    public func getDict() -> [String : Any]
    {
        var dict:[String:Any] = [
            "video": [],
            "audio": [],
            "photo": []
        ]
        //
        if self.photos != nil
        {
            if !self.photos!.isEmpty
            {
                var data:[[String:Any]] = []
                //
                for item in self.photos!
                {
                    data.append(item.getDict())
                }
                //
                dict["photo"] = data
            }
        }
        //
        return dict
    }
}

public struct TurnToObjPhotos:TurnToGeneric
{
    //required
    public var b64data      : String
    public var description  : String
    public var id           : Int
    
    //optionals
    public var caption      : String
    
    public init(b64data:String, description:String, id:Int)
    {
        self.b64data = b64data
        self.description = description
        self.id = id
        //
        self.caption = self.description
    }
    
    public func getDict() -> [String : Any]
    {
        let dict:[String:Any] = [
            "id": self.id,
            "b64data": "data:image/png;base64,\(self.b64data)",
            "description": self.description,
            "caption": self.caption
        ]
        //
        return dict
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
    public var title       : String?
    public var url         : String?
    
    public init(sku:String)
    {
        self.sku = sku
        self.title = nil
        self.url = nil
    }
    
    public func getDict() -> [String : Any]
    {
        let dict:[String:Any] = [
            "sku": self.sku,
            "averageRating": 0,
            "ratingCount": 0,
            "reviewCount": 0
        ]
        //
        return dict
    }
}

/*********
 Este aplica para el servicio de Search
 *******************/
public struct TurnToObjSearch:TurnToGeneric
{
    //Properties
    public var word     : String
    public var sku      : String
    public var limit    : Int
    public var offset   : Int
    
    
    public init(word:String,sku:String, limit:Int=50, offset:Int=0)
    {
        self.limit = limit
        self.offset = offset
        self.sku = sku
        self.word = word
    }
    
    public func getDict() -> [String : Any]
    {
        let dict:[String:Any] = [
            "q": self.word,
            "sku": self.sku,
            "limit": self.limit,
            "offset": self.offset,
            "ugcType":"review",
            "publishedOnly":"true"
        ]
        //
        return dict
    }
}


/*********
 Este aplica para el servicio de CustomFields
 *******************/
public struct TurnToObjCustomFields:TurnToGeneric
{
    //Properties
   
    public var sku      : String
    
    
    public init(sku:String)
    {
       
        self.sku = sku
      
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
 Objeto para actualizar item
 *******************/
public struct TurnToUpdateProduct:TurnToGeneric
{
    
    
    public func getDict() -> [String : Any]
    {
        return [:]
    }
}

































































































































