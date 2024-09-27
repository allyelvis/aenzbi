import React, { useState, useEffect } from 'react';
import { View, Text, Button } from 'react-native';
import BleManager from 'react-native-ble-manager';

const App = () => {
  const [voltage, setVoltage] = useState(0);

  useEffect(() => {
    BleManager.start({ showAlert: false });

    // Discover and connect to the BLE device
    BleManager.scan([], 5, true).then(() => {
      console.log('Scanning...');
    });

    // Handle device connection and data subscription here...
    const handleDiscoverPeripheral = (peripheral) => {
      console.log('Discovered:', peripheral);
      BleManager.connect(peripheral.id).then(() => {
        console.log('Connected to:', peripheral.id);

        // Subscribe to a characteristic to get voltage updates
        BleManager.retrieveServices(peripheral.id).then((peripheralInfo) => {
          BleManager.startNotification(peripheral.id, 'SERVICE_UUID', 'CHARACTERISTIC_UUID').then(() => {
            console.log('Started notification on:', peripheral.id);
          });
        });
      });
    };

    // Listen for peripheral discoveries
    BleManagerEmitter.addListener('BleManagerDiscoverPeripheral', handleDiscoverPeripheral);

    return () => {
      // Cleanup listeners
      BleManagerEmitter.removeListener('BleManagerDiscoverPeripheral', handleDiscoverPeripheral);
    };
  }, []);

  return (
    <View>
      <Text>Current Voltage: {voltage} volts</Text>
      <Button title="Increase Voltage" onPress={() => {/* Send voltage regulation command */}} />
      <Button title="Decrease Voltage" onPress={() => {/* Send voltage regulation command */}} />
    </View>
  );
};

export default App;
