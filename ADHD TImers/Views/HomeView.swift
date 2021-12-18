//
//  SwiftUIView.swift
//  ADHD TImers
//
//  Created by Daniel Pressner on 18.12.21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.timers, id:\.id) { timer in
                NavigationLink(destination: {}) {
                    HStack {
                        Text("\(timer.name!)")
                        Spacer()
                        Text("\(timer.durationInSeconds)")
                    }
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: {TimerDetailView()}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
