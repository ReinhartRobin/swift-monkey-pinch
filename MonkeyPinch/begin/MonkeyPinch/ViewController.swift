/**
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
    // 1
    let translation = gesture.translation(in: view)

    // 2
    guard let gestureView = gesture.view else {
      return
    }

    gestureView.center = CGPoint(
      x: gestureView.center.x + translation.x,
      y: gestureView.center.y + translation.y
    )

    // 3
    gesture.setTranslation(.zero, in: view)
    
    guard gesture.state == .ended else {
      return
    }

    // 1
    let velocity = gesture.velocity(in: view)
    let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
    let slideMultiplier = magnitude / 200

    // 2
    let slideFactor = 0.1 * slideMultiplier
    // 3
    var finalPoint = CGPoint(
      x: gestureView.center.x + (velocity.x * slideFactor),
      y: gestureView.center.y + (velocity.y * slideFactor)
    )

    // 4
    finalPoint.x = min(max(finalPoint.x, 0), view.bounds.width)
    finalPoint.y = min(max(finalPoint.y, 0), view.bounds.height)

    // 5
    UIView.animate(
      withDuration: Double(slideFactor * 2),
      delay: 0,
      // 6
      options: .curveEaseOut,
      animations: {
        gestureView.center = finalPoint
    })
  }
    
  @IBAction func handlePinch(_ gesture: UIPinchGestureRecognizer) {
    guard gesture.state == .ended else {
      return
    }

    // 1
    let velocity = gesture.velocity(in: view)
    let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
    let slideMultiplier = magnitude / 200

    // 2
    let slideFactor = 0.1 * slideMultiplier
    // 3
    var finalPoint = CGPoint(
      x: gestureView.center.x + (velocity.x * slideFactor),
      y: gestureView.center.y + (velocity.y * slideFactor)
    )

    // 4
    finalPoint.x = min(max(finalPoint.x, 0), view.bounds.width)
    finalPoint.y = min(max(finalPoint.y, 0), view.bounds.height)

    // 5
    UIView.animate(
      withDuration: Double(slideFactor * 2),
      delay: 0,
      // 6
      options: .curveEaseOut,
      animations: {
        gestureView.center = finalPoint
    })
  }
  
  @IBAction func handleRotate(_ gesture: UIRotationGestureRecognizer) {
    guard gesture.state == .ended else {
      return
    }

    // 1
    let velocity = gesture.velocity(in: view)
    let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
    let slideMultiplier = magnitude / 200

    // 2
    let slideFactor = 0.1 * slideMultiplier
    // 3
    var finalPoint = CGPoint(
      x: gestureView.center.x + (velocity.x * slideFactor),
      y: gestureView.center.y + (velocity.y * slideFactor)
    )

    // 4
    finalPoint.x = min(max(finalPoint.x, 0), view.bounds.width)
    finalPoint.y = min(max(finalPoint.y, 0), view.bounds.height)

    // 5
    UIView.animate(
      withDuration: Double(slideFactor * 2),
      delay: 0,
      // 6
      options: .curveEaseOut,
      animations: {
        gestureView.center = finalPoint
    })
  }
  
  @objc func handleTap(_ gesture: UITapGestureRecognizer) {
  }
}
