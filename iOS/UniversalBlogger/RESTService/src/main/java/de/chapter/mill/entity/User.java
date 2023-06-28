package de.chapter.mill.entity;

import jakarta.persistence.*;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Entity
@lombok.Data
@NoArgsConstructor
@Table(name = "tblUser")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "userName")
    private String userName;

    @Column(name = "email")
    private String email;

    public User(String userName, String email) {
        this.userName = userName;
        this.email = email;
    }
}
