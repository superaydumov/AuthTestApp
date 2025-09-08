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
            Button(Resources.WelcomeScreen.skipButtonText) {
                // TODO: переход на основной экран без авторизации
            }
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.titleText)
            .padding(.trailing, horizontalPadding)
        }
    }

    var welcomeTexts: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(Resources.WelcomeScreen.welcomeHeaderText)
                .textCase(.uppercase)
                .font(.customTitleFont(size: 64))
                .foregroundColor(.titleText)

            Text(Resources.WelcomeScreen.welcomeText)
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
            socialButton(title: Resources.WelcomeScreen.appleButtonText, imageName: .appleIcon) {
                print("Apple")
            }

            socialButton(title: Resources.WelcomeScreen.googleButtonText, imageName: .googleIcon) {
                print("Google")
            }
        }
    }

    var termsText: some View {
        VStack(spacing: 4) {
            Text(Resources.WelcomeScreen.agreeText)
                .font(.footnote)
                .foregroundColor(.tintText)

            HStack(spacing: 4) {
                Button(Resources.WelcomeScreen.termsOfUseButtonText) {
                    // TODO: открыть ссылку
                }
                .foregroundStyle(.linkText)
                .font(.footnote)
                .underline()

                Text(Resources.WelcomeScreen.andText)
                    .font(.footnote)
                    .foregroundColor(.tintText)

                Button(Resources.WelcomeScreen.privacyPolicyButtonText) {
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
