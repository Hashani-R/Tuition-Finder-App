import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import FirebaseCore

class GoogleAuthManager: ObservableObject {
    @Published var isSignedIn = false
    @Published var errorMessage: String?
    
    static let shared = GoogleAuthManager()
    
    private init() {
        // Check if user is already signed in
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
                if let user = user {
                    self?.handleSignInResult(user: user)
                }
            }
        }
    }
    
    func signIn() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            self.errorMessage = "Cannot find root view controller"
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            
            guard let user = result?.user else {
                self.errorMessage = "No user found"
                return
            }
            
            self.handleSignInResult(user: user)
        }
    }
    
    private func handleSignInResult(user: GIDGoogleUser) {
        guard let idToken = user.idToken?.tokenString else {
            self.errorMessage = "ID token missing"
            return
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: user.accessToken.tokenString)
        
        // Sign in with Firebase
        Auth.auth().signIn(with: credential) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }
            
            // Successfully signed in
            DispatchQueue.main.async {
                self?.isSignedIn = true
                self?.errorMessage = nil
            }
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        do {
            try Auth.auth().signOut()
            isSignedIn = false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
