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
 Objetos de respuesta para listado de Reviews
 *********************/
class TTGetReviewListObject:Mappable
{
    var reviews     : [TTReviewsObject]?
    var offset      : Int?
    var limit       : Int?
    var total       : Int?
    var errors      : [TTErrorObject]?
    var filters     : TTFilters?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        reviews     <- map["reviews"]
        offset      <- map["offset"]
        limit       <- map["limit"]
        total       <- map["total"]
        errors      <- map["errors"]
        filters     <- map["filters"]
    }
}

class TTFilters:Mappable
{
    var attributes      : [TTAttributes]?
    var dimensions      : [TTDimensions]?
    var userSettings    : TTUserSettings?
    var rating          : [TTRating]?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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
class TTReviewsObject:Mappable
{
    var idReview            : Int?
    var localeReview        : String?
    var rating              : Int?
    var titleReview         : String?
    var textReview          : String?
    var textLength          : Int?
    var csFlag              : Bool?
    var inappropriateFlag   : Bool?
    var reviewedFlag        : Bool?
    var autoModerated       : Bool?
    var published           : Bool?
    var incentivized        : Bool?
    var upVotes             : Int?
    var downVotes           : Int?
    var orderId             : Int?
    var catalogItems        : [TTCatalogItems]?
    var dimensions          : [TTDimensions]?
    var media               : TTMedia?
    var responses           : [TTResponse]?
    var reviewedDate        : String?
    var purchaseDate        : String?
    var tags                : [String]?
    var syndication         : String?
    var dateCreated         : String?
    var user                : TTUserReview?
    var errors              : [TTErrorObject]?

    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        idReview            <- map["id"]
        localeReview        <- map["locale"]
        rating              <- map["rating"]
        titleReview         <- map["nickName"]
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
        reviewedDate        <- map["reviewedDate"]
        purchaseDate        <- map["purchaseDate"]
        tags                <- map["tags"]
        syndication         <- map["syndication"]
        dateCreated         <- map["dateCreated"]
        user                <- map["user"]
    }
}

class TTResponse:Mappable
{
    var textResponse    : String?
    var locale          : String?
    var user            : TTUserReview?
    var dateCreated     : String?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        textResponse    <- map["text"]
        locale          <- map["locale"]
        user            <- map["user"]
        dateCreated     <- map["dateCreated"]
    }
}

class TTUserSettings:Mappable
{
    var shopperProfiles     : [TTShopperProfiles]?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        shopperProfiles     <- map["shopperProfiles"]
    }
}

class TTRating:Mappable
{
    var valueR      : Int?
    var countR      : Int?
    var filter      : String?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        valueR       <- map["value"]
        countR       <- map["count"]
        filter       <- map["filter"]
    }
}

class TTDimensions:Mappable
{
    var type            : Int?
    var dimensionId     : Int?
    var dimensionLabel  : String?
    var valueDimension  : Int?
    var onlyLabel       : [String]?
    
    var values          : [TTValues]?
    var sortOrder       : Int?
    var name            : String?
    var required        : Bool?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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

class TTMedia:Mappable
{
    var photo   : [TTPhotoVideo]?
    var video   : [TTPhotoVideo]?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        photo   <- map["photo"]
        video   <- map["video"]
    }
}

class TTPhotoVideo:Mappable
{
    var mediaId         : Int?
    var mediaType       : String?
    var imageType       : String?
    var normalUrl       : String?
    var caption         : String?
    var provider        : String?
    var providedLink    : String?
    var thumbnailUrl    : String?
    var thumbnailWidth  : Int?
    var thumbnailHeight : Int?
    var widthM          : Int?
    var heightM         : Int?
    var authorName      : String?
    var authorUrl       : String?
    var providerId      : String?
    var htmlEmbed       : String?
    var s88thumbDims    : TTThumbDims?
    var s64thumbDims    : TTThumbDims?
    var locale          : String?
    var published       : String?
    var dateCreated     : String?
    var tags            : [String]?
    
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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

class TTThumbDims:Mappable
{
    var widthT      : Int?
    var heightT     : Int?
    var scaledTo    : String?
    var targetLeft  : Int?
    var targetTop   : Int?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        widthT      <- map["width"]
        heightT     <- map["height"]
        scaledTo    <- map["scaledTo"]
        targetLeft  <- map["targetLeft"]
        targetTop   <- map["targetTop"]
    }
}

class TTUserReview:Mappable
{
    var nickName        : String?
    var firstName       : String?
    var lastName        : String?
    var emailAddress    : String?
    var externalId      : Int?
    var city            : String?
    var state           : String?
    var country         : String?
    var ageRange        : Int?
    var badge           : TTBagde?
    var shopperProfiles : [TTShopperProfiles]?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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

class TTBagde:Mappable
{
    var textBadge   : String?
    var imageUrl    : String?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        textBadge   <- map["text"]
        imageUrl    <- map["imageUrl"]
    }
}

class TTShopperProfiles:Mappable
{
    var idShopper                   : Int?
    var values                      : [TTValues]?
    var displayPublic               : Bool?
    var nameS                       : String?
    var labelS                      : String?
    var collectDuringContentSubmit  : Bool?
    var required                    : Bool?
    var type                        : Int?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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

class TTCatalogItems:Mappable
{
    var sku             : String?
    var titleItem       : String?
    var url             : String?
    var category        : String?
    var reviewCount     : Int?
    var ratingCount     : Int?
    var averageRating   : Float?
    var ratingBreakdown : TTRatingBreakdown?
    var attributes      : [TTAttributes]?
    
    
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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

class TTAttributes:Mappable
{
    var type        : String?
    var typeLabel   : String?
    var values      : [TTValues]?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        type        <- map["type"]
        typeLabel   <- map["typeLabel"]
        values      <- map["values"]
    }
}

class TTValues:Mappable
{
    var valueLabel  : String?
    var value       : String?
    
    var idValue     : Int?
    var countV      : Int?
    var sortOrder   : String?
    var filter      : String?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        valueLabel  <- map["valueLabel"]
        value       <- map["value"]
        
        idValue     <- map["id"]
        countV      <- map["count"]
        sortOrder   <- map["sortOrder"]
        filter      <- map["filter"]
        
    }
}

class TTRatingBreakdown:Mappable
{
    var uno     : Int?
    var dos     : Int?
    var tres    : Int?
    var cuatro  : Int?
    var cinco   : Int?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
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
class TTErrorObject:Mappable
{
    var message : String?
    var code    : Int?
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
        message     <- map["message"]
        code        <- map["code"]
    }
}
