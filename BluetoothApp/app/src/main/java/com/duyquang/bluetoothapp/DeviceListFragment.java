package com.duyquang.bluetoothapp;



import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;

import com.duyquang.bluetoothapp.thread.ConnectThread;

import org.parceler.Parcels;

import java.util.ArrayList;
import java.util.Set;


public class DeviceListFragment extends Fragment implements AbsListView.OnItemClickListener{

    private ArrayList <DeviceItem>deviceItemList;
    private static BluetoothAdapter bTAdapter;
    private ConnectThread connectThread;
    private AbsListView mListView;
    private ArrayAdapter<DeviceItem> mAdapter;

    // TODO: Rename and change types of parameters
    public static DeviceListFragment newInstance(BluetoothAdapter adapter) {
        DeviceListFragment fragment = new DeviceListFragment();
        bTAdapter = adapter;
        return fragment;
    }

    public DeviceListFragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d("DEVICELIST", "Super called for DeviceListFragment onCreate\n");
        deviceItemList = new ArrayList<DeviceItem>();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_device_list, container, false);
        Button refreshBtn = (Button) view.findViewById(R.id.refresh);
        mListView = (AbsListView) view.findViewById(android.R.id.list);
        mListView.setOnItemClickListener(this);
        refreshBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                deviceItemList.clear();
                Set<BluetoothDevice> pairedDevices = bTAdapter.getBondedDevices();
                if (pairedDevices.size() > 0) {
                    for (BluetoothDevice device : pairedDevices) {
                        DeviceItem newDevice= new DeviceItem(device.getName(),device.getAddress(),device,"false");
                        deviceItemList.add(newDevice);
                    }
                }

                // If there are no devices, add an item that states so. It will be handled in the view.
                if(deviceItemList.size() == 0) {
                    deviceItemList.add(new DeviceItem("No Devices", "", null,"false"));
                }

                Log.d("DEVICELIST", "DeviceList populated\n");
                mAdapter = new DeviceListAdapter(getActivity(), deviceItemList, bTAdapter);
                Log.d("DEVICELIST", "Adapter created\n");
                ((AdapterView<ListAdapter>) mListView).setAdapter(mAdapter);
            }
        });
        return view;
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {


        connectThread=new ConnectThread();
        Intent i=new Intent(getActivity(),TimeZoneActivity.class);
        i.putExtra("btdevice",Parcels.wrap(deviceItemList.get(position).getBluetoothDevice()));
        startActivity(i);

        Log.d("DEVICELIST", "onItemClick position: " + position +
                " id: " + id + " name: " + deviceItemList.get(position).getDeviceName() + "\n");
    }
}