//import SwiftUI
//
//struct SignInView: View {
//    @State private var emailAddress = ""
//    @State private var password = ""
//    
//    var body: some View {
//        ZStack {
//            Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
//                .edgesIgnoringSafeArea(.all)
//             
//            VStack(alignment: .leading) {
//                Text("Mood")
//                    .font(.largeTitle)
//                    .bold()
//                    .foregroundColor(.black)
//                
//                Spacer()
//                
//                Text("Let's get you started!")
//                    .font(.headline)
//                    .bold()
//                    .foregroundColor(.black)
//                    .padding(.bottom, 10)
//                                
//                Text("Email address")
//                    .font(.subheadline)
//                    .foregroundColor(.black)
//                
//                TextField("", text: $emailAddress)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.emailAddress)
//                    .padding(.bottom, 10)
//                
//                Text("Password")
//                    .font(.subheadline)
//                    .foregroundColor(.black)
//                
//                TextField("", text: $password)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding(.bottom, 20)
//                                   
//                // Transform to Sign in button checking user data and creating a session with CoreData
//                NavigationLink(destination: HomeView()) {
//                    Text("Sign in")
//                        .bold()
//                        .frame(maxWidth: .infinity)
//                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
//                        .foregroundColor(.black)
//                        .cornerRadius(100)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 100)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
//                        .padding(.bottom, 10)
//                }
//                
//                HStack {
//                    Spacer()
//                    
//                    Text("Forgot your password?")
//                        .font(.caption)
//                        .foregroundColor(.blue)
//                        .padding(.bottom, 10)
//                    
//                    Spacer()
//                }
//            }
//            .padding(.horizontal, 16)
//        }
//    }
//}
//
//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
