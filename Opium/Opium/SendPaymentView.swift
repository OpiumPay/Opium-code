//
//  SendPaymentView.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 12/08/23.
//

import SwiftUI

struct SendPaymentView: View {
    var text = "shop@upi"
    
    @State var amount = "₹"
    
    @FocusState var focus
    
    var body: some View {
        ZStack {
            Color(.orange).opacity(0.05)
                .ignoresSafeArea()
            VStack {
                
                
                ZStack {
                    Circle()
                        .foregroundColor(.orange.opacity(0.3))
                        .frame(width: 200)
                    
                    Image("person")
                        .resizable()
                        .frame(width: 100, height: 120)
                        
                }
                .padding(.top, 50)
                
                
                Text("shop@upi")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding(.bottom, 130)
                                
                
                ZStack {
                    Color(.white)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        VStack(alignment: .center) {
                            Text("Enter amount")
                                .fontWeight(.medium)
                                .padding(.top, 20)
                            TextField("₹100", text: $amount)
                                .font(.system(size: 64))
                                .keyboardType(.numberPad)
                                .focused($focus)
                                .multilineTextAlignment(.center)
            //                    .padding()
                                
                            }
                        
                        Spacer()
                        
                        NavigationLink(destination: SendTxnView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("lightOrange"))
                                
                                Text("Send")
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 130, height: 60)
                            .padding()
                            
                        }
                    }
                }
                
                
                
            }
        }
        
        .onAppear {
            focus = true
        }
        .navigationTitle("Send UPI")
        .navigationBarBackButtonHidden(false)
    }
}

struct SendPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        SendPaymentView()
    }
}
