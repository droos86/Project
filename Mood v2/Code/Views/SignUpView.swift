//
//  SignUpView.swift
//  Mood v2
//
//  Created by Daniel Roos on 15.12.23.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
                .edgesIgnoringSafeArea(.all)
                        
            VStack(alignment: .leading) {
                Text("Mood")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                
                Spacer()
                
                // Text("Let's get yourself set up!")
                    // .font(.headline)
                    // .foregroundColor(.black)
                    // .padding(.bottom, 10)
                
                Text("First name")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextField("", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)

                Text("Last name")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextField("", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                Text("Email address")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                TextField("", text: $emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .padding(.bottom, 10)
                
                Text("Password")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                SecureField("", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                // Text("Confirm password")
                    // .font(.subheadline)
                    // .foregroundColor(.black)
                                    
                // SecureField("", text: $confirmPassword)
                    // .textFieldStyle(RoundedBorderTextFieldStyle())
                    // .padding(.bottom, 10)
                
                // Sign up button storing user data and creating a session with CoreData

                // NavigationLink(destination: HomeView()) {
                    // Text("Sign up")
                        // .bold()
                        // .frame(maxWidth: .infinity)
                        // .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                        // .background(Color.black)
                        // .foregroundColor(.white)
                        // .cornerRadius(100)
                        // .padding(.bottom, 10)
                // }
                
                
            }
            .padding(.horizontal, 16)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
