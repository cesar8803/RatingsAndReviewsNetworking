//
//  TurnToUtils.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 03/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

extension String
{
    func stringTo(replace:String, withValidString stringToAdd:String)-> String
    {
        let validString = stringToAdd.count == 0 ? self.replacingOccurrences(of: replace, with: "") : self.replacingOccurrences(of: replace, with: stringToAdd)
        return validString
    }
}
