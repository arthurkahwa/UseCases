package de.chapter.mill.service;

import de.chapter.mill.dataTransferObject.PostDataTransferObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class PostService implements PostServiceInterface {
    @Override
    public ResponseEntity save(PostDataTransferObject postDataTransferObject) {
        return null;
    }

    @Override
    public ResponseEntity update(Long id, PostDataTransferObject postDataTransferObject) {
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
