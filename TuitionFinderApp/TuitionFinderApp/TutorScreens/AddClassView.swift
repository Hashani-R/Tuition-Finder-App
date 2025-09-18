import SwiftUI

struct AddClassView: View {
    @State private var selectedCategory = "Grade 5 Scholarship"
    let categories = ["Grade 5 Scholarship", "O/Level", "A/Level"]
    
    @State private var subject = ""
    @State private var grade = ""
    @State private var medium = "English"
    let mediums = ["English", "Sinhala"]
    
    @State private var instituteName = ""
    @State private var location = ""
    
    @State private var schedule = Date()
    @State private var classFee = ""
    
    @State private var description = ""
    @State private var link = ""
    
    var body: some View {
        
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Add Class")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    // Category
                    Text("Category")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Picker("Select Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    // Subject
                    Text("Subject")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    TextField("Enter subject", text: $subject)
                        .padding()
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Grade
                    Text("Grade")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    TextField("Enter grade (1-13)", text: $grade)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(height: 40)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Medium
                    Text("Medium")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Picker("Select Medium", selection: $medium) {
                        ForEach(mediums, id: \.self) { medium in
                            Text(medium)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    // Institute Name
                    Text("Name of the Institute")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    TextField("Enter institute name", text: $instituteName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Location
                    Text("Location")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    TextField("Enter location", text: $location)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Schedule
                    Text("Schedule")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    DatePicker("Select date & time", selection: $schedule, displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Fee
                    Text("Fee")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    HStack {
                        Text("LKR")
                            .fontWeight(.semibold)
                        TextField("Enter fee", text: $classFee)
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    // Description
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Images
                    Text("Upload Images")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack {
                        ForEach(0..<3) { _ in
                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .frame(width: 60, height: 60)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                            }
                        }
                    }
                    
                    // Links
                    Text("Links")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    TextField("Enter links", text: $link)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Publish Button
                    Button(action: {
                        print("Publish tapped")
                    }) {
                        Text("Publish")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard) //  Allows scroll when keyboard is shown
            .scrollDismissesKeyboard(.interactively) // ✅ drag to dismiss keyboard
            //.navigationTitle("Add Class")
        }
    }

#Preview {
    
    AddClassView()
    
}
