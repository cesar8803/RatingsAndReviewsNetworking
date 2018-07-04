//
//  TurnToGeneric.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 04/07/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

/**************
 Protocolos de los obtejos para armas los parametros
 requeridos para las peticiones a los servicios
 *********************/
public protocol TurnToGeneric
{
    func getDict()->[String:Any]
}

