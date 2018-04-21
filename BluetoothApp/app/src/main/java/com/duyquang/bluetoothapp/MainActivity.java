package com.duyquang.bluetoothapp;

import android.bluetooth.BluetoothAdapter;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;

import com.duyquang.bluetoothapp.ZoneObject.ListTimeZone;
import com.duyquang.bluetoothapp.ZoneObject.Zone;
import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {

    private DeviceListFragment mDeviceListFragment;
    public BluetoothAdapter BTAdapter;
    public int REQUEST_BLUETOOTH = 1;

    final String urlListTimeZone="http://api.timezonedb.com/v2/list-time-zone?key=N8MBHD3NY0ZM&format=json";
    public static List<Zone> zones=new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list);
        BTAdapter = BluetoothAdapter.getDefaultAdapter();

        if (!BTAdapter.isEnabled()) {
            Intent enableBT = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
            startActivityForResult(enableBT, REQUEST_BLUETOOTH);
        }

        new Thread(new Runnable() {
            @Override
            public void run() {
                OkHttpClient client = new OkHttpClient();
                Request request = new Request.Builder()
                        .url(urlListTimeZone)
                        .build();

                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        e.printStackTrace();
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {

                        String rawListTimeZone = response.body().string();
                        Gson gson = new Gson();
                        ListTimeZone listTimeZone = (ListTimeZone) gson.fromJson(rawListTimeZone, ListTimeZone.class);
                        zones =  listTimeZone.getZones();
                    }
                });
            }
        }).start();

        FragmentManager fragmentManager = getSupportFragmentManager();
        mDeviceListFragment = DeviceListFragment.newInstance(BTAdapter);
        fragmentManager.beginTransaction().replace(R.id.container, mDeviceListFragment).commit();
    }
}
