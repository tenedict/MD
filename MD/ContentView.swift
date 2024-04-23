//
//  Content1View.swift
//  MD
//
//  Created by 문재윤 on 4/17/24.
//

import SwiftUI
import SwiftData
import Foundation
import LocalAuthentication


 
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var addmodal = false
    @Query private var items: [Item]
    @State private var isUnlocked = 0



    
    
    func allincome() -> Int {
        var ai = 0
        for item in items {
            ai += item.income
        }
        return ai
    }
    
    func allexpenses() -> Int {
        var ae = 0
        for item in items {
            ae -= item.expenses
        }
        return ae
    }
    
    func allmoney() -> Int {
        var am = 0
        for item in items {
            am -= item.expenses
            am += item.income
            
        }
        return am
    }
    
    // 생체인식
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                if success {
                    isUnlocked = 0
                } else {
                    isUnlocked = 3
                }
            }
        } else {
        }
    }
    
    
    
    func dateCalculate(x: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: x, to: Date())
        
        if let days = components.day {
            if days == 0 {
                return "오늘"
            } else if days == 1 {
                return "어제"
            } else if days < 6 {
                return "\(days)일 전"
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                return dateFormatter.string(from: x)
            }
        }
        
        return ""
    }
    
    var sortedItems: [Item] {
        // 날짜순으로 정렬된 items 반환
        return items.sorted { $0.timestamp > $1.timestamp }
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                    
                
                List {
                    Section {
                                                    
                            Button(action: {isUnlocked = 1}, label: {
                                HStack(alignment: .bottom) {
                                    if allmoney() > -1 {
                                        Text("\(allmoney())")
                                            .font(.largeTitle)
                                    } else {
                                        Text("\(allmoney())")
                                            .font(.largeTitle)
                                            .foregroundColor(.red)
                                    }
                                    
                                    
                                    Text("원 사용가능")
                                        .padding(.bottom, 3)
                                    Spacer()}
                               
                                .padding(.bottom, -8)
                                
                            }).buttonStyle(.plain)

                    }
                    .listRowBackground(Color.clear)
     

                        Section {
                            ForEach(sortedItems) { item in
                                NavigationLink(
                                    destination: UpdateView(item: item)
                                ) {
                                    if item.lock {
                                        HStack{
                                            VStack(alignment: .leading) {
                                                Text("잠긴 목록")
                                                    .fontWeight(.bold)
                                                    .padding(.bottom, 3)
                                                Text(dateCalculate(x: item.timestamp))
                                                    .font(.caption2)
                                                    .foregroundColor(.gray)
                                            }
                                            Spacer()
                                            Image(systemName: "lock")
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.vertical, 0)
                                        
                                        Spacer()
                                        
                                    }
                                    else
                                    {
                                        HStack{
                                            VStack(alignment: .leading) {
                                                Text(item.title)
                                                    .fontWeight(.bold)
                                                    .padding(.bottom, 3)
                                                Text(dateCalculate(x: item.timestamp))
                                                    .font(.caption2)
                                                    .foregroundColor(.gray)
                                            }
                                            Spacer()
                                            Text("\(String(-item.expenses + item.income))")
                                        }
                                        .padding(.vertical, 0)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            .onDelete(perform: deleteItems)
                        }
                            .padding(.vertical, 1)

                }
                .padding(.horizontal, 5)
            }
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(
                        destination: informationView()
                    ) {
                        Image(systemName: "questionmark.circle")
                    }
                    .buttonStyle(.plain)
                }
                ToolbarItem {
                    NavigationLink(
                        destination: AddView()
                    ) {
                        Image(systemName: "square.and.pencil")
                        
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                       let itemToDelete = sortedItems[index]
                       modelContext.delete(itemToDelete)
                   }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: Item.self,  inMemory: true)
    }
}

