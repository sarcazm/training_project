package ru.bellintegrator.practice.model.user;

import lombok.Data;
import ru.bellintegrator.practice.model.userdoc.UserDoc;
import ru.bellintegrator.practice.model.country.Country;
import ru.bellintegrator.practice.model.office.Office;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "User")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    /**
     * Служебное поле hibernate
     */
    @Version
    private Integer version;
    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;
    @Column(name = "second_name", nullable = false, length = 50)
    private String secondName;
    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;
    @Column(name = "middle_name", nullable = false, length = 50)
    private String middleName;
    @Column(name = "position", nullable = false, length = 50)
    private String position;
    @Column(name = "phone", nullable = false, length = 10)
    private String phone;
    @Column(name = "is_identified", nullable = false)
    private Boolean isIdentified;


    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "office_id")
    private Office office;

    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "country_id")
    private Country country;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserDoc> userDocs = new ArrayList<>();

}
