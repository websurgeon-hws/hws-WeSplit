//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("Hello World")
            }
//            .navigationBarTitle(Text("SwiftUI"))
//            .navigationBarTitle(Text("SwiftUI"), displayMode: .inline)
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
