package de.chapter.mill.dataTransferObject;

import de.chapter.mill.entity.User;
import lombok.Builder;

import java.util.ArrayList;
import java.util.List;

@lombok.Data
@Builder
public class UserDataTransferObject {
    Long id;
    String userName;
    String email;

    public List<UserDataTransferObject> listOf(List<User> entityList) {
        List<UserDataTransferObject> result = new ArrayList<>();

        for (User entity : entityList) {
            result.add(simgleDTO(entity));
        }

        return result;
    }

    public UserDataTransferObject simgleDTO(User entity) {
        return UserDataTransferObject.builder()
                .id(entity.getId())
                .email(entity.getEmail())
                .userName(entity.getUserName())
                .build();
    }
}
