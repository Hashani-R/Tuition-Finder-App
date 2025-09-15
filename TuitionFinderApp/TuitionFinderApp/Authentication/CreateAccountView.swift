import SwiftUI

struct CreateAccountView: View {
    @State private var fullName: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var selectedRole: String = "Select your role"
    
    let roles = ["Parent", "Tutor", "Student"]
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack (spacing: 20){
                
                Text("Create Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                //Name
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Full Name")
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.top, 15.0)
                    
                    TextField("Enter your full name", text: $fullName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    
                    //EmailEnter
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        
                        Text("Email")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.top, 15.0)
                        
                        TextField("Enter your email", text: $emailAddress)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                    }
                    
                    //Password
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        
                        Text("Password")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.top, 15.0)
                        
                        
                        HStack {
                            if showPassword {
                                TextField("Enter your password", text: $password)
                            } else {
                                SecureField("Enter your password", text: $password)
                            }
                            
                            // Eye button
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        
                        
                    }
                    
                    //Select your role
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        
                        Text("Role")
                            .font(.headline)
                            .fontWeight(.medium)
                            .padding(.top, 15.0)
                        Menu {
                            ForEach(roles, id: \.self) { role in
                                Button(role) {
                                    selectedRole = role
                                }
                                
                            }
                        }label: {
                            HStack {
                                Text(selectedRole)
                                    .foregroundColor(selectedRole == "Select your role" ? .gray : .primary)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    
                }
                Button(action: {
                    // Action for account creation goes here
                })
                {
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        //.frame(height: 30)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                        
                }
                .padding(.top, 20)
                
                Spacer()
                
                
            }
            .padding(.horizontal, 24)
            
            
        }
        
        
    }
}


#Preview {
    CreateAccountView()
}

