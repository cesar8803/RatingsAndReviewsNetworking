//
//  TurnToRouterRequest.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
//
import Alamofire

internal enum TurnToRouterRequest:URLRequestConvertible
{
    //AuthType
    case accessToken
    case invalidateAccessToken
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
            case .accessToken:
                return nil
            case .invalidateAccessToken:
                return nil
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
