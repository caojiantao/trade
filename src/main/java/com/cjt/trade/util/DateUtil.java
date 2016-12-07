package com.cjt.trade.util;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    /**
     * 秒
     */
    public static final long SECOND = 1000;

    /**
     * 分
     */
    public static final long MINUTE = SECOND * 60;

    /**
     * 小时
     */
    public static final long HOUR = MINUTE * 60;

    /**
     * 天
     */
    public static final long DAY = HOUR * 24;
    
    /**
     * 解析日期，得到字符串，默认格式为yyyy-MM-dd
     */
    public static String parseDate(Date date){
        return parseDate(date, "yyyy-MM-dd");
    }

    /**
     * 解析日期，得到字符串
     */
    public static String parseDate(Date date, String format) {
        return new SimpleDateFormat(format).format(date);
    }
    
    /**
     * 解析字符串，得到日期，默认格式为yyyy-MM-dd
     */
    public static Date parseStr(String str){
        return parseStr(str, "yyyy-MM-dd");
    }
    
    /**
     * 解析字符串，得到日期
     */
    public static Date parseStr(String dateStr, String format){
        Date date = null;
        try {
            date = new SimpleDateFormat(format).parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获取星期，默认格式为yyyy-MM-dd
     */
    public static String getWeek(String dateStr) {
        return getWeek(dateStr, "yyyy-MM-dd");
    }
    
    public static String getWeek(String dateStr, String format) {
        Date date = parseStr(dateStr, format);
        return getWeek(date);
    }

    /**
     * 获取星期
     */
    public static String getWeek(Date date) {
        String[] weekOfDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        return weekOfDays[w];
    }

    /**
     * 增加指定时长
     * @param type SECOND秒；MINUTE分；HOUR小时；DAY天；
     */
    public static Date addTime(Date date, int duration, long type) {
        long longTime = duration * type;
        return new Date(date.getTime() + longTime);
    }
    
    public static double getDuration(String firstDateStr, String secondDateStr, long type){
        return getDuration(firstDateStr, secondDateStr, type, "yyyy-MM-dd HH:mm:ss");
    }

    public static double getDuration(String firstDateStr, String secondDateStr, long type, String format){
        return getDuration(firstDateStr, secondDateStr, type, format, 2);
    }
    
    public static double getDuration(String firstDateStr, String secondDateStr, long type, int accuracy){
        return getDuration(firstDateStr, secondDateStr, type, "yyyy-MM-dd HH:mm:ss", accuracy);
    }

    public static double getDuration(String firstDateStr, String secondDateStr, long type, String format, int accuracy){
        Date firstDate = parseStr(firstDateStr, format);
        Date secondDate = parseStr(secondDateStr, format);
        return getDuration(firstDate, secondDate, type, accuracy);
    }

    public static double getDuration(Date firstDate, Date secondDate, long type){
        return getDuration(firstDate, secondDate, type, 2);
    }
    
    /**
     * 得到两个时间间隔，类型可供选择（四舍五入，默认精确到两位小数）
     * @param type SECOND秒；MINUTE分；HOUR小时；DAY天；
     */
    public static double getDuration(Date firstDate, Date secondDate, long type, int accuracy) {
        double longTime = (secondDate.getTime() - firstDate.getTime()) * 1.0;
        double value = longTime / type;
        BigDecimal b = new BigDecimal(value);
        return b.setScale(accuracy, BigDecimal.ROUND_HALF_UP).doubleValue();
    }
    
    public static boolean isLeapYear(String year){
        return isLeapYear(Integer.parseInt(year));
    }
    
    /**
     * 判断是否为闰年
     */
    public static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
    }
}
