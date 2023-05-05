//
//  testfile.swift
//  Zen-u
//
//  Created by Aindrila Ray on 28/04/23.
//

import SwiftUI
import PDFKit
import WebKit
import UIKit

struct PDFKitViewRepresantable: UIViewRepresentable {
    let documentURL : URL
    init(documentURL: URL) {
        self.documentURL = documentURL
    }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: documentURL)
        webView.load(request)
    }
}

struct CustomPDFView: View {
    let title: String
    let url : String
    let show: Bool
    @State private var downloadProgress: Double = 0
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundColor(Color("Heading"))
                    .font(.title3.weight(.semibold))
                    .hLeading()
                if(show) {
                    Button(action: share){
                        
                        Image(systemName: "square.and.arrow.up")
                        Text("Share")
                        
                    }.hTrailing()
                }
            }.padding(.horizontal)
            PDFKitViewRepresantable(documentURL: URL(string: url)!)
            
        }
        
    }
    
    func share() {
            let activityViewController = UIActivityViewController(activityItems: ["I am sharing my report with you."], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    func downloadDocument() {
        guard let url = URL(string: url) else { return }
        
        let downloadTask = URLSession.shared.downloadTask(with: url) { (url, response, error) in
            if let url = url {
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                let destinationURL = documentsDirectory.appendingPathComponent("document.pdf")
                
                do {
                    try FileManager.default.moveItem(at: url, to: destinationURL)
                    print("Document downloaded successfully: \(destinationURL.absoluteString)")
                } catch {
                    print("Error moving downloaded file: \(error)")
                }
            } else {
                print("Error downloading document: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        
        downloadTask.resume()
    }
    
}

struct CustomPDFView_Previews: PreviewProvider {
    static var previews: some View {
        let pdfPath = "https://www.africau.edu/images/default/sample.pdf"
        CustomPDFView(title: "Title", url: pdfPath, show: false)        
    }
}

