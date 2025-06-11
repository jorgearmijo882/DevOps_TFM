package com.example.inventory;

import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/products")
// permite peticiones desde tu frontend en http://localhost
@CrossOrigin(origins = "http://localhost")
public class ProductController {
    // tus endpoints GET, POST, etc.
}
