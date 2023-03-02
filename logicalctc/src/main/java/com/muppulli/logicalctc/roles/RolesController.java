package com.muppulli.logicalctc.roles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/roles")
public class RolesController {
    private final RolesServices rolesServices;

    @Autowired
    public RolesController(RolesServices rolesServices) {
        this.rolesServices = rolesServices;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<Roles>> GetUsers() {
        return new ResponseEntity<>(rolesServices.getRoles(), HttpStatus.OK);
    }
}
