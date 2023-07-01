package de.chapter.mill.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * User Entity
 * Represents the <strong>tblPost</strong> database table
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tblpost")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "userid")
    private Long userId;

    @Column(name = "title")
    private String title;

    @Column(name = "body")
    private String body;
}
