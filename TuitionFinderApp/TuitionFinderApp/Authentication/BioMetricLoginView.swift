import SwiftUI
import LocalAuthentication

//Struct01
struct BioMetricLoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var goToFaceIDImplement = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("LoginImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .padding(.horizontal, 10)
                    .accessibilityLabel("Login illustration")
                
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
                .accessibilityLabel("Click to login")
                
                Spacer().frame(height: 20)
                
            
                Button(action: {
                    goToFaceIDImplement = true
                }) {
                    Text("Use your faceID to login")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
            }
            Spacer().frame(height: 20)
            
           
            .navigationDestination(isPresented: $goToFaceIDImplement) {
                FaceIDImplement()
            }
        }
    }
}

#Preview {
    BioMetricLoginView()
}

//Struct02
struct FaceIDImplement: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked!")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            } else {
                Text("Unlock with Face ID")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // Checking the availability of FaceID or touchID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                        print("Authenticated successfully!")
                    } else {
                        self.isUnlocked = false
                        print("Authentication failed!")
                    }
                }
            }
        } else {
            
            print("Biometric authentication not available")
        }
    }
}

#Preview {
    FaceIDImplement()
}
