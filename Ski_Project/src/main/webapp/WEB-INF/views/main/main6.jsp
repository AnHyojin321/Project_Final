<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>3D Ski Slope Preview</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #f4f4f4;
      color: #333;
    }
	
    header {
      width: 100%;
      padding: 20px;
      background-color: #1e90ff;
      color: white;
      text-align: center;
    }

    header h1 {
      margin: 0;
      font-size: 2em;
    }

    main {
      padding: 20px;
      text-align: center;
    }

    .sketchfab-embed-wrapper {
      position: relative;
      width: 100%;
      max-width: 800px;
      margin: 20px auto;
      border: 5px solid #1e90ff;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .sketchfab-embed-wrapper iframe {
      width: 100%;
      height: 400px;
      pointer-events: none; /* 마우스 및 터치 이벤트 차단 */
    }

    .info-section {
      margin-top: 20px;
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 10px;
      padding: 20px;
      max-width: 800px;
      margin-left: auto;
      margin-right: auto;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .info-section h2 {
      color: #1e90ff;
      margin-bottom: 10px;
    }

    .info-section p {
      margin: 10px 0;
      line-height: 1.6;
    }

    .btn-wrapper {
      margin-top: 20px;
    }

    .btn {
      display: inline-block;
      background-color: #1e90ff;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #1c86ee;
    }

    footer {
      margin-top: 30px;
      padding: 10px 0;
      background-color: #1e90ff;
      color: white;
      text-align: center;
    }
  </style>
</head>
<body>
  <!-- 메인 콘텐츠 -->
  <main>
    <!-- Sketchfab Viewer -->
    <div class="sketchfab-embed-wrapper">
      <iframe 
        title="Suomu 3D Ski Map" 
        frameborder="0" 
        allowfullscreen 
        mozallowfullscreen="true" 
        webkitallowfullscreen="true" 
        allow="autoplay; fullscreen; xr-spatial-tracking" 
        src="https://sketchfab.com/models/eda3654190284752acac047f881b5acb/embed?autostart=1&annotations_visible=0&annotation_cycle=4&transparent=1&ui_hint=0">
      </iframe>
    </div>

    <!-- 추가 정보 -->
    <div class="info-section">
      <h2>About This Ski Slope</h2>
      <p>
        Explore the 3D visualization of the Suomu Ski Resort slopes. This map allows you to preview the slopes, analyze routes, and plan your skiing adventure.
      </p>
      <p>
        Our interactive 3D viewer makes it easy to navigate and explore the terrain in detail. Get ready for an unforgettable experience on the slopes!
      </p>
    </div>
  </main>


</body>
</html>
