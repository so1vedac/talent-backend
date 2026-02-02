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
        
        data.put("title", "동아리 재능 - 메인 영상");
        // 앞에 '/'를 붙여야 public 폴더에서 찾습니다.
        data.put("url", "/main.mp4"); 
        
        return data;
    }
}
