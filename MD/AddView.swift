//
//  AddView.swift
//  MD
//
//  Created by 문재윤 on 4/11/24.
//

import SwiftUI



struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var newTitle = ""
    @State private var newContent1 = ""
    @State private var newExpenses = ""
    @State private var newContent2 = ""
    @State private var newIncome = ""
    @State private var newlock = false
    @State private var birthDate = Date()
    
   
    
    func totalPrice(from input: String) -> Int {
        var total = 0
        var currentNumber = ""
        
        for char in newContent1 {
            if char.isNumber {
                currentNumber.append(char)
            } else if char == "원" {
                total += Int(currentNumber) ?? 0
                currentNumber = ""
            } else if char == "만" {
                if currentNumber != ""{
                    currentNumber += "0000"}
                else  {currentNumber = "10000"
                }
            } else if char == "천" {
                if currentNumber != ""{
                    currentNumber += "000"}
                else  {currentNumber = "1000"
                }
            }   else if char == "백" {
                if currentNumber != ""{
                    currentNumber += "00"}
                else  {currentNumber = "100"
                }
            }   else if char == "십" {
                if currentNumber != ""{
                    currentNumber += "0"}
                else  {currentNumber = "10"
                }
            }
                else if char == "," {
                    
                }
                else if char != "원" {
                    currentNumber = ""
                }
                
            }
        
        
        return total
    }
    
    
    
    func totalPrice1(from input: String) -> Int {
        var total = 0
        var currentNumber = ""
        
        for char in newContent2 {
            if char.isNumber {
                currentNumber.append(char)
            } else if char == "원" {
                total += Int(currentNumber) ?? 0
                currentNumber = ""
            } else if char == "만" {
                if currentNumber != ""{
                    currentNumber += "0000"}
                else  {currentNumber = "10000"
                }
            } else if char == "천" {
                if currentNumber != ""{
                    currentNumber += "000"}
                else  {currentNumber = "1000"
                }
            }   else if char == "백" {
                if currentNumber != ""{
                    currentNumber += "00"}
                else  {currentNumber = "100"
                }
            }   else if char == "십" {
                if currentNumber != ""{
                    currentNumber += "0"}
                else  {currentNumber = "10"
                }
            }
                else if char == "," {
                    
                }
                else if char != "원" {
                    currentNumber = ""
                } 
                
            }
        
        
        return total
    }
    
   
    var body: some View {
        NavigationView {
            
            VStack {
            
                
                
                List {
                    
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                           
                            Text("\(totalPrice1(from: newContent2)-totalPrice(from: newContent1))")
                                    .font(.largeTitle)
                            
                            Text("원")
                                .padding(.bottom, 3)
                            Spacer()}
                        HStack{
                            Text("+\(totalPrice1(from: newContent2))")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

                            Text("-\(totalPrice(from: newContent1))")
                                .foregroundColor(.red)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .padding(.bottom, -8)
                    
                    
                    Section {
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date)
                        {   Text("날짜를 선택하세요") }
                      
                    }

                    Section {
                      
                            Text("제목")
                            TextField("",text: $newTitle)
                            .onTapGesture {
                                self.endText()
                            }
                    }
                  
                    Section {
                        Text("오늘의 수입")
                        TextEditor(text: $newContent2)
                            .onTapGesture {
                                self.endText()
                            }
                    }
                    
                    
                    
                    
                    Section {
                        Text("오늘의 소비")
                        TextEditor(text: $newContent1)
                            .onTapGesture {
                                self.endText()
                            }
                    }
                    
                    Section {
                        Toggle(isOn: $newlock, label: {
                            Text("FaceID로 잠그기")
                        })
                        
                    }
                    
                    
                                          
                    
                    
                }
                
            }
            
            .padding(.horizontal, 5)

            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Text("취소")
                        .foregroundColor(.red)})
                }
                ToolbarItem {
                    Button(action: { addItem(); dismiss()}, label: {
                        Text("완료")})
                }
            }
        }.navigationBarBackButtonHidden(true)
        }
        
    }

private extension AddView {
    func addItem() {
            if newTitle == "" {
                newTitle = "새로운 활동 \(birthDate.formatted(date: .omitted, time: .shortened))"
            }
            // 새로운 Item을 생성하고 modelContext에 추가합니다.
            let newItem = Item(timestamp: birthDate, title: newTitle, content1: newContent1,content2: newContent2,  expenses: totalPrice(from: newContent1), income: totalPrice1(from: newContent1), lock: newlock)
            modelContext.insert(newItem)
    }
    
    
    func endText() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
        }
    

   
}


#Preview {
    AddView()
        .modelContainer(for: Item.self, inMemory: true)
}
