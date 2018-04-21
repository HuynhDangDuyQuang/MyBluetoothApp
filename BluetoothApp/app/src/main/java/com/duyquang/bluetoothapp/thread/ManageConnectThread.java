package com.duyquang.bluetoothapp.thread;

import android.bluetooth.BluetoothSocket;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * Created by FRAMGIA\nguyen.thanh.cong on 23/09/2015.
 */
public class ManageConnectThread {

    public ManageConnectThread() { }

    public void sendData(BluetoothSocket socket, String data) {
        try {

            ByteArrayOutputStream output = new ByteArrayOutputStream(8);
            OutputStream outputStream = socket.getOutputStream();
            for(int c:data.toCharArray()){
                output.write(c);
            }

            outputStream.write(output.toByteArray());
        }
        catch (IOException e) {}
    }

    public int receiveData(BluetoothSocket socket) throws IOException {
        byte[] buffer = new byte[4];
        ByteArrayInputStream input = new ByteArrayInputStream(buffer);
        InputStream inputStream = socket.getInputStream();
        inputStream.read(buffer);
        return input.read();
    }
}

