//
//  KVLLoaderProtocol.swift
//  KVLAnimatedLoader
//
//  Created by Misha Koval on 12/6/15.
//  Copyright © 2015 Misha Koval. All rights reserved.
//

import Foundation

protocol KVLLoaderProtocol
{
    var animationDurationSec : CFTimeInterval{get set}; //Seconds
    func startAnimating();
    func stopAnimating();
}