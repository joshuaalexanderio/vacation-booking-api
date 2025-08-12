package com.example.demo.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="excursions")
@Getter
@Setter
public class Excursion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "excursion_id")
    private Long id;
    
    @Column(name = "excursion_title")
    private String excursion_title;
    
    @Column(name = "excursion_price")
    private BigDecimal excursion_price;
    
    @Column(name = "image_url")
    private String image_URL;
    
    @Column(name = "create_date")
    @CreationTimestamp
    private LocalDateTime create_date;
    
    @Column(name = "last_update")
    @UpdateTimestamp
    private LocalDateTime last_update;
    
    @ManyToOne
    @JoinColumn(name = "vacation_id", nullable = false)
    private Vacation vacation;
    
    @ManyToMany(mappedBy = "excursions")
    private Set<CartItem> cartItems;

    public Excursion() {
    }
}
