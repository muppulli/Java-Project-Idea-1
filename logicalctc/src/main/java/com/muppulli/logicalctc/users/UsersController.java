package com.muppulli.logicalctc.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/")
public class UsersController {
    private final UserServices userService;

    @Autowired
    public UsersController(UserServices userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public ResponseEntity<List<Users>> GetUsers() {
        return new ResponseEntity<>(userService.getUsers(), HttpStatus.OK);
    }
}