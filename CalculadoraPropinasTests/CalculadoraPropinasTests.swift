//
//  CalculadoraPropinasTests.swift
//  CalculadoraPropinasTests
//
//  Created by Daniel Rodriguez on 25/1/24.
//

import XCTest
@testable import CalculadoraPropinas

final class CalculadoraPropinasTests: XCTestCase {

    func testCalcularTotalConPropina() {
        let monto = "100"
        let porcentaje = 15.0
        let dividirCuenta = false
        let propinaPersonalizada = false
        let montoPropina = ""
        
        let resultado = Calculos.calcularTotalConPropina(montoCuenta: monto, porcentajePropina: porcentaje, dividirCuenta: dividirCuenta, propinaPersonalizada: propinaPersonalizada, propinaPersonalizadaMonto: montoPropina)
        XCTAssertEqual(resultado, 115.0)
        }

    func testTotalPropina() {
        let monto = "100"
        let porcentaje = 15.0
        let dividirCuenta = false
        let propinaPersonalizada = false
        let montoPropina = ""
    
        let resultado = Calculos.calcularTotalPropina(montoCuenta: monto, porcentajePropina: porcentaje, propinaPersonalizada: propinaPersonalizada, propinaPersonalizadaMonto: montoPropina, dividirCuenta: dividirCuenta)
        XCTAssertEqual(resultado, 15.0)
    }
    
//nuevos cambios 
}
