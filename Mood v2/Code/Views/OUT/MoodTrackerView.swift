//import SwiftUI
//
//struct MoodTrackerView: View {
//    @State private var moodRating: Double = 3 // Default to neutral position
//    
//    let moodDescriptions = [
//        1: "Very unpleasant",
//        2: "Unpleasant",
//        3: "Neutral",
//        4: "Pleasant",
//        5: "Very pleasant"
//    ]
//    
////    @State private var backgroundColor = Color(red: 185 / 255.0, green: 200 / 255.0, blue: 250 / 255.0) // Light blue
//    
//    @State private var backgroundColor = Color(.black)
//    
//    @State private var circleColor = Color(red: 30 / 255.0, green: 114 / 255.0, blue: 250 / 255.0) // System blue
//    
//    @State private var circleWidth: CGFloat = 270
//    
//    var body: some View {
//        ZStack {
//            backgroundColor
//                .edgesIgnoringSafeArea(.all)
//                .onAppear {
//                    print("MoodTrackerView body")
//                }
//            
//            VStack(alignment: .leading) {
//                Text("How do you feel right now?")
//                    .font(.title)
//                    .bold()
//                    .foregroundColor(.white)
//                
//                Spacer()
//                
//                HStack {
//                    Spacer()
//                    
//                    Circle()
//                        .frame(width: circleWidth)
//                        .foregroundColor(circleColor)
//                        .blur(radius: 75)
//                    
//                    Spacer()
//                }
//                
//                Spacer()
//                
//                // Display current value
//                Text("\(moodDescriptions[Int(moodRating)] ?? "")")
//                    .font(.title2)
//                    .bold()
//                    .foregroundColor(.white)
//                    .padding(.bottom, 10)
//                
//                // Slider
//                Slider(value: $moodRating, in: 1...5, step: 1)
//                    .accentColor(.gray)
//                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
//                    .onChange(of: moodRating) { newValue in
//                        withAnimation {
//                            updateColors()
//                        }
//                    }
//                
//                // Slider labels
//                HStack {
//                    Text("Very unpleasant")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 20)
//                    
//                    Spacer()
//                    
//                    Text("Very pleasant")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                        .padding(.bottom, 20)
//                }
//                
//                NavigationLink(destination: MoodLogView()) {
//                    Text("Log mood")
//                        .bold()
//                        .frame(maxWidth: .infinity)
//                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(100)
//                }
//                .simultaneousGesture(TapGesture().onEnded{
//                    logMoodToDatabase()
//                    fetchAllMoodDataFromDatabase()
//                })
//            }
//            .padding(.horizontal, 16)
//    }
//}
//    
//    private func updateColors() {
//        switch moodRating {
//        case 1:
////            backgroundColor = Color(red: 165/255, green: 170/255, blue: 255/255) // Dull blue
//            circleColor = Color(red: 45 / 255.0, green: 30 / 255.0, blue: 105 / 255.0) // Dark blue
//        case 2:
////            backgroundColor = Color(red: 205/255, green: 190/255, blue: 250/255) // Light purple
//            circleColor = Color(red: 130 / 255.0, green: 55 / 255.0, blue: 250 / 255.0) // Purple
//        case 3:
////            backgroundColor = Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
//            circleColor = Color(red: 30 / 255.0, green: 114 / 255.0, blue: 250 / 255.0) // System blue
//        case 4:
////            backgroundColor = Color(red: 210/255, green: 250/255, blue: 250/255) // Light green
//            circleColor = Color(red: 0 / 255.0, green: 250 / 255.0, blue: 200 / 255.0) // Green
//        case 5:
////            backgroundColor = Color(red: 250/255, green: 170/255, blue: 155/255) // Light red
//            circleColor = Color(red: 255 / 255.0, green: 65 / 255.0, blue: 0 / 255.0) // Red
//        default:
//            break
//        }
//    }
//    
//    private func logMoodToDatabase() {
//        print("Logging mood to database")
//        // Use DatabaseManager to log mood to the database
//        let user_id = 1 // Replace with actual user ID
//        DatabaseManager.shared.logMood(user_id: user_id, mood: Int(moodRating))
//    }
//    
//    private func fetchAllMoodDataFromDatabase() {
//        print("Fetching all mood data from database")
//        DatabaseManager.shared.fetchAllMoodData()
//    }
//}
//
//struct MoodTrackerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoodTrackerView()
//    }
//}
