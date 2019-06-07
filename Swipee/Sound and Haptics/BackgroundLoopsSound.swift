import AudioKit

class BackgroundSound {
    static var sharedInstance = BackgroundSound()
    
    var mixer = AKMixer()
    
    var drums : AKSequencer!
    var drumCallback = AKMIDICallbackInstrument()

    var bass : AKSequencer!
    var bassCallback = AKMIDICallbackInstrument()
    
    var chords : AKSequencer!
    var chordsCallback = AKMIDICallbackInstrument()
    
    var melody : AKSequencer!
    var melodyCallback = AKMIDICallbackInstrument()
    
    var drumTrack : AKMusicTrack!
    
    
    init() {
        setup()
        
        
    }
    
    
    func setup(){
        
        mixer = AKMixer()
        AudioKit.output = mixer
        do { try! AudioKit.start() }
        
        setupSequencer()
        
        drumCallback.callback = sequencerCallback
        
    }
    
    private func setupSequencer(){
        
        drumTrack = drums.newTrack()
        
        
        for i in 0..<4 {
            drumTrack.add(midiNoteData: AKMIDINoteData(noteNumber: MIDINoteNumber.random(in: 60...63), velocity: MIDIVelocity.random(in: 0...127), channel: 1, duration: AKDuration(beats: 0.3), position: AKDuration(beats: Double(i)/2)))
        }
        
        drums.setTempo(80)
        drums.setLength(AKDuration(beats: 2))
        drums.enableLooping()
        
        drumTrack.setMIDIOutput(drumCallback.midiIn)
        
        
    }
    
    private func sequencerCallback(_ status: UInt8,
                                   _ noteNumber: MIDINoteNumber,
                                   _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == 145 {
//                self.responseSampler.play(noteNumber: noteNumber, velocity: velocity)
            } else if status == 129 {
//                self.responseSampler.stop(noteNumber: noteNumber)
            }
        }
    }
    
    private func accompCallback(_ status: UInt8,
                                _ noteNumber: MIDINoteNumber,
                                _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == 145 {
//                self.kickDrumSound.play(noteNumber: 60, velocity: 127)
//                self.delegate?.drumTrackNoteOnCallback(self.sequencer.currentRelativePosition.beats)
                
            } else if status == 129 {
//                self.kickDrumSound.stop(noteNumber: 60)
            }
        }
    }
    
}

