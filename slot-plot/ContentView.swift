//
//  ContentView.swift
//  slot-plot
//
//  Created by Arunangshu Das on 24/12/22.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{
            path in
            let p1=CGPoint(x: 0, y: 20)
            let p2=CGPoint(x: 0, y: rect.height-20)
            let p3=CGPoint(x: rect.width/2 , y: rect.height)
            let p4=CGPoint(x: rect.width, y: rect.height-20)
            let p5=CGPoint(x: rect.width, y: 20)
            let p6=CGPoint(x: rect.width/2, y: 0)
            
            path.move(to: p6)
            
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 5)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 5)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 5)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 5)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 5)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 5)
            
//            path.addArc(tangent1End: p2, tangent2End: p3, radius: 1)
//            path.addArc(tangent1End: p3, tangent2End: p4, radius: 1)
//            path.addArc(tangent1End: p4, tangent2End: p5, radius: 1)
            
        }
    }
}

enum Choice:Int,Identifiable{
    
    var id:Int{
        rawValue
    }
    
    case success,failure
}

struct ContentView: View {
    
    @State public var symbols=["happy", "eating","love"]
    @State public var numbers=[0,1,2]
    @State public var counter=0
    @State private var showingAlert: Choice?
    
    var body: some View {
        ZStack{
            Image("sunshine")
                .resizable()
                .ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 80){
                HStack{
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color:.orange, radius: 5)
                    Text("Arunangshu")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .shadow(color:.orange, radius: 5)
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color:.orange, radius: 5)
                }.frame(width: .infinity,height: 50,alignment: .center)
                VStack(spacing:20){
                    HStack(spacing: 60){
                        Hexagon()
                            .fill(Color.gray)
                            .opacity(0.6)
                            .frame(width: 100,height: 100,alignment: .center)
                            .overlay(
                            Image(symbols[numbers[0]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,
                                      height: 70,
                                       alignment: .center)
                                .shadow(color: .gray ,radius: 5,
                                       x: 5,y: 5)
                            
                            )
                        Hexagon()
                            .fill(Color.gray)
                            .opacity(0.6)
                            .frame(width: 100,height: 100,alignment: .center)
                            .overlay(
                            Image(symbols[numbers[1]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,
                                      height: 70,
                                       alignment: .center)
                                .shadow(color: .gray ,radius: 5,
                                       x: 5,y: 5)
                            
                            )
                    }
                    Hexagon()
                        .fill(Color.gray)
                        .opacity(0.6)
                        .frame(width: 100,height: 100,alignment: .center)
                        .overlay(
                        Image(symbols[numbers[2]])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80,
                                  height: 70,
                                   alignment: .center)
                            .shadow(color: .gray ,radius: 5,
                                   x: 5,y: 5)
                        
                        )
                    HStack(spacing: 60){
                        Hexagon()
                            .fill(Color.gray)
                            .opacity(0.6)
                            .frame(width: 100,height: 100,alignment: .center)
                            .overlay(
                            Image(symbols[numbers[1]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,
                                      height: 70,
                                       alignment: .center)
                                .shadow(color: .gray ,radius: 5,
                                       x: 5,y: 5)
                            
                            )
                        Hexagon()
                            .fill(Color.gray)
                            .opacity(0.6)
                            .frame(width: 100,height: 100,alignment: .center)
                            .overlay(
                            Image(symbols[numbers[0]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80,
                                      height: 70,
                                       alignment: .center)
                                .shadow(color: .gray ,radius: 5,
                                       x: 5,y: 5)
                            
                            )
                    }
                }
                
                Button {
                    
                    self.numbers[0]=Int.random(in: 0...self.symbols.count-1)
                    self.numbers[1]=Int.random(in: 0...self.symbols.count-1)
                    self.numbers[2]=Int.random(in: 0...self.symbols.count-1)
                    
                    counter+=1
                    
                    if (self.numbers[0]==self.numbers[1] && self.numbers[1]==self.numbers[2] &&
                        self.numbers[0]==self.numbers[2]){
                        self.showingAlert = .success
                        counter=0
                    }
                    else if counter>5
                    {
                        self.showingAlert = .failure
                        counter=0
                    }
                    
                    
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("color"))
                        .overlay(Text("Spin")
                            .fontWeight(.bold)
                            .font(.title2)
                                 
                        )
                        .foregroundColor(.black)
                        .frame(width: 150,height: 50,alignment: .center)
                        .shadow(color: .gray,radius: 5,x:0,
                                y:5)
                }

            }
            .alert(item: $showingAlert){
                alert->Alert in
                switch alert{
                case .success:
                    return Alert(title: Text("Yahh Won!!"),message: Text("Great!!"),dismissButton: .cancel())
                case .failure:
                    return Alert(title: Text("oops"),message: Text("Better luck next time!!"),dismissButton: .cancel())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
