import SwiftUI

struct LogMoodView: View {
//    @State private var backgroundColor = Color(.black)
    @State private var moodRating: Double = 3
    @State private var circleColor = Color(red: 30 / 255.0, green: 114 / 255.0, blue: 250 / 255.0)
    @State private var circleWidth: CGFloat = 270
    
    let moodDescriptions = [
        1: "Very unpleasant",
        2: "Unpleasant",
        3: "Neutral",
        4: "Pleasant",
        5: "Very pleasant"
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
            
                Spacer()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: circleWidth)
                            .foregroundColor(circleColor)
                            .blur(radius: 75)
                        
                        Spacer()
                    }
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                }

                VStack(alignment: .leading) {
                    Text("How have you felt overall today?")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    
                    Spacer()
                    
                    Rectangle()
                        .padding(.bottom, 45)
                        .opacity(0)
                    
                    Spacer()
                    
                    // Display current value
                    Text("\(moodDescriptions[Int(moodRating)] ?? "")")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    
                    // Slider
                    Slider(value: $moodRating, in: 1...5, step: 1)
                        .accentColor(.gray)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                        .onChange(of: moodRating) { newValue in
                            withAnimation {
                                updateColors()
                            }
                        }
                    
                    // Slider labels
                    HStack {
                        Text("Very unpleasant")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)
                        
                        Spacer()
                        
                        Text("Very pleasant")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 20)
                    }
                    
                    NavigationLink(destination: MoodLogView()) {
                        Text("Log mood")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(100)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        logMoodToDatabase()
                        fetchAllMoodDataFromDatabase()
                    })
                
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            .navigationBarTitle("Log mood")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        NavigationLink(destination: HomeView()) {
                            Label {
                                Text("Home")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            } icon: {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.gray)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: LogMoodView()) {
                            Label {
                                Text("Log mood")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            } icon: {
                                Image(systemName: "plus.app.fill")
                                    .foregroundColor(.blue)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: MoodLogView()) {
                            Label {
                                Text("View log")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            } icon: {
                                Image(systemName: "chart.xyaxis.line")
                                    .foregroundColor(.gray)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .toolbarColorScheme(.dark)
            .toolbarBackground(.ultraThinMaterial)
        }
        .colorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
    
    private func updateColors() {
        switch moodRating {
        case 1:
//            backgroundColor = Color(red: 165/255, green: 170/255, blue: 255/255) // Dull blue
            circleColor = Color(red: 60 / 255.0, green: 21 / 255.0, blue: 127 / 255.0) // Dark blue
        case 2:
//            backgroundColor = Color(red: 205/255, green: 190/255, blue: 250/255) // Light purple
            circleColor = Color(red: 130 / 255.0, green: 55 / 255.0, blue: 250 / 255.0) // Purple
        case 3:
//            backgroundColor = Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
            circleColor = Color(red: 30 / 255.0, green: 114 / 255.0, blue: 250 / 255.0) // System blue
        case 4:
//            backgroundColor = Color(red: 210/255, green: 250/255, blue: 250/255) // Light green
            circleColor = Color(red: 0 / 255.0, green: 250 / 255.0, blue: 200 / 255.0) // Green
        case 5:
//            backgroundColor = Color(red: 250/255, green: 170/255, blue: 155/255) // Light red
            circleColor = Color(red: 255 / 255.0, green: 91 / 255.0, blue: 98 / 255.0) // Red
        default:
            break
        }
    }
    
    
    private func logMoodToDatabase() {
        print("Logging mood to database")
        // Use DatabaseManager to log mood to the database
        let user_id = 1 // Replace with actual user ID
        DatabaseManager.shared.logMood(user_id: user_id, mood: Int(moodRating))
    }
    
    
    private func fetchAllMoodDataFromDatabase() {
        print("Fetching all mood data from database")
        DatabaseManager.shared.fetchAllMoodData()
    }
}


struct LogMoodView_Previews: PreviewProvider {
    static var previews: some View {
        LogMoodView()
    }
}
