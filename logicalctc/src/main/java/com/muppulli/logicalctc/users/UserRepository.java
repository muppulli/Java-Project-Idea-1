package com.muppulli.logicalctc.users;

import com.muppulli.logicalctc.users.Users;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<Users, Long> {

}
