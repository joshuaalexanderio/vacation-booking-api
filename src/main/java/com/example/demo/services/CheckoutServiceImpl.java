package com.example.demo.services;

import com.example.demo.entities.Cart;
import com.example.demo.entities.CartItem;
import com.example.demo.entities.Customer;
import com.example.demo.entities.Division;
import com.example.demo.dao.CustomerRepository;
import com.example.demo.dao.DivisionRepository;
import jakarta.transaction.Transactional;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.UUID;

@NoArgsConstructor
@Service
public class CheckoutServiceImpl implements CheckoutService{

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private DivisionRepository divisionRepository;

    @Override
    @Transactional
    public PurchaseResponse placeOrder(Purchase purchase) {
        try {
            
            if (purchase == null) {
                throw new IllegalArgumentException("Purchase cannot be null");
            }
            
            
            Cart cart = purchase.getCart();
            
            
            if (cart == null) {
                return new PurchaseResponse("ERROR: Your cart is empty. Please add items before placing an order.", false);
            }
            
            Set<CartItem> cartItems = purchase.getCartItem();
            
            if (cartItems == null) {
                return new PurchaseResponse("ERROR: Your cart is empty. Please add items before placing an order.", false);
            }
            
            if (cartItems.isEmpty()) {
                return new PurchaseResponse("ERROR: Your cart is empty. Please add items before placing an order.", false);
            }
            
            String orderTrackingNumber = generateOrderTrackingNumber();
            
            cart.setOrderTrackingNumber(orderTrackingNumber);
            
            Customer customer = purchase.getCustomer();
            if (customer != null) {
                if (customer.getDivision() == null) {
                    Division defaultDivision = divisionRepository.findAll().stream()
                        .findFirst()
                        .orElseThrow(() -> new RuntimeException("No divisions found"));
                    customer.setDivision(defaultDivision);
                }
            }
            
            // Add cart items to cart
            for (CartItem item : cartItems) {
                cart.add(item);
            }
            
            // Add cart to customer
            if (customer != null) {
                customer.add(cart);
                // Save the customer and cascade to cart and cart items
                customerRepository.save(customer);
            }
            
            // Create the response
            PurchaseResponse purchaseResponse = new PurchaseResponse(orderTrackingNumber);
            
            return purchaseResponse;
            
        } catch (Exception e) {
            throw new RuntimeException("Failed to process purchase: " + e.getMessage(), e);
        }
    }

    private String generateOrderTrackingNumber() {
        // Generate random UUID number (UUID version-4)
        return UUID.randomUUID().toString();
    }
}
