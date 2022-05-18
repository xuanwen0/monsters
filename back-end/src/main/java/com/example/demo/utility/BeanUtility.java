package com.example.demo.utility;

import org.apache.commons.lang3.StringUtils;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import java.beans.PropertyDescriptor;
import java.lang.reflect.*;
import java.util.List;
import java.util.Optional;

public class BeanUtility {
	private static final String BY = "By";
	private static final String FOR = "For";

	private BeanUtility() {

	}

	public static String getPropertyNameByGetter(Method method) {
		String methodName = method.getName();
		if (methodName.startsWith("is")) {
			return getPropertyNameByBooleanGetter(method);
		} else {
			return getPropertyNameByGetterOrSetter(method);
		}
	}

	public static String getPropertyNameByBooleanGetter(Method method) {
		String methodName = method.getName();
		return changeFirstCharacterToLowerCase(methodName.substring(2));
	}

	public static String changeFirstCharacterToLowerCase(String string) {
		StringBuilder builder = new StringBuilder(string.length());
		char[] chars = string.toCharArray();
		chars[0] = Character.toLowerCase(chars[0]);
		builder.append(chars);
		return builder.toString();
	}

	public static String getPropertyNameByGetterOrSetter(Method method) {
		String methodName = method.getName();
		return changeFirstCharacterToLowerCase(methodName.substring(3));
	}

	public static String changeFirstCharacterToUpperCase(String string) {
		StringBuilder builder = new StringBuilder(string.length());
		char[] chars = string.toCharArray();
		chars[0] = Character.toUpperCase(chars[0]);
		builder.append(chars);
		return builder.toString();
	}

	@SuppressWarnings("unchecked")
	public static void copyProperties(Object from, Object to) {
		if (from instanceof List && to instanceof List) {
			List fromList = (List) from;
			List toList = (List) to;
			if (fromList.size() > toList.size()) {
				Class<?> listClass = (Class<?>) ((ParameterizedType) to.getClass().getGenericSuperclass())
						.getActualTypeArguments()[0];
				try {
					Constructor constructor = listClass.getConstructor();
					for (int k = 0; k < fromList.size() - toList.size(); k = k + 1) {
						Object object = constructor.newInstance();
						toList.add(object);
					}
				} catch (InstantiationException | IllegalAccessException | InvocationTargetException
						| NoSuchMethodException ignore) {

				}
			}
			for (int k = 0; k < fromList.size(); k = k + 1) {
				copyProperties(fromList.get(k), toList.get(k));
			}
		} else {
			VOWrapperUtility<Object> wrapperByFrom = new VOWrapperUtility<>(from);
			VOWrapperUtility<Object> wrapperByTo = new VOWrapperUtility<>(to);

			for (PropertyDescriptor propertyDescriptor : wrapperByFrom.getNotNullFieldList()) {
				Object value = wrapperByFrom.getPropertyValue(propertyDescriptor.getName());
				try {
					Optional<Field> joinColumnOptional;
					if (wrapperByTo.hasProperty(propertyDescriptor.getName(), propertyDescriptor.getPropertyType())) {
						wrapperByTo.setPropertyValue(propertyDescriptor.getName(), value);
					} else if (wrapperByFrom.isJoinColumn(propertyDescriptor.getName())) {
						String variableName = propertyDescriptor.getName().contains("By")
								? propertyDescriptor.getName().split("By")[1]
								: changeFirstCharacterToUpperCase(propertyDescriptor.getName());
						String ref = null;
						Optional<Method> optionalMethod = wrapperByFrom.getGetter(propertyDescriptor.getName());
						if (optionalMethod.isPresent()) {
							Method method = optionalMethod.get();
							if (method.isAnnotationPresent(JoinColumn.class)) {
								JoinColumn joinColumn = method.getAnnotation(JoinColumn.class);
								ref = joinColumn.referencedColumnName();
							}
						}
						VOWrapperUtility<Object> wrapperByNotNullField = new VOWrapperUtility<>(value);
						for (PropertyDescriptor voNotNullField : wrapperByNotNullField.getNotNullFieldList()) {
							String propertyName = voNotNullField.getName() + "For" + variableName;
							Optional<Method> optional = wrapperByNotNullField.getGetter(voNotNullField.getName());
							if (wrapperByTo.hasProperty(propertyName, voNotNullField.getPropertyType())) {
								wrapperByTo.setPropertyValue(propertyName,
										wrapperByNotNullField.getPropertyValue(voNotNullField));
							} else if (optional.isPresent() && StringUtils.isNotBlank(ref)) {
								Method getter = optional.get();
								Column column = getter.getAnnotation(Column.class);
								if (column != null && ref.equals(column.name())) {
									String toVariableName = changeFirstCharacterToLowerCase(variableName);
									if (wrapperByTo.hasProperty(toVariableName, voNotNullField.getPropertyType())) {
										wrapperByTo.setPropertyValue(toVariableName,
												wrapperByNotNullField.getPropertyValue(voNotNullField));
									}
								}
							}
						}
					} else if ((joinColumnOptional = wrapperByTo.getJoinColumnByPostName(
							BY + changeFirstCharacterToUpperCase(propertyDescriptor.getName()))).isPresent()
							|| (joinColumnOptional = wrapperByTo.getJoinColumnByPostName(propertyDescriptor.getName()))
									.isPresent()) {
						Field joinColumn = joinColumnOptional.get();
						Optional<Method> optionalMethod = wrapperByTo.getGetter(joinColumn);
						if (optionalMethod.isPresent()) {
							Method joinColumnGetter = optionalMethod.get();
							if (wrapperByTo.getPropertyValue(joinColumn) == null) {
								wrapperByTo.setPropertyValue(joinColumn,
										joinColumn.getType().getConstructor().newInstance());
							}
							JoinColumn joinColumnAnnotation = joinColumnGetter.getDeclaredAnnotation(JoinColumn.class);
							VOWrapperUtility<Object> wrapperByJoinColumn = new VOWrapperUtility<>(
									wrapperByTo.getPropertyValue(joinColumn));
							for (PropertyDescriptor descriptor : wrapperByJoinColumn.getColumns()) {
								Method columnGetter = descriptor.getReadMethod();
								Column columnAnnotation = columnGetter.getDeclaredAnnotation(Column.class);
								if (columnAnnotation.name().equals(joinColumnAnnotation.referencedColumnName())) {
									wrapperByJoinColumn.setPropertyValue(descriptor, value);
									wrapperByTo.setPropertyValue(joinColumn, wrapperByJoinColumn.getBean());
									break;
								}
							}
						}
					} else if (propertyDescriptor.getName().contains(FOR)) {
						String[] nameArray = new String[2];
						String fieldName = propertyDescriptor.getName();
						nameArray[0] = fieldName.substring(fieldName.lastIndexOf(FOR) + FOR.length());
						nameArray[1] = fieldName.substring(0, fieldName.lastIndexOf(FOR));
						nameArray[1] = changeFirstCharacterToLowerCase(nameArray[1]);
						Optional<Field> joinColumnByPostName = wrapperByTo.getJoinColumnByPostName(nameArray[0]);
						if (joinColumnByPostName.isPresent()) {
							Field field = joinColumnByPostName.get();
							Object joinColumnValue = wrapperByTo.getPropertyValue(field);
							if (joinColumnValue == null) {
								joinColumnValue = field.getType().getConstructor().newInstance();
							}
							VOWrapperUtility<Object> wrapperByJoinColumn = new VOWrapperUtility<>(joinColumnValue);
							wrapperByJoinColumn.setPropertyValue(nameArray[1], value);
							wrapperByTo.setPropertyValue(field, joinColumnValue);
						}
					}
				} catch (Exception ignore) {
				}
			}
		}
	}
}