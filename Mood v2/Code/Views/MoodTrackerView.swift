//
//  MoodTrackerView.swift
//  Mood v2
//
//  Created by Daniel Roos on 15.12.23.
//

import SwiftUI

struct MoodTrackerView: View {
    @State private var moodRating: Double = 3 // Default to neutral position
    
    let moodDescriptions = [
        1: "Very unpleasant",
        2: "Unpleasant",
        3: "Neutral",
        4: "Pleasant",
        5: "Very pleasant"
    ]
    
    @State private var backgroundColor = Color(red: 185 / 255.0, green: 200 / 255.0, blue: 250 / 255.0) // Light blue
    
    @State private var circleColor = Color(red: 30 / 255.0, green: 114 / 255.0, blue: 250 / 255.0) // System blue
    
    @State private var circleWidth: CGFloat = 270
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("How do you feel right now?")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Circle()
                        .frame(width: circleWidth)
                        .foregroundColor(circleColor)
                        .blur(radius: 30)
                    
                    Spacer()
                }
                
                Spacer()
                
                // Display current value
                Text("\(moodDescriptions[Int(moodRating)] ?? "")")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                // Slider
                Slider(value: $moodRating, in: 1...5, step: 1)
                    .accentColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .onChange(of: moodRating) { newValue in
                        withAnimation {
                            updateColors()
                        }
                    }
                
                // Slider labels
                HStack {
                    Text("Very unpleasant")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    
                    Spacer()
                    
                    Text("Very pleasant")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                }
                
                NavigationLink(destination: MoodLogView_Alt()) {
                    Text("Log mood")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(100)
                }
            }
            .padding(.horizontal, 16)
    }
}
    
    private func updateColors() {
        switch moodRating {
        case 1:
            backgroundColor = Color(red: 165/255, green: 170/255, blue: 255/255) // Dull blue
            circleColor = Color(red: 35 / 255.0, green: 20 / 255.0, blue: 95 / 255.0) // Dark blue
        case 2:
            backgroundColor = Color(red: 205/255, green: 190/255, blue: 250/255) // Light purple
            circleColor = Color(red: 130 / 255.0, green: 55 / 255.0, blue: 250 / 255.0) // Purple
        case 3:
            backgroundColor = Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
            circleColor = Color(red: 30 / 255.0, green: 114 / 255.0, blue: 250 / 255.0) // System blue
        case 4:
            backgroundColor = Color(red: 210/255, green: 250/255, blue: 250/255) // Light green
            circleColor = Color(red: 0 / 255.0, green: 250 / 255.0, blue: 200 / 255.0) // Green
        case 5:
            backgroundColor = Color(red: 250/255, green: 170/255, blue: 155/255) // Light red
            circleColor = Color(red: 255 / 255.0, green: 65 / 255.0, blue: 0 / 255.0) // Red
        default:
            break
        }
    }
}

struct MoodTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        MoodTrackerView()
    }
}
