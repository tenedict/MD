////
////  UpdatemoneyView.swift
////  MD
////
////  Created by 문재윤 on 4/11/24.
////
//
//import SwiftUI
//import SwiftData
//
//struct UpdatemoneyView: View {
//    @Environment(\.dismiss) private var dismiss
//    @Environment(\.modelContext) private var modelContext
//    @State var newMoney: String = ""
//    @State var incomeName: String = ""
//    @Query private var moneys: [Money]
//   
//    
//
//    var body: some View {
//        
//        
//        List {
//            ForEach(moneys) { item in
//                NavigationLink(
//                    destination: AddView()) {
//                    Text(item.name)
//                    Text(item.income)
//                }
//            }
//            .onDelete{ indexes in
//                deleteItems(offsets: indexes)
//            }
//        }
//        TextField("수입원", text: $incomeName)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding()
//        TextField("목표 금액", text: $newMoney)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .keyboardType(.numberPad)
//            .padding()
//       
//    
//            
//        Button(action: {
//            addMoney() ;dismiss();
//            newMoney = ""
//        }) {
//            Text("Done")
//        }
//    }
//    func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(moneys[index])
//            }
//        }
//    }
//}
//
//
//private extension UpdatemoneyView {
//    func addMoney() {
//        print(newMoney)
//        withAnimation {
//            // 새로운 Item을 생성하고 modelContext에 추가합니다.
//            let newMoney = Money(income: newMoney, time: Date(), name: incomeName)
//            modelContext.insert(newMoney)
//
//        }
//    }
//
//   
//}
//
//
//#Preview {
//    UpdatemoneyView()
//        .modelContainer(for: [Money.self],  inMemory: true)
//}
