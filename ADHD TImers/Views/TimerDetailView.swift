//
//  TimerDetailView.swift
//  ADHD TImers
//
//  Created by Daniel Pressner on 18.12.21.
//

import SwiftUI

struct TimerDetailView: View {
    
    @StateObject var viewModel = TimerDetailViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.timeRemaining)")
            HStack {
                VStack {
                    Picker(selection: $viewModel.hours, content: {
                        ForEach(0..<24) { hour in
                            Text("\(hour)")
                        }
                    }, label: {Text("hours")})
                        .pickerStyle(.wheel)
                        .frame(width: 100)
                        .compositingGroup()
                    .clipped()
                    Text(viewModel.hours == 1 ? "Hour" : "Hours")
                        .font(.system(size: 12))
                }
                Spacer()
                Text(":")
                Spacer()
                VStack {
                    Picker(selection: $viewModel.minutes, content: {
                        ForEach(0..<60) { minute in
                            Text("\(minute)")
                        }
                    }, label: {Text("minutes")})
                        .pickerStyle(.wheel)
                        .frame(width: 100)
                        .compositingGroup()
                    .clipped()
                    Text(viewModel.minutes == 1 ? "Minute" : "Minutes")
                        .font(.system(size: 12))
                }
                Spacer()
                Text(":")
                Spacer()
                VStack {
                    Picker(selection: $viewModel.seconds, content: {
                        ForEach(0..<60) { second in
                            Text("\(second)")
                        }
                    }, label: {Text("seconds")})
                        .pickerStyle(.wheel)
                        .frame(width: 100)
                        .compositingGroup()
                    .clipped()
                    Text(viewModel.seconds == 1 ? "Second" : "Seconds")
                        .font(.system(size: 12))
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar, content: { Button(action: {}, label: {Text("Cancel")})})
            ToolbarItem(placement: .bottomBar, content: { Button(action: {viewModel.startTimer()}, label: {Text("Start")})})
        }
    }
}

struct TimerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDetailView()
.previewInterfaceOrientation(.portrait)
    }
}
