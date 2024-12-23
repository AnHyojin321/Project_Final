package com.kh.ski.management.model.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class WeatherService {

    private final String API_URL = "https://api.openweathermap.org/data/2.5/forecast";
    private final String API_KEY = "8d4d7d5c9b577b0a766194424087c55f"; // OpenWeatherMap에서 발급받은 API 키

    // API 호출 메서드
    public String getWeather(String city) {
        String url = String.format("%s?q=%s&appid=%s&units=metric&lang=kr", API_URL, city, API_KEY);

        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url, String.class);
    }

    // JSON 데이터 파싱 및 날짜 순으로 5일간의 날씨 데이터 추출
    public List<Map<String, String>> parseWeatherData(String jsonData) {
        List<Map<String, String>> weatherList = new ArrayList<>();
        Set<String> dates = new HashSet<>();  // 중복을 피하기 위한 Set

        try {
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(jsonData);
            JSONArray list = (JSONArray) jsonObject.get("list");

            // 날짜 순으로 데이터를 정리하기 위한 Map
            Map<String, Map<String, String>> dayWeatherMap = new LinkedHashMap<>();

            // 데이터를 날짜별로 그룹화
            for (Object obj : list) {
                JSONObject item = (JSONObject) obj;
                String dateTime = (String) item.get("dt_txt");
                String date = dateTime.split(" ")[0]; // 날짜만 추출

                if (!dates.contains(date)) {
                    dates.add(date); // 중복된 날짜 제외
                    // 날짜를 LocalDate로 변환
                    LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                    DayOfWeek dayOfWeek = localDate.getDayOfWeek(); // 요일 정보 추출
                    String day = getKoreanDayOfWeek(dayOfWeek); // 한글 요일로 변환

                    // 한 날짜에 대한 데이터를 계산하여 저장
                    JSONObject main = (JSONObject) item.get("main");
                    double minTemp = convertToDouble(main.get("temp_min"));
                    double maxTemp = convertToDouble(main.get("temp_max"));
                    JSONArray weatherArray = (JSONArray) item.get("weather");
                    String description = (String) ((JSONObject) weatherArray.get(0)).get("description");

                    // 날짜별 날씨 정보 저장
                    Map<String, String> weatherData = new HashMap<>();
                    weatherData.put("date", date);
                    weatherData.put("day", day);
                    weatherData.put("description", description);
                    weatherData.put("minTemp", String.format("%.1f", minTemp));
                    weatherData.put("maxTemp", String.format("%.1f", maxTemp));

                    dayWeatherMap.put(date, weatherData);
                }

                // 5일만 추출하도록 조건 설정
                if (dayWeatherMap.size() >= 5) {
                    break; // 5일 이후의 데이터는 더 이상 처리하지 않음
                }
            }

            // Map의 날짜 순으로 정렬된 데이터 List로 변환
            weatherList.addAll(dayWeatherMap.values());
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return weatherList;
    }

    // 요일을 한글로 변환하는 메서드
    private String getKoreanDayOfWeek(DayOfWeek dayOfWeek) {
        switch (dayOfWeek) {
            case MONDAY: return "월요일";
            case TUESDAY: return "화요일";
            case WEDNESDAY: return "수요일";
            case THURSDAY: return "목요일";
            case FRIDAY: return "금요일";
            case SATURDAY: return "토요일";
            case SUNDAY: return "일요일";
            default: throw new IllegalArgumentException("Invalid DayOfWeek: " + dayOfWeek);
        }
    }

    // Object 타입 데이터를 Double로 변환하는 유틸리티 메서드
    private double convertToDouble(Object value) {
        if (value instanceof Number) {
            return ((Number) value).doubleValue();
        }
        throw new IllegalArgumentException("Value is not a valid number: " + value);
    }

}