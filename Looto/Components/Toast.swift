//
//  Toast.swift
//  Looto
//
//  Created by deniz.yesilirmak on 24.12.2023.
//

import Foundation

import SwiftUI

enum ToastStyle {
  case error
  case warning
  case success
  case info
}

extension ToastStyle {
  var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    }
  }
  
  var iconFileName: String {
    switch self {
    case .info: return "info.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    case .success: return "checkmark.circle.fill"
    case .error: return "xmark.circle.fill"
    }
  }

  var backgroundColor: Color {
    switch self {
    case .info: return Color.blue.opacity(1)
    case .warning: return Color.orange.opacity(1)
    case .success: return Color.green.opacity(1)
    case .error: return Color.red.opacity(1)
    }
  }
}


struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
}

struct ToastView: View {
  
  var style: ToastStyle
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: style.iconFileName)
            .foregroundColor(.white)
      Text(message)
        .font(Font.caption)
        .foregroundColor(.white)
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(.white)
      }
    }
    .padding()
    .background(style.backgroundColor)
    .frame(minWidth: 0, maxWidth: width)
    .cornerRadius(0)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
  }
}

struct ToastModifier: ViewModifier {
  
  @Binding var toast: Toast?
  @State private var workItem: DispatchWorkItem?
  
  func body(content: Content) -> some View {
    ZStack {
        content
        mainToastView()
        }
  }
  
  @ViewBuilder func mainToastView() -> some View {
    if let toast = toast {
      VStack {
        ToastView(
          style: toast.style,
          message: toast.message,
          width: toast.width
        ) {
          dismissToast()
        }
        Spacer()
      }
    }
  }
  
  private func showToast() {
    guard let toast = toast else { return }
    
    UIImpactFeedbackGenerator(style: .light)
      .impactOccurred()
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem {
        dismissToast()
      }
      
      workItem = task
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  private func dismissToast() {
    withAnimation {
      toast = nil
    }
    
    workItem?.cancel()
    workItem = nil
  }
}

extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}

struct Toast_Previews: PreviewProvider {
  static var previews: some View {
    //fullscreen view to show toast
    ZStack {
        Color.cyan
        .ignoresSafeArea()
      Text("Hello, world!")
        .toastView(toast: .constant(Toast(style: .info, message: "Hello, world!", duration: 3)))
    }
  }
}
