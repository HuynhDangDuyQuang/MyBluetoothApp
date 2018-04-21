package com.duyquang.bluetoothapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;
import android.widget.Toast;

import com.duyquang.bluetoothapp.ZoneObject.Time;
import com.duyquang.bluetoothapp.ZoneObject.Zone;
import com.duyquang.bluetoothapp.thread.ConnectThread;
import com.duyquang.bluetoothapp.thread.ManageConnectThread;
import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class Adapter extends BaseAdapter implements Filterable {

    Context mContext;
    List<Zone> zones;
    CustomFilter filter;
    List<Zone> filterList;
    ConnectThread connectThread;
    String urlGetTime="http://api.timezonedb.com/v2/get-time-zone?key=N8MBHD3NY0ZM&format=json&by=zone&fields=formatted&zone=";

    public Adapter(Context ctx, List<Zone> zones, ConnectThread connectThread) {
        // TODO Auto-generated constructor stub

        this.mContext=ctx;
        this.zones=zones;
        this.filterList=zones;
        this.connectThread=connectThread;
    }

    @Override
    public int getCount() {
        // TODO Auto-generated method stub
        return zones.size();
    }

    @Override
    public Object getItem(int pos) {
        // TODO Auto-generated method stub
        return zones.get(pos);
    }

    @Override
    public long getItemId(int pos) {
        // TODO Auto-generated method stub
        return zones.indexOf(getItem(pos));
    }

    boolean isSent=true;
    @Override
    public View getView(final int pos, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        final Zone iZone=zones.get(pos);
        LayoutInflater inflater=(LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        if(convertView==null)
        {
            convertView=inflater.inflate(R.layout.list_item, parent,false);
        }
        TextView countryName=(TextView) convertView.findViewById(R.id.country_name);
        TextView zoneName=(TextView) convertView.findViewById(R.id.zone_name);
        TextView gmtOffset=(TextView) convertView.findViewById(R.id.gmt_offset);

        countryName.setText(iZone.getCountryName());
        zoneName.setText(iZone.getZoneName());
        final int utc=(int)(iZone.getGmtOffset()/3600);
        gmtOffset.setText("UTC "+((utc>=0)?("+"):(""))+utc);

        convertView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                OkHttpClient client = new OkHttpClient();
                Request request = new Request.Builder()
                        .url(urlGetTime+iZone.getZoneName())
                        .build();

                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {

                        e.printStackTrace();
                        isSent=false;
                    }

                    @Override
                    public void onResponse(Call call, Response response) throws IOException {

                        String rawListTimeZone = response.body().string();
                        Gson gson = new Gson();
                        Time time = (Time) gson.fromJson(rawListTimeZone, Time.class);

                        ManageConnectThread manageConnectThread=new ManageConnectThread();
                        manageConnectThread.sendData(connectThread.getbTSocket(),new StringBuffer(" "+time.getFormatted()).reverse().toString()+"/"+iZone.getCountryCode()+" "+"UTC"+((utc>=0)?("+"):(""))+utc+"/");
                        isSent=true;

                    }
                });
                if(isSent) Toast.makeText(mContext,"sent successfully",Toast.LENGTH_SHORT).show();
                else Toast.makeText(mContext,"sent failed",Toast.LENGTH_SHORT).show();
            }
        });

        return convertView;
    }

    @Override
    public Filter getFilter() {
        // TODO Auto-generated method stub
        if(filter == null)
        {
            filter=new CustomFilter();
        }

        return filter;
    }

    //INNER CLASS
    class CustomFilter extends Filter
    {

        @Override
        protected FilterResults performFiltering(CharSequence constraint) {
            // TODO Auto-generated method stub

            FilterResults results=new FilterResults();

            if(constraint != null && constraint.length()>0)
            {
                constraint=constraint.toString().toUpperCase();

                List<Zone> filters=new ArrayList<Zone>();
                for(int i=0;i<filterList.size();i++)
                {
                    if(filterList.get(i).getCountryName().toUpperCase().contains(constraint))
                    {
                        Zone z=new Zone(filterList.get(i).getCountryCode(), filterList.get(i).getCountryName(),
                                filterList.get(i).getZoneName(),filterList.get(i).getGmtOffset(),
                                filterList.get(i).getTimestamp());

                        filters.add(z);
                    }
                }

                results.count=filters.size();
                results.values=filters;

            }else
            {
                results.count=filterList.size();
                results.values=filterList;

            }

            return results;
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            // TODO Auto-generated method stub

            zones=(List<Zone>) results.values;
            notifyDataSetChanged();
        }

    }

}