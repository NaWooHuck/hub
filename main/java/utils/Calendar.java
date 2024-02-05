package utils;

import java.time.LocalDate;

public class Calendar {
	
	int makeCalendar(int year, int month) {
		
		int date = 1;       // 일
        int day;            // 요일

        LocalDate firstDate = LocalDate.of(year, month, date); // 해당월 1일 설정
        day = firstDate.getDayOfWeek().getValue();
        
        return date;
	}
}
