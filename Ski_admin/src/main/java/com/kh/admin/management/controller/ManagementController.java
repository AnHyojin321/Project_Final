package com.kh.admin.management.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.admin.management.model.service.ManagementService;
import com.kh.admin.management.model.service.WeatherService;
import com.kh.admin.management.model.vo.SkiResortOpen;
import com.kh.admin.management.model.vo.SlopeOpen;

@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService managementService;

	@Autowired
    private WeatherService weatherService;

    
	@GetMapping("skiResortUpdate.sm")
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
	    mv.setViewName("management/skiResortUpdate");
	    return mv;
	}

	
	@GetMapping("slopeUpdate.sm")
	public ModelAndView selectSlope(ModelAndView mv) {
		
		ArrayList<SlopeOpen> list = managementService.selectSlope();
		mv.addObject("list", list).setViewName("management/slopeUpdate");
		return mv;
	}
	
	@RequestMapping(value="skiResortUpdateControl.sm", method={RequestMethod.GET, RequestMethod.POST})
	public String updateSkiResort(SkiResortOpen sro) {
	    int result = managementService.updateSkiResort(sro);
	    return "redirect:/skiResortUpdate.sm";
	}
	
	@RequestMapping(value = "slopeUpdateControl.sm", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateSlope(@RequestParam Map<String, String> paramMap, Model model, HttpSession session) {
	    ArrayList<SlopeOpen> slopeList = new ArrayList<>();

	    // 인덱스를 기반으로 객체를 수동으로 생성
	    int index = 0;
	    while (paramMap.containsKey("so[" + index + "].slopeNo")) {
	        SlopeOpen slope = new SlopeOpen();
	        slope.setSlopeNo(Integer.parseInt(paramMap.get("so[" + index + "].slopeNo")));
	        slope.setSlopeName(paramMap.get("so[" + index + "].slopeName"));
	        slope.setSlopeLevel(paramMap.get("so[" + index + "].slopeLevel"));
	        slope.setSlopeIsOpen(paramMap.get("so[" + index + "].slopeIsOpen"));
	        slope.setSlopeNote(paramMap.get("so[" + index + "].slopeNote"));

	        slopeList.add(slope);
	        index++;
	    }

	    // 서비스 호출하여 업데이트 실행
	    int result = managementService.updateSlope(slopeList);
	    
	    if(result > 0) {
	    	session.setAttribute("alertMsg", "슬로프 오픈 상태 변경 완료");
	    }

	    model.addAttribute("updatedList", slopeList);
	    return "redirect:/slopeUpdate.sm";
	}

	
}
