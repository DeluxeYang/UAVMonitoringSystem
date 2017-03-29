package com.uav.log;

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

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;
  
import org.apache.commons.dbutils.BasicRowProcessor;  
import org.apache.commons.dbutils.QueryRunner;  
import org.apache.commons.dbutils.handlers.ArrayListHandler;  
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import storm.kafka.BrokerHosts;
import storm.kafka.KafkaSpout;
import storm.kafka.SpoutConfig;
import storm.kafka.StringScheme;
import storm.kafka.ZkHosts;

import backtype.storm.Config;
import backtype.storm.LocalCluster;
import backtype.storm.StormSubmitter;

import backtype.storm.generated.AlreadyAliveException;
import backtype.storm.generated.InvalidTopologyException;

import backtype.storm.spout.SchemeAsMultiScheme;

import backtype.storm.task.OutputCollector;
import backtype.storm.task.TopologyContext;

import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.topology.TopologyBuilder;
import backtype.storm.topology.BasicOutputCollector;

import backtype.storm.topology.base.BaseRichBolt;
import backtype.storm.topology.base.BaseBasicBolt;

import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Tuple;
import backtype.storm.tuple.Values;


public class LonLatTop {
//******************************************************************************
    public static class UAVJsonParse extends BaseRichBolt {

        private static final Log LOG = LogFactory.getLog(UAVJsonParse.class);

        private OutputCollector collector;
        
        public void prepare(Map stormConf, TopologyContext context,
                    OutputCollector collector) {
            this.collector = collector;    
        }

        public void execute(Tuple input) {
            try {
                String data = input.getString(0);
                LOG.warn("******获取原始数据：******" + data);
                JSONObject jsonObject = JSONObject.fromObject(data);//解析获得的json数据
                collector.emit(new Values(jsonObject.get("ID"),jsonObject.get("lng"),jsonObject.get("lat"),jsonObject.get("time")));
                collector.ack(input);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public void declareOutputFields(OutputFieldsDeclarer declarer) {
            declarer.declare(new Fields("user_id", "lng", "lat", "time"));
        }
    }
//******************************************************************************
    public static class MysqlBolt extends BaseRichBolt{

        private static final Log LOG = LogFactory.getLog(MysqlBolt.class);
        private OutputCollector collector;
        Connection conn = null;
        String table = "test";//数据表

        public void declareOutputFields(OutputFieldsDeclarer arg0){
            //TODO
        }

        public void prepare(Map conf,TopologyContext context,OutputCollector collector){
            //TODO
            this.collector = collector;
            try{
                LinkDB();//连接数据库
            }catch(InstantiationException e){
                e.printStackTrace();
            }catch(IllegalAccessException e){
                e.printStackTrace();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }

        public void LinkDB() throws InstantiationException,IllegalAccessException,SQLException{
            String host_port = "192.168.1.1:3306";
            String database = "test";//数据库
            String username = "root";
            String password = "123456";
            String url = "jdbc:mysql://"+host_port+"/"+database;
            try{
                LOG.warn("LinkDB******" + url);
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url,username,password);
            }catch(ClassNotFoundException e ){
                e.printStackTrace();
            }
        }

        public void execute(Tuple tuple){
            int user_ID = tuple.getInteger(0);
            double lng = tuple.getDouble(1);
            double lat = tuple.getDouble(2);
            String time = tuple.getString(3);
            InsertDB(user_ID, lng, lat, time);//插入数据
        }

        public void InsertDB(int user_ID, double lng, double lat, String time){
            String sql = "insert into "+this.table+"(user_id, lng, lat, time)value("+user_ID+","+lng+","+lat+",'"+time+"')";
            LOG.warn("InsertDB******" + sql);
            try{
                Statement st = conn.createStatement();
                st.executeUpdate(sql);
            }catch(SQLException e){
                e.printStackTrace();
            }
        }   
    }
//******************************************************************************
    public static void main(String[] args) throws AlreadyAliveException, InvalidTopologyException, InterruptedException {
        String zks = "node2:2181,node3:2181,node4:2181";
        String topic = "uav-lng-lat-topic";
        String zkRoot = ""; // default zookeeper root configuration for storm
        String id = "uav";

        BrokerHosts brokerHosts = new ZkHosts(zks);
        SpoutConfig spoutConf = new SpoutConfig(brokerHosts, topic, zkRoot, id);
        spoutConf.scheme = new SchemeAsMultiScheme(new StringScheme());
        spoutConf.forceFromStart = false;
        spoutConf.zkServers = Arrays.asList(new String[] {"node2", "node3", "node4"});
        spoutConf.zkPort = 2181;

        TopologyBuilder builder = new TopologyBuilder();
        builder.setSpout("kafka-reader", new KafkaSpout(spoutConf), 5); // Kafka我们创建了一个5分区的Topic，这里并行度设置为5
        builder.setBolt("UAVJsonParse", new UAVJsonParse(), 2).shuffleGrouping("kafka-reader");
        builder.setBolt("Mysql",new MysqlBolt()).fieldsGrouping("UAVJsonParse",new Fields("user_id", "lng", "lat", "time"));

        Config conf = new Config();

        String name = LonLatTop.class.getSimpleName();
        if (args != null && args.length > 0) {
            // Nimbus host name passed from command line
            conf.put(Config.NIMBUS_HOST, args[0]);//在导入时
            conf.setNumWorkers(3);
            StormSubmitter.submitTopologyWithProgressBar(name, conf, builder.createTopology());
        } else {
            conf.setMaxTaskParallelism(3);
            LocalCluster cluster = new LocalCluster();
            cluster.submitTopology(name, conf, builder.createTopology());
            Thread.sleep(60000);
            cluster.shutdown();
        }
    }
}