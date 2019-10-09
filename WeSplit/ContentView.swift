//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Alice", "Bob", "Eve"]
    @State private var selectedStudent = 1

    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
