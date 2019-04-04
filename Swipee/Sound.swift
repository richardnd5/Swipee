import AudioKit

class Sound {
    
    weak var delegate : CallbackDelegate?
    static var shared = Sound()
    var startingTempo : Double = 120
    
    var mixer = AKMixer()
    var sequencer = AKSequencer()
    var gameOverSound : SoundEffect!
    
    var accompTrack : AKMusicTrack!
    var callTrack : AKMusicTrack!
    
    var callSampler = SoundSampler()
    var callCallback = AKCallbackInstrument()
    
    var responseSampler = SoundSampler()
    var responseCallback = AKCallbackInstrument()
    
    var kickDrumSound = AKSynthKick()
    var accompCallback = AKCallbackInstrument()

    func setup() {

        gameOverSound = SoundEffect(fileName: "gameOverSound")
        
        mixer = AKMixer(kickDrumSound, gameOverSound.sampler)
        AudioKit.output = mixer
        do { try! AudioKit.start() }
        responseSampler.connect(to: mixer)
        
        setupSequencer()
        
        callCallback.callback = sequencerCallback
        accompCallback.callback = accompCallback

    }
    
    private func setupSequencer(){
        
        accompTrack = sequencer.newTrack()
        callTrack = sequencer.newTrack()
        
        for i in 0..<8 {
            accompTrack.add(midiNoteData: AKMIDINoteData(noteNumber: MIDINoteNumber.random(in: 60...63), velocity: MIDIVelocity.random(in: 0...127), channel: 1, duration: AKDuration(beats: 0.5), position: AKDuration(beats: Double(i))))
        }

        sequencer.setTempo(startingTempo)
        sequencer.setLength(AKDuration(beats: 8))
        sequencer.enableLooping()
        
        accompTrack.setMIDIOutput(accompCallback.midiIn)
        callTrack.setMIDIOutput(callCallback.midiIn)
        
    }
    
    func setGuessTrackWithNextGuess(noteNumber: MIDINoteNumber){
        callTrack.clear()
        
        let midiNoteData = AKMIDINoteData(
                noteNumber: noteNumber,
                velocity: 127,
                channel: 1,
                duration: AKDuration(beats: 1),
                position: AKDuration(beats: 0))
        
        callTrack.add(midiNoteData: midiNoteData)
    }

    private func sequencerCallback(_ status: AKMIDIStatus,
                           _ noteNumber: MIDINoteNumber,
                           _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == .noteOn {
                self.responseSampler.play(noteNumber: noteNumber, velocity: velocity)
            } else if status == .noteOff {
                self.responseSampler.stop(noteNumber: noteNumber)
            }
        }
    }
    
    private func accompCallback(_ status: AKMIDIStatus,
                                   _ noteNumber: MIDINoteNumber,
                                   _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == .noteOn {
                self.kickDrumSound.play(noteNumber: 60, velocity: 127)
                self.delegate?.accompTrackNoteOnCallback(self.sequencer.currentRelativePosition.beats)

            } else if status == .noteOff {
                self.kickDrumSound.stop(noteNumber: 60)
                self.delegate?.accompTrackNoteOffCallback()
            }
        }
    }
    
    func playSequencer(){
        if !sequencer.isPlaying {
            sequencer.play()
        }
    }
    
    func stopSequencer(){
        if sequencer.isPlaying {
            sequencer.stop()
            sequencer.rewind()
            sequencer.setTempo(startingTempo)
        }
    }
    
    func incrementSequencerTempo(_ amount: Double = 6){
        let newTempo = sequencer.tempo+amount
        sequencer.setTempo(newTempo)
    }
    
    func playSwipeSound(_ direction: UISwipeGestureRecognizer.Direction){
        Haptics.shared.vibrate(.light)
        switch direction {
        case .up:
            responseSampler.playDirection(.up)
        case .down:
            responseSampler.playDirection(.down)
        case .left:
            responseSampler.playDirection(.left)
        case .right:
            responseSampler.playDirection(.right)
        default:
            return
        }
    }
    
    func playGameOverSound(){
        gameOverSound.play()
    }
    
}

