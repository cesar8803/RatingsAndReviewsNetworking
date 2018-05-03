//
//  TestService.swift
//  RatingsAndReviewsNetworking
//
//  Created by Josue J Maqueda Flores on 02/05/18.
//  Copyright © 2018 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

public class TestService
{
    
    private init() {}
    
    public static func doSomething()->String
    {
        return "Funcion de prueba del framework del pod creado"
    }
    public static func doSomething3()->String
    {
        print("Test")
        return "Funcion de prueba del framework del pod creado"
    }
    
    private static func funcionPrivada()
    {
        let string = "Aqui esta la prueba"
        
        print("Aqui se imprime \(string)")
    }

}
