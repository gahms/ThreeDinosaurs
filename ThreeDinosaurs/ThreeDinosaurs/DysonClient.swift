//
//  DysonClient.swift
//  ThreeDinosaurs
//
//  Created by Nicolai Henriksen on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import Foundation
import MQTTClient

class DysonClient: NSObject, MQTTSessionDelegate {

    func poc() {
        let transport = MQTTCFSocketTransport()
        transport.host = "192.168.1.106"
        transport.port = 1883
        
        let session = MQTTSession()!
        session.transport = transport
        session.delegate = self
        session.protocolLevel = .version31
        
        print("Connecting...")
        session.connectAndWaitTimeout(30)
        print("Connecting...done")
        
        print("publishAndWait...")
        let body = "{\"Left\":1000,\"Right\":1000}"
        let data = body.data(using: String.Encoding.utf8)
        session.publishAndWait(data,
                               onTopic: "command/wheel_speed",
                               retain: false,
                               qos: MQTTQosLevel.atLeastOnce)
        
        print("publishAndWait...done")
        
        print("disconnect...")
        session.disconnect()
        print("disconnect...done")
    }

    /*
    func poc2() {
        session = MQTTSession()
        session.delegate = self
        
        session.connect(toHost: "192.168.1.106",
                        port: 1883,
                        usingSSL: false)
    }
    
    var sessionConnected = false;
    var sessionError = false;
    var sessionReceived = false;
    var sessionSubAcked = false;
    var session : MQTTSession!
    
    func handleEvent(session: MQTTSession!, event eventCode: MQTTSessionEvent, error: NSError!) {
        switch eventCode {
        case .Connected:
            sessionConnected = true
        case .ConnectionClosed:
            sessionConnected = false
        default:
            sessionError = true
        }
    }
    
    func newMessage(session: MQTTSession!, data: NSData!, onTopic topic: String!, qos: MQTTQosLevel, retained: Bool, mid: UInt32) {
        print("Received \(data) on:\(topic) q\(qos) r\(retained) m\(mid)")
        sessionReceived = true;
    }
    
    func subAckReceived(session: MQTTSession!, msgID: UInt16, grantedQoss qoss: [NSNumber]!) {
        sessionSubAcked = true;
    }
    */

    func connected(_ session: MQTTSession!) {
        print("connected")
    }
    
    func connectionClosed(_ session: MQTTSession!) {
        print("connectionClosed")
    }
    
    func connectionError(_ session: MQTTSession!, error: Error!) {
        print("connectionError")
    }
    
    func connectionRefused(_ session: MQTTSession!, error: Error!) {
        print("connectionRefused")
    }
    
    func newMessage(_ session: MQTTSession!, data: Data!, onTopic topic: String!, qos: MQTTQosLevel, retained: Bool, mid: UInt32) {
        print("newMessage")
    }
    
    func handleEvent(_ session: MQTTSession!, event eventCode: MQTTSessionEvent, error: Error!) {
        print("handleEvent")
    }
}
