package com.uav.storm;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.ArrayList;  
import java.util.Date;  
import java.util.List;

import net.sf.json.JSONArray;  
import net.sf.json.JSONObject;  


public class LogLatTop {
    public static void main(String[] args) {
        String sTotalString = "{'id':1,'name':'张三','age':32}";
        try {
        	JSONObject jsonObject = JSONObject.fromObject(sTotalString);
            //JSONArray jsonArray = JSONArray.fromObject(sTotalString);
            //if(jsonArray.size() > 0){
                //for(int i = 0; i < jsonArray.size(); i++){
                    //JSONObject jsonObject = jsonArray.getJSONObject(i);
                    System.out.println(jsonObject.get("id"));
                    System.out.println(jsonObject.get("name"));
                    System.out.println(jsonObject.get("age"));
               // }
            //}
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
