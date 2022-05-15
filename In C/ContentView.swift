//
//  ContentView.swift
//  In C
//
//  Created by John Pill on 15/05/2022.
//

import SwiftUI

struct CardBack: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    @Binding var randomNumber: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .shadow(color: .purple, radius: 10, x: 0, y: 0)
            
            Image("image" + String(randomNumber))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.red)
                .onAppear(perform: {
                    withAnimation(Animation.spring().delay(0.5)) {
                        
                    }
                })
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            .padding([.bottom, .leading, .trailing], 20)
    }
}


struct CardFront: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    @Binding var randomNumber: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:20)
                .fill(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .shadow(color: .purple, radius: 10, x: 0, y: 0)
            
            Image("image" + String(randomNumber))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.red)
                .onAppear(perform: {
                    withAnimation(Animation.spring().delay(0.5)) {
                        
                    }
                })
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
            .padding([.bottom, .leading, .trailing], 20)
    }
}



struct ContentView: View {
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    @State var randomNumber = 0
    @State private var hasTimeElapsed = false
    
    
    let width: CGFloat = 700
    let height: CGFloat = 320
    let durationAndDelay: CGFloat = 0.4
    
    
    func randommizeNumber() {
        DispatchQueue.main.asyncAfter(deadline: .now() + durationAndDelay) {                          hasTimeElapsed = true
            self.randomNumber = Int.random(in: 1...12)
            
        }
    }
    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }

    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("In C")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                    .padding()
                Spacer()
                Text("Cell No: \(randomNumber)")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(.purple)
                    .padding()


                
                Spacer()
            }
        
        ZStack {
            CardFront(width: width, height: height, degree: $frontDegree, randomNumber: $randomNumber)
            CardBack(width: width, height: height, degree: $backDegree, randomNumber: $randomNumber)
        }
        .onTapGesture {
            flipCard()
            randommizeNumber()
            
        }
        
        }
    

        
        
    }
}



//struct ContentView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardBack(width: 200, height: 250, degree: $backDegree)
//        CardFront(width: 200, height: 250)
//    }
//}
