//
//  SuccessfulTxn.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 12/08/23.
//

import SwiftUI

struct SuccessfulTxn: View {
    var body: some View {
        VStack {
            LottieView(name: "tick", loopMode: .repeat(100))
                .frame(width: 160, height: 160)
                .padding()
                .padding(.top, 10)
            List {
                Section(header: Text("Transaction Details")) {
                    ExampleRow(left: "Sent To", right: "shop@upi")
                    ExampleRow(left: "Amount", right: "₹50")
                    ExampleRow(left: "UTR Number", right: "MPCip5Gdd3JBDq")
                    ExampleRow(left: "Timestamp", right: "August \(Date().formatted(.dateTime.day(.ordinalOfDayInMonth).hour().minute()))")
                    ExampleRow(left: "From UPI", right: "RazorpayX")
                }
                

                
            }
            .listStyle(.insetGrouped)
            .padding(.top, 30)
            
            Button(action: {}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                    
                    Text("Done")
                        .foregroundColor(.white)
                }
                .frame(width: 150, height: 50)
                .padding()
                
            }
            
        }
    }
}

struct SuccessfulTxn_Previews: PreviewProvider {
    static var previews: some View {
        SuccessfulTxn()
    }
}
