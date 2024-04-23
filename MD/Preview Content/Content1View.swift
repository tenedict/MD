//import SwiftUI
//import SwiftData
//import Foundation
//import LocalAuthentication
//
//
//struct Content1View: View {
//    @Environment(\.modelContext) private var modelContext
//    @State private var addmodal = false
//    @Query private var items: [Item]
//    let bg =  Image("image1.jpg")
//    @State private var isUnlocked = 1
//    
//    func allincome() -> Int {
//        var ai = 0
//        for item in items {
//            ai += item.income
//        }
//        return ai
//    }
//    
//    func allexpenses() -> Int {
//        var ae = 0
//        for item in items {
//            ae -= item.expenses
//        }
//        return ae
//    }
//    
//    func allmoney() -> Int {
//        var am = 0
//        for item in items {
//            am -= item.expenses
//            am += item.income
//            
//        }
//        return am
//    }
//    
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "We need to unlock your data."
//
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//
//                if success {
//                    isUnlocked = 0
//                } else {
//
//                }
//            }
//        } else {
//        }
//    }
//    
//    var sortedItems: [Item] {
//        // 날짜순으로 정렬된 items 반환
//        return items.sorted { $0.timestamp < $1.timestamp }
//    }
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                HStack{
//                    if isUnlocked == 0 {
//                        Button(action: {isUnlocked = 1}, label: {
//                            if allmoney() >= 0 {
//                                Text("잔액 ₩ \(allmoney())").foregroundColor(.black)
//                            } else {
//                                Text("잔액 ₩ \(allmoney())").foregroundColor(.red)
//                            }
//                        })
//                    } else {
//                        Button(action: {authenticate()}, label: {
//                            Text("잔액").foregroundColor(.black)
//                            Image(systemName: "faceid").foregroundColor(.black)
//                        })
//                    }
//                }
//                .padding(20)
//                .background(Color(.systemGray6))
//                .cornerRadius(20)
//
//                List {
//                    if isUnlocked == 0 {
//                        Section {
//                            ForEach(sortedItems) { item in
//                                NavigationLink(
//                                    destination: UpdateView(item: item)
//                                ) {
//                                    HStack(alignment: .center) {
//                                        Text(item.title).foregroundColor(.black)
//                                        Text(item.timestamp.formatted()).foregroundColor(.black)
//                                        Spacer()
//                                        Text("\(String(-item.expenses + item.income))").foregroundColor(.black)
//                                    }
//                                }
//                            }
//                            .onDelete(perform: deleteItems)
//                        }.listRowBackground(Color(white:1, opacity: 0.7))
//                    } else {
//                        // 잠금
//                        Section {
//                            ForEach(sortedItems) { item in
//                                Button(action: {authenticate()}) {
//                                    HStack(alignment: .center) {
//                                        Text(item.title).foregroundColor(.black)
//                                        Text("(\(item.timestamp.formatted(date: .numeric, time: .omitted)))").foregroundColor(.black)
//                                        Spacer()
//                                        Text("?????").foregroundColor(.black)
//                                    }
//                                }
//                            }
//                        }.listRowBackground(Color(white:1, opacity: 0.7))
//                    }
//                }
//                Button(action: {self.addmodal = true}, label: {
//                    Text("추가하기").foregroundColor(.indigo)
//                }).padding()
//                .fullScreenCover(isPresented: $addmodal, content: AddView.init)
//            }
//            .padding(10)
//            .scrollContentBackground(.hidden)
//            .background(
//                Image("dorl").resizable().scaledToFill().clipped().edgesIgnoringSafeArea(.all)
//            )
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Image(systemName: "questionmark.circle")
//                }
//                ToolbarItem {
//                    Button(action: {}) {
//                        Image(systemName: "chart.bar.doc.horizontal")
//                    }
//                }
//            }
//        }
//    }
//    
//    func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}
//
//struct Content1View_Previews: PreviewProvider {
//    static var previews: some View {
//        Content1View()
//            .modelContainer(for: Item.self,  inMemory: true)
//    }
//}
//
























//
//  Content1View.swift
//  MD
//
//  Created by 문재윤 on 4/17/24.
//
//
//import SwiftUI
//import SwiftData
//import Foundation
//import LocalAuthentication
//
//
//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @State private var addmodal = false
//    @Query private var items: [Item]
//    @State private var isUnlocked = 0
//
//
//
//    
//    
//    func allincome() -> Int {
//        var ai = 0
//        for item in items {
//            ai += item.income
//        }
//        return ai
//    }
//    
//    func allexpenses() -> Int {
//        var ae = 0
//        for item in items {
//            ae -= item.expenses
//        }
//        return ae
//    }
//    
//    func allmoney() -> Int {
//        var am = 0
//        for item in items {
//            am -= item.expenses
//            am += item.income
//            
//        }
//        return am
//    }
//    
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "We need to unlock your data."
//
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//
//                if success {
//                    isUnlocked = 0
//                } else {
//                    isUnlocked = 3
//                }
//            }
//        } else {
//        }
//    }
//    
//    
//    
//    func dateCalculate(x: Date) -> String {
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.day], from: x, to: Date())
//        
//        if let days = components.day {
//            if days == 0 {
//                return "오늘"
//            } else if days == 1 {
//                return "어제"
//            } else if days < 6 {
//                return "\(days)일 전"
//            } else {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "yyyy-MM-dd"
//                return dateFormatter.string(from: x)
//            }
//        }
//        
//        return ""
//    }
//    
//    var sortedItems: [Item] {
//        // 날짜순으로 정렬된 items 반환
//        return items.sorted { $0.timestamp > $1.timestamp }
//    }
//    
//    
//    
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                    
//                
//                List {
//                    Section {
//                        if isUnlocked == 0 {
//                            
//                            Button(action: {isUnlocked = 1}, label: {
//                                HStack(alignment: .bottom) {
//                                    Text("\(allmoney())")
//                                        .font(.largeTitle)
//                                    Text("원 사용가능")
//                                        .padding(.bottom, 3)
//                                    Spacer()}
//                               
//                                .padding(.bottom, -8)
//                                
//                            }).buttonStyle(.plain)
//                        } else {
//                            Button(action: {authenticate()}, label: {
//                                HStack(alignment: .bottom) {
//                                    Text("잠금")
//                                        .font(.largeTitle)
//                                    Text("을 해제해주세요")
//                                        .padding(.bottom, 3)
//                                    Spacer()}
//                             
//                                .padding(.bottom, -8)
//                               
//                            }).buttonStyle(.plain)
//                        }
//                    }
//                    .listRowBackground(Color.clear)
//     
//
//                    
//                    
//                    if isUnlocked == 0 {
//                        Section {
//                            ForEach(sortedItems) { item in
//                                NavigationLink(
//                                    destination: UpdateView(item: item)
//                                ) {
//                                    HStack{
//                                        VStack(alignment: .leading) {
//                                            Text(item.title)
//                                                .fontWeight(.bold)
//                                                .padding(.bottom, 3)
//                                            Text(dateCalculate(x: item.timestamp))
//                                                .font(.caption2)
//                                                .foregroundColor(.gray)
//                                        }
//                                        Spacer()
//                                        Text("\(String(-item.expenses + item.income))")
//                                    }
//                                    .padding(.vertical, 0)
//                                    
//                                    Spacer()
//                                    
//                                }
//                                
//                            }
//                            
//                            .onDelete(perform: deleteItems)
//                        }.padding(.horizontal, 12)
//                            .padding(.vertical, 1)
//                        
//                    } else {
//                        
//                        
//                        Section {
//                            ForEach(sortedItems) { item in
//                                NavigationLink(
//                                    destination: UpdateView(item: item)
//                                ) {
//                                    HStack{
//                                        VStack(alignment: .leading) {
//                                            Text(item.title)
//                                                .fontWeight(.bold)
//                                                .padding(.bottom, 3)
//                                            Text(dateCalculate(x: item.timestamp))
//                                                .font(.caption2)
//                                                .foregroundColor(.gray)
//                                        }
//                                        Spacer()
//                                        Image(systemName: "lock")
//                                            .foregroundColor(.gray)
//                                    }
//                                    .padding(.vertical, 0)
//                                    
//                                    Spacer()
//                                    
//                                }
//                                
//                            }
//                            
//                            .onDelete(perform: deleteItems)
//                        }.padding(.horizontal, 12)
//                            .padding(.vertical, 1)
//                                                
//                    }
//                }
//            }
//            .scrollContentBackground(.hidden)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    NavigationLink(
//                        destination: AddView()
//                    ) {
//                        Image(systemName: "gearshape")
//                    }
//                    .buttonStyle(.plain)
//                }
//                ToolbarItem {
//                    NavigationLink(
//                        destination: AddView()
//                    ) {
//                        Image(systemName: "square.and.pencil")
//                        
//                    }
//                    .buttonStyle(.plain)
//                }
//            }
//        }
//    }
//    
//    func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                       let itemToDelete = sortedItems[index]
//                       modelContext.delete(itemToDelete)
//                   }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .modelContainer(for: Item.self,  inMemory: true)
//    }
//}
//
