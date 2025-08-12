package com.example.demo.services;

import com.example.demo.entities.Cart;
import com.example.demo.entities.CartItem;
import com.example.demo.entities.Customer;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
public class Purchase {
    private Customer customer;
    private Cart cart;
    private Set<CartItem> CartItem;
    
    private Set<CartItem> cartItems;
    
    public Set<CartItem> getCartItem() {
        return CartItem != null ? CartItem : cartItems;
    }
    
    public void setCartItem(Set<CartItem> cartItem) {
        this.CartItem = cartItem;
        this.cartItems = cartItem; 
    }
    
    public Set<CartItem> getCartItems() {
        return cartItems != null ? cartItems : CartItem;
    }
    
    public void setCartItems(Set<CartItem> cartItems) {
        this.cartItems = cartItems;
        this.CartItem = cartItems; 
    }
}
