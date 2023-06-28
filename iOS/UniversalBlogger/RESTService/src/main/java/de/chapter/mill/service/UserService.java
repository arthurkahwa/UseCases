package de.chapter.mill.service;

import de.chapter.mill.dataTransferObject.UserDataTransferObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceInterface {
    @Override
    public ResponseEntity save(UserDataTransferObject userDataTransferObject) {
        return null;
    }

    @Override
    public ResponseEntity update(Long id, UserDataTransferObject userDataTransferObject) {
        return null;
    }

    @Override
    public ResponseEntity delete(Long id) {
        return null;
    }

    @Override
    public ResponseEntity getAll() {
        return null;
    }

    @Override
    public ResponseEntity findById(Long id) {
        return null;
    }

    @Override
    public ResponseEntity deleteAll() {
        return null;
    }
}
