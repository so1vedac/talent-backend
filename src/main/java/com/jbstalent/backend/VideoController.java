package com.jbstalent.backend;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
import java.util.HashMap;

@RestController
public class VideoController {

    @GetMapping("/api/hero-video")
    public Map<String, String> getHeroVideo() {
        Map<String, String> data = new HashMap<>();
        // 무료 고화질 코딩 관련 영상 (Pexels)
        data.put("title", "동아리 재능 - 코딩의 시작");
        data.put("url", "https://www.youtube.com/watch?v=XEHCLuYAmBg&t=2s");
        return data;
    }
}