//
//  AuthenticationController.swift
//  HomeAssistant
//
//  Created by Stephan Vanterpool on 8/11/18.
//  Copyright © 2018 Robbie Trencheny. All rights reserved.
//

import Foundation
import PromiseKit
import SafariServices
import AuthenticationServices
import Shared

/// Manages browser verification to retrive an access code that can be exchanged for an authentication token.
class AuthenticationController: NSObject, SFSafariViewControllerDelegate {
    enum AuthenticationControllerError: Error {
        case invalidURL
        case userCancelled
        case cantFindURLHandler
    }

    private var promiseResolver: Resolver<String>?
    private var authenticationObserver: NSObjectProtocol?
    private var authenticationViewController: Any?
    private var authStyle: String = "SFSafariViewController"

    override init() {
        super.init()
        self.configureAuthenticationObserver()
    }

    /// Opens a browser to the URL for obtaining an access code.
    // swiftlint:disable:next function_body_length
    func authenticateWithBrowser(at baseURL: URL) -> Promise<String> {
        return Promise { (resolver: Resolver<String>) in
            self.promiseResolver = resolver

            var redirectURI = "homeassistant://auth-callback"

            var clientID = "https://home-assistant.io/iOS"

            if Current.appConfiguration == .Debug {
                clientID = "https://home-assistant.io/iOS/dev-auth"
                redirectURI = "homeassistant-dev://auth-callback"
            } else if Current.appConfiguration == .Beta {
                clientID = "https://home-assistant.io/iOS/beta-auth"
                redirectURI = "homeassistant-beta://auth-callback"
            }

            var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
            components?.path = "/auth/authorize"
            let responseTypeQuery = URLQueryItem(name: "response_type", value: "code")
            let clientIDQuery = URLQueryItem(name: "client_id", value: clientID)
            let redirectQuery = URLQueryItem(name: "redirect_uri", value: redirectURI)
            components?.queryItems = [responseTypeQuery, clientIDQuery, redirectQuery]
            if let authURL = try components?.asURL() {

                let newStyleAuthCallback = { (callbackURL: URL?, error: Error?) in
                    if let authErr = error {
                        Current.Log.error("Error during \(self.authStyle) authentication: \(authErr)")
                        return
                    }

                    guard let successURL = callbackURL else {
                        Current.Log.error("CallbackURL was empty during \(self.authStyle) authentication")
                        return
                    }

                    self.handleSuccess(successURL)
                }

                if #available(iOS 12.0, *) {
                    self.authStyle = "ASWebAuthenticationSession"
                    let webAuthSession = ASWebAuthenticationSession(url: authURL, callbackURLScheme: redirectURI,
                                                                    completionHandler: newStyleAuthCallback)

                    webAuthSession.start()

                    self.authenticationViewController = webAuthSession
                } else if #available(iOS 11.0, *) {
                    self.authStyle = "SFAuthenticationSession"
                    let webAuthSession = SFAuthenticationSession(url: authURL, callbackURLScheme: redirectURI,
                                                                 completionHandler: newStyleAuthCallback)

                    webAuthSession.start()

                    self.authenticationViewController = webAuthSession
                } else {
                    let safariVC = SFSafariViewController(url: authURL)
                    if #available(iOS 11.0, *) { safariVC.dismissButtonStyle = .cancel }
                    safariVC.delegate = self

                    self.authenticationViewController = safariVC
                    Current.authenticationControllerPresenter?(safariVC)
                }
            } else {
                resolver.reject(AuthenticationControllerError.invalidURL)
            }
        }
    }

    // MARK: - SFSafariViewControllerDelegate

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        guard let resolver = self.promiseResolver else {
            return
        }

        resolver.reject(AuthenticationControllerError.userCancelled)
        self.cleanUp()
    }

    // MARK: - Private helpers

    private func configureAuthenticationObserver() {
        let notificationCenter = NotificationCenter.default
        let notificationName = Notification.Name("AuthCallback")
        let queue = OperationQueue.main
        self.authenticationObserver = notificationCenter.addObserver(forName: notificationName, object: nil,
                                                                     queue: queue) { notification in
            if #available(iOS 12.0, *) {
                (self.authenticationViewController as? ASWebAuthenticationSession)?.cancel()
            } else if #available(iOS 11.0, *) {
                (self.authenticationViewController as? SFAuthenticationSession)?.cancel()
            } else {
                (self.authenticationViewController as? SFSafariViewController)?.dismiss(animated: true,
                                                                                        completion: nil)
            }
            guard let url = notification.userInfo?["url"] as? URL else {
                    return
            }

            self.handleSuccess(url)

            if #available(iOS 12.0, *) {
                (self.authenticationViewController as? ASWebAuthenticationSession)?.cancel()
            } else if #available(iOS 11.0, *) {
                (self.authenticationViewController as? SFAuthenticationSession)?.cancel()
            } else {
                (self.authenticationViewController as? SFSafariViewController)?.dismiss(animated: true,
                                                                                        completion: nil)
            }

            self.cleanUp()
        }
    }

    private func handleSuccess(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }

        let parameter = components.queryItems?.first(where: { (item) -> Bool in
            item.name == "code"
        })

        if let codeParamter = parameter, let code = codeParamter.value {
            Current.Log.verbose("Returning from authentication with code \(code)")
            self.promiseResolver?.fulfill(code)
        }
    }

    private func cleanUp() {
        self.authenticationViewController = nil
        self.promiseResolver = nil
    }
}
