package com.example.demo;


import java.util.Map;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.geo.Circle;
import org.springframework.data.geo.Distance;
import org.springframework.data.geo.GeoResult;
import org.springframework.data.geo.GeoResults;
import org.springframework.data.geo.Point;
import org.springframework.data.redis.connection.RedisGeoCommands;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.domain.geo.Metrics;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

	@RequestMapping(value={"/test"})
	public String MngMain(Model model) {
		
		System.out.println("test");
		
//		testStrings();
//		testHash();
		
		model.addAttribute("list",georadius());
		
        return "index";

    }
    
	@RequestMapping(value={"/position"})
	public String position() {
		
		System.out.println("position");
		
        return "position";

    }

	@RequestMapping(value={"/storage"})
	public String storage() {
		
		System.out.println("storage");
		
        return "storage";

    }
	
    void testStrings() {
        // given
        ValueOperations<String, String> valueOperations = redisTemplate.opsForValue();
        String key = "stringKey";

        // when
        valueOperations.set(key, "hello");

        // then
        String value = valueOperations.get(key);
        System.out.println(value);
    }
    

    void testHash() {
        // given
        HashOperations<String, Object, Object> hashOperations = redisTemplate.opsForHash();
        String key = "hashKey";

        // when
        //hashOperations.put(key, "hello", "world");
        hashOperations.put(key, "hello", "world");

        // then
        Object value = hashOperations.get(key, "hello");
        System.out.println(value);


        Map<Object, Object> entries = hashOperations.entries(key);
        System.out.println(entries);

        Long size = hashOperations.size(key);
        System.out.println(size);
    }
    
//    void testgeo() {
//    	
//        // given
//    	GeoResults a = redisTemplate.opsForGeo().geoRadius("hanageo", new Circle(127.0, 36.0, 1000));
    
    
    /**
 * 4. 주어진 위도와 경도에 따라 지정된 범위의 위치 찾기
     */
    public  GeoResults<RedisGeoCommands.GeoLocation<String>> georadius(){
        //위치 지정
        Point point = new Point(127.5,  36.5);
        //빌드 조건 -10km
        Distance distance = new Distance(10, Metrics.KILOMETERS);
        Circle circle = new Circle(point,distance);
        // redisgeo 명령
        RedisGeoCommands.GeoRadiusCommandArgs args = RedisGeoCommands.GeoRadiusCommandArgs.newGeoRadiusArgs();
         // 위치 정보를 포함
        args.includeDistance();

        // 조회된 URL 위치 정보를 저장합니다.
        GeoResults<RedisGeoCommands.GeoLocation<String>> outlets = redisTemplate.boundGeoOps("hanageo").radius(circle, args);
        
        
        
        
        
        
        for (GeoResult<RedisGeoCommands.GeoLocation<String>> outlet : outlets) {
            //거리 정보 얻기
            Distance outletdistance = outlet.getDistance();
            //거리
            double value = outletdistance.getValue();
            //단위
            String unit = outletdistance.getUnit();
            
            System.out.println(" | unit : " + outletdistance +" | value : " + value + " | name :" + outlet.getContent().getName());
        }
        System.out.println(outlets.getContent().size());
        System.out.println(Stream.of(1,5,3,267,843,32,45).sorted().toList());
        return outlets;
    }
	
}
