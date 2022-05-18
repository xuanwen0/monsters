package com.example.demo.utility;

import org.apache.commons.lang3.reflect.MethodUtils;

import javax.persistence.*;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class VOWrapperUtility<V> extends BeanWrapperUtility<V> {
    public VOWrapperUtility(V bean) {
        super(bean);
    }

    public List<Field> getPrimaryKey() {
        return Arrays.stream(getBeanClass().getDeclaredFields()).filter((Field field) -> {
            try {
                return isPrimaryKey(field);
            } catch (Exception ignore) {
            }
            return false;
        }).collect(Collectors.toList());
    }

    public List<Field> getJoinColumn() {
        return Arrays.stream(getBeanClass().getDeclaredFields()).filter((Field field) -> {
            try {
                return isJoinColumn(field);
            } catch (Exception ignore) {
            }
            return false;
        }).collect(Collectors.toList());
    }

    public Optional<Field> getJoinColumnByPostName(String postName) {
        for (Field field : getJoinColumn()) {
            if (field.getName().endsWith(postName)) {
                return Optional.of(field);
            }
        }
        return Optional.empty();
    }

    public boolean isPrimaryKey(Field field) throws Exception {
        return isPrimaryKey(field.getName());
    }

    public boolean isPrimaryKey(String propertyName) throws Exception {
        Optional<Method> optional = getGetter(propertyName);
        if (optional.isPresent()) {
            Method getter = optional.get();
            return methodHasAnnotation(getter, Id.class);
        } else {
            return false;
        }
    }

    public boolean isBasicColumn(Field field) throws Exception {
        return isBasicColumn(field.getName());
    }

    public boolean isBasicColumn(String propertyName) throws Exception {
        Optional<Method> optional = getGetter(propertyName);
        if (optional.isPresent()) {
            Method getter = optional.get();
            boolean isBasic = methodHasAnnotation(getter, Basic.class);
            boolean isColumn = methodHasAnnotation(getter, Column.class);
            return isBasic || isColumn;
        } else {
            return false;
        }
    }

    public boolean isJoinColumn(Field field) throws Exception {
        return isJoinColumn(field.getName());
    }

    public boolean isJoinColumn(String propertyName) throws Exception {
        Optional<Method> optional = getGetter(propertyName);
        if (optional.isPresent()) {
            Method getter = optional.get();
            boolean isOneToOne = methodHasAnnotation(getter, OneToOne.class);
            boolean isManyToOne = methodHasAnnotation(getter, ManyToOne.class);
            return isOneToOne || isManyToOne;
        } else {
            return false;
        }
    }

    public List<PropertyDescriptor> getColumns() throws Exception {
        List<PropertyDescriptor> methodList = new ArrayList<>();
        MethodUtils
                .getMethodsListWithAnnotation(getBeanClass(), Column.class)
                .stream()
                .map(BeanUtility::getPropertyNameByGetter)
                .map(super::getProperty)
                .filter(Optional::isPresent)
                .map(Optional::get)
                .forEach(methodList::add);
        MethodUtils
                .getMethodsListWithAnnotation(getBeanClass(), JoinColumn.class)
                .stream()
                .map(BeanUtility::getPropertyNameByGetter)
                .map(super::getProperty)
                .filter(Optional::isPresent)
                .map(Optional::get)
                .forEach(methodList::add);
        MethodUtils
                .getMethodsListWithAnnotation(getBeanClass(), JoinColumns.class)
                .stream()
                .map(BeanUtility::getPropertyNameByGetter)
                .map(super::getProperty)
                .filter(Optional::isPresent)
                .map(Optional::get)
                .forEach(methodList::add);
        return methodList;
    }
}
