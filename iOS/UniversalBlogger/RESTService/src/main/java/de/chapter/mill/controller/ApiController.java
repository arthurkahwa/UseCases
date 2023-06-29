package de.chapter.mill.controller;

import de.chapter.mill.entity.User;
import de.chapter.mill.repository.PostRepository;
import de.chapter.mill.repository.UserRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

// @CrossOrigin(origins = "http://localhost:8080")
@RestController
@RequestMapping("/api")
public class ApiController {
    private static final Logger LOGGER = LogManager.getLogger(ApiController.class.getName());

    @Autowired
    UserRepository userRepository;

    @Autowired
    PostRepository postRepository;

    @GetMapping("user/{id}")
    public ResponseEntity<User> getUserById(@PathVariable("id") Long id) {
        LOGGER.trace("Get User by Id");

        try {
            Optional<User> user = userRepository.findById(id);

            return user.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                    .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
        }
        catch (Exception exception) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("users")
    public ResponseEntity<List<User>> getAllUsers() {
        LOGGER.trace("Get all users");
         try {
             List<User> userList = new ArrayList<>(userRepository.findAll());

             if (userList.isEmpty()) {
                 return new ResponseEntity<>(HttpStatus.NO_CONTENT);
             }

             return new ResponseEntity<>(userList, HttpStatus.OK);
         }
         catch (Exception exception) {
             return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
         }
    }

    @PostMapping("user")
    public ResponseEntity<User> createSingleUser(@RequestBody User user) {
        try {
            User _user = userRepository
                    .save(new User(user.getUsername(), user.getEmail()));
            return new ResponseEntity<>(_user, HttpStatus.OK);
        }
        catch (Exception exception) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("users")
    public ResponseEntity<List<User>> createMultipleUsers(@RequestBody List<User> inputUsers) {
        LOGGER.trace("Create a group of users");
        try {
            List<User> createdUserList = userRepository.saveAll(inputUsers);

            return new ResponseEntity<>(createdUserList, HttpStatus.OK);
        }
        catch (Exception exception) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
