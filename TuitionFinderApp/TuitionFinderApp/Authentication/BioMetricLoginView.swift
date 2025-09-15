import SwiftUI

struct BioMetricLoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        
        NavigationStack {
            
            
            VStack {
                //Spacer().frame(height: 20)
                
                
                Image("LoginImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .padding(.horizontal, 10)
                
                Spacer().frame(height: 10)
                
                
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 0)
                
                Spacer().frame(height: 25)
                
                
                TextField("Type your Email", text: $email)
                    .padding()
                    .frame(width: 320, height: 45)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.blue.opacity(0.7), lineWidth: 1)
                        
                    )
                    .padding(.horizontal, 40)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 320, height: 45)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.blue.opacity(0.7), lineWidth: 1)
                    )
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
                
                Spacer().frame(height: 20)
                
                
                Button(action: {
                    // Action goes here
                }) {
                    Text("Login")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 40)
                
                Spacer().frame(height: 20)
                
                Button("Use Face ID to login") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .font(.headline)
                .fontWeight(.semibold)
                
                
            }
            Spacer().frame(height: 20)
        }
    }
}

#Preview {
    BioMetricLoginView()
}
