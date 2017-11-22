//
//  ViewController.swift
//  Planets
//
//  Created by Joe Hill on 11/19/17.
//  Copyright © 2017 Dumb Unicorn. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sun = SCNNode(geometry: SCNSphere(radius: 0.35))
        
        //earthParent and venusParent are basically in the middle of the sun, their children, the earth and venus you see
        //are childNodes of earthParent and venusParent
        
        let earthParent = SCNNode()
        let venusParent = SCNNode()
        let mercuryParent = SCNNode()
        let moonParent = SCNNode()
        let marsParent = SCNNode()
        let jupiterParent = SCNNode()
        let saturnParent = SCNNode()
        let neptuneParent = SCNNode()
        let uranusParent = SCNNode()
       // let saturnRingParent = SCNNode()
        
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun Diffuse")
        sun.position = SCNVector3(0,0,-1)
        earthParent.position = SCNVector3(0,0,-1)
        venusParent.position = SCNVector3(0,0,-1)
        mercuryParent.position = SCNVector3(0,0,-1)
        moonParent.position = SCNVector3(1.75,0,0)
        marsParent.position = SCNVector3(0,0,-1)
        jupiterParent.position = SCNVector3(0,0,-1)
        saturnParent.position = SCNVector3(0,0,-1)
        neptuneParent.position = SCNVector3(0,0,-1)
        uranusParent.position = SCNVector3(0,0,-1)
        //saturnRingParent.position = SCNVector3(0,0,-1)
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        self.sceneView.scene.rootNode.addChildNode(neptuneParent)
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        //self.sceneView.scene.rootNode.addChildNode(saturnRingParent)
        
        let earth = planet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth Specular"), emission: #imageLiteral(resourceName: "Earth Emmission"), normal: #imageLiteral(resourceName: "Earth Normal"), position: SCNVector3(1.75, 0, 0))
        
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Venus Surface"), specular: nil, emission: #imageLiteral(resourceName: "Venus Atmosphere"), normal: nil, position: SCNVector3(0.9,0,0))
        
        let moon = planet(geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "Moon Surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0, 0, -0.3))
        
        let mercury = planet(geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "Mercury Surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(0.5, 0, 0))
        
        let mars = planet(geometry: SCNSphere(radius: 0.175), diffuse: #imageLiteral(resourceName: "Mars Surface"), specular: nil, emission: nil, normal: nil, position: SCNVector3(2.5,0,0))
        
        let jupiter = planet(geometry: SCNSphere(radius: 0.28), diffuse: #imageLiteral(resourceName: "Jupiter Atmosphere"), specular: nil, emission: nil, normal: nil, position: SCNVector3(4.0,0.5,0))
        
        let saturn = planet(geometry: SCNSphere(radius: 0.26), diffuse: #imageLiteral(resourceName: "Saturn Atmosphere"), specular: nil, emission: nil, normal: nil, position: SCNVector3(4.75,1,0))
        
        let neptune = planet(geometry: SCNSphere(radius: 0.23), diffuse: #imageLiteral(resourceName: "Neptune Atmosphere"), specular: nil, emission: nil, normal: nil, position: SCNVector3(6.5,-0.5,0))
        
        let uranus = planet(geometry: SCNSphere(radius: 0.225), diffuse: #imageLiteral(resourceName: "Uranus Atmostphere"), specular: nil, emission: nil, normal: nil, position: SCNVector3(5.75,0,0))
        
        //let saturnRing = planet(geometry: SCNTorus(ringRadius: CGFloat(0), pipeRadius: CGFloat(0)), diffuse: #imageLiteral(resourceName: "Saturn Ring"), specular: nil, emission: nil, normal: nil, position: SCNVector3(4.75,1,0))
        
        
        //Animation for Planets
        
        let sunAction = Rotation(time: 8)
        let earthParentRotation = Rotation(time: 14)
        let venusParentRotation = Rotation(time: 10)
        let mercuryParentRotation = Rotation(time: 7)
        let moonRotation = Rotation(time: 2)
        let earthRotation = Rotation(time: 8)
        let marsRotation = Rotation(time: 16)
        let jupiterRotation = Rotation(time: 19)
        let saturnRotation = Rotation(time: 21)
        let uranusRotation = Rotation(time: 22.5)
        let neptuneRotation = Rotation(time: 25)
        //let saturnRingRotation = Rotation(time: 21)
       
        earthParent.runAction(earthParentRotation)
        venusParent.runAction(venusParentRotation)
        mercuryParent.runAction(mercuryParentRotation)
        earth.runAction(earthRotation)
        moonParent.runAction(moonRotation)
        marsParent.runAction(marsRotation)
        jupiterParent.runAction(jupiterRotation)
        saturnParent.runAction(saturnRotation)
        uranusParent.runAction(uranusRotation)
        neptuneParent.runAction(neptuneRotation)
        //saturnRingParent.runAction(saturnRingRotation)
        
        sun.runAction(sunAction)
        
        earthParent.addChildNode(earth)
        earthParent.addChildNode(moonParent)
        venusParent.addChildNode(venus)
        mercuryParent.addChildNode(mercury)
        earth.addChildNode(moon)
        moonParent.addChildNode(moon)
        marsParent.addChildNode(mars)
        jupiterParent.addChildNode(jupiter)
        saturnParent.addChildNode(saturn)
        uranusParent.addChildNode(uranus)
        neptuneParent.addChildNode(neptune)
        //saturnRingParent.addChildNode(saturnRing)
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?,
                normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
        
        
        
    }
    
    func Rotation(time: TimeInterval) -> SCNAction {
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
        
        let foreverRotation = SCNAction.repeatForever(rotation)
        return foreverRotation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Int {
    var degreesToRadians: Double {return Double(self) * .pi/180}
}

