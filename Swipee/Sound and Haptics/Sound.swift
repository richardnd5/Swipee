import AudioKit

class Sound {
    
    weak var delegate : CallbackDelegate?
    static var shared = Sound()
    
    var startingTempo : Double = 60
    
    let titleSequencerTempo : Double = 400
    
    var mixer = AKMixer()
    var sequencer = AKSequencer()
    
    var accompTrack : AKMusicTrack!
    var callTrack : AKMusicTrack!
    
    var gameOverSound : SoundEffect!
    
    var titleSequencer = AKSequencer()
    var titleCallback = AKMIDICallbackInstrument()
    var titleTrack : AKMusicTrack!

    var callSampler = SoundSampler()
    var callCallback = AKMIDICallbackInstrument()
    
    var responseSampler = SoundSampler()
    var responseCallback = AKMIDICallbackInstrument()
    
    var kickDrumSound = AKSynthKick()
    var accompCallback = AKMIDICallbackInstrument()

    func setup() {

        gameOverSound = SoundEffect(fileName: "gameOverSound")
        
        AKSettings.playbackWhileMuted = true
        mixer = AKMixer(kickDrumSound, gameOverSound)
        AudioKit.output = mixer
        do { try! AudioKit.start() }
        responseSampler.connect(to: mixer)
        callSampler.connect(to: mixer)
        
        setupSequencer()
        
        callCallback.callback = sequencerCallback
        accompCallback.callback = accompCallback
    }
    
    private func setupSequencer(){
        
        accompTrack = sequencer.newTrack()
        callTrack = sequencer.newTrack()
        
        for i in 0..<4 {
            accompTrack.add(midiNoteData: AKMIDINoteData(noteNumber: MIDINoteNumber.random(in: 60...63), velocity: MIDIVelocity.random(in: 0...127), channel: 1, duration: AKDuration(beats: 0.3), position: AKDuration(beats: Double(i)/2)))
        }

        sequencer.setTempo(startingTempo)
        sequencer.setLength(AKDuration(beats: 2))
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

    private func sequencerCallback(_ status: UInt8,
                           _ noteNumber: MIDINoteNumber,
                           _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == 145 {
                self.callSampler.play(noteNumber: noteNumber, velocity: velocity)
                
            } else if status == 129 {
                self.callSampler.stop(noteNumber: noteNumber)
            }
        }
    }
    
    private func accompCallback(_ status: UInt8,
                                   _ noteNumber: MIDINoteNumber,
                                   _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == 145 {
                self.kickDrumSound.play(noteNumber: 60, velocity: 127)
                self.delegate?.accompTrackNoteOnCallback(self.sequencer.currentRelativePosition.beats)

            } else if status == 129 {
                self.kickDrumSound.stop(noteNumber: 60)
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
    
    func incrementSequencerTempo(_ amount: Double = 3){
        let newTempo = sequencer.tempo+amount
        sequencer.setTempo(newTempo)
    }
    
    func playSwipeSound(_ direction: UISwipeGestureRecognizer.Direction){
        Haptics.shared.vibrate(.light)
        switch direction {
        case .up:
            responseSampler.playDirection(.up)
            Timer.scheduledTimer(withTimeInterval: 0.24, repeats: false, block:{_ in
                self.responseSampler.stopDirection(.up)
            })
        case .down:
            responseSampler.playDirection(.down)
            Timer.scheduledTimer(withTimeInterval: 0.24, repeats: false, block:{_ in
                self.responseSampler.stopDirection(.down)
            })
        case .left:
            responseSampler.playDirection(.left)
            Timer.scheduledTimer(withTimeInterval: 0.24, repeats: false, block:{_ in
                self.responseSampler.stopDirection(.left)
            })        case .right:
            responseSampler.playDirection(.right)
            Timer.scheduledTimer(withTimeInterval: 0.24, repeats: false, block:{_ in
                self.responseSampler.stopDirection(.right)
            })        default:
            return
        }
    }
    
    func playGameOverSound(){
        gameOverSound.play()
    }
}

