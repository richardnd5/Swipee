import AudioKit

enum SoundDirection : MIDINoteNumber {
    case up = 60
    case left
    case right
    case down
}

enum AppState {
    case opening
    case tutorial
    case playing
    case gameOver
}
