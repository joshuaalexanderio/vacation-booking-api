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
@Table(name="vacations")
@Getter
@Setter
public class Vacation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vacation_id")
    private Long id;
    
    @Column(name = "vacation_title")
    private String vacation_title;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "travel_fare_price")
    private BigDecimal travel_price;
    
    @Column(name = "image_url")
    private String image_URL;
    
    @Column(name = "create_date")
    @CreationTimestamp
    private LocalDateTime create_date;
    
    @Column(name = "last_update")
    @UpdateTimestamp
    private LocalDateTime last_update;
    
    @OneToMany(mappedBy = "vacation", cascade = CascadeType.ALL)
    private Set<Excursion> excursions;
    
    @OneToMany(mappedBy = "vacation", cascade = CascadeType.ALL)
    private Set<CartItem> cartItems;

    public Vacation(){}

}
