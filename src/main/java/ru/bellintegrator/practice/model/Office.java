package ru.bellintegrator.practice.model;

import lombok.Data;

import javax.persistence.*;


@Entity
@Table(name = "Office")
@Data
public class Office {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, length = 50)
    private String name;
    @Column(name = "address", nullable = false, length = 100)
    private String address;
    @Column(name = "phone", nullable = false, length = 10)
    private String phone;
    @Column(name = "is_active")
    private Boolean isActive;

    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "organization_id")
    private Organization organization;

    public Office() {
    }
}
