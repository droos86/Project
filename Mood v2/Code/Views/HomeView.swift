import SwiftUI
import Charts

struct HomeView: View {
    @State private var circleWidth: CGFloat = 270
    @ObservedObject var databaseManager = DatabaseManager.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Circle()
                                .frame(width: circleWidth)
                                .foregroundColor(.blue)
                                .blur(radius: 75)
                            
                            Spacer()
                        }
                        .padding(.top, -325)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                    
                    VStack {
                        ZStack (alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            
                            VStack (alignment: .leading, spacing: 10) {
                                Text("ABOUT")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(.top, 10)
                                
                                Divider()
                                    .padding(.horizontal, -16)
                                
                                Text("Mood is a CS50 final project inspired by existing health and mental wellness apps. It is designed and developed by Daniel Roos from Germany mainly using Xcode, SwiftUI, SQLite for data management, and SwiftCharts for data visualization.")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.top, 5)
                                    .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        Spacer()
                        
                        ZStack (alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            
                            VStack (alignment: .leading, spacing: 10) {
                                Text("FEATURES")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(.top, 10)
                                
                                Divider()
                                    .padding(.horizontal, -16)
                                
                                Grid (alignment: .leading, horizontalSpacing: 16, verticalSpacing: 10) {
                                    GridRow {
                                        Label("Log mood", systemImage: "plus.app.fill")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .labelStyle(.iconOnly)
                                        
                                        Text("Log how you have felt overall from very pleasant to very unpleasant on a daily basis with an intuitive slider.")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                    
                                    GridRow {
                                        Label("View log", systemImage: "chart.xyaxis.line")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .labelStyle(.iconOnly)
                                        
                                        Text("Track your mood over time by weeks, months, and years to understand your progress.")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                    
                                    GridRow {
                                        Label("Analytics", systemImage: "cpu.fill")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .labelStyle(.iconOnly)
                                        
                                        Text("Use analytics-based insights and recommendations to improve your mood over time.")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.top, 5)
                                .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        HStack {
                            Text("Highlights")
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 10)
                            
                            Spacer()
                        }
                        
//                        ZStack (alignment: .leading) {
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
//
//                            VStack (alignment: .leading, spacing: 10) {
//                                Label("Usage", systemImage: "number.circle.fill")
//                                    .font(.headline)
//                                    .foregroundColor(.blue)
//                                    .padding(.top, 10)
//
//                                Text("Number of days mood has been recorded.")
//                                    .font(.subheadline)
//                                    .foregroundColor(.white)
//                                    .bold()
//                                    .padding(.bottom, 30)
//
//                                Spacer()
//                            }
//                            .padding(.horizontal, 16)
//                        }
//
//                        Spacer()
                        
                        ZStack (alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            
                            VStack (alignment: .leading, spacing: 10) {
                                HStack (alignment: .bottom) {
                                    Label("Current week", systemImage: "calendar.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 10)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: MoodLogView()) {
                                        Label("Arrow", systemImage: "chevron.right")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .labelStyle(.iconOnly)
                                    }
                                }
                                
//                                Text("Currently you have very mixed feelings.")
//                                    .font(.subheadline)
//                                    .foregroundColor(.white)
//                                    .bold()
//                                    .padding(.bottom, 5)
                                
                                Divider()
                                    .padding(.top, 5)
                                    .padding(.bottom, 5)
                                
                                Text("25-31 Dec 2023")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(.bottom, 10)
                                
                                Chart {
                                    ForEach(databaseManager.fetchMoodDataForWeek(), id: \.id) { moodData in
                                        PointMark(
                                            x: .value("Day", moodData.date, unit: .day),
                                            y: .value("Mood", moodData.mood)
                                        )
                                        .foregroundStyle(.white)

                                        LineMark(
                                            x: .value("Day", moodData.date, unit: .day),
                                            y: .value("Mood", moodData.mood)
                                        )
                                        .interpolationMethod(.stepCenter)
                                        .lineStyle(StrokeStyle(lineWidth: 2))
                                        .foregroundStyle(.white)
                                    }
                                }
                                .onAppear {
//                                    print("Chart appeared. Fetching mood data...")
                                    let fetchedData = databaseManager.fetchMoodDataForWeek()
//                                    print("Fetched \(fetchedData.count) rows from the database.")
                                }
                                .onChange(of: databaseManager.moodData) { _ in
//                                    print("Mood data changed. Count: \(databaseManager.moodData.count)")
                                }
                                .chartLegend(.hidden)
                                .frame(height: 80)
                                .chartYAxis {
                                    AxisMarks(
                                        values: [1]
                                    ) {
                                        AxisValueLabel {
                                            Text("""
                                                Very
                                                unpleasant
                                                """
                                            )
                                        }
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    }
                                    
                                    AxisMarks(
                                        values: [3]
                                    ) {
                                        AxisValueLabel {
                                            Text("""
                                                Neutral
                                                """
                                            )
                                        }
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    }
                                    
                                    AxisMarks(
                                        values: [5]
                                    ) {
                                        AxisValueLabel {
                                            Text("""
                                                Very
                                                pleasant
                                                """
                                            )
                                        }
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    }
                                    
                                    AxisMarks(
                                        values: [1, 3, 5]
                                    ) {
                                        AxisGridLine()
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .chartYScale(domain: 1 ... 5)
                                .chartXAxis {
                                    AxisMarks(values: .stride(by: .day, count: 1)) {
//                                        AxisGridLine()
//                                            .foregroundStyle(.gray)
//                                        AxisTick()
//                                            .foregroundStyle(.gray)
//                                        AxisValueLabel(format: .dateTime.weekday())
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
                                    }
                                }
                                
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 25)
                        }
                        
                        Spacer()
                        
                        ZStack (alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            
                            VStack (alignment: .leading, spacing: 10) {
                                HStack (alignment: .bottom) {
                                    Label("Insights", systemImage: "lightbulb.fill")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 10)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: MoodLogView()) {
                                        Label("Arrow", systemImage: "chevron.right")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .labelStyle(.iconOnly)
                                    }
                                }
                                
                                Text("To come in next version.")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.bottom, 30)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                        }
                        
                        Spacer()
                        
                        ZStack (alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                            
                            VStack (alignment: .leading, spacing: 10) {
                                HStack (alignment: .bottom) {
                                    Label("Recommendations", systemImage: "exclamationmark.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 10)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: MoodLogView()) {
                                        Label("Arrow", systemImage: "chevron.right")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                            .labelStyle(.iconOnly)
                                    }
                                }
                                
                                Text("To come in next version.")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.bottom, 30)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
            }
            .navigationBarTitle("Home")
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
                                    .foregroundColor(.blue)
                            } icon: {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.blue)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: LogMoodView()) {
                            Label {
                                Text("Log mood")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            } icon: {
                                Image(systemName: "plus.app.fill")
                                    .foregroundColor(.gray)
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
}


struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 4) {
            configuration.icon
            configuration.title
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
