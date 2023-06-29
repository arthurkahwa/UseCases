package de.chapter.mill.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@Table(name = "tblpost")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "body")
    private String body;

    @Column(name = "userid")
    private Long userid;

    public Post(String title, String body, Long userid) {
        this.title = title;
        this.body = body;
        this.userid = userid;
    }
}
