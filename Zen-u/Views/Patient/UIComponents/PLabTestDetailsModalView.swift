//
//  PLabTestDetailsModalView.swift
//  Zen-u
//
//  Created by Archit Khanna on 02/05/23.
//

import SwiftUI

var tests: [String] = ["Haemoglobin", "PCV", "RCB count", "Total Leucocyte count (TLC)", "Platelet count", "MCV", "MMV"]

struct PLabTestDetailsModalView: View {
    @Binding var isShowing: Bool
    @State private var isDragging = false
    
    @State private var curHeight: CGFloat = 400
    let minHeight:CGFloat = 400
    let maxHeight:CGFloat = 400
    
    let startOpacity = 0.4
    let endOpacity = 0.8
    
    var dragPercentage:Double {
        let res = Double((curHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    var mainView: some View {
        VStack{
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            ZStack{
                VStack(alignment: .leading){
                    ForEach(tests, id: \.self) { item in
                        Text(item).font(.callout)
                        Divider()
                    }
                }
                .padding(.horizontal, 30)
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea()
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight / 2)
            }
                .foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
        .onDisappear{
            curHeight = minHeight
        }
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged{ val in
                if !isDragging{
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight {
                    curHeight -= dragAmount / 6
                }
                else{
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded{ val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight > maxHeight{
                    curHeight = maxHeight
                }
                else if curHeight < minHeight{
                    curHeight = minHeight
                }
                
            }
    }
}

struct PLabTestDetailsModalView_previews: PreviewProvider{
    static var previews: some View{
        PLabTestDetails()
    }
}
