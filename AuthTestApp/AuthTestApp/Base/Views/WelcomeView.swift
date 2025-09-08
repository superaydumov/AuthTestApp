//
//  ContentView.swift
//  AuthTestApp
//
//  Created by Эльдар Айдумов on 04.09.2025.
//

import SwiftUI

struct WelcomeView: View {

    // MARK: - Stored constants

    private let horizontalPadding: CGFloat = 16



    var body: some View {
        ZStack {
            Color(.appBackground)
                .ignoresSafeArea()

            vectorImage

            VStack {
                topBar
                Spacer(minLength: 10)
                welcomeTexts
                Spacer()
                flowerImage
                Spacer()
                socialButtons
                termsText
                Spacer(minLength: 20)
            }
            .padding(.horizontal, horizontalPadding)
        }
    }
}

// MARK: - Computed properties and methods

private extension WelcomeView {

    var topBar: some View {
        HStack {
            Spacer()
            Button("Skip") {
                // TODO: переход на основной экран без авторизации
            }
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.titleText)
            .padding(.trailing, horizontalPadding)
        }
    }

    var welcomeTexts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Welcome")
                .textCase(.uppercase)
                .font(.customTitleFont(size: 64))
                .foregroundColor(.titleText)

            Text("Enter your phone number. We will send you an SMS with a confirmation code to this number.")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.mainText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    var flowerImage: some View {
        Image(.flower)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 285)
    }

    var vectorImage: some View {
        Image(.vector)
            .resizable()
            .scaledToFit()
    }

    var socialButtons: some View {
        VStack(spacing: 12) {
            socialButton(title: "Continue with Apple", imageName: .appleIcon) {
                print("Apple")
            }

            socialButton(title: "Continue with Google", imageName: .googleIcon) {
                print("Google")
            }
        }
    }

    var termsText: some View {
        VStack(spacing: 4) {
            Text("By continuing, you agree to Assetsy’s")
                .font(.footnote)
                .foregroundColor(.tintText)

            HStack(spacing: 4) {
                Button("Terms of Use") {
                    // TODO: открыть ссылку
                }
                .foregroundStyle(.linkText)
                .font(.footnote)
                .underline()

                Text("and")
                    .font(.footnote)
                    .foregroundColor(.tintText)

                Button("Privacy Policy") {
                    // TODO: открыть ссылку
                }
                .foregroundStyle(.linkText)
                .font(.footnote)
                .underline()
            }
        }
        .padding(.top, 12)
    }

    func socialButton(
        title: String,
        imageName: ImageResource,
        action: @escaping () -> Void) -> some View {
            Button(action: action) {
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.appWhite)
                .foregroundStyle(.appBlack)
                .cornerRadius(10)
            }
        }
}
