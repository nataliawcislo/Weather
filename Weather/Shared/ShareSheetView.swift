//
//  ShareSheetView.swift
//  Weather
//
//  Created by Natalia Wcislo on 13.05.23.
//

import Foundation
import SwiftUI

struct ShareSheetView: View {
    private let url = URL(string: "https://www.apple.com")!
    @State private var count: Int = 0
    var body: some View {

        VStack{
            Button(action: {
                sharecounter()
                actionSheet()
            })
    {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
            }
            Text("count: \(count)")
        }
    }
 
    
    func actionSheet() {
       guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
       let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
       UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    func sharecounter(){
        self.count += 1
    }
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView()
    }
}
