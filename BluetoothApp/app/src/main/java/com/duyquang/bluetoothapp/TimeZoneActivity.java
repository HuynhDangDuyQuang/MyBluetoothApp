package com.duyquang.bluetoothapp;

import android.bluetooth.BluetoothDevice;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;

import com.duyquang.bluetoothapp.thread.ConnectThread;

import org.parceler.Parcels;

import java.util.UUID;

public class TimeZoneActivity extends AppCompatActivity {
    private static final UUID BTMODULEUUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    private ListView lv;
    private Adapter adapter;
    private SearchView inputSearch;
    ConnectThread connectThread;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_time_zone);
        BluetoothDevice btDevice=(BluetoothDevice) Parcels.unwrap(getIntent().getParcelableExtra("btdevice"));
        connectThread=new ConnectThread();
        if(!connectThread.connect(btDevice,BTMODULEUUID)){
            Toast.makeText(this,"Connection failed",Toast.LENGTH_SHORT).show();
            finish();
        }

        lv = (ListView) findViewById(R.id.list_view);
        inputSearch = (SearchView) findViewById(R.id.inputSearch);

        adapter = new Adapter(TimeZoneActivity.this, MainActivity.zones,connectThread);
        lv.setAdapter(adapter);

        inputSearch.setOnQueryTextListener(new SearchView.OnQueryTextListener() {

            @Override
            public boolean onQueryTextSubmit(String arg0) {
                // TODO Auto-generated method stub
                return false;
            }

            @Override
            public boolean onQueryTextChange(String query) {
                // TODO Auto-generated method stub

                adapter.getFilter().filter(query);

                return false;
            }
        });
    }

    @Override
    protected void onPause(){
        super.onPause();
        connectThread.cancel();
    }
}
