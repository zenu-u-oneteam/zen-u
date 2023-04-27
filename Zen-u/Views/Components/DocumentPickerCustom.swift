//
//  TestView.swift
//  Zen-u
//
//  Created by Aindrila Ray on 27/04/23.
//

import SwiftUI
import UniformTypeIdentifiers
import MobileCoreServices
import Firebase

struct DocumentPickerCustom: View {
    
    @State var show = false
    @State var alert = false
    
    var body: some View {
        Button( action: {
            self.show.toggle()
        }) {
            TabButton(text: "Upload New")
        }
        .sheet(isPresented: $show) {
            DocumentPicker(alert: self.$alert)
        }.alert(isPresented: $alert){
            Alert(title: Text("Message"), message: Text("Upload Successful"), dismissButton: .default(Text("Okay")))
        }
    }
}

struct DocumentPickerCustom_Previews: PreviewProvider {
    static var previews: some View {
        DocumentPickerCustom()
    }
}

struct DocumentPicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> DocumentPicker.Coordinator {
        return DocumentPicker.Coordinator (parent1: self)
    }
    @Binding var alert: Bool
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) ->
    DocumentPicker.UIViewControllerType{
        let picker = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .open)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker
        init(parent1: DocumentPicker) {
            parent = parent1
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print(urls)
        }
    }
}
