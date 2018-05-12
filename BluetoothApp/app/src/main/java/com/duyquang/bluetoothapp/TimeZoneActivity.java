package com.duyquang.bluetoothapp;

import android.bluetooth.BluetoothDevice;
import android.os.Bundle;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.app.AppCompatActivity;
import android.widget.AbsListView;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;

import com.duyquang.bluetoothapp.ZoneObject.ListTimeZone;
import com.duyquang.bluetoothapp.thread.ConnectThread;
import com.google.gson.Gson;

import org.parceler.Parcels;

import java.io.IOException;
import java.util.UUID;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class TimeZoneActivity extends AppCompatActivity {
    private static final UUID BTMODULEUUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    private ListView lv;
    private Adapter adapter;
    private SearchView inputSearch;
    private SwipeRefreshLayout swipeContainer;
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

        swipeContainer = findViewById(R.id.swipeContainer);
        swipeContainer.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                OkHttpClient client = new OkHttpClient();
                Request request = new Request.Builder()
                        .url(MainActivity.urlListTimeZone)
                        .build();

                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        runOnUiThread(new Runnable() {
                            public void run() {
                                Toast.makeText(TimeZoneActivity.this,"No Internet Connection",Toast.LENGTH_LONG).show();
                                swipeContainer.setRefreshing(false);
                            }
                        });
                        e.printStackTrace();
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {

                        String rawListTimeZone = response.body().string();
                        Gson gson = new Gson();
                        ListTimeZone listTimeZone = (ListTimeZone) gson.fromJson(rawListTimeZone, ListTimeZone.class);
                        MainActivity.zones =  listTimeZone.getZones();
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                swipeContainer.setRefreshing(false);
                                adapter = new Adapter(TimeZoneActivity.this, MainActivity.zones,connectThread);
                                lv.setAdapter(adapter);
                            }
                        });
                    }
                });
            }
        });

        lv = (ListView) findViewById(R.id.list_view);
        inputSearch = (SearchView) findViewById(R.id.inputSearch);
        inputSearch.setIconified(false);
        inputSearch.requestFocus();

        adapter = new Adapter(TimeZoneActivity.this, MainActivity.zones,connectThread);
        lv.setAdapter(adapter);
        lv.setOnScrollListener(new AbsListView.OnScrollListener()
        {
            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState)
            {

            }

            @Override
            public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount)
            {
                int topRowVerticalPosition = (lv == null || lv.getChildCount() == 0) ? 0 : lv.getChildAt(0).getTop();
                swipeContainer.setEnabled(firstVisibleItem == 0 && topRowVerticalPosition >= 0);
            }
        });

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
