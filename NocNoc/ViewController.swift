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

    @IBOutlet weak var testButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.layer.cornerRadius = 5
    }

    @IBAction func buttonPressed(_ sender: Any) {
        let session = AVAudioSession.sharedInstance()
        _ = try? session.setCategory(AVAudioSessionCategoryRecord, with: [])
        for input in AVAudioSession.sharedInstance().availableInputs! {
            print("Port Type: \(input.portType)")
            print("Port Name: \(input.portName)")
        }
    }
}
