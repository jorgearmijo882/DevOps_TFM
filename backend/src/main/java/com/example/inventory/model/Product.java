package com.example.inventory.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "products")
public class Product {
    
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String product;          // nombre del producto

    @Column(nullable = false)
    private Integer quantity;        // cantidad

    @Column(nullable = false, precision = 10, scale = 2)
    private Double value;            // valor

    @Column(nullable = false)
    private String category;         // categoría

    @Column(name = "entry_date", nullable = false)
    private LocalDate entryDate;     // fecha de ingreso

    public Product() { }

    public Product(String product, Integer quantity, Double value, String category, LocalDate entryDate) {
        this.product = product;
        this.quantity = quantity;
        this.value = value;
        this.category = category;
        this.entryDate = entryDate;
    }

    // getters y setters ...

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getProduct() { return product; }
    public void setProduct(String product) { this.product = product; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Double getValue() { return value; }
    public void setValue(Double value) { this.value = value; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public LocalDate getEntryDate() { return entryDate; }
    public void setEntryDate(LocalDate entryDate) { this.entryDate = entryDate; }
}
