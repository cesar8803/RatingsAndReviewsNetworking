//
//  TurnToGeneric.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 04/07/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

public protocol TurnToBase
{
    func getDict()->[String:Any]
}

public protocol TurnToGeneric:TurnToBase
{
    var idReview:String? {get set}
}

public struct TurnToObjListReview:TurnToGeneric
{
    //Base
    public var idReview: String?
    
    //Propias
    public var sku:String
    
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

//public strucn TurnToObjDetailreview:T
