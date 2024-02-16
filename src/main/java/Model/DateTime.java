package Model;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

public class DateTime {
    private int dateId;
    private LocalDate entryDate;
    private LocalDate exitDate;
    private LocalTime entryTime;
    private LocalTime exitTime;


    public int getDateId() {
        return dateId;
    }

    public void setDateId(int dateId) {
        this.dateId = dateId;
    }

    public LocalDate getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(LocalDate entryDate) {
        this.entryDate = entryDate;
    }

    public LocalDate getExitDate() {
        return exitDate;
    }

    public void setExitDate(LocalDate exitDate) {
        this.exitDate = exitDate;
    }

    public LocalTime getEntryTime() {
        return Time.valueOf(entryTime).toLocalTime();
    }

    public void setEntryTime(LocalTime entryTime) {
        this.entryTime = entryTime;
    }

    public LocalTime getExitTime() {
        return exitTime;
    }

    public void setExitTime(LocalTime exitTime) {
        this.exitTime = exitTime;
    }
}
