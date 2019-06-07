import AudioKit

class SoundSampler : AKSampler {
    
    init() {
        super.init()
        loadPianoSamples()
    }
    
    private func loadPianoSamples() {
        let bundleURL = Bundle.main.resourceURL?.appendingPathComponent("Sampler")
        loadSFZ(path: (bundleURL?.path)!, fileName: "sampler.sfz")
        releaseDuration = 7.0
    }
    
    func playDirection(_ direction: SoundDirection){
        play(noteNumber: direction.rawValue, velocity: 127)
//        print("played direction!   \(direction)")

    }
    
    func stopDirection(_ direction: SoundDirection){
        stop(noteNumber: direction.rawValue)
    }
}
