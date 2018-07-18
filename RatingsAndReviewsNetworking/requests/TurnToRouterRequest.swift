//
//  TurnToRouterRequest.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import Alamofire

public enum TurnToTypeRequest
{
    case listObject
    case simpleObject
}

public enum TurnToRouterRequest:URLRequestConvertible
{
    //AuthType
    case accessToken(params:TurnToGeneric)
    case invalidateAccessToken(params:TurnToGeneric)
    //ReviewsType
    case reviewsList(params:TurnToGeneric)
    case reviewDetail(idReview:String)
    case createReview(params:TurnToGeneric)
    case voteUp(idReview:String)
    case voteDown(idReview:String)
    case markAsInappropiate(idReview:String)
    //SettingsType
    case settings
    //ProductsType
    case productList(params:TurnToGeneric)
    case ugcSummary(params:TurnToGeneric)
    case updateProduct(params:TurnToGeneric)
    case search(params:TurnToGeneric)
    case customFields(params:TurnToGeneric)
    
    
    
    public func asURLRequest() throws -> URLRequest
    {
        //Método
        var method:HTTPMethod
        {
            switch self
            {
            case .accessToken,.invalidateAccessToken,.createReview,.voteUp,.voteDown,.markAsInappropiate,.updateProduct:
                return .post
            case .reviewsList, .reviewDetail,.settings,.productList,.ugcSummary,.search,.customFields:
                return .get
            }
        }
        
        //PARAMS
        let params:[String:Any]? =
        {
            switch self
            {
            case .accessToken(let params):
                return params.getDict()
            case .invalidateAccessToken(let params):
                return params.getDict()
            case .reviewsList(let params):
                return params.getDict()
            case .reviewDetail:
                return nil
            case .createReview(let params):
                return params.getDict()
            case .voteUp, .voteDown, .markAsInappropiate, .settings:
                return nil
            case .productList(let params):
                return params.getDict()
            case .ugcSummary(let params):
                return params.getDict()
            case .updateProduct(let params):
                return params.getDict()
            case .search(let params):
                return params.getDict()
            case .customFields(let params):
                return params.getDict()
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
            case .search:
                relativePath = TurnToContextService.search.url
            case .customFields:
                relativePath = TurnToContextService.customFields.url
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
        //
        let encoding: ParameterEncoding = {
            switch self {
            case .createReview, .markAsInappropiate:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        //
        return try encoding.encode(urlRequest, with: params)
    }
}
