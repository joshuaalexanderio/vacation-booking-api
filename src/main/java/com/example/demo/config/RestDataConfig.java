package com.example.demo.config;

import com.example.demo.entities.*;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Configuration
public class RestDataConfig implements RepositoryRestConfigurer {

    /**
     * This method exposes standard rest api end points for the following classes:
     * Country
     * Customer
     * Division
     * Excursion
     * Vacation
     * Cart
     * CartItem
     * Set page configuration parameters
     *
     * @param config
     * @param cors
     */
    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config, CorsRegistry cors) {
        config.exposeIdsFor(Country.class);
        config.exposeIdsFor(Customer.class);
        config.exposeIdsFor(Division.class);
        config.exposeIdsFor(Excursion.class);
        config.exposeIdsFor(Vacation.class);
        config.exposeIdsFor(Cart.class);
        config.exposeIdsFor(CartItem.class);
        config.setDefaultPageSize(20);
        config.setMaxPageSize(100)


    }
}

