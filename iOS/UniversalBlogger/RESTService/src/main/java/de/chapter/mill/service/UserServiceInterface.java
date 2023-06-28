package de.chapter.mill.service;

import de.chapter.mill.dataTransferObject.UserDataTransferObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public interface UserServiceInterface {
    public ResponseEntity save(UserDataTransferObject userDataTransferObject);
    public ResponseEntity update(Long id, UserDataTransferObject userDataTransferObject);
    public ResponseEntity delete(Long id);
    public ResponseEntity getAll();
    public ResponseEntity findById(Long id);
    public ResponseEntity deleteAll();
}
