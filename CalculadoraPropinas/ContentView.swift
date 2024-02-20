//
//  ContentView.swift
//  CalculadoraPropinas
//
//  Created by Daniel Rodriguez on 25/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var montoCuenta = ""
    @State private var porcentajePropina = 0.0
    @State private var dividirCuenta = false
    @State private var propinaPersonalizada = false
    @State private var propinaPersonalizadaMonto = ""

    var totalConPropina: Double {
        Calculos.calcularTotalConPropina(montoCuenta: montoCuenta, porcentajePropina: porcentajePropina, dividirCuenta: dividirCuenta, propinaPersonalizada: propinaPersonalizada, propinaPersonalizadaMonto: propinaPersonalizadaMonto)
    }

    var totalPropina: Double {
        Calculos.calcularTotalPropina(montoCuenta: montoCuenta, porcentajePropina: porcentajePropina, propinaPersonalizada: propinaPersonalizada, propinaPersonalizadaMonto: propinaPersonalizadaMonto, dividirCuenta: dividirCuenta)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Datos de la cuenta")) {
                                    TextField("Monto de la cuenta", text: $montoCuenta)
                                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Porcentaje de propina")) {
                    HStack {
                        Text("0%")
                        Slider(value: $porcentajePropina, in: 0...100, step: 1.0)
                            .disabled(propinaPersonalizada)
                        Text("100%")
                    }
                    Toggle("Propina personalizada", isOn: $propinaPersonalizada)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    if propinaPersonalizada {
                        TextField("Ingrese su propina", text: $propinaPersonalizadaMonto)
                            .keyboardType(.decimalPad)
                    } else {
                        Text("Propina: \(porcentajePropina, specifier: "%.0f")%")
                            .foregroundColor(.blue)
                            .font(.headline)
                    }
                }

                Section(header: Text("Opciones")) {
                    Toggle("Dividir la cuenta", isOn: $dividirCuenta)
                }

                Section(header: Text("Resultado")) {
                    Text("Total de propina: $\(totalPropina, specifier: "%.2f")")
                        .foregroundColor(.blue)
                        .font(.headline)

                    Text("Total con propina: $\(totalConPropina, specifier: "%.2f")")
                        .foregroundColor(.green)
                        .font(.headline)
                }
            }
            .navigationBarTitle("Propinas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Calculos {
    static func calcularTotalConPropina(montoCuenta: String, porcentajePropina: Double, dividirCuenta: Bool, propinaPersonalizada: Bool, propinaPersonalizadaMonto: String) -> Double {
        let monto = Double(montoCuenta) ?? 0
        let propina = propinaPersonalizada ? Double(propinaPersonalizadaMonto) ?? 0 : monto * porcentajePropina / 100
        let totalCuenta = dividirCuenta ? (monto + propina) / 2 : monto + propina
        return totalCuenta
    }

    static func calcularTotalPropina(montoCuenta: String, porcentajePropina: Double, propinaPersonalizada: Bool, propinaPersonalizadaMonto: String, dividirCuenta: Bool) -> Double {
        let monto = Double(montoCuenta) ?? 0
        let propina = propinaPersonalizada ? Double(propinaPersonalizadaMonto) ?? 0 : monto * porcentajePropina / 100
        return dividirCuenta ? propina / 2 : propina
    }
}
