//import SwiftUI
//
//struct Update1View: View {
//    @Environment(\.dismiss) private var dismiss
//    @Environment(\.modelContext) private var modelContext
//    var item: Item
//    @State private var newTitle = ""
//    @State private var newContent1 = ""
//    @State private var newExpenses = ""
//    @State private var newContent2 = ""
//    @State private var newIncome = ""
//    @State private var newDate = Date()
//    
//    func totalPrice(from input: String) -> Int {
//        var total = 0
//        var currentNumber = ""
//        
//        for char in newContent1 {
//            if char.isNumber {
//                currentNumber.append(char)
//            } else if char == "원" {
//                total += Int(currentNumber) ?? 0
//                currentNumber = ""
//            }
//        }
//        
//        return total
//    }
//    
//    
//    
//    func totalPrice1(from input: String) -> Int {
//        var total = 0
//        var currentNumber = ""
//        
//        for char in newContent2 {
//            if char.isNumber {
//                currentNumber.append(char)
//            } else if char == "원" {
//                total += Int(currentNumber) ?? 0
//                currentNumber = ""
//            }
//        }
//        
//        return total
//    }
//    
//    
//    
//    
//    
//    var body: some View {
//        NavigationView {
//            
//            VStack {
//                
//                  
//                    
//                HStack {
//                    Image(systemName: "plus")
//                        .foregroundColor(.black)
//                    Text("\(totalPrice1(from: newContent2))")
//                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                    Image(systemName: "minus")
//                        .foregroundColor(.black)
//                    Text("\(totalPrice(from: newContent1))원")
//                        .foregroundColor(.red)
//                }
//                    .padding(20)
//                   
//                    .background(Color(white:1, opacity: 0.7))
//                    .cornerRadius(20)
//
//                
//                
//                                List {
//                    
//                    Section {
//                        DatePicker(selection: $newDate
//                                   , in: ...Date(), displayedComponents: .date) {
//                            Text("날짜를 선택하세요")
//                            
//                        }.foregroundColor(.black)
//                        
//                        .foregroundColor(Color.primary.opacity(0.9))
//                      
//                    }.listRowBackground(Color(white:1, opacity: 0.7))
//
//                    Section {
//                      
//                            Text("제목")
//                            .foregroundColor(.black)
////                            ZStack(alignment: .topLeading) {
////                                // TextField들을 선언하고 Binding 변수들을 연결합니다.
////                                let place1: String = "일기 제목을 적어주세요."
////                                TextEditor(text: $newTitle)
////                                    .foregroundColor(Color.primary.opacity(0.25))
////                                if newTitle.isEmpty {
////                                    Text(place1)
////
////                                    //                                    .padding(.horizontal, 24)
////                                        .foregroundColor(Color.primary.opacity(0.25))
////                                }
////                            }.foregroundColor(.white .opacity(0.5))
////                            TextEditor(text: $newTitle)
//                            TextField("",text: $newTitle)
//                            .foregroundColor(.black)
//
//                        
//                        
//                    }
//                    .listRowBackground(Color(white:1, opacity: 0.7))
//                    
//                    
//                    
//                    //                TextEditor(text: $newTitle)
//                    //                    .frame(width: 300, height: 50)
//                    //                    .padding(10)
//                    Section {
//                        Text("오늘의 수입")
//                            .foregroundColor(.black)
////                        ZStack(alignment: .topLeading) {
////                            // TextField들을 선언하고 Binding 변수들을 연결합니다.
////                            let place2: String = "수입 내역을 적어주세요."
////                            TextEditor(text: $newContent2)
////                            if newContent2.isEmpty {
////                                Text(place2)
//////                                    .padding(24)
////                                    .foregroundColor(Color.primary.opacity(0.25))
////                            }
////                        }
//                        TextEditor(text: $newContent2)
//                            .foregroundColor(.black)
//                    }.listRowBackground(Color(white:1, opacity: 0.7))
//                    
//                    
//                    
//                    
//                    Section {
//                        Text("오늘의 소비")
//                            .foregroundColor(.black)
////                        ZStack(alignment: .topLeading) {
////                            // TextField들을 선언하고 Binding 변수들을 연결합니다.
////                            let place3: String = "지출 내역을 적어주세요."
////                            TextEditor(text: $newContent1)
////
////                            if newContent1.isEmpty {
////                                Text(place3)
//////                                    .padding(24)
////                                    .foregroundColor(Color.primary.opacity(0.25))
////                            }
////                        }
//                        TextEditor(text: $newContent1)
//                            .foregroundColor(.black)
//                    }.listRowBackground(Color(white:1, opacity: 0.7))
//                                     
//                    
//                    
//                    
//                    
//                }
//                Button(action: { updateItem(); dismiss()}, label: {
//                    Text("추가하기")
//                    .foregroundColor(.indigo)})
//                
//            }
//            .padding(10)
//            .scrollContentBackground(.hidden)
//            .background(
//                Image("dorl")
//                    .resizable()
//                    .scaledToFill()
//                    .clipped()
//                    .edgesIgnoringSafeArea(.all)
//                    .blur(radius: 7)
//                //                            .overlay(Color.indigo.opacity(0.2))
//                
//            )
//        }
//        .task {
//            self.newTitle = item.title
//            newContent1 = item.content1
//            newExpenses = String(item.expenses)
//            newContent2 = item.content2
//            newIncome = String(item.income)
//            newDate = item.timestamp
//        }
//        
//    }
//    
//}
//
//private extension Update1View {
//    func updateItem() {
//        withAnimation {
//            // 새로운 Item을 생성하고 modelContext에 추가합니다.
//            //            let newItem = Item(timestamp: birthDate, title: newTitle, content1: newContent1,content2: newContent2,  expenses: totalPrice(from: newContent1), income: totalPrice1(from: newContent1))
//            //            modelContext.insert(newItem)
//            item.title = newTitle
//            item.expenses = totalPrice(from: newContent1)
//            item.content1 = newContent1
//            item.content2 = newContent2
//            item.income = totalPrice1(from: newContent1)
//            item.timestamp = newDate
//            
//        }
//        
//    }
//    
//    
//}
//
