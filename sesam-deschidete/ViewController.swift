//
//  ViewController.swift
//  sesam-deschidete
//
//  Created by Alexandru Marin on 12/05/2018.
//  Copyright © 2018 Alexandru Marin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var captureSession: AVCaptureSession?
        var videoPreviewLayer: AVCaptureVideoPreviewLayer?
        
        let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            previewView.layer.addSublayer(videoPreviewLayer!)
            
            captureSession?.startRunning()
        } catch {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var previewView: UIView!
    
    

}

