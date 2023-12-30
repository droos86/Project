//import SwiftUI
//
//struct ContentView_Alt: View {
//    @State private var circleWidth: CGFloat = 270
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color(.black)
//                    .edgesIgnoringSafeArea(.all)
//                
////                Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
////                    .edgesIgnoringSafeArea(.all)
//                
//                VStack(alignment: .leading) {
//                    Text("Welcome to")
//                        .font(.subheadline)
//                        .foregroundColor(.white)
//                    
//                    Text("Mood")
//                        .font(.largeTitle)
//                        .bold()
//                        .foregroundColor(.white)
//                    
//                    Spacer()
//                    
//                    HStack {
//                        Spacer()
//
//                        Circle()
//                            .frame(width: circleWidth)
//                            .foregroundColor(.blue)
//                            .blur(radius: 75)
//                            .onAppear {
//                                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
//                                    self.circleWidth = 150
//                                }
//                            }
//
//                        Spacer()
//                    }
//                                        
//                    Spacer()
//                    
//                    Text("Track and improve your mood over time.")
//                        .font(.title2)
//                        .bold()
//                        .foregroundColor(.white)
//                    
//                    Text("On-device data.")
//                        .font(.subheadline)
//                        .foregroundColor(.white)
//                    
//                    Text("Self-caring.")
//                        .font(.subheadline)
//                        .foregroundColor(.white)
//                        .padding(.bottom, 10)
//                    
//                    NavigationLink(destination: HomeView()) {
//                        Text("Start")
//                            .bold()
//                            .frame(maxWidth: .infinity)
//                            .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                            .background(Color.white)
//                            .foregroundColor(.black)
//                            .cornerRadius(100)
//                    }
//                    
//                    // NavigationLink(destination: SignUpView()) {
//                        // Text("Sign up")
//                            // .bold()
//                            // .frame(maxWidth: .infinity)
//                            // .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                            // .background(Color.black)
//                            // .foregroundColor(.white)
//                            // .cornerRadius(100)
//                            // .padding(.bottom, 10)
//                    // }
//                    
//                    // NavigationLink(destination: SignInView()) {
//                        // Text("Sign in")
//                            // .bold()
//                            // .frame(maxWidth: .infinity)
//                            // .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                            // .foregroundColor(.black)
//                            // .cornerRadius(100)
//                            // .overlay(
//                                // RoundedRectangle(cornerRadius: 100)
//                                    // .stroke(Color.black, lineWidth: 1)
//                            // )
//                    // }
//                }
//                .padding(.horizontal, 16)
//            }
//            .onAppear {
//               print("Test")
//            }
//        }
//    }
//}
//    
//struct ContentView_Alt_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
