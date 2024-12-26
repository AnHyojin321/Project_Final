package com.kh.ski.pack.model.service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import javax.imageio.ImageIO;
import org.springframework.stereotype.Service;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;

@Service
public class BarcodeService {

    public String generateBarcodeFile(String data, String filePath) throws Exception {
        int width = 300;
        int height = 100;

        // ZXing 라이브러리 설정
        Hashtable<EncodeHintType, Object> hintMap = new Hashtable<>();
        hintMap.put(EncodeHintType.MARGIN, 1); // 여백 설정

        // 바코드 생성
        MultiFormatWriter writer = new MultiFormatWriter();
        BitMatrix bitMatrix = writer.encode(data, BarcodeFormat.CODE_128, width, height, hintMap);

        // 비트맵을 이미지로 변환
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        image.createGraphics();
        Graphics2D graphics = (Graphics2D) image.getGraphics();
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, width, height);
        graphics.setColor(Color.BLACK);

        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                if (bitMatrix.get(x, y)) {
                    image.setRGB(x, y, Color.BLACK.getRGB());
                }
            }
        }

        // 바코드 이미지를 파일로 저장
        File outputFile = new File(filePath);
        ImageIO.write(image, "PNG", outputFile);

        // 저장된 파일 경로 반환
        return outputFile.getAbsolutePath();
    }
}
