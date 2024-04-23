import SwiftUI
import SwiftData
import Foundation
import LocalAuthentication


struct UpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    var item: Item
    @State private var newTitle = ""
    @State private var newContent1 = ""
    @State private var newExpenses = ""
    @State private var newContent2 = ""
    @State private var newIncome = ""
    @State private var newlock = false
    @State private var succ = false
    @State private var newDate = Date()
    
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                if success {
                    succ = true
                } else {
                    succ = false
                }
            }
        } else {
        }
    }
    
    
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
                
                if newlock  == true && succ == false {
                  
                        Button(action: { authenticate() }, label: {
                            HStack {
                                Image(systemName: "faceid")
                                Text("여기를 눌러 잠금해제")
                            }.padding(.bottom,150)
                        }).onAppear(perform: {
                            authenticate()
                        })
                    
                }
                
                else{
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
                            DatePicker(selection: $newDate
                                       , in: ...Date(), displayedComponents: .date) {
                                Text("날짜를 선택하세요")}
                            
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
            }
            .padding(.horizontal, 5)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Text("뒤로")
                        .foregroundColor(.gray)})
                }
                ToolbarItem {
                    Button(action: { updateItem(); dismiss()}, label: {
                        Text("완료")})
                }
            }
            
            
        }
        
        .task {
            self.newTitle = item.title
            newContent1 = item.content1
            newExpenses = String(item.expenses)
            newContent2 = item.content2
            newIncome = String(item.income)
            newDate = item.timestamp
            newlock = item.lock
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

private extension UpdateView {
    func updateItem() {
        withAnimation {
            if newTitle == "" {
                newTitle = "활동 수정 \(newDate.formatted(date: .omitted, time: .shortened))"
            }
            item.title = newTitle
            item.expenses = totalPrice(from: newContent1)
            item.content1 = newContent1
            item.content2 = newContent2
            item.income = totalPrice1(from: newContent1)
            item.timestamp = newDate
            item.lock = newlock
            
        }
        
    }
    
    func endText() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
        }
    
    
}

