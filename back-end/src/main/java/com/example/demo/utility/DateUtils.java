package com.example.demo.utility;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;

public final class DateUtils {

    private DateUtils() {

    }

    /**
     * 取得傳入日期該週的星期一
     *
     * @param dateTime 日期時間
     * @return 星期一
     * @since 1.0.0
     */
    public static LocalDateTime getMonday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.MONDAY);
    }

    /**
     * 取得傳入日期該週的指定星期
     *
     * @param dateTime 日期時間
     * @param week     星期幾
     * @return 星期一
     * @since 1.0.0
     */
    public static LocalDateTime getWeek(LocalDateTime dateTime, DayOfWeek week) {
        return LocalDateTime.of(getWeek(dateTime.toLocalDate(), week), dateTime.toLocalTime());
    }

    /**
     * 取得傳入日期該週的星期一
     *
     * @param date 日期
     * @return 星期一
     * @since 1.0.0
     */
    public static LocalDate getMonday(LocalDate date) {
        return getWeek(date, DayOfWeek.MONDAY);
    }

    /**
     * 取得傳入日期時間該週的指定星期
     *
     * @param date 日期
     * @param week 星期幾
     * @return 星期
     * @since 1.0.0
     */
    public static LocalDate getWeek(LocalDate date, DayOfWeek week) {
        return date.plusDays(week.getValue() - date.getDayOfWeek().getValue());
    }

    /**
     * 取得傳入日期該週的星期二
     *
     * @param dateTime 日期時間
     * @return 星期二
     * @since 1.0.0
     */
    public static LocalDateTime getTuesday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.TUESDAY);
    }

    /**
     * 取得傳入日期該週的星期二
     *
     * @param date 日期
     * @return 星期二
     * @since 1.0.0
     */
    public static LocalDate getTuesday(LocalDate date) {
        return getWeek(date, DayOfWeek.TUESDAY);
    }

    /**
     * 取得傳入日期該週的星期三
     *
     * @param dateTime 日期時間
     * @return 星期三
     * @since 1.0.0
     */
    public static LocalDateTime getWednesday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.WEDNESDAY);
    }

    /**
     * 取得傳入日期該週的星期三
     *
     * @param date 日期
     * @return 星期三
     * @since 1.0.0
     */
    public static LocalDate getWednesday(LocalDate date) {
        return getWeek(date, DayOfWeek.WEDNESDAY);
    }

    /**
     * 取得傳入日期該週的星期四
     *
     * @param dateTime 日期時間
     * @return 星期四
     * @since 1.0.0
     */
    public static LocalDateTime getThursday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.THURSDAY);
    }

    /**
     * 取得傳入日期該週的星期四
     *
     * @param date 日期
     * @return 星期四
     * @since 1.0.0
     */
    public static LocalDate getThursday(LocalDate date) {
        return getWeek(date, DayOfWeek.THURSDAY);
    }

    /**
     * 取得傳入日期該週的星期五
     *
     * @param dateTime 日期時間
     * @return 星期五
     * @since 1.0.0
     */
    public static LocalDateTime getFriday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.FRIDAY);
    }

    /**
     * 取得傳入日期該週的星期五
     *
     * @param date 日期
     * @return 星期五
     * @since 1.0.0
     */
    public static LocalDate getFriday(LocalDate date) {
        return getWeek(date, DayOfWeek.FRIDAY);
    }

    /**
     * 取得傳入日期該週的星期六
     *
     * @param dateTime 日期時間
     * @return 星期六
     * @since 1.0.0
     */
    public static LocalDateTime getSaturday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.SATURDAY);
    }

    /**
     * 取得傳入日期該週的星期六
     *
     * @param date 日期
     * @return 星期六
     * @since 1.0.0
     */
    public static LocalDate getSaturday(LocalDate date) {
        return getWeek(date, DayOfWeek.SATURDAY);
    }

    /**
     * 取得傳入日期該週的星期日
     *
     * @param dateTime 日期時間
     * @return 星期日
     * @since 1.0.0
     */
    public static LocalDateTime getSunday(LocalDateTime dateTime) {
        return getWeek(dateTime, DayOfWeek.SUNDAY);
    }

    /**
     * 取得傳入日期該週的星期日
     *
     * @param date 日期
     * @return 星期日
     * @since 1.0.0
     */
    public static LocalDate getSunday(LocalDate date) {
        return getWeek(date, DayOfWeek.SUNDAY);
    }
}
