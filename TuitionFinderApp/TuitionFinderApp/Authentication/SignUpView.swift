import SwiftUI

struct SignUpView: View {
    @State private var goToCreateAccountView = false
    
    var body: some View {
        NavigationStack {
            
            
            VStack(alignment: .center, spacing: 30) {
                
                
                Image("SignUpImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 365)
                    .padding(.top, 30)
                    .accessibilityLabel("Sign Up illustration")
                
                
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                
                Button(action: {
                    goToCreateAccountView = true
                }) {
                    Text("Create Account")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                    // .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 40)
                .accessibilityLabel("Create a new account")
                
                .navigationDestination(isPresented: $goToCreateAccountView) {
                CreateAccountView()
                            }
                
                Button(action: {
                    // TODO: add Google sign in later
                }) {
                    HStack {
                        Image("GoogleLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .clipShape(Circle())
                            .frame(width: 33, height: 33)
                        
                        Text("Continue with Google")
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black.opacity(0.7), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 40)
                .accessibilityLabel("Sign up with your Google account")
                
                
                Button(action: {
                    
                }) {
                    HStack {
                        
                        Image(systemName: "applelogo")
                            .font(.title)
                        //.resizable()
                        //.frame(width: 25, height: 29)
                            .foregroundColor(.black)
                        
                        
                        
                        Text(" Continue with Apple")
                            .font(.headline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black.opacity(0.7), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 40)
                .accessibilityLabel("Sign up with your AppleID")
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    SignUpView()
}
