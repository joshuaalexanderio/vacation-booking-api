package com.example.demo.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="customers")
@Getter
@Setter
@NoArgsConstructor
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id", nullable = false)
    private Long id;
    
    @Column(name = "customer_first_name", nullable = false)
    private String firstName;
    
    @Column(name = "customer_last_name", nullable = false)
    private String lastName;
    
    @Column(name = "address", nullable = false)
    private String address;
    
    @Column(name = "postal_code", nullable = false)
    private String postal_code;
    
    @Column(name = "phone", nullable = false)
    private String phone;
    
    @Column(name = "create_date")
    @CreationTimestamp
    private LocalDateTime create_date;
    
    @Column(name = "last_update")
    @UpdateTimestamp
    private LocalDateTime last_update;
    
    @ManyToOne
    @JoinColumn(name = "division_id", nullable = false)
    private Division division;
    
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private Set<Cart> carts;

    public void add(Cart cart) {
        if (cart != null) {
            if (this.carts == null) {
                this.carts = new HashSet<>();
            }
            this.carts.add(cart);
            cart.setCustomer(this);
        }
    }
}
