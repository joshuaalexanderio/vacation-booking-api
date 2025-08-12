package com.example.demo;

import com.example.demo.dao.CustomerRepository;
import com.example.demo.dao.DivisionRepository;
import com.example.demo.entities.Customer;
import com.example.demo.entities.Division;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class BootstrapData implements CommandLineRunner {

    private final CustomerRepository customerRepository;
    private final DivisionRepository divisionRepository;

    public BootstrapData(CustomerRepository customerRepository, DivisionRepository divisionRepository) {
        this.customerRepository = customerRepository;
        this.divisionRepository = divisionRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        // Check if there are less than or equal to one customer in the database
        List<Customer> existingCustomers = customerRepository.findAll();
        
        if (existingCustomers.size() <= 1) {
            // Get divisions to assign to customers
            Optional<Division> californiaDivision = divisionRepository.findById(4L); // California
            Optional<Division> newYorkDivision = divisionRepository.findById(31L); // New York
            Optional<Division> texasDivision = divisionRepository.findById(42L); // Texas
            Optional<Division> floridaDivision = divisionRepository.findById(9L); // Florida
            Optional<Division> coloradoDivision = divisionRepository.findById(5L); // Colorado
            
            // Create five sample customers
            Customer customer1 = new Customer();
            customer1.setFirstName("Alice");
            customer1.setLastName("Nguyen");
            customer1.setAddress("17 Maple Crescent");
            customer1.setPostal_code("30303");
            customer1.setPhone("555-111-2222");
            if (californiaDivision.isPresent()) {
                customer1.setDivision(californiaDivision.get());
            }
            
            Customer customer2 = new Customer();
            customer2.setFirstName("Carlos");
            customer2.setLastName("Martinez");
            customer2.setAddress("88 Riverbend Drive");
            customer2.setPostal_code("60606");
            customer2.setPhone("555-333-4444");
            if (newYorkDivision.isPresent()) {
                customer2.setDivision(newYorkDivision.get());
            }
            
            Customer customer3 = new Customer();
            customer3.setFirstName("Priya");
            customer3.setLastName("Singh");
            customer3.setAddress("2500 Elmwood Ave");
            customer3.setPostal_code("77077");
            customer3.setPhone("555-555-6666");
            if (texasDivision.isPresent()) {
                customer3.setDivision(texasDivision.get());
            }
            
            Customer customer4 = new Customer();
            customer4.setFirstName("Liam");
            customer4.setLastName("O'Connor");
            customer4.setAddress("42 Ocean View Rd");
            customer4.setPostal_code("33133");
            customer4.setPhone("555-777-8888");
            if (floridaDivision.isPresent()) {
                customer4.setDivision(floridaDivision.get());
            }
            
            Customer customer5 = new Customer();
            customer5.setFirstName("Fatima");
            customer5.setLastName("Al-Farsi");
            customer5.setAddress("900 Summit Lane");
            customer5.setPostal_code("80909");
            customer5.setPhone("555-999-0000");
            if (coloradoDivision.isPresent()) {
                customer5.setDivision(coloradoDivision.get());
            }
            
            // Save all customers
            customerRepository.save(customer1);
            customerRepository.save(customer2);
            customerRepository.save(customer3);
            customerRepository.save(customer4);
            customerRepository.save(customer5);
            
            // Log the results
            List<Customer> allCustomers = customerRepository.findAll();
            System.out.println("Customer Data Loaded");
            System.out.println("Total customers in database: " + allCustomers.size());
            System.out.println("Customer names:");
            for (Customer customer : allCustomers) {
                System.out.println("- " + customer.getFirstName() + " " + customer.getLastName());
            }
        } else {
            // Log existing customer count
            System.out.println("Customer Data Status");
            System.out.println("Total customers in database: " + existingCustomers.size());
            System.out.println("Sample customers already exist, skipping data load.");
        }
    }
} 