//
//  ContentView.swift
//  GridCalendar
//
//  Created by MAC on 29/07/22.
//  1

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        ScrollView //Wrapper que permite movernos por todos los dias del mes
        {
            // Genera 4 columnas de ancho 40
            let layout =
            [
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40)),
                GridItem(.flexible(minimum: 40))
                //GridItem(.adaptive(minimum: 80))-->divide el ancho restante entre el valor que se le asigna(80), y genera las columnas con el valor resultante
                //GridItem(.flexible(minimum:40)--> crea columna que ocupa el ancho disponible que le queda
            ]
            
            LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders])//Definir columnas (Vista de cuadricula vertical)
            {
                ForEach(year, id: \.name)//MuestraMes
                {
                    month in Section(header: Text(verbatim: month.name).font(.headline))
                    {
                        ForEach(month.days)//Muestra Dia
                        {
                            day in Capsule().overlay(Text("\(day.value)").foregroundColor(.white)).foregroundColor(.blue).frame(height: 40)
                        }
                    }
                }
             }
        }
    }
}

struct Day: Identifiable //Representa meses y dias
{
    let id = UUID() // Identificador unico
    let value: Int //guardara el orden de cada dia, por ejemplo el 2 de febrero, tendra valor de 2
}

struct Month
{
    let name: String //Indicara cada mes
    let numberOfDays: Int//Numero de dias del mes
    var days: [Day]//Iteraremos sobre matriz Day
 
    init(name: String, numberOfDays: Int)
    {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []//Se inicializa
 
        for n in 1...numberOfDays//Itera desde 1 hasta el ultimo dia de cada mes
        {
            self.days.append(Day(value: n))
        }
 
    }
}
//Se construye matriz year y se inicializa estructura Month, para pasar el numero correcto de dias para cada mes
let year = [
        Month(name: "January", numberOfDays: 31),
        Month(name: "February", numberOfDays: 28),
        Month(name: "March", numberOfDays: 31),
        Month(name: "April", numberOfDays: 30),
        Month(name: "May", numberOfDays: 31),
        Month(name: "June", numberOfDays: 30),
        Month(name: "July", numberOfDays: 31),
        Month(name: "August", numberOfDays: 31),
        Month(name: "September", numberOfDays: 30),
        Month(name: "October", numberOfDays: 31),
        Month(name: "November", numberOfDays: 30),
        Month(name: "December", numberOfDays: 31),
    ]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
