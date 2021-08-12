#!/usr/bin/swift

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title Selected Audio devices
// @raycast.mode inline
// @raycast.refreshTime 10m
// Optional parameters:
// @raycast.icon 🔈🔈
// @raycast.packageName Audio device
// Documentation:
// @raycast.description Shows the selected audio devices for input and output
// @raycast.author Roland Leth
// @raycast.authorURL https://runtimesharks.com
import CoreBluetooth

// https://www.jaredwolff.com/the-ultimate-how-to-bluetooth-swift-with-hardware-in-20-minutes/
class ParticlePeripheral: NSObject {

    /// Particle LED services and charcteristics Identifiers

    public static let particleLEDServiceUUID     = CBUUID.init(string: "b4250400-fb4b-4746-b2b0-93f0e61122c6")
    public static let redLEDCharacteristicUUID   = CBUUID.init(string: "b4250401-fb4b-4746-b2b0-93f0e61122c6")
    public static let greenLEDCharacteristicUUID = CBUUID.init(string: "b4250402-fb4b-4746-b2b0-93f0e61122c6")
    public static let blueLEDCharacteristicUUID  = CBUUID.init(string: "b4250403-fb4b-4746-b2b0-93f0e61122c6")


    private var peripheral: CBPeripheral!

}

// func findDevices() -> [AudioDevice] {
// 	var address = AudioObjectPropertyAddress(
// 		mSelector: AudioObjectPropertySelector(kAudioHardwarePropertyDevices),
// 		mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
// 		mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementMaster))

// 	var propSize: UInt32 = 0
// 	var result = AudioObjectGetPropertyDataSize(
// 		AudioObjectID(kAudioObjectSystemObject),
// 		&address,
// 		UInt32(MemoryLayout<AudioObjectPropertyAddress>.size),
// 		nil,
// 		&propSize)

// 	if (result != 0) {
// 		print("Error \(result) from AudioObjectGetPropertyDataSize")
// 		return []
// 	}

// 	let numDevices = Int(propSize / UInt32(MemoryLayout<AudioDeviceID>.size))
// 	var devids = Array<AudioDeviceID>(repeating: AudioDeviceID(), count: numDevices)

// 	result = AudioObjectGetPropertyData(
// 		AudioObjectID(kAudioObjectSystemObject),
// 		&address,
// 		0,
// 		nil,
// 		&propSize,
// 		&devids)

// 	if (result != 0) {
// 		print("Error \(result) from AudioObjectGetPropertyData")
// 		return []
// 	}

// 	return (0..<numDevices).compactMap { i in
// 		AudioDevice(deviceID: devids[i])
// 	}

// }

// let devices = findDevices()
// let inputs = devices.filter { !$0.hasOutput }
// let outputs = devices.filter { $0.hasOutput }

// func selectedDevice(output: Bool) -> String? {
// 	var id = AudioObjectID(kAudioObjectSystemObject)
// 	var idSize = UInt32(MemoryLayout.size(ofValue: id))
// 	let selector = output
// 		? kAudioHardwarePropertyDefaultOutputDevice
// 		: kAudioHardwarePropertyDefaultInputDevice

// 	var idPropertyAddress = AudioObjectPropertyAddress(
// 		mSelector: AudioObjectPropertySelector(selector),
// 		mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
// 		mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementMaster))

// 	let result = AudioObjectGetPropertyData(
// 		id,
// 		&idPropertyAddress,
// 		0,
// 		nil,
// 		&idSize,
// 		&id)

// 	if (result != 0) {
// 		return nil
// 	}

// 	return (output ? outputs : inputs).first { $0.audioDeviceID == id }?.name
// }

// let outputDevice = selectedDevice(output: true)
// let inputDevice = selectedDevice(output: false)

// let inputName = inputs
// 	.compactMap(\.name)
// 	.filter { inputDevice == $0 }
// 	.first
// let outputName = outputs
// 	.compactMap(\.name)
// 	.filter { outputDevice == $0 }
// 	.first

// switch (inputName, outputName) {
// case (let inputName?, let outputName?):
// 	print("\(inputName)  |  \(outputName)")
// case (let inputName?, nil):
// 	print("\(inputName)")
// case (nil, let outputName?):
// 	print("\(outputName)")
// case (nil, nil):
// 	print("No devices found")
// }