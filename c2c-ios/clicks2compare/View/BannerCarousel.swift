import SwiftUI

struct ImageCarouselView: View {
    let images: [String] = ["bn1", "bn3", "bn2"]
    @State private var currentPage = 0
    private let colors: [Color] = [.red, .blue, .green, .orange, .black]
    var body: some View {
        ZStack {
            TabView {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            withAnimation {
                currentPage = (currentPage + 1) % images.count
            }
        }
    }

    private func stopTimer() {
        // Stop the timer when the view disappears
        // to prevent unwanted behavior in the background
        // (e.g., when the view is not visible).
    }
}

struct PageControl: View {
    let numberOfPages: Int
    @Binding var currentPage: Int

    var body: some View {
        HStack {
            ForEach(0..<numberOfPages,id: \.self) { page in
                Circle()
                    .fill(page == currentPage ? Color.blue : Color.gray)
                    .frame(width: 8, height: 8)
                    .overlay(Circle().stroke(page == currentPage ? Color.clear : Color.blue, lineWidth: 1))
                    .padding(4)
                    .onTapGesture {
                        currentPage = page
                    }
            }
        }
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView()
    }
}
