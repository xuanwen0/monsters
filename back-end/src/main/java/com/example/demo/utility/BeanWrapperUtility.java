package com.example.demo.utility;

import org.apache.commons.lang3.ClassUtils;
import org.springframework.beans.BeanUtils;

import javax.persistence.Transient;
import java.beans.PropertyDescriptor;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

public class BeanWrapperUtility<B> {
    private B bean;
    private Class<?> beanClass;
    private Map<String, Field> fieldMap;
    private Map<String, Method> getterMap;
    private Map<String, Method> setterMap;
    private PropertyDescriptor[] propertyDescriptors;
    private Map<String, PropertyDescriptor> propertyDescriptorMap;

    @SuppressWarnings("unchecked")
    public BeanWrapperUtility(B bean) {
        this.bean = bean;
        this.beanClass = bean.getClass();
        this.getterMap = new HashMap<>();
        this.setterMap = new HashMap<>();
        this.propertyDescriptorMap = new HashMap<>();
        this.propertyDescriptors = BeanUtils.getPropertyDescriptors(beanClass);
        for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
            try {
                Method getter = propertyDescriptor.getReadMethod();
                Method setter = propertyDescriptor.getWriteMethod();
                if (getter != null) {
                    getterMap.put(propertyDescriptor.getName(), beanClass.getDeclaredMethod(propertyDescriptor.getReadMethod().getName()));
                }
                if (setter != null) {
                    setterMap.put(propertyDescriptor.getName(), beanClass.getDeclaredMethod(propertyDescriptor.getWriteMethod().getName(), propertyDescriptor.getPropertyType()));
                }
            } catch (NoSuchMethodException ignore) {

            }
            propertyDescriptorMap.put(propertyDescriptor.getName(), propertyDescriptor);
        }
    }

    public B getBean() {
        return bean;
    }

    public Class getBeanClass() {
        return beanClass;
    }

    public Map<String, Method> getGetterMap() {
        return getterMap;
    }

    public Map<String, Method> getSetterMap() {
        return setterMap;
    }

    public boolean hasProperty(Field field) {
        return hasProperty(field.getName(), field.getType());
    }

    public boolean hasProperty(String propertyName, Class propertyClass) {
        for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
            if (propertyDescriptor.getName().equals(propertyName) && ClassUtils.isAssignable(propertyDescriptor.getPropertyType(), propertyClass)) {
                return true;
            }
        }
        return false;
    }

    public boolean hasPropertyByName(String propertyName) {
        for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
            if (propertyDescriptor.getName().equals(propertyName)) {
                return true;
            }
        }
        return false;
    }

    public Optional<PropertyDescriptor> getProperty(String propertyName) {
        try {
            for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
                if (propertyDescriptor.getName().equals(propertyName)) {
                    return Optional.of(propertyDescriptor);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    public Optional<Method> getGetter(Field field) {
        return getGetter(field.getName());
    }

    public Optional<Method> getGetter(String propertyName) {
        return Optional.ofNullable(getterMap.get(propertyName));
    }

    public Optional<Method> getSetter(Field field) {
        return getSetter(field.getName());
    }

    public Optional<Method> getSetter(String propertyName) {
        return Optional.ofNullable(setterMap.get(propertyName));
    }

    public Object getPropertyValue(Field field) {
        return getPropertyValue(field.getName());
    }

    public Object getPropertyValue(String propertyName) {
        return getPropertyValue(propertyDescriptorMap.get(propertyName));
    }

    public Object getPropertyValue(PropertyDescriptor propertyDescriptor) {
        try {
            return propertyDescriptor.getReadMethod().invoke(bean);
        } catch (Exception ignore) {
        }
        return null;
    }

    public void setPropertyValue(Field field, Object... values) {
        setPropertyValue(field.getName(), values);
    }

    public void setPropertyValue(String propertyValue, Object... values) {
        setPropertyValue(propertyDescriptorMap.get(propertyValue), values);
    }

    public void setPropertyValue(PropertyDescriptor propertyDescriptor, Object... values) {
        try {
            if (propertyDescriptor.getWriteMethod() != null) {
                propertyDescriptor.getWriteMethod().invoke(bean, values);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean propertyHasAnnotation(String propertyName, Class<? extends Annotation> annotationClass) {
        try {
            return propertyHasAnnotation(beanClass.getDeclaredField(propertyName), annotationClass);
        } catch (NoSuchFieldException ignored) {
        }
        return false;
    }

    public boolean propertyHasAnnotation(Field field, Class<? extends Annotation> annotationClass) {
        return field.isAnnotationPresent(annotationClass);
    }

    public boolean methodHasAnnotation(String methodName, Class<? extends Annotation> annotationClass, Class... parameterType) {
        try {
            return methodHasAnnotation(beanClass.getDeclaredMethod(methodName, parameterType), annotationClass);
        } catch (NoSuchMethodException ignored) {
        }
        return false;
    }

    public boolean methodHasAnnotation(Method method, Class<? extends Annotation> annotationClass) {
        return method.isAnnotationPresent(annotationClass);
    }

    public List<PropertyDescriptor> getNotNullFieldList() {
        List<PropertyDescriptor> propertyDescriptorList = new ArrayList<>();
        for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
            try {
                if (!propertyHasAnnotation(propertyDescriptor.getName(), Transient.class) && propertyDescriptor.getReadMethod().invoke(bean) != null) {
                    propertyDescriptorList.add(propertyDescriptor);
                }
            } catch (Exception ignore) {
            }
        }
		return propertyDescriptorList;
	}
}
