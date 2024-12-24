package com.kh.ski.management.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ski.management.model.service.ManagementService;
import com.kh.ski.management.model.service.WeatherService;
import com.kh.ski.management.model.vo.SkiResortOpen;
import com.kh.ski.management.model.vo.SlopeOpen;

@Controller
public class ManagementController {

	@Autowired
	private ManagementService managementService;

	@Autowired
    private WeatherService weatherService;
	
	@GetMapping("search.map")
	public String myPage() {
		return "management/mapView";
	}
	
	
	
	@GetMapping("slopeOpen.sm")
	public ModelAndView selectSlope(ModelAndView mv) {
	    ArrayList<SlopeOpen> list = managementService.selectSlope();

	    // 난이도별로 행 개수를 계산
	    Map<String, Long> levelCounts = list.stream()
	        .collect(Collectors.groupingBy(SlopeOpen::getSlopeLevel, Collectors.counting()));

	    mv.addObject("list", list);
	    mv.addObject("levelCounts", levelCounts); // 난이도별 행 개수 전달
	    mv.setViewName("management/slopeOpen");
	    return mv;
	}

	
	@GetMapping("widget.sm")
	public ModelAndView selectSkiResort(ModelAndView mv) {
	    String city = "Seoul"; // 예시 도시
	    String weatherData = weatherService.getWeather(city);

	    List<Map<String, String>> weatherList = weatherService.parseWeatherData(weatherData);
	    ArrayList<SkiResortOpen> list = managementService.selectSkiResort();

	    // 병합 리스트 생성
	    ArrayList<Map<String, Object>> slopeIsOpenList = new ArrayList<>();
	    for (int i = 0; i < list.size() && i < weatherList.size(); i++) {
	        SkiResortOpen resort = list.get(i);
	        Map<String, String> weather = weatherList.get(i);

	        // 병합 객체 생성
	        Map<String, Object> combined = new HashMap<>();
	        combined.put("skiResortIsOpen", resort.getSkiResortIsOpen());
	        combined.put("skiResortOpenNo", resort.getSkiResortOpenNo());
	        combined.put("date", weather.get("date"));
	        combined.put("day", weather.get("day"));
	        combined.put("maxTemp", weather.get("maxTemp"));
	        combined.put("minTemp", weather.get("minTemp"));
	        combined.put("description", weather.get("description"));

	        slopeIsOpenList.add(combined);
	    }

	    mv.addObject("slopeIsOpenList", slopeIsOpenList);
	    mv.setViewName("management/widget");
	    return mv;
	}
	
}
