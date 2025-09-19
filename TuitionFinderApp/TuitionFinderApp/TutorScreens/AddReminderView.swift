import SwiftUI

struct AddReminderView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var reminderDate: Date = Date()
    
    var onSave: ((String, String, Date) -> Void)?
    
    var body: some View {
       
            NavigationStack {
                
                
                Form {
                    
                    Section(header: Text("Reminder Details")
                        .multilineTextAlignment(.leading)) {
                            
                            
                            HStack {
                                TextField("Enter Title", text: $title)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 30)
                                
                                
                            }
                            HStack {
                                TextField("Enter Description", text: $description)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 50)
                            }
                        }
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    Section(header: Text("Date & Time")) {
                        DatePicker("Select Date & Time",
                                   selection: $reminderDate,
                                   displayedComponents: [.date, .hourAndMinute])
                    }
                    
                    // Save button at bottom
                    Section {
                        Button(action: {
                            if !title.isEmpty {
                                onSave?(title, description, reminderDate)
                            }
                        }) {
                            Text("Done")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                 .navigationTitle("Add Reminder")
                 
            }
        }
    }


#Preview {
    AddReminderView()
}

