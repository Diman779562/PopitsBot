package ru.neoflex.PopitsBot.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ru.neoflex.PopitsBot.model.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByChatId(long id);
}
