import class Combine.AnyCancellable

extension AnyCancellable {

    func store(in bag: CancelBag) {
        if bag.contains(self) {
            return
        }

        bag.insert(self)
    }
}
