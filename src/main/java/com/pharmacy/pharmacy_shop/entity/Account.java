package com.pharmacy.pharmacy_shop.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Entity
@Table(name = "account")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Account {
    @Id
    private String id;

    @NotNull(message = "Username is required")
    @Column(nullable = false, length = 100)
    private String username;

    @NotNull(message = "Password is required")
    @Column(nullable = false, length = 100)
    private String password;

    @NotNull(message = "Type is required")
    @Column(nullable = false, length = 10)
    private String type; // 'admin' hoặc 'custom'
}

