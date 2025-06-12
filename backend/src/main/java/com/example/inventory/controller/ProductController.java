package com.example.inventory.controller;

import com.example.inventory.model.Product;
import com.example.inventory.repository.ProductRepository;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;
import java.util.List;

@RestController
@RequestMapping("/api/products")
@CrossOrigin(origins = "http://localhost")
public class ProductController {

    private final ProductRepository repo;

    public ProductController(ProductRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<Product> listAll() {
        return repo.findAll();
    }

    @PostMapping
    public Product create(@RequestBody Product product) {
        return repo.save(product);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        repo.deleteById(id);
    }

    @PutMapping("/{id}")
    public Product update(@PathVariable Long id, @RequestBody Product p) {
        return repo.findById(id)
            .map(existing -> {
                existing.setProduct(p.getProduct());
                existing.setQuantity(p.getQuantity());
                existing.setValue(p.getValue());
                existing.setCategory(p.getCategory());
                existing.setEntryDate(p.getEntryDate());
                return repo.save(existing);
            })
            .orElseThrow(() -> new ResponseStatusException(
                  HttpStatus.NOT_FOUND, "Producto no encontrado"));
    }
}
