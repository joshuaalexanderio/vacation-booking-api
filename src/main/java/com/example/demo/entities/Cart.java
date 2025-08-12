package com.example.demo.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="carts")

// Known bug with @Data with ManyOne/OneMany relationships
@Getter
@Setter

public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id")
    private Long id;

    @Column(name = "order_tracking_number")
    private String orderTrackingNumber;
    
    @Column(name = "Package_Price")
    private BigDecimal package_price;
    
    @Column(name = "party_size")
    private int party_size;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private StatusType status;
    
    @Column(name = "create_date")
    @CreationTimestamp
    private LocalDateTime create_date;

    @Column(name = "last_update")
    @UpdateTimestamp
    private LocalDateTime last_update;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;
    
    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL)
    private Set<CartItem> cartItem;

    public Cart() {
    }
    public void add(CartItem cartItem) {
        if (cartItem != null) {
            if (this.cartItem == null) {
                this.cartItem = new HashSet<>();
            }
            this.cartItem.add(cartItem);
            cartItem.setCart(this);
        }
    }
}
