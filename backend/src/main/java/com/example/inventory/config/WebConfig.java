package com.example.inventory.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {
  @Override
  public void addCorsMappings(CorsRegistry registry) {
    registry
      .addMapping("/api/**")
      .allowedOrigins("http://localhost")
      .allowedMethods("GET","POST","PUT","DELETE","OPTIONS")
      .allowCredentials(true);
  }
}
