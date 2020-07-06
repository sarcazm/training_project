package ru.bellintegrator.practice.model;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.time.LocalDate;

public class User {
    @Temporal(TemporalType.DATE)
    LocalDate date;
}
