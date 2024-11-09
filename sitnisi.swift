import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var currentTime: String = ""

    private var timerSubscription: AnyCancellable?

    init() {
        timerSubscription = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                let formatter = DateFormatter()
                formatter.timeStyle = .medium
                self.currentTime = formatter.string(from: Date())
            }
    }
}
