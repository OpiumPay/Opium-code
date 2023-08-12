//
//  HomeView.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 11/08/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    ZStack {
                        Circle()
                            .foregroundColor(.orange.opacity(0.5))
                        
                        VStack {
                            HStack {
                                Image("shams")
                                    .resizable()
                                    .foregroundColor(.secondary)
                                    .frame(width: 40, height: 40)

                            }
                        }
                    }
                    .frame(width: 50, height: 50)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Jane.eth")
                            .fontWeight(.semibold)
                        
                        Text("0x182...271")
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "bell.badge")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.horizontal)
                        

                }
                
                ScrollView {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(.primary)
                                    
                                    VStack {
                                        HStack {
                                            Text("Available Bal")
                                                .foregroundColor(.white)
                                                .fontWeight(.medium)
                                            
                                            
                                            Spacer()
                                                
                                        }
                                        .padding(25)
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .bottom) {
                                            Text("8,700")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .font(.system(size: 35))
                                            
                                            Text("INR")
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                                .foregroundColor(.white)
                                                .padding(.bottom, 5)
                                            
                                            Spacer()
                                        }
                                        .padding(25)
                                    }
                                }
                                .frame(width: geo.size.width * 0.60)
                                .padding(1)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("lightOrange"))
                                    
                                    VStack {
                                        HStack {
                                            Text("Safe Bal")
                                                .foregroundColor(.white)
                                                .fontWeight(.medium)
                                            
                                            
                                            Spacer()
                                            
                                            Image("safe")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                
                                        }
                                        .padding(25)
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .bottom) {
                                            Text("25,000")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                                .font(.system(size: 35))
                                            
                                            Text("INR")
                                                .fontWeight(.semibold)
                                                .font(.system(size: 15))
                                                .foregroundColor(.white)
                                                .padding(.bottom, 5)
                                            
                                            Spacer()
                                        }
                                        .padding(25)
                                    }
                                }
                                .frame(width: geo.size.width * 0.60)
                                .padding(1)
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal, 1)
                    .frame(height: 250)
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                            VStack {
                                Image(systemName: "arrow.up.right")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                Text("Send")
                                    .foregroundColor(.black)
                                    .fontWeight(.medium)
                                    .padding(.top, 5)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                            VStack {
                                Image(systemName: "arrow.down.left")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                Text("Withdraw")
                                    .foregroundColor(.black)
                                    .fontWeight(.medium)
                                    .padding(.top, 5)
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                            VStack {
                                Image(systemName: "creditcard.fill")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                Text("Topup")
                                    .foregroundColor(.black)
                                    .fontWeight(.medium)
                                    .padding(.top, 5)
                            }
                        }
                    }
                    .foregroundColor(.gray.opacity(0.15))
                    .frame(height: 80)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(.gray.opacity(0.15))
                        
                        VStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(.gray.opacity(0.40))
                                .frame(width: 60, height: 4)
                                .padding()
                            
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("tunap@paytm")
                                            .font(.system(size: 18))
                                            .foregroundColor(.black)
                                            .fontWeight(.medium)
                                        
                                        Text("8 Aug 12:40 PM")
                                            .foregroundColor(.black.opacity(0.7))
                                            .font(.system(size: 12))

                                    }
                                    
                                    Spacer()
                                    
                                    Text("- ₹200")
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                }
                                .padding()
                            
                            Divider()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("shreyas@icici")
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .fontWeight(.medium)
                                    
                                    Text("8 Aug 12:40 PM")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12))

                                }
                                
                                Spacer()
                                
                                Text("- ₹200")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                        
                        Divider()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("zomato@upi")
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .fontWeight(.medium)
                                    
                                    Text("8 Aug 12:40 PM")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12))

                                }
                                
                                Spacer()
                                
                                Text("- ₹200")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                        
                        Divider()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("swiggy@hdfcbank")
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .fontWeight(.medium)
                                    
                                    Text("8 Aug 12:40 PM")
                                        .foregroundColor(.black.opacity(0.7))
                                        .font(.system(size: 12))

                                }
                                
                                Spacer()
                                
                                Text("- ₹200")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .padding(.bottom, 30)
                                                    
                            
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
