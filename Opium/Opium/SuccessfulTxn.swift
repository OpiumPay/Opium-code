//
//  SuccessfulTxn.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 12/08/23.
//

import SwiftUI

struct SuccessfulTxn: View {
    var body: some View {
        ZStack {
            Color("fadeOrange")
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                                .frame(width: geo.size.width * 0.88, height: geo.size.height * 0.75)
                            
                            VStack {
                                Spacer()
                                HStack {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                    
                                    Spacer()
                                    
                                    Line()
                                       .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                       .frame(height: 1)
                                    
                                    Spacer()
                                    
                                    Circle()
                                        .frame(width: 30, height: 30)
                                }
                                .foregroundColor(Color("fadeOrange"))
                                
                                Spacer()
                            }
                            .overlay {
                                VStack {
                                    Group {
                                        LottieView(name: "orangeTick", loopMode: .repeat(100))
                                            .frame(width: 130, height: 130)
                                            .padding(.top, geo.size.height * 0.10)
                                        
                                        Text("Transaction Success")
                                            .font(.title2)
                                            .fontWeight(.medium)
                                        
                                        Text("\(Date().formatted())")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14))
                                        
//                                        Text("Amount")
//                                            .font(.title3)
//                                            .foregroundColor(.gray)
//                                            .fontWeight(.regular)
//                                            .padding(.top, 5)
                                        
                                        Text("₹50.00")
                                            .font(.largeTitle)
                                            .fontWeight(.medium)
                                            .padding(.top, 5)
                                        
                                        Text("(0.60 USDC)")
                                            .font(.footnote)
                                            .fontWeight(.medium)
                                        
                                        
                                        HStack {
                                            Text("Transaction Details")
                                                .foregroundColor(.gray)
                                                .font(.callout)
                                                .padding(.leading, geo.size.width * 0.09)
                                            Spacer()
                                        }
                                        .padding(.top, geo.size.height * 0.03)
                                    }
                                    
                            
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 15)
                                        
                                        HStack {
                                            Image(systemName: "info.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(Color(.systemOrange))
                                                .padding(.trailing, 15)
                                            
                                            VStack(alignment: .leading) {
                                                Text("Sent to shop@upi")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.semibold)
                                                
                                                Text("UTR: MPCip5Gdd3JBDq")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14))
                                                
                                                    
                                            }
                                            
                                            Spacer()
                                            
                                        }
                                        .padding(.horizontal, geo.size.width * 0.04)
                                            
                                    }
                                    .frame(width: geo.size.width * 0.80, height: geo.size.height * 0.10)
                                    .foregroundColor(.black.opacity(0.05))
                                    
                                    NavigationLink(destination: HomeView()) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 15)
                                                .foregroundColor(.orange)
                                                .frame(width: geo.size.width * 0.78, height: 50)
                                                
                                            
                                            Text("Done")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                        }
                                        
                                    }
                                    .padding(.top)
                                    
                                    
                                    
                                    Text("Available Credit: ₹4400")
                                        .fontWeight(.medium)
                                        .font(.footnote)
                                        .padding(.top, 5)
                                    
                                    
                                    
                                    Spacer()
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    Spacer()
                        
                }
            }
        }
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct SuccessfulTxn_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulTxn()
    }
}
