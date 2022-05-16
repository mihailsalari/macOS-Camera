//
//  ViewController.swift
//  macOS Camera
//
//  Created by Mihail Șalari. on 4/24/17.
//  Copyright © 2017 Mihail Șalari. All rights reserved.
//

import Cocoa

final class ViewController: NSViewController {
  private var cameraManager: CameraManagerProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    do {
      cameraManager = try CameraManager(containerView: view)
      cameraManager.delegate = self
    } catch {
      // Cath the error here
      print(error.localizedDescription)
    }
  }
  
  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  override func viewDidAppear() {
    super.viewDidAppear()
    do {
      try cameraManager.startSession()
    } catch {
      // Cath the error here
      print(error.localizedDescription)
    }
  }
  
  override func viewDidDisappear() {
    super.viewDidDisappear()
    do {
      try cameraManager.stopSession()
    } catch {
      // Cath the error here
      print(error.localizedDescription)
    }
  }
}

extension ViewController: CameraManagerDelegate {
  func cameraManager(_ output: CameraCaptureOutput, didOutput sampleBuffer: CameraSampleBuffer, from connection: CameraCaptureConnection) {
    print(Date())
  }
}
