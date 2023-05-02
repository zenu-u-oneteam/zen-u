//
//  testfile.swift
//  Zen-u
//
//  Created by Aindrila Ray on 28/04/23.
//

import SwiftUI
import PDFKit
import WebKit


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
    var body: some View {
        VStack{
            HStack{
                Text(title) .foregroundColor(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                Button(action: {
                    
                }){
                    
                    Image(systemName: "square.and.arrow.up")
                    Text("Share")
                    
                }.hTrailing()
                Button(action: {
                    
                }){
                    
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                    
                }.padding(.all, 5)
                   
            }.padding(.horizontal)
            PDFKitViewRepresantable(documentURL: URL(string: url)!)
            
        }

    }
}



struct CustomPDFView_Previews: PreviewProvider {
    static var previews: some View {
    let pdfPath = "https://www.africau.edu/images/default/sample.pdf"
    CustomPDFView(title: "Title", url: pdfPath)
            
            
        }
    }

