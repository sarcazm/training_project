package ru.bellintegrator.practice.service;

import ru.bellintegrator.practice.model.Organization;

import java.util.List;

public interface OrganizationService {
    /**
     * Получить список организаций
     *
     * @return {@Organization}
     */
    List<Organization> all();
}
