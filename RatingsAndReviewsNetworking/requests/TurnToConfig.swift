//
//  TurnToConfig.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

//CONTEXT IGC
internal enum TurnToContextService
{
    case accessToken
    case invalidateAccessToken
    case reviewsList
    case reviewDetail
    case createReview
    case voteUp
    case voteDown
    case markAsInappropiate
    case settings
    case productList
    case ugcSummary
    case updadteProduct
    case search
    case customFields
    case createorders
    
    internal var url:String
    {
        switch self
        {
        case .accessToken:
            return "/#version#/oauth2/token"
        case .invalidateAccessToken:
            return "/#version#/oauth2/invalidate_token"
        case .reviewsList:
            return "/#version#/reviews"
        case .reviewDetail:
            return "/#version#/reviews/#idReview#"
        case .createReview:
            return "/#version#/reviews"
        case .voteUp:
            return "/#version#/reviews/#idReview#/voteup"
        case .voteDown:
            return "/#version#/reviews/#idReview#/votedown"
        case .markAsInappropiate:
            return "/#version#/reviews/#idReview#/flag"
        case .settings:
            return "/#version#/sites"
        case .productList:
            return "/#version#/products"
        case .ugcSummary:
            return "/#version#/products/ugc_summary"
        case .updadteProduct:
            return "/#version#/products"
        case .search:
            return "/#version#/search"
        case .customFields:
           return "/#version#/products"
        case .createorders:
            return "/#version#/orders/create"
            
        }
    }
}

public class TurnToConfig
{
    public static let sharedInstance = TurnToConfig()
    
    private var _turntoApiVersion       : String = "v1.2"
    private var _turntoEndpoint         : String = "https://api.turnto.com"
    private var _timeOutInterval        : Double = 60.0
    private var _headerField            : String = "Authorization"
    private var _accesApiToken          : String = "bearer LSZVtMUo183hGgNiNPaoVRz96iERW1P364gs"
    private var _token                  : String = "LSZVtMUo183hGgNiNPaoVRz96iERW1P364gs"
    private var _typeToken              : String = "bearer"
    //
    //Valores Constantes proporcionados por TurnTo para obtener Token
    private var _client_id              : String = "xxxxxxxxxx"
    private var _client_secret          : String = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    private var _grant_type             : String = "client_credentials"
    private var _max_try_get_request    : Int = 2
    
    private init(){}
    
    /**
     Versión del API de TurnTo a utilizar
    */
    public var turntoApiVersion:String
    {
        set{
            _turntoApiVersion = newValue
        }
        get{
            return _turntoApiVersion
        }
    }
    
    /**
     Liga de donde se conectará al API de TurnTo
    */
    public var turntoEndpoint:String
    {
        set{
            _turntoEndpoint = newValue
        }
        get{
            return _turntoEndpoint
        }
    }
    
    /**
     Tiempo de espera máximo para cada request ejecutado
    */
    public var timeOutInterval:Double
    {
        set{
            _timeOutInterval = newValue
        }
        get{
            return _timeOutInterval
        }
    }
    
    /**
     Cabecera de Autorización para permisos de peticion del API de TurnTo
    */
    public var headerField:String
    {
        set{
            _headerField = newValue
        }
        get{
            return _headerField
        }
    }
    
    /**
     Token de acceso al API de TurnTo
    */
    public var accesApiToken:String
    {
        set{
            _accesApiToken = newValue
        }
        get{
            return _accesApiToken
        }
    }
    
    public var token:String
    {
        set{
            _token = newValue
        }
        get{
            return _token
        }
    }
    
    public var typeToken:String
    {
        set{
            _typeToken = newValue
        }
        get{
            return _typeToken
        }
    }
    
    /********
     Configuracion de Credenciales para bbtención de Token
    ******************/
    public var client_id:String
    {
        set{
            _client_id = newValue
        }
        get{
            return _client_id
        }
    }
    
    public var client_secret:String
    {
        set{
            _client_secret = newValue
        }
        get{
            return _client_secret
        }
    }
    
    public var grant_type:String
    {
        set{
            _grant_type = newValue
        }
        get{
            return _grant_type
        }
    }
    
    public var max_try_get_request:Int
    {
        set{
            _max_try_get_request = newValue
        }
        get{
            return _max_try_get_request
        }
    }
}
