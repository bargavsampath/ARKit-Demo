//
//  ViewController.swift
//  ARKit-Demo
//
//  Created by BARGAV MUNUSAMY SAMPATH  on 6/28/18.
//  Copyright © 2018 BARGAV MUNUSAMY SAMPATH . All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //        // Create a new scene
        //        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        //creating a 3D cube image
        //chamferRadius: it will tell us how sharp the cube edges are
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        //creating a 3d Moon Image
        //let moon = SCNSphere(radius: 0.2)  //radius = 20cms
        
        //creating an instance of SCNMaterial to give color to our cube
        let material = SCNMaterial()
       // material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        material.diffuse.contents = UIColor.blue
        cube.materials = [material]
        
        //creating a location coordinate to place our cube: (x,y,z)
        //z: Negative value -> towards
        
        let node = SCNNode()
        node.position = SCNVector3Make(0.0, 0.0, -0.5)
        node.geometry = cube
        
        //adding the cube to the rootNode of sceneView's view
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
