package com.muppulli.logicalctc.users;


import jakarta.persistence.*;

@Entity
@Table(name = "USERS")
public class Users {
    @Id
//    @SequenceGenerator(name = "users_sequence",
//            sequenceName = "users_sequence",
//            allocationSize = 1)
//    @GeneratedValue(strategy = GenerationType.SEQUENCE,
//            generator = "users_sequence")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Users() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Users(Long id, String firstName, String lastName, int role, int rank) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.role = role;
    }

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private int role;
}
