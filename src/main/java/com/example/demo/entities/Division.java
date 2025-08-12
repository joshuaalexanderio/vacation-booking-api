package com.example.demo.entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Set;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="divisions")
@Getter
@Setter
@NoArgsConstructor
public class Division {
    
    @JsonProperty("division_name")
    @Column(name = "division")
    private String division_name;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "division_id")
    private Long id;

    @Column(name = "create_date")
    @CreationTimestamp
    private LocalDateTime create_date;
    
    @Column(name = "last_update")
    @UpdateTimestamp
    private LocalDateTime last_update;

    @Column(name = "country_id")
    private Long country_id;
    public void setCountry(Country country) {
        setCountry_id(country.getId());
        this.country = country;
    }
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country_id", nullable = false, insertable = false, updatable = false)
    private Country country;
    
    @OneToMany(mappedBy = "division", cascade = CascadeType.ALL)
    private Set<Customer> customers;

    public Division(String url) {
        String divisionId = url.substring(url.lastIndexOf('/') + 1);
        this.id=Long.parseLong(divisionId);
    }
}
