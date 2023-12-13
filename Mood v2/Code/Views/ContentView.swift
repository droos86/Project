//
//  ContentView.swift
//  Mood v2
//
//  Created by Daniel Roos on 13.12.23.
//

// TODOS
// Data visualization with SwiftCharts (week, month, year)
// Submit and store mood with MoodTracker
// Fix Sign up view
// User mgmt. (Sign up, Sign in, CoreData, session, email confirmation, forgot password)
// About page
// Sandwhich menu / navigation view check
// Responsiveness (horizontal, different screen sizes)
// Style check
// Testing
// Video
// README

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var circleWidth: CGFloat = 270
    
    var body: some View {
        NavigationView {
            ZStack {
                // LinearGradient(
                    // gradient: Gradient(colors: [
                        // Color(red: 185/255, green: 200/255, blue: 250/255),
                        // Color.blue
                    // ]),
                    // startPoint: .topLeading,
                    // endPoint: .bottomTrailing
                // )
                //.edgesIgnoringSafeArea(.all)
                
                Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text("Mood")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()

                        Circle()
                            .frame(width: circleWidth)
                            .foregroundColor(.blue)
                            .blur(radius: 30)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                                    self.circleWidth = 150
                                }
                            }

                        Spacer()
                    }
                                        
                    Spacer()
                    
                    Text("Track and improve your mood over time.")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("On-device data.")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text("Self-caring.")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(100)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: SignInView()) {
                        Text("Sign in")
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
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
