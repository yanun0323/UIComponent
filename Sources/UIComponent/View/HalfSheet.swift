import SwiftUI

#if os(iOS)
    @available(iOS 15, *)
    public enum HalfSheetStyle {
        case medium, large
    }

    // MARK: Controller
    @available(iOS 15, *)
    public class HalfSheetController<Content>: UIHostingController<Content> where Content: View {
        public var grabber: Bool = true
        public var radius: CGFloat = 15
        public var detents: [UISheetPresentationController.Detent] = []

        override public func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            if let presentation = sheetPresentationController {
                presentation.detents = detents  // [.medium(), .large()]
                presentation.prefersGrabberVisible = grabber
                presentation.largestUndimmedDetentIdentifier = .medium
                presentation.preferredCornerRadius = radius
            }
        }

        public func Inject(
            _ grabberVisible: Bool, _ cornerRadius: CGFloat, _ style: [HalfSheetStyle]
        ) -> Self {
            self.grabber = grabberVisible
            self.radius = cornerRadius
            s.forEach { ss in
                switch ss {
                case .medium:
                    self.detents.append(.medium())
                case .large:
                    self.detents.append(.large())

                }
            }
            return self
        }
    }

    // MARK: Structure
    @available(iOS 15, *)
    @available(macOS, unavailable)
    public struct HalfSheet<Content>: UIViewControllerRepresentable where Content: View {

        public let grabber: Bool
        public let radius: CGFloat
        public let style: [HalfSheetStyle]
        public let content: Content

        public init(
            grabber: Bool = true, radius: CGFloat = 15, style: [HalfSheetStyle] = [.medium],
            @ViewBuilder content: () -> Content
        ) {
            self.grabber = grabber
            self.radius = radius
            self.style = style
            self.content = content()
        }

        public func makeUIViewController(context: Context) -> HalfSheetController<Content> {
            return HalfSheetController(rootView: content).Inject(grabber, radius, style)
        }

        public func updateUIViewController(_: HalfSheetController<Content>, context: Context) {
        }
    }
#endif
