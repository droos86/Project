//
//  HomeView.swift
//  Mood v2
//
//  Created by Daniel Roos on 15.12.23.
//

import SwiftUI

struct HomeView: View {
    @State private var circleWidth: CGFloat = 270
    
    var body: some View {
        ZStack {
            Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Hello")
                    .font(.caption)
                    .foregroundColor(.black)
                
                Text("Daniel")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Circle()
                        .frame(width: circleWidth)
                        .foregroundColor(.blue)
                        .blur(radius: 30)
                    
                    Spacer()
                }
                
                Spacer()
                
                Text("What do you want to do?")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                NavigationLink(destination: MoodTrackerView()) {
                    Text("Log mood")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                        .padding(.bottom, 10)
                }
                
                NavigationLink(destination: MoodLogView_Alt()) {
                    Text("View log")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                        .foregroundColor(.black)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
