//
//  TurnToRouterRequest.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import Alamofire

public enum TurnToServiceRequest
{
    case accessToken(params:TurnToGeneric)
    case invalidateAccessToken(params:TurnToGeneric)
    case reviewsList(params:TurnToGeneric)
    case reviewDetail(params:TurnToGeneric)
    case createReview(params:TurnToGeneric)
    case voteUp(params:TurnToGeneric)
    case voteDown(params:TurnToGeneric)
    case markAsInappropiate(params:TurnToGeneric)
    case settings
    case productList(params:TurnToGeneric)
    case ugcSummary(params:TurnToGeneric)
    case updateProduct(params:TurnToGeneric)
    
    var request:URLRequestConvertible
    {
        switch self
        {
        case .accessToken(let params):
            return TurnToRouterRequest.accessToken(params: params.getDict())
        case .invalidateAccessToken(let params):
            return TurnToRouterRequest.invalidateAccessToken(params: params.getDict())
        case .reviewsList(let params):
            return TurnToRouterRequest.reviewsList(params: params.getDict())
        case .reviewDetail(let params):
            return TurnToRouterRequest.reviewDetail(idReview: params.idReview ?? "0")
        case .createReview(let params):
            return TurnToRouterRequest.createReview(params: params.getDict())
        case .voteUp(let params):
            return TurnToRouterRequest.voteUp(idReview: params.idReview ?? "0")
        case .voteDown(let params):
            return TurnToRouterRequest.voteDown(idReview: params.idReview ?? "0")
        case .markAsInappropiate(let params):
            return TurnToRouterRequest.markAsInappropiate(idReview: params.idReview ?? "0")
        case .settings:
            return TurnToRouterRequest.settings
        case .productList(let params):
            return TurnToRouterRequest.productList(params: params.getDict())
        case .ugcSummary(let params):
            return TurnToRouterRequest.ugcSummary(params: params.getDict())
        case .updateProduct(let params):
            return TurnToRouterRequest.updateProduct(params: params.getDict())
        }
    }
}

internal enum TurnToRouterRequest:URLRequestConvertible
{
    //AuthType
    case accessToken(params:[String:Any])
    case invalidateAccessToken(params:[String:Any])
    //ReviewsType
    case reviewsList(params:[String:Any])
    case reviewDetail(idReview:String)
    case createReview(params:[String:Any])
    case voteUp(idReview:String)
    case voteDown(idReview:String)
    case markAsInappropiate(idReview:String)
    //SettingsType
    case settings
    //ProductsType
    case productList(params:[String:Any])
    case ugcSummary(params:[String:Any])
    case updateProduct(params:[String:Any])
    
    func asURLRequest() throws -> URLRequest
    {
        //Método
        var method:HTTPMethod
        {
            switch self
            {
            case .accessToken, .invalidateAccessToken:
                return .post
            case .reviewsList, .reviewDetail:
                return .get
            case .createReview, .voteUp, .voteDown, .markAsInappropiate:
                return .post
            case .settings, .productList, .ugcSummary:
                return .get
            case .updateProduct:
                return .post
            }
        }
        
        //PARAMS
        let params:[String:Any]? =
        {
            switch self
            {
            case .accessToken(let params):
                return params
            case .invalidateAccessToken(let params):
                return params
            case .reviewsList(let params):
                return params
            case .reviewDetail:
                return nil
            case .createReview(let params):
                return params
            case .voteUp, .voteDown, .markAsInappropiate, .settings:
                return nil
            case .productList(let params):
                return params
            case .ugcSummary(let params):
                return params
            case .updateProduct(let params):
                return params
            }
        }()
        
        let url:URL =
        {
            var relativePath:String?
            //
            switch self
            {
            case .accessToken:
                relativePath = TurnToContextService.accessToken.url
            case .invalidateAccessToken:
                relativePath = TurnToContextService.invalidateAccessToken.url
            case .reviewsList:
                relativePath = TurnToContextService.reviewsList.url
            case .reviewDetail(let idReview):
                relativePath = TurnToContextService.reviewDetail.url.stringTo(replace: "#idReview#", withValidString: idReview)
            case .createReview:
                relativePath = TurnToContextService.createReview.url
            case .voteUp(let idReview):
                relativePath = TurnToContextService.voteUp.url.stringTo(replace: "#idReview#", withValidString: idReview)
            case .voteDown(let idReview):
                relativePath = TurnToContextService.voteDown.url.stringTo(replace: "#idReview#", withValidString: idReview)
            case .markAsInappropiate(let idReview):
                relativePath = TurnToContextService.markAsInappropiate.url.stringTo(replace: "#idReview#", withValidString: idReview)
            case .settings:
                relativePath = TurnToContextService.settings.url
            case .productList:
                relativePath = TurnToContextService.productList.url
            case .ugcSummary:
                relativePath = TurnToContextService.ugcSummary.url
            case .updateProduct:
                relativePath = TurnToContextService.updadteProduct.url
            }
            //
            var finalUrl = URL(string: TurnToConfig.sharedInstance.turntoEndpoint)!
            if let relativePath = relativePath
            {
                finalUrl = finalUrl.appendingPathComponent(relativePath.stringTo(replace: "#version#", withValidString: TurnToConfig.sharedInstance.turntoApiVersion))
            }
            //
            return finalUrl
        }()
        //
        
        //REQUEST
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = TurnToConfig.sharedInstance.timeOutInterval
        urlRequest.setValue(TurnToConfig.sharedInstance.accesApiToken, forHTTPHeaderField: TurnToConfig.sharedInstance.headerField)
        //urlRequest.setValue("xxx", forHTTPHeaderField: "Authorization")
        //
        let encoding: ParameterEncoding = {
            switch self {
            case .createReview, .markAsInappropiate:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: params)
        //return try! Alamofire.URLEncoding.default.encode(urlRequest, with: params)
    }
}
