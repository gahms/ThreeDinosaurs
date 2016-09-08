//
//  DysonClient.swift
//  ThreeDinosaurs
//
//  Created by Nicolai Henriksen on 08/09/16.
//  Copyright © 2016 ThreeDinosaurs. All rights reserved.
//

import Moscapsule

class DysonClient: NSObject {
    // set MQTT Client Configuration
    let mqttConfig = MQTTConfig(clientId: "cid", host: "test.mosquitto.org", port: 1883, keepAlive: 60)
    
    /*
    mqttConfig.onPublishCallback = { messageId in
    NSLog("published (mid=\(messageId))")
    }
    mqttConfig.onMessageCallback = { mqttMessage in
    NSLog("MQTT Message received: payload=\(mqttMessage.payloadString)")
    }
    
    // create new MQTT Connection
    let mqttClient = MQTT.newConnection(mqttConfig)
    
    // publish and subscribe
    mqttClient.publishString("message", topic: "publish/topic", qos: 2, retain: false)
    mqttClient.subscribe("subscribe/topic", qos: 2)
    
    // disconnect
    mqttClient.disconnect()
 */
}
