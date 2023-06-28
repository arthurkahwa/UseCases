package de.chapter.mill.dataTransferObject;

import de.chapter.mill.entity.Post;
import lombok.Builder;

import java.util.ArrayList;
import java.util.List;

@lombok.Data
@Builder
public class PostDataTransferObject {
    Long id;
    String title;
    String body;
    Long userId;

    public List<PostDataTransferObject> listOf(List<Post> entityList) {
        List<PostDataTransferObject> result = new ArrayList<>();

        for (Post entity : entityList) {
            result.add(singleEntity(entity));
        }

        return result;
    }
    public PostDataTransferObject singleEntity(Post entity) {
        return PostDataTransferObject.builder()
                .id(entity.getId())
                .title(entity.getTitle())
                .body(entity.getBody())
                .userId(entity.getUserId())
                .build();
    }
}
