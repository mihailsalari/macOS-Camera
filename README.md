# macOS-Camera
Simple example how to run macOS Camera

# Demo

![Camera](https://user-images.githubusercontent.com/23311250/168668059-3924ee42-98ea-4ba4-8b2d-e4c2f718b7a4.gif)


# AVFoundation

https://developer.apple.com/av-foundation/

## Support

|                       |  [8.x.x]  |  [7.x.x]  | 
| --------------------- |:---------:|:---------:|
| [Xcode Version ][1]   |           |     x     |


[1]: http://developer.apple.com/xcode/

## Supporting macOS version:
* macOS 10.x

## Feature Done 


### v1.0.0
* AVCaptureVideoPreviewLayer
* AVCaptureSession
* AVCaptureDevice

### v2.0.0
* CameraManagerProtocol
* CameraManager
* CameraManagerDelegate

## Usage:

1. Drag and drop the ```CameraManager.swift``` into your macOS Xcode project.

On ```viewDidLoad``` method, instantiate the ```CameraManager``` object:
```swift
    do {
      cameraManager = try CameraManager(containerView: view)
    } catch {
      // Cath the error here
    }
```

2. Set the CameraManagerDelegate

After you instantiated the camera manager, set it's delegate in this way:
```swift
    cameraManager.delegate = self
```
3. To start camera, run the following snippet on ```viewDidLoad``` or ```viewDidAppear``` method:
```swift
    do {
      try cameraManager.startSession()
    } catch {
      // Cath the error here
    }
```

## Full snippet code:

```swift
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
```

```swift
    extension YourViewController: CameraManagerDelegate {
        func cameraManager(_ output: CameraCaptureOutput, didOutput sampleBuffer: CameraSampleBuffer, 
                             from connection: CameraCaptureConnection) {
            print(Date())
        }
    }
```

## Bug Reports & Feature Requests

No Bugs

## Contributing

1. Fork the project.
2. Create a branch for your new feature.
3. Write tests.
4. Write code to make the tests pass.
5. Submit a pull request.

All pull requests are welcome !
