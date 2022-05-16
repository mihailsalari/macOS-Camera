//
//  ViewController.swift
//  macOS Camera
//
//  Created by Mihail Șalari. on 4/24/17.
//  Copyright © 2017 Mihail Șalari. All rights reserved.
//

import Cocoa
import AVFoundation

final class ViewController: NSViewController {
  
  // MARK: - Properties
  
  private var cameraManager: CameraManagerProtocol!
  
  
  // MARK: - LyfeCicle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    do {
      cameraManager = try CameraManager(containerView: view)
      cameraManager.delegate = self
      try cameraManager.startSession()
    } catch {
      print(error.localizedDescription)
    }
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
}

extension ViewController: CameraManagerDelegate {
  func cameraManager(_ output: CameraCaptureOutput, didOutput sampleBuffer: CameraSampleBuffer, from connection: CameraCaptureConnection) {
    print(Date())
  }
}
