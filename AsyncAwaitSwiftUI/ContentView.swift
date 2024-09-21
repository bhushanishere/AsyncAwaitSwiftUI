//
//  ContentView.swift
//  AsyncAwaitSwiftUI
//
//  Created by Bhushan Borse DXC on 31/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var currentDateListVM = CurrentDateListViewModel()
    
    var body: some View {
        NavigationView {
            List(currentDateListVM.currentDates, id: \.id) { currentDate in
                Text(currentDate.date)
            }.listStyle(.plain)
             
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                Task {
                    await currentDateListVM.populateDates()
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await currentDateListVM.populateDates()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
