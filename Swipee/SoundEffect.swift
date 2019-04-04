import AudioKit

class SoundEffect {
    
    private var audioFile : AKAudioFile!
    var sampler = AKMIDISampler()
    
    private var name : String!
    private var volume : Double!
    
    init(fileName: String, volume: Double = 1.0) {
        self.volume = volume
        audioFile = loadAudioFile("\(fileName)")
        setupSampler()
        self.name = fileName
    }
    
    private func loadAudioFile(_ name: String) -> AKAudioFile{
        let path = Bundle.main.url(forResource: name, withExtension: "mp3")
        var file : AKAudioFile!
        do {
            try  file = AKAudioFile(forReading: path!)
        } catch {
            print("didn't load the audio file. Why? \(error)")
        }
        return file
    }
    
    private func setupSampler(){
        do { try sampler.loadAudioFile(audioFile!) } catch { print("Couldn't load the audio file. Here's why:     \(error)") }
        sampler.enableMIDI()
        sampler.volume = volume
    }
    
    func play(){
        do { try sampler.play(noteNumber: 60, velocity: 127, channel: 1) } catch { print("couldn't play the note. Why? Here:  \(error)") }
    }
    
    func playRandomPitched(semitoneRange: MIDINoteNumber = 7){
        
        let lowRange : MIDINoteNumber = 57
        let highRange = lowRange+semitoneRange-3
        let randomNote = MIDINoteNumber.random(in: lowRange...highRange)
        do { try sampler.play(noteNumber: randomNote, velocity: 127, channel: 1) } catch { print("couldn't play the note. Why? Here:  \(error)") }
    }
    
    func setVolume(to volume : Double = 1.0){
        sampler.volume = volume
    }
}



