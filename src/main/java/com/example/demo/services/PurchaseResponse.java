package com.example.demo.services;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseResponse {
    private final String orderTrackingNumber;

    // Success constructor
    public PurchaseResponse(String orderTrackingNumber) {
        this.orderTrackingNumber = orderTrackingNumber;
    }

    // Error constructor - returns error message as tracking number
    public PurchaseResponse(String errorMessage, boolean isError) {
        this.orderTrackingNumber = errorMessage;
    }
}
