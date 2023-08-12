//
//  SendTxnView.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 12/08/23.
//

import SwiftUI
import metamask_ios_sdk
import Combine


struct ExampleRow: View {
    var left = ""
    var right = ""
    var body: some View {
        HStack {
            Text(left)
                .foregroundColor(.gray)
            Spacer()
            Text(right)
        }
    }
}

struct SendTxnView: View {
    @ObservedObject var ethereum = MetaMaskSDK.shared.ethereum
    
    @State private var cancellables: Set<AnyCancellable> = []
    
    @State var errorMessage = ""
    @State var showError = false
    
    @State var result = ""
    
    @State var status = ""
    @State private var hasTimeElapsed = false
    
    @State private var hasTimeElapsed2 = false
    
    @State var scannedCode: String?

    
    private func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 7_500_000_000)
            hasTimeElapsed = true
        }
    
    private func delayTexts() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 11_500_000_000)
            hasTimeElapsed2 = true
        
//            try? await Task.sleep(nanoseconds: 13_500_000_000)
//            scannedCode = "something"

        }
    
    func signInput() {
        let from = ethereum.selectedAddress
        let params: [String] = [from, message]
        let signRequest = EthereumRequest(
            method: .ethSignTypedDataV4,
            params: params
        )

        ethereum.request(signRequest)?.sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                errorMessage = error.localizedDescription
                showError = true
                print("Error: \(errorMessage)")
            default: break
            }
        }, receiveValue: { value in
            self.result = value as? String ?? ""
        }).store(in: &cancellables)
    }
    
    var body: some View {
        VStack {
            
            if (result == "") {
                List {
                            Section(header: Text("Transaction Details")) {
                                ExampleRow(left: "Name", right: "shop@upi")
                                ExampleRow(left: "Amount", right: "₹50")
                                ExampleRow(left: "Remarks", right: "Grocery shopping")
                            }
                    
                    Section(header: Text("Safe Txn Details")) {
                        ExampleRow(left: "Address", right: "\(ethereum.selectedAddress)")
                        ExampleRow(left: "Amount", right: "0.6 USDC")
                        ExampleRow(left: "Signing Text", right: base64)
                    }
                        }
                .listStyle(.insetGrouped)
                .padding(.top, 30)
            } else {
                Spacer()
                
                ProgressView()
                    .controlSize(.large)
                
                
//                if let code = scannedCode {
//                    NavigationLink("Next page", destination: SuccessfulTxn(), isActive: .constant(true)).hidden()
//                }
                
                if (hasTimeElapsed2) {
                    Text("Transaction Sent")
                } else {
                    Text(hasTimeElapsed ? "Message signed succesfully..." : "Sending UPI Transaction...")
                        .task(delayText)
                        .task(delayTexts)
                        .padding()
                }
                
                
            }
                
            Spacer()
            
            if (result == "") {
                HStack {
                    NavigationLink(destination: SendTxnView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.gray)
                            
                            Text("Deny")
                                .foregroundColor(.white)
                        }
                        .frame(width: 150, height: 50)
                        .padding()
                        
                    }
                    
                    Button(action: {signInput()}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.blue)
                            
                            Text("Accept")
                                .foregroundColor(.white)
                        }
                        .frame(width: 150, height: 50)
                        .padding()
                        
                    }
                }
                .padding()
                .onReceive(NotificationCenter.default.publisher(for: .Connection)) { notification in
                    status = notification.userInfo?["value"] as? String ?? "Offline"
                }
            }
        }
    }
}

struct SendTxnView_Previews: PreviewProvider {
    static var previews: some View {
        SendTxnView()
    }
}

var base64 = "amtzZGNibmprYmNzZGtqYmNzCmZkCgpmZAp2CnZmZAp2ZmRyZXNldgpldmYKdgplZXZlZXZ2ZQ=="

var message = "{\"domain\":{\"chainId\":84531,\"name\":\"Opium\",\"verifyingContract\":\"0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC\",\"version\":\"1\"},\"message\":{\"UPIid\":\"shop@upi\",\"AmountinINR\":\"50\",\"AmountinUSDC\":\"0.6\",\"Remarks\":\"Groceryshopping\",\"UniqueSigningText\":\"amtzZGNibmprYmNzZGtqYmNzCmZkCgpmZAp2CnZmZAp2ZmRyZXNldgpldmYKdgplZXZlZXZ2ZQ==\"},\"primaryType\":\"UPITxn\",\"types\":{\"EIP712Domain\":[{\"name\":\"name\",\"type\":\"string\"},{\"name\":\"version\",\"type\":\"string\"},{\"name\":\"chainId\",\"type\":\"uint256\"},{\"name\":\"verifyingContract\",\"type\":\"address\"}],\"QA\":[{\"name\":\"UPIid\",\"type\":\"string\"},{\"name\":\"AmountinINR\",\"type\":\"string\"},{\"name\":\"AmountinUSDC\",\"type\":\"string\"},{\"name\":\"Remarks\",\"type\":\"string\"},{\"name\":\"UniqueSigningText\",\"type\":\"string\"}]}}"
