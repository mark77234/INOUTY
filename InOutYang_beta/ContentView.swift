import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // 배경 그라데이션
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 50) {
                    // 첫 번째 버튼
                    CustomNavigationButton(
                        text: "부산대 ➜ 밀양역",
                        iconName: "tram.fill",
                        colors: [Color.blue, Color.purple],
                        destination: MYS_Dir()
                    )
                    
                    // 두 번째 버튼
                    CustomNavigationButton(
                        text: "밀양역 ➜ 부산대",
                        iconName: "graduationcap",
                        colors: [Color.purple, Color.blue],
                        destination: PNU_Dir()
                    )
                }
                .padding()
                .navigationTitle("INOUTY")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// 공통 버튼 컴포넌트
struct CustomNavigationButton<Destination: View>: View {
    let text: String
    let iconName: String
    let colors: [Color]
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(text)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Image(systemName: iconName)
                    .font(.system(size: 24))
            }
            .frame(width: 300, height: 80)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
}


