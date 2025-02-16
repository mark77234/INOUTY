import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var circleOpacity: Double = 0.3
    @State private var circleScale: CGFloat = 0.5
    @State private var textOpacity: Double = 0.0
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color.black // 배경색
                    .ignoresSafeArea()
                
                // 애니메이션 배경 원
                Circle()
                    .fill(Color.blue)
                    .scaleEffect(circleScale)
                    .opacity(circleOpacity)
                    .frame(width: 300, height: 300)
                    .onAppear {
                        withAnimation(
                            .easeInOut(duration: 1.0).repeatForever(autoreverses: true)
                        ) {
                            self.circleScale = 1.5
                            self.circleOpacity = 0.7
                        }
                    }
                
                // 로고 및 텍스트
                VStack {
                    Image(systemName: "bus.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                    
                    Text("INOUTY")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(textOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                self.textOpacity = 1.0
                            }
                        }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // 시간 조정
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
