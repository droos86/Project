//import SwiftUI
//
//struct HomeView_Alt: View {
//    @State private var circleWidth: CGFloat = 270
//    
//    var body: some View {
//        ZStack {
//            Color(.black)
//                .edgesIgnoringSafeArea(.all)
//            
////            Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
////                .edgesIgnoringSafeArea(.all)
//            
//            VStack(alignment: .leading) {
//                // Text("Hello")
//                    // .font(.caption)
//                    // .foregroundColor(.black)
//                
//                Text("Hello")
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
//                        .foregroundColor(.blue)
//                        .blur(radius: 75)
//                    
//                    Spacer()
//                }
//                
//                Spacer()
//                
//                Text("What do you want to do?")
//                    .font(.title2)
//                    .bold()
//                    .foregroundColor(.white)
//                    .padding(.bottom, 10)
//                
//                NavigationLink(destination: MoodTrackerView()) {
//                    Text("Log mood")
//                        .bold()
//                        .frame(maxWidth: .infinity)
//                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(100)
//                        .padding(.bottom, 10)
//                }
//                
//                NavigationLink(destination: MoodLogView()) {
//                    Text("View log")
//                        .bold()
//                        .frame(maxWidth: .infinity)
//                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                        .foregroundColor(.white)
//                        .cornerRadius(100)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 100)
//                                .stroke(Color.white, lineWidth: 1)
//                        )
//                }
//            }
//            .padding(.horizontal, 16)
//        }
//    }
//}
//
//struct HomeView_Alt_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
