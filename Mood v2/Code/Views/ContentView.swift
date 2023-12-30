import SwiftUI

struct ContentView: View {
    @State private var circleWidth: CGFloat = 150
    @State private var isBreathingIn = true
    @State private var isTitle = false
    @State private var isInvisible = true
    @State private var cycleCount = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Text("Breathe in")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                            .opacity(isBreathingIn ? 1 : 0)
                            .onAppear {
                                animateBreathing()
                            }
                            .onDisappear {
                                resetBreathingAnimation()
                            }
                        
                        Text("Breathe out")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                            .opacity(isBreathingIn ? 0 : 1)
                        
                        Text("Breathe out")
                            .frame(width: 175, height: 25, alignment: .center)
                            .background(Color(.black))
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                            .opacity(isInvisible ? 0 : 1)
                            .onAppear {
                                animateVisibility()
                            }
                            .onDisappear {
                                resetVisibilityAnimation()
                            }
                    }
                    
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                    
                    Text("Welcome to")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(isTitle ? 1 : 0)
                        .onAppear {
                            animateTitle()
                        }
                        .onDisappear {
                            resetTitleAnimation()
                        }
                    
                    Text("Mood")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .opacity(isTitle ? 1 : 0)
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Start")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .opacity(isTitle ? 1 : 0)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Circle()
                            .frame(width: circleWidth)
                            .foregroundColor(.blue)
                            .blur(radius: 75)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                                    self.circleWidth = 270
                                }
                            }
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    
    private func animateBreathing() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 1)) {
                isBreathingIn.toggle()
            }

            cycleCount += 1

            if cycleCount == 3 {
                timer.invalidate()
            }
        }
    }
    
    
    private func resetBreathingAnimation() {
        isBreathingIn = true
        cycleCount = 0
    }
    
    
    private func animateTitle() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.2) {
            withAnimation(.easeIn) {
                isTitle.toggle()
            }
        }
    }

    
    private func resetTitleAnimation() {
        isTitle = false
    }
    
    
    private func animateVisibility() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.2) {
            withAnimation(.easeIn) {
                isInvisible.toggle()
            }
        }
    }

    
    private func resetVisibilityAnimation() {
        isInvisible = true
    }
}
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
