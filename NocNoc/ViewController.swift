//
//  ViewController.swift
//  NocNoc
//
//  Created by Tiago Ferreira on 25/09/2017.
//  Copyright © 2017 Tiago Ferreira.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var builtInLabel: UILabel!
    @IBOutlet weak var headsetLabel: UILabel!
    @IBOutlet weak var lineInLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.layer.cornerRadius = 5
        builtInLabel.text = "Built In Microphone: Unknown"
        headsetLabel.text = "Headset (Jack) Microphone: Unknown"
        lineInLabel.text = "Line In (Dock) Microphone: Unknown"
    }

    @IBAction func buttonPressed(_ sender: Any) {
        var builtInDetected = false
        var headsetDetected = false
        var lineInDetected = false

        let session = AVAudioSession.sharedInstance()
        _ = try? session.setCategory(AVAudioSessionCategoryRecord, with: [])
        for input in AVAudioSession.sharedInstance().availableInputs! {
            switch input.portType {
            case "MicrophoneBuiltIn":
                builtInDetected = true
            case "MicrophoneWired":
                headsetDetected = true
            case "LINE IN DOCK":
                lineInDetected = true
            default:
                print("Detected new device: \(input.portType)")
            }
        }

        if builtInDetected {
            builtInLabel.text = "Built In Microphone: Detected"
        } else {
            builtInLabel.text = "Built In Microphone: Undetected"
        }

        if headsetDetected {
            headsetLabel.text = "Headset (Jack) Microphone: Detected"
        } else {
            headsetLabel.text = "Headset (Jack) Microphone: Undetected"
        }

        if lineInDetected {
            lineInLabel.text = "Line In (Dock) Microphone: Detected"
        } else {
            lineInLabel.text = "Line In (Dock) Microphone: Undetected"
        }
    }
}
