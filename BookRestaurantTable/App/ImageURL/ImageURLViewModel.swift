import Foundation
import SwiftUI
import Combine
import UIKit
    struct ImagePreviewModel {
        var urlString : String 
        var width : CGFloat = 100.0
        var height : CGFloat = 100.0
    }

    struct ImagePreview: View {
        let viewModel: ImagePreviewModel
        @State var initialImage = UIImage()
        var body: some View {
            Image(uiImage: initialImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: self.width, height: self.height)
                .onAppear {
                    guard let url = URL(string: self.viewModel.urlString) else { return }
                    URLSession.shared.dataTask(with: url) { (data, response, error) in
                        guard let data = data else { return }
                        guard let image = UIImage(data: data) else { return }

                        RunLoop.main.perform {
                            self.initialImage = image
                        }

                    }.resume()
                }
        }
        var width: CGFloat { return max(viewModel.width, 100.0) }
        var height: CGFloat { return max(viewModel.height, 100.0) }
    }
