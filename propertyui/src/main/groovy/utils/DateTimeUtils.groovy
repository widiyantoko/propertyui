package utils

import java.time.LocalDate
import java.time.Period
import java.time.ZoneId

class DateTimeUtils {

    static Period getDurationOfTimes(Date startDate){
        return getDurationOfTimes(startDate, new Date())
    }

    static Period getDurationOfTimes(Date startDate, Date endDate){
        if (!startDate || !endDate)
            return null

        LocalDate start = startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate()
        LocalDate end = endDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate()

        return Period.between(start, end)
    }
}
