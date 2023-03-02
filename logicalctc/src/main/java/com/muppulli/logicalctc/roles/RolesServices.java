package com.muppulli.logicalctc.roles;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RolesServices {

    private final RolesRepository rolesRepository;

    @Autowired
    public RolesServices(RolesRepository rolesRepository) {
        this.rolesRepository = rolesRepository;
    }

    public List<Roles> getRoles() {
        return rolesRepository.findAll();
    }
}
