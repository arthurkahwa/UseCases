//
//  BluetoothViewModel.swift
//  List-BlueTooth-Devices
//
//  Created by Arthur Nsereko Kahwa on 9/5/23.
//

import Foundation
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject {
    var centralManager: CBCentralManager?
    @Published var peripheralSet: Set<CBPeripheral> = []
    
    override init() {
        super.init()
        
        centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        peripheralSet.insert(peripheral)
    }
}
