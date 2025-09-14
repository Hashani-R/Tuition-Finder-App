import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
       
       var body: some View {
           VStack {
               Spacer().frame(height: 20)
               
               
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
               
               Spacer().frame(height: 25)
               
              // Apple ID Button & Google Button
               HStack(spacing: 15) {
                   
                   
                   HStack {
                       Image(systemName: "applelogo")
                           .font(.title)
                       Text("AppleID")
                           .font(.headline)
                           .fontWeight(.semibold)
                   }
                   .frame(width: 120, height: 18)
                   .frame(maxWidth: .infinity)
                   .padding()
                   .background(Color.white)
                   .overlay(
                       RoundedRectangle(cornerRadius: 25)
                           .stroke(Color.black.opacity(0.7), lineWidth: 1)
                   )
                   
                   
                   HStack {
                       Image("GoogleLogo")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .clipped()
                           .clipShape(Circle())
                           .frame(width: 33, height: 33)
                       Text("Google")
                           .font(.headline)
                           .fontWeight(.semibold)
                   }
                   .frame(width: 120, height: 18)
                   .frame(maxWidth: .infinity)
                   .padding()
                   .background(Color.white)
                   .overlay(
                       RoundedRectangle(cornerRadius: 25)
                           .stroke(Color.black.opacity(0.7), lineWidth: 1)
                   )
               }
               .padding(.horizontal, 40)
               .padding(.bottom, 15)
               //Spacer()
           }
       }
   }

#Preview {
    LoginView()
}
