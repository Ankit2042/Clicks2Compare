//
//  PieChartView.swift
//  clicks2compare
//
//  Created by Nitin Singh on 15/01/24.
//

import SwiftUI

@available(OSX 10.15, *)
public struct ChartView: View {
    @StateObject var viewModel = ReferralUsersDetails()

    public var body: some View {
        GeometryReader { geometry in
            VStack {
                if let pieChartData = viewModel.referralUsers {
                    PieChartView(values: viewModel.values , names: pieChartData.data.piegraph.name ?? [], formatter: {value in String(format: "%.2f", value)})
                } else {
                    Text("Loading...")
                }
            }
            .onAppear {
                viewModel.GetData()
            }
        }
    }
}

@available(OSX 10.15, *)
public struct PieChartView: View {
    public let values: [Double]
    public let names: [String]
    public let formatter: (Double) -> String
    
    public var colors: [Color]
    public var backgroundColor: Color
    
    public var widthFraction: CGFloat
    public var innerRadiusFraction: CGFloat
    
    @State private var activeIndex: Int = -1
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    public init(values:[Double], names: [String], formatter: @escaping (Double) -> String, colors: [Color] = [Color(#colorLiteral(red: 0.615060389, green: 0.6872571111, blue: 0.6824037433, alpha: 1)), Color(#colorLiteral(red: 0.4341839076, green: 0.4841316727, blue: 0.5746168494, alpha: 1)), Color(#colorLiteral(red: 0.6148324609, green: 0.6822978854, blue: 0.4978522062, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)), Color(#colorLiteral(red: 0.631372549, green: 0.6784313725, blue: 0.7607843137, alpha: 1)), Color(#colorLiteral(red: 0.6712024212, green: 0.5320590138, blue: 0.7323239446, alpha: 1))], backgroundColor: Color = Color.white, widthFraction: CGFloat = 0.75, innerRadiusFraction: CGFloat = 0.60){
        self.values = values
        self.names = names
        self.formatter = formatter
        
        self.colors = colors
        self.backgroundColor = backgroundColor
        self.widthFraction = widthFraction
        self.innerRadiusFraction = innerRadiusFraction
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack{
                    ForEach(0..<self.values.count, id: \.self){ i in
                        PieSlice(pieSliceData: self.slices[i])
                            .scaleEffect(self.activeIndex == i ? 1.03 : 1)
//                            .animation(Animation.spring())
                            
                    }
                    .frame(width: widthFraction * geometry.size.width , height: widthFraction * geometry.size.width)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let radius = 0.5 * widthFraction * geometry.size.width
                                let diff = CGPoint(x: value.location.x - radius, y: radius - value.location.y)
                                let dist = pow(pow(diff.x, 2.0) + pow(diff.y, 2.0), 0.5)
                                if (dist > radius || dist < radius * innerRadiusFraction) {
                                    self.activeIndex = -1
                                    return
                                }
                                var radians = Double(atan2(diff.x, diff.y))
                                if (radians < 0) {
                                    radians = 2 * Double.pi + radians
                                }
                                
                                for (i, slice) in slices.enumerated() {
                                    if (radians < slice.endAngle.radians) {
                                        self.activeIndex = i
                                        break
                                    }
                                }
                            }
                            .onEnded { value in
                                self.activeIndex = -1
                            }
                    )
                    Circle()
                        .fill(Color.theme.BlackWhite)
                        .frame(width: widthFraction * geometry.size.width * innerRadiusFraction, height: widthFraction * geometry.size.width * innerRadiusFraction)
                    
                    VStack {
                        Text(self.activeIndex == -1 ? "Total" : names[self.activeIndex])
                            .font(.system(size: 15))
                            
                        Text(String(self.activeIndex == -1 ? Int(values.reduce(0, +)) : Int(values[self.activeIndex])))
                            .font(.title)
                            
                    }
                    
                }
                PieChartRows(colors: self.colors, names: self.names, values: self.values.map { Int($0) }, percents: self.values.map { String(format: "%.0f%%", $0 * 100 / self.values.reduce(0, +)) })
            }
            .foregroundColor(Color.primary)
        }
    }
}

@available(OSX 10.15, *)
struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [Int]
    var percents: [String]
   
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ForEach(0..<self.values.count,id: \.self){ i in
                    HStack {
                        RoundedRectangle(cornerRadius: 5.0)
                            .fill(self.colors[i])
                            .frame(width: 20, height: 20)
                        Text(self.names[i])
                        Spacer()
                        VStack(alignment: .trailing) {
                           
                            Text("\(self.values[i])")
                            Text(self.percents[i])
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
        }
    }
}


@available(OSX 10.15.0, *)
struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(values: [1300, 500, 300,500,480,547,487,984], names: ["Rent", "Transport", "Education","Rent","Rent","Rent","Rent","Rent"], formatter: {value in String(format: "%.2f", value)})    }
}
