package org.youcode.maska.service;

import java.util.List;
import java.util.Optional;

public interface CrudInterface<T> {
    T save(T t);
    T update(T t);
    T delete(T t);
    Optional<T> findById(Long id);
    List<T> findAll();
}
