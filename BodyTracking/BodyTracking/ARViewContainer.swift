//
//  ARViewContainer.swift
//  BodyTracking
//
//  Created by Nihal Syed on 2022-06-18.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit

private var bodySkeleton: BodySkeleton?
private let bodySkeletonAnchor = AnchorEntity()

struct ARViewContainer: UIViewRepresentable{
    typealias UIViewType = ARView
    
    //required function to conform to UIViewRepresentable
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        arView.setupForBodyTracking()
        arView.scene.addAnchor(bodySkeletonAnchor)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

extension ARView: ARSessionDelegate{
    func setupForBodyTracking(){
        let configuration = ARBodyTrackingConfiguration()
        self.session.run(configuration)
        
        self.session.delegate = self
    }
    
    public func session(_ session: ARSession, didUpdate anchors: [ARAnchor]){
        for anchor in anchors{
            if let bodyAnchor = anchor as? ARBodyAnchor{
                if let skeleton = bodySkeleton {
                    //if BodySkeleton already exists, update all joints and bones
                    skeleton.update(with: bodyAnchor)
                }else{
                    //if bodyskeleton doesnt exist yet, or body has been detected for the first time
                    //create bodySkeleton entity and add it to the bodySkeletonAnchor
                    bodySkeleton = BodySkeleton(for: bodyAnchor)
                    bodySkeletonAnchor.addChild(bodySkeleton!)
                }
            }
        }
    }
}
