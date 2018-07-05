//
//  TTSessIons.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 04/07/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import ObjectMapper

/*********
 Objetos, de recepción de Token de acceso
 *********************/
class TTGetAccessTokenObject: Mappable
{
    var token_type      : String?
    var access_token    : String?
    var errors          : [TTErrorObject]?
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        token_type      <- map["token_type"]
        access_token    <- map["access_token"]
        errors          <- map["errors"]
    }
}

