package com.duyquang.bluetoothapp;

import android.bluetooth.BluetoothDevice;
import android.os.Parcel;
import android.os.Parcelable;

public class DeviceItem implements Parcelable {
    private String deviceName;
    private String address;
    private boolean connected;
    private BluetoothDevice btDevice;

    public BluetoothDevice getBluetoothDevice() {return btDevice;};

    public String getDeviceName() {
        return deviceName;
    }

    public boolean getConnected() {
        return connected;
    }

    public String getAddress() {
        return address;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public DeviceItem(String name, String address,BluetoothDevice btDevice ,String connected){
        this.deviceName = name;
        this.address = address;
        this.btDevice=btDevice;
        if (connected == "true") {
            this.connected = true;
        }
        else {
            this.connected = false;
        }
    }

    protected DeviceItem(Parcel in) {
        deviceName = in.readString();
        address = in.readString();
        connected = in.readByte() != 0x00;
        btDevice = (BluetoothDevice) in.readValue(BluetoothDevice.class.getClassLoader());
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(deviceName);
        dest.writeString(address);
        dest.writeByte((byte) (connected ? 0x01 : 0x00));
        dest.writeValue(btDevice);
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<DeviceItem> CREATOR = new Parcelable.Creator<DeviceItem>() {
        @Override
        public DeviceItem createFromParcel(Parcel in) {
            return new DeviceItem(in);
        }

        @Override
        public DeviceItem[] newArray(int size) {
            return new DeviceItem[size];
        }
    };
}