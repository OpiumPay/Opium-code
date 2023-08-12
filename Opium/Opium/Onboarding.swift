//
//  Onboarding.swift
//  Opium
//
//  Created by Sangeeta Papinwar on 11/08/23.
//

import SwiftUI
import Combine
import metamask_ios_sdk

struct Onboarding: View {
    var body: some View {
        NavigationView {
            FirstView()
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
        SecondView()
        ThirdView()
    }
}


struct FirstView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Text("UPI\ncredit line \nfor your crypto")
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(30)
                
                Spacer()
                
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.primary)
                        .frame(width: 30)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 30)
                        .foregroundColor(.secondary)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 30)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    NavigationLink(destination: SecondView()) {
                            HStack {
                                Text("ENTER")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .padding(.trailing, 5)
                                
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .frame(width: 25, height: 20)
                            }
                            
                    }
                    
                }
                .frame(height: 4)
                .padding(30)
                .padding(.bottom, 30)
            }
        }
            
        
    }
}



struct SecondView: View {
    
    @State private var cancellables: Set<AnyCancellable> = []

    private let dapp = Dapp(name: "Opium App", url: "https://coria.tech")

    @State private var connected: Bool = false
    @State private var status: String = "Offline"

    @State private var errorMessage = ""
    @State private var showError = false

    @State private var showProgressView = false
    @State private var showToast = false
    
    @ObservedObject var ethereum = MetaMaskSDK.shared.ethereum
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Text("Connect your\nmetamask wallet")
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(30)
                .padding(.bottom, 70)
             
                if ethereum.selectedAddress.isEmpty {
                    Section {
                        ZStack {
                            Button {
                                showProgressView = true
                                
                                ethereum.connect(dapp)?.sink(receiveCompletion: { completion in
                                    switch completion {
                                    case let .failure(error):
                                        showProgressView = false
                                        errorMessage = error.localizedDescription
                                        showError = true
                                        print("Connection error: \(errorMessage)")
                                    default: break
                                    }
                                }, receiveValue: { result in
                                    showProgressView = false
                                    print("Connection result: \(result)")
                                }).store(in: &cancellables)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(.blue)
                                    HStack {
                                        Text("Connect")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 20))
                                            .padding(.trailing, 5)
                                        
                                    }
                                }
                                .frame(width: 300, height: 60)
                            }
                            
                            if showProgressView && !ethereum.connected {
                                ProgressView()
                                    .scaleEffect(1.5, anchor: .center)
                                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            }
                        }
                        .alert(isPresented: $showError) {
                            Alert(
                                title: Text("Error"),
                                message: Text(errorMessage)
                            )
                        }
                    } footer: {
                        Text("This will open the MetaMask app. Please sign in and accept the connection prompt.")
                            .font(.footnote)
                            .padding(.bottom, 50)
                            .frame(width: 300)
                    }
                }
                
                if !ethereum.selectedAddress.isEmpty {
                    Section {
                        Group {
                            
                            Button {
                                ethereum.clearSession()
                                showToast = true
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(.blue)
                                    HStack {
                                        Text("Clear session")
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                            .font(.system(size: 20))
                                            .padding(.trailing, 5)
                                        
                                    }
                                }
                                .frame(width: 300, height: 60)
                            }
                            
                        }
                    } footer: {
                        Text("Connected \(ethereum.selectedAddress)")
                            .font(.footnote)
                            .padding(.bottom, 50)
                            .frame(width: 300)
                    }
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.secondary)
                        .frame(width: 30)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 30)
                        .foregroundColor(.primary)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 30)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    NavigationLink(destination: ThirdView()) {
                            HStack {
                                Text("ENTER")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .padding(.trailing, 5)
                                
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .frame(width: 25, height: 20)
                            }
                            
                    }
                    
                    
                }
                .frame(height: 4)
                .padding(30)
                .padding(.bottom, 30)
            }
            .onReceive(NotificationCenter.default.publisher(for: .Connection)) { notification in
                status = notification.userInfo?["value"] as? String ?? "Offline"
            }
        }
            
        
    }
}

struct ThirdView: View {
    @ObservedObject var ethereum = MetaMaskSDK.shared.ethereum
    @State var showToast = false
    
    struct Para: CodableData {
        let to: String
        let from: String
        let value: String
        let data: String?

        init(to: String, from: String, value: String, data: String? = nil) {
            self.to = to
            self.from = from
            self.value = value
            self.data = data
        }

        func socketRepresentation() -> NetworkData {
            [
                "to": to,
                "from": from,
                "value": value,
                "data": data
            ]
        }
    }
    
    func sendTransaction() {
        let transaction = Para(
            to: "0x",
            from: ethereum.selectedAddress,
            value: "123"
        )

        let transactionRequest = EthereumRequest(
            method: .ethSendTransaction,
            params: [transaction] // eth_sendTransaction rpc call expects an array parameters object
        )

        ethereum.request(transactionRequest)?.sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                errorMessage = error.localizedDescription
                showError = true
                print("Transaction error: \(errorMessage)")
            default: break
            }
        }, receiveValue: { value in
            print("Transaction result: \(value)")
            self.result = value as? String ?? ""
        }).store(in: &cancellables)
    }

    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Image("safe_green")
                        .resizable()
                        .frame(width: 70, height: 70)
                    Spacer()
                }
                .padding(.leading, 20)
                
                HStack {
                    Text("Create a\ngnosis safe\ncontract")
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(30)
                
                Spacer()
                
                Section {
                    Group {
                        
                        Button {
                            ethereum.clearSession()
                            showToast = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .foregroundColor(.blue)
                                HStack {
                                    Text("Create Safe")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 20))
                                        .padding(.trailing, 5)
                                    
                                }
                            }
                            .frame(width: 300, height: 60)
                        }
                        
                    }
                } footer: {
                    Text("You will be asked to accept a transation on metamask")
                        .font(.footnote)
                        .padding(.bottom, 50)
                        .frame(width: 320)
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(.secondary)
                        .frame(width: 30)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 30)
                        .foregroundColor(.secondary)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 30)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    NavigationLink(destination: ContentView()) {
                            HStack {
                                Text("ENTER")
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 20))
                                    .padding(.trailing, 5)
                                
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                                    .frame(width: 25, height: 20)
                            }
                            
                    }
                    
                }
                .frame(height: 4)
                .padding(30)
                .padding(.bottom, 30)
            }
        }
            
        
    }
}


extension Notification.Name {
    static let Event = Notification.Name("event")
    static let Connection = Notification.Name("connection")
}

