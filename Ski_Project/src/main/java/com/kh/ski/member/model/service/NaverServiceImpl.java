package com.kh.ski.member.model.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.kh.ski.member.model.vo.NaverUserInfo;

@Service
public class NaverServiceImpl implements NaverService {

    private static final String CLIENT_ID = ""; // 네이버 Client ID
    private static final String CLIENT_SECRET = ""; // 네이버 Client Secret
    private static final String REDIRECT_URI = "http://localhost:8090/ski/naver/callback"; // Redirect URI

    @Override
    public String getAccessToken(String code) {
        String accessToken = null;

        try {
            URL url = new URL("https://nid.naver.com/oauth2.0/token");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // 요청 파라미터 설정
            String params = "grant_type=authorization_code" +
                            "&client_id=" + CLIENT_ID +
                            "&client_secret=" + CLIENT_SECRET +
                            "&redirect_uri=" + REDIRECT_URI +
                            "&code=" + code;

            OutputStream os = conn.getOutputStream();
            os.write(params.getBytes());
            os.flush();
            os.close();

            // 응답 데이터 읽기
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) { // 성공
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                // JSON 파싱
                JSONObject json = new JSONObject(response.toString());
                accessToken = json.getString("access_token");
                System.out.println("Access Token: " + accessToken); // 디버깅용
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.err.println("Access Token 요청 실패: " + errorResponse.toString());
            }

        } catch (Exception e) {
            System.err.println("Access Token 요청 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return accessToken;
    }

    @Override
    public NaverUserInfo getUserInfo(String accessToken) {
        NaverUserInfo naverUserInfo = null;

        try {
            URL url = new URL("https://openapi.naver.com/v1/nid/me");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            // 응답 데이터 읽기
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) { // 성공
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                // JSON 파싱
                JSONObject json = new JSONObject(response.toString());
                JSONObject responseObj = json.getJSONObject("response");

                String id = responseObj.getString("id");
                String nickname = responseObj.optString("nickname", "닉네임 없음");
                String email = responseObj.optString("email", "이메일 없음");
                String mobile = responseObj.optString("mobile", "전화번호 없음");

                // 생년월일 생성
                String birthYear = responseObj.optString("birthyear", "1900");
                String birthday = responseObj.optString("birthday", "01-01").replace("-", "");
                String birthDate = birthYear + birthday; // YYYYMMDD 형식

                // NaverUserInfo 객체 생성
                naverUserInfo = new NaverUserInfo(id, nickname, email, mobile, birthDate);
                System.out.println("Naver User Info: " + naverUserInfo); // 디버깅용
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.err.println("사용자 정보 요청 실패: " + errorResponse.toString());
            }

        } catch (Exception e) {
            System.err.println("사용자 정보 요청 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return naverUserInfo;
    }
}
