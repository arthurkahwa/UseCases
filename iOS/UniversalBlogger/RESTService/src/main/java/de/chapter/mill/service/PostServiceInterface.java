package de.chapter.mill.service;

import de.chapter.mill.dataTransferObject.PostDataTransferObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public interface PostServiceInterface {
    public ResponseEntity save(PostDataTransferObject postDataTransferObject);
    public ResponseEntity update(Long id, PostDataTransferObject postDataTransferObject);
    public ResponseEntity delete(Long id);
    public ResponseEntity getAll();
    public ResponseEntity findById(Long id);
    public ResponseEntity deleteAll();
}
