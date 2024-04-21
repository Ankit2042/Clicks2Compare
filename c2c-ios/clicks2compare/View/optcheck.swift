import SwiftUI

struct BannerCarousel: View {
    public let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    ///  images with these names are placed  in my assets
   
    let constant = Constant()
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(0..<constant.Banner.count, id: \.self) { i in
                    let url = URL(string: constant.Banner[i])
                    AsyncImage(url: url) { ImageReturn in
                        ImageReturn
                            .resizable()
                            .scaledToFit()
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer) { _ in
                withAnimation {
                    
                    selection = selection < constant.Banner.count - 1 ? selection + 1 : 0
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
    }
}

struct BannerCarousel_Previews: PreviewProvider {
    static var previews: some View {
        BannerCarousel()
    }
}


