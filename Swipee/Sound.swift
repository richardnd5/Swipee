import AudioKit

class Sound {
    
    weak var delegate : CallbackDelegate?
    weak var titleDelegate : TitleDelegate?
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
        
        setupSequencer()
        setupTitleSequencer()
        
        callCallback.callback = sequencerCallback
        accompCallback.callback = accompCallback
        titleCallback.callback = titleCallback
        
        

    }
    
    private func setupTitleSequencer(){
        
        titleTrack = titleSequencer.newTrack()
        
        for i in 0..<7 {
            titleTrack.add(midiNoteData: AKMIDINoteData(noteNumber: MIDINoteNumber(60), velocity: MIDIVelocity.random(in: 0...127), channel: 1, duration: AKDuration(beats: 0.5), position: AKDuration(beats: Double(i))))
        }
        
        titleSequencer.setTempo(titleSequencerTempo)
        titleSequencer.setLength(AKDuration(beats: 7))
        
        titleTrack.setMIDIOutput(titleCallback.midiIn)
        
        
    }
    
    private func setupSequencer(){
        
        accompTrack = sequencer.newTrack()
        callTrack = sequencer.newTrack()
        
        for i in 0..<8 {
            accompTrack.add(midiNoteData: AKMIDINoteData(noteNumber: MIDINoteNumber.random(in: 60...63), velocity: MIDIVelocity.random(in: 0...127), channel: 1, duration: AKDuration(beats: 0.3), position: AKDuration(beats: Double(i)/2)))
            print("putting the kicks in: \(Double(i)/2)")
        }

        sequencer.setTempo(startingTempo)
        sequencer.setLength(AKDuration(beats: 4))
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
                self.responseSampler.play(noteNumber: noteNumber, velocity: velocity)
            } else if status == 129 {
                self.responseSampler.stop(noteNumber: noteNumber)
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
                self.delegate?.accompTrackNoteOffCallback()
            }
        }
    }
    
    private func titleCallback(_ status: UInt8,
                                _ noteNumber: MIDINoteNumber,
                                _ velocity: MIDIVelocity) {
        DispatchQueue.main.async {
            if status == 145 {
                self.titleDelegate?.animateTitle(self.titleSequencer.currentRelativePosition.beats)
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
    
    func playTitleSequencer(){
        if !titleSequencer.isPlaying {
            titleSequencer.play()
        }
    }
    
    func stopTitleSequencer(){
        if titleSequencer.isPlaying {
            titleSequencer.stop()
            titleSequencer.rewind()
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

