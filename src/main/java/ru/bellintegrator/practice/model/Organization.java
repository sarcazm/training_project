package ru.bellintegrator.practice.model;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "Organization")
@Data
public class Organization {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    @Column(name = "full_name", nullable = false, length = 50)
    private String fullName;
    @Column(name = "inn", nullable = false, length = 10)
    private String inn;
    @Column(name = "kpp", nullable = false, length = 9)
    private String kpp;
    @Column(name = "address", nullable = false, length = 100)
    private String address;
    @Column(name = "phone", nullable = false, length = 10)
    private String phone;
    @Column(name = "is_active")
    private Boolean isActive;

    @OneToMany(mappedBy = "organization", fetch = FetchType.LAZY,cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Office> offices = new ArrayList<>();



    public Organization() {
    }
}
