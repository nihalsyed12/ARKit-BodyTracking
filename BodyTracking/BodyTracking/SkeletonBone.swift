//
//  SkeletonBone.swift
//  BodyTracking
//
//  Created by Nihal Syed on 2022-06-18.
//

import Foundation
import RealityKit

//struct for all skeleton bones
struct SkeletonBone{
    var fromJoint: SkeletonJoint
    var toJoint: SkeletonJoint
    
    //get joint position and center the bone position
    var centerPosition: SIMD3<Float>{
        [(fromJoint.position.x + toJoint.position.x)/2, (fromJoint.position.y + toJoint.position.y)/2, (fromJoint.position.z + toJoint.position.z)/2]
    }
    
    //simd_distance calculates euclidian distance
    var length: Float{
        simd_distance(fromJoint.position, toJoint.position)
    }
    
    
}
