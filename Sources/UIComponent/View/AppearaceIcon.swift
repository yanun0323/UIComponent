//
//  SwiftUIView.swift
//  
//
//  Created by YanunYang on 2022/8/18.
//

import SwiftUI

// MARK: MacOS

@available(iOS 15, macOS 12.0, *)
public struct AppearaceIcon_MacOS12_System: View {
    @State var BackgroundImage: Image
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

@available(iOS 15, macOS 12.0, *)
public struct AppearaceIcon_MacOS12_Light: View {
    @State var BackgroundImage: Image
    var body: some View {
        BackgroundImage
            .resizable()
            .overlay {
                ZStack {
                    Rectangle()
                        .frame(height: 10)
                        .foregroundColor(Color.black.opacity(0.3))
                        .offset(x: 0, y: -20)
                    ZStack {
                        VStack {
                            HStack(spacing: 3) {
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 5, height: 5)
                                Circle()
                                    .foregroundColor(.yellow)
                                    .frame(width: 5, height: 5)
                                Circle()
                                    .foregroundColor(.green)
                                    .frame(width: 5, height: 5)
                                Spacer()
                            }
                            .padding(3)
                            Spacer()
                        }
                        HStack(spacing: 0) {
                            Spacer()
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 30)
                        }
                    }
                    .frame(width: 60, height: 40)
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(5)
                    .offset(x: 10, y: 20)
                }
            }
            .clipShape(Rectangle())
    }
}

@available(iOS 15, macOS 12.0, *)
public struct AppearaceIcon_MacOS12_Dark: View {
    @State var BackgroundImage: Image
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: iOS

@available(iOS 15, macOS 12.0, *)
public struct AppearaceIcon_iOS15_System: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

@available(iOS 15, macOS 12.0, *)
public struct AppearaceIcon_iOS15_Light: View {
    var body: some View {
        Text()
    }
}

@available(iOS 15, macOS 12.0, *)
public struct AppearaceIcon_iOS15_Dark: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

