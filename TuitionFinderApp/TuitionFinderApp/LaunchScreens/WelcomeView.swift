import SwiftUI

struct WelcomeView: View {
    @State private var goToLoginView = false
    @State private var goToSignUpView = false
    var body: some View {
        NavigationStack{
            
            VStack (alignment: .center)
            {
                Spacer().frame(height: 40)
                
                Text("Hello Brainiest People!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Text("You are at the right place to succeed in your education journey.")
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black.opacity(0.6))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                Spacer()//.frame(height: 45)
                
                
                Image("WelcomeImage")
                    .resizable()
                //.scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .frame(width: 420, height: 400)
                    .accessibilityLabel("Welcome illustration of Happy winners")
                
                
                Spacer()
                //.frame(height: 10)
                
                //Page Indicators
                
                
                Button("Login") {
                    goToLoginView = true
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 15)
                .padding()
                .background(Color.blue)
                //.buttonStyle(.borderedProminent)
                .cornerRadius(25)
                .padding(.top, 7)
                .padding(.horizontal, 40)
                .accessibilityLabel("Login to your account")
                
                
                .navigationDestination(isPresented: $goToLoginView) {
                                LoginView()
                            }
                
                
                Button("Are you new? Sign Up") {
                    goToSignUpView = true
                }
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 10)
                .accessibilityLabel("Sign up for a new account")
                
                .navigationDestination(isPresented:
                $goToSignUpView) {
                                SignUpView()
                            }
                
            }
            .padding(.bottom, 15)
            .accessibilityElement(children: .contain)
            
            //Spacer().frame(height: 10)
            
        }
    }
}

#Preview {
    WelcomeView()
}

