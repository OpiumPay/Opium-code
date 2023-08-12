//
//  SendPaymentView.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 12/08/23.
//

import SwiftUI

struct SendPaymentView: View {
    var text = "shop@upi"
    
    @State var amount = ""
    
    @FocusState var focus
    
    var body: some View {
        VStack {
            Text("You are sending payment to \(text)")
                .font(.title)
                .padding(.top, 20)
            
            VStack(alignment: .leading) {
                Text("Enter amount to send in Rupees")
                    .padding(.top, 20)
                TextField("100", text: $amount)
                    .font(.system(size: 24))
                    .keyboardType(.numberPad)
                    .focused($focus)
//                    .padding()
                    
                }
            .padding(.leading, 35)
            
            NavigationLink(destination: SendTxnView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                    
                    Text("Send")
                        .foregroundColor(.white)
                }
                .frame(width: 150, height: 50)
                .padding()
                
            }

            
            
            Spacer()
        }
        .onAppear {
            focus = true
        }
    }
}

struct SendPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        SendPaymentView()
    }
}
