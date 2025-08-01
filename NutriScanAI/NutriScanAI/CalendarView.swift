import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var sheetView = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Calendário Alimentar")
                        .font(.system(size: 30))
                        .bold()
                        .padding(.top, 10)
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    Text("Selecione um dia para consulta").font(.title2)
                        .foregroundStyle(.green).bold()
                    
                    DatePicker(
                        "Selecione uma data",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                    .frame(width: 350)
                    .accentColor(.green)
                    .onChange(of: selectedDate) { _ in
                        sheetView = true
                    }
                }
                
                Spacer() 
            }
        }
        .sheet(isPresented: $sheetView) {
            InfoAlimentos(date: $selectedDate)
        }
    }
}

#Preview {
    CalendarView()
}
