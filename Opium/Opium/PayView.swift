//
//  PayView.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 11/08/23.
//

import SwiftUI
import CodeScanner

struct PayView1: View {
    
        @State private var isPresentingScanner = false
        @State private var scannedCode: String?

        var body: some View {
            VStack(spacing: 10) {
                if let code = scannedCode {
                    NavigationLink("Next page", destination: SendPaymentView(text: code), isActive: .constant(true)).hidden()
                }

                Button("Scan Code") {
                    isPresentingScanner = true
                }

                Text("Scan a UPI QR for payment")
            }
            .sheet(isPresented: $isPresentingScanner) {
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        scannedCode = result.string
                        isPresentingScanner = false
                    }
                }
            }
        }
}

struct PayView: View {
    
        @State private var isPresentingScanner = false
        @State private var scannedCode: String?

        var body: some View {
            VStack(spacing: 10) {
                if let code = scannedCode {
                    NavigationLink("Next page", destination: SendPaymentView(text: code), isActive: .constant(true)).hidden()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .border(.gray)
                    
                    CodeScannerView(codeTypes: [.qr]) { response in
                        if case let .success(result) = response {
                            scannedCode = result.string
                            isPresentingScanner = false
                        }
                    }
                    
                }
                .ignoresSafeArea()
                .overlay {
                    ZStack {
                        
                        VStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 30)
                                .border(Color("lightOrange"))
                                .frame(width: 300, height: 300)
                                .foregroundColor(.black.opacity(0))
                            Spacer()
                            Text("Scan a UPI QR for payment")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(.bottom, 150)
                        }
                    }
                    
                }
                

            }
        }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
