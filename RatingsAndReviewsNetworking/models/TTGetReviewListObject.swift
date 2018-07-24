//
//  ModelMapper.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 04/07/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import ObjectMapper

/*********
 Objetos de respuesta para listado de Reviews y búsqueda en Reviews
 *********************/
public class TTGetReviewListObject:Mappable
{
    public var results     : [TTReviewsObject]?
    public var reviews     : [TTReviewsObject]?
    public var offset      : Int?
    public var limit       : Int?
    public var total       : Int?
    public var errors      : [TTErrorObject]?
    public var filters     : TTFilters?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        results     <- map["results"]
        reviews     <- map["reviews"]
        offset      <- map["offset"]
        limit       <- map["limit"]
        total       <- map["total"]
        errors      <- map["errors"]
        filters     <- map["filters"]
    }
}

public class TTFilters:Mappable
{
    public var attributes      : [TTAttributes]?
    public var dimensions      : [TTDimensions]?
    public var userSettings    : TTUserSettings?
    public var rating          : [TTRating]?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        attributes      <- map["attributes"]
        dimensions      <- map["dimensions"]
        userSettings    <- map["userSettings"]
        rating          <- map["rating"]
    }
}

/*********
 Objetos de respuesta para, GetViewDetail, VoteUp, VoteDowns y MarkAsInapropiate
 *********************/
public class TTReviewsObject:Mappable
{
    public var idReview            : Int?
    public var localeReview        : String?
    public var rating              : Int?
    public var titleReview         : String?
    public var textReview          : String?
    public var textLength          : Int?
    public var csFlag              : Bool?
    public var inappropriateFlag   : Bool?
    public var reviewedFlag        : Bool?
    public var autoModerated       : Bool?
    public var published           : Bool?
    public var incentivized        : Bool?
    public var upVotes             : Int?
    public var downVotes           : Int?
    public var orderId             : Int?
    public var catalogItems        : [TTCatalogItems]?
    public var dimensions          : [TTDimensions]?
    public var media               : TTMedia?
    public var responses           : [TTResponse]?
    public var reviewedDate        : String?
    public var purchaseDate        : String?
    public var tags                : [String]?
    public var syndication         : String?
    public var dateCreated         : String?
    public var user                : TTUserReview?
    public var errors              : [TTErrorObject]?
    //
    public var isVoted             : Bool = false

    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        idReview            <- map["id"]
        localeReview        <- map["locale"]
        rating              <- map["rating"]
        titleReview         <- map["title"]
        textReview          <- map["text"]
        textLength          <- map["textLength"]
        csFlag              <- map["csFlag"]
        inappropriateFlag   <- map["inappropriateFlag"]
        reviewedFlag        <- map["reviewedFlag"]
        autoModerated       <- map["autoModerated"]
        published           <- map["published"]
        incentivized        <- map["incentivized"]
        upVotes             <- map["upVotes"]
        downVotes           <- map["downVotes"]
        orderId             <- map["orderId"]
        catalogItems        <- map["catalogItems"]
        dimensions          <- map["dimensions"]
        media               <- map["media"]
        responses           <- map["responses"]
        reviewedDate        <- map["reviewedDate"]
        purchaseDate        <- map["purchaseDate"]
        tags                <- map["tags"]
        syndication         <- map["syndication"]
        dateCreated         <- map["dateCreated"]
        user                <- map["user"]
        errors              <- map["errors"]
    }
}

public class TTResponse:Mappable
{
    public var textResponse    : String?
    public var locale          : String?
    public var user            : TTUserReview?
    public var dateCreated     : String?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        textResponse    <- map["text"]
        locale          <- map["locale"]
        user            <- map["user"]
        dateCreated     <- map["dateCreated"]
    }
}

public class TTUserSettings:Mappable
{
    public var shopperProfiles     : [TTShopperProfiles]?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        shopperProfiles     <- map["shopperProfiles"]
    }
}

public class TTRating:Mappable
{
    public var valueR      : Int?
    public var countR      : Int?
    public var filter      : String?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        valueR       <- map["value"]
        countR       <- map["count"]
        filter       <- map["filter"]
    }
}

public class TTDimensions:Mappable
{
    public var type            : Int?
    public var dimensionId     : Int?
    public var dimensionLabel  : String?
    public var valueDimension  : Int?
    public var onlyLabel       : [String]?
    
    public var values          : [TTValues]?
    public var sortOrder       : Int?
    public var name            : String?
    public var required        : Bool?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        type            <- map["type"]
        dimensionId     <- map["dimensionId"]
        dimensionLabel  <- map["dimensionLabel"]
        valueDimension  <- map["value"]
        onlyLabel       <- map["label"]
        values          <- map["values"]
        sortOrder       <- map["sortOrder"]
        name            <- map["name"]
        required        <- map["required"]
    }
}

public class TTDimensionsP:Mappable
{
    public var id              : Int?
    public var type            : Int?
    public var label           : String?
    public var values          : [TTValues]?
    public var sortOrder       : Int?
    public var required        : Bool?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        id              <- map["id"]
        type            <- map["type"]
        label           <- map["label"]
        values          <- map["values"]
        sortOrder       <- map["sortOrder"]
        required        <- map["required"]
    }
}

public class TTMedia:Mappable
{
    public var photo   : [TTPhotoVideo]?
    public var video   : [TTPhotoVideo]?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        photo   <- map["photo"]
        video   <- map["video"]
    }
}

public class TTPhotoVideo:Mappable
{
    public var mediaId         : Int?
    public var mediaType       : String?
    public var imageType       : String?
    public var normalUrl       : String?
    public var caption         : String?
    public var provider        : String?
    public var providedLink    : String?
    public var thumbnailUrl    : String?
    public var thumbnailWidth  : Int?
    public var thumbnailHeight : Int?
    public var widthM          : Int?
    public var heightM         : Int?
    public var authorName      : String?
    public var authorUrl       : String?
    public var providerId      : String?
    public var htmlEmbed       : String?
    public var s88thumbDims    : TTThumbDims?
    public var s64thumbDims    : TTThumbDims?
    public var locale          : String?
    public var published       : String?
    public var dateCreated     : String?
    public var tags            : [String]?
    
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        mediaId         <- map["id"]
        mediaType       <- map["type"]
        imageType       <- map["imageType"]
        normalUrl       <- map["normalUrl"]
        caption         <- map["caption"]
        provider        <- map["provider"]
        providedLink    <- map["providedLink"]
        thumbnailUrl    <- map["thumbnailUrl"]
        thumbnailWidth  <- map["thumbnailWidth"]
        thumbnailHeight <- map["thumbnailHeight"]
        widthM          <- map["width"]
        heightM         <- map["height"]
        authorName      <- map["authorName"]
        authorUrl       <- map["authorUrl"]
        providerId      <- map["providerId"]
        htmlEmbed       <- map["html"]
        s88thumbDims    <- map["s88thumbDims"]
        s64thumbDims    <- map["s64thumbDims"]
        locale          <- map["locale"]
        published       <- map["published"]
        dateCreated     <- map["dateCreated"]
        tags            <- map["tags"]
    }
}

public class TTThumbDims:Mappable
{
    public var widthT      : Int?
    public var heightT     : Int?
    public var scaledTo    : String?
    public var targetLeft  : Int?
    public var targetTop   : Int?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        widthT      <- map["width"]
        heightT     <- map["height"]
        scaledTo    <- map["scaledTo"]
        targetLeft  <- map["targetLeft"]
        targetTop   <- map["targetTop"]
    }
}

public class TTUserReview:Mappable
{
    public var nickName        : String?
    public var firstName       : String?
    public var lastName        : String?
    public var emailAddress    : String?
    public var externalId      : Int?
    public var city            : String?
    public var state           : String?
    public var country         : String?
    public var ageRange        : Int?
    public var badge           : TTBagde?
    public var shopperProfiles : [TTShopperProfiles]?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        nickName        <- map["nickName"]
        firstName       <- map["firstName"]
        emailAddress    <- map["emailAddress"]
        externalId      <- map["externalId"]
        city            <- map["city"]
        state           <- map["state"]
        country         <- map["country"]
        ageRange        <- map["ageRange"]
        badge           <- map["badge"]
        shopperProfiles <- map["shopperProfiles"]
    }
}

public class TTBagde:Mappable
{
    public var textBadge   : String?
    public var imageUrl    : String?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        textBadge   <- map["text"]
        imageUrl    <- map["imageUrl"]
    }
}

public class TTShopperProfiles:Mappable
{
    public var idShopper                   : Int?
    public var values                      : [TTValues]?
    public var displayPublic               : Bool?
    public var nameS                       : String?
    public var labelS                      : String?
    public var collectDuringContentSubmit  : Bool?
    public var required                    : Bool?
    public var type                        : Int?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        idShopper                   <- map["id"]
        values                      <- map["values"]
        displayPublic               <- map["displayPublic"]
        nameS                       <- map["name"]
        labelS                      <- map["label"]
        collectDuringContentSubmit  <- map["collectDuringContentSubmit"]
        required                    <- map["required"]
        type                        <- map["type"]
    }
}

public class TTCatalogItems:Mappable
{
    public var sku             : String?
    public var titleItem       : String?
    public var url             : String?
    public var category        : String?
    public var reviewCount     : Int?
    public var ratingCount     : Int?
    public var averageRating   : Float?
    public var ratingBreakdown : TTRatingBreakdown?
    public var attributes      : [TTAttributes]?
    
    
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        sku             <- map["sku"]
        titleItem       <- map["titleItem"]
        url             <- map["url"]
        category        <- map["category"]
        reviewCount     <- map["reviewCount"]
        ratingCount     <- map["ratingCount"]
        averageRating   <- map["averageRating"]
        ratingBreakdown <- map["ratingBreakdown"]
        attributes      <- map["attributes"]
    }
}

public class TTAttributes:Mappable
{
    public var type        : String?
    public var typeLabel   : String?
    public var values      : [TTValues]?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        type        <- map["type"]
        typeLabel   <- map["typeLabel"]
        values      <- map["values"]
    }
}

public class TTProductDimensions:Mappable
{
    public var sku              : String?
    public var title            : String?
    public var url              : String?
    public var dimensions       : [TTDimensionsP]?
    public var errors           : [TTErrorObject]?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        sku             <- map["sku"]
        title           <- map["title"]
        url             <- map["url"]
        dimensions      <- map["dimensions"]
        errors          <- map["errors"]
    }
}

public class TTValues:Mappable
{
    public var valueLabel  : String?
    public var value       : String?
    public var label       : String?
    public var idValue     : Int?
    public var countV      : Int?
    public var sortOrder   : String?
    public var filter      : String?
    //
    public var isSelected  : Bool = false
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        valueLabel  <- map["valueLabel"]
        value       <- map["value"]
        label       <- map["label"]
        idValue     <- map["id"]
        countV      <- map["count"]
        sortOrder   <- map["sortOrder"]
        filter      <- map["filter"]
        
    }
}

public class TTRatingBreakdown:Mappable
{
    public var uno     : Int?
    public var dos     : Int?
    public var tres    : Int?
    public var cuatro  : Int?
    public var cinco   : Int?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        uno     <- map["1"]
        dos     <- map["2"]
        tres    <- map["3"]
        cuatro  <- map["4"]
        cinco   <- map["5"]
    }
}

/*********
 Objetos, Errores
 *********************/
public class TTErrorObject:Mappable
{
    public var message : String?
    public var code    : Int?
    
    required public init?(map: Map)
    {
    }
    
    public func mapping(map: Map)
    {
        message     <- map["message"]
        code        <- map["code"]
    }
}
