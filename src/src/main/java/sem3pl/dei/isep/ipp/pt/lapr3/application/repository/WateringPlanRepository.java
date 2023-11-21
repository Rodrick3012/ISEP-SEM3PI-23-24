package sem3pl.dei.isep.ipp.pt.lapr3.application.repository;

import sem3pl.dei.isep.ipp.pt.bddad.dataAccess.DatabaseConnection;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.DateInterval;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.Watering;
import sem3pl.dei.isep.ipp.pt.lapr3.application.domain.WateringPlan;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

public class WateringPlanRepository {
    private final List<WateringPlan> wateringPlanList = new ArrayList<>();

    public WateringPlanRepository() {
    }


    public List<WateringPlan> getWateringPlanList() {
        return wateringPlanList;
    }

    public WateringPlan createWateringPlan(List<String> wateringHours, List<Watering>  wateringList, Map<Watering, List<DateInterval>> wateringCalendar){
        WateringPlan wateringPlan = new WateringPlan(wateringHours, wateringList, wateringCalendar);
        if(!hasDuplicate(wateringPlanList)){
            addWateringPlan(wateringPlan);
        }
        return wateringPlan;
    }

    private boolean addWateringPlan(WateringPlan wateringPlan){
        return wateringPlanList.add(wateringPlan);
    }

    private static boolean hasDuplicate(List<WateringPlan> wateringPlanList){
        Iterator<WateringPlan> wateringPlanIterator = wateringPlanList.iterator();
        while(wateringPlanIterator.hasNext()){
            WateringPlan wateringPlan = wateringPlanIterator.next();
            wateringPlanIterator.remove();
            if(wateringPlanList.contains(wateringPlan)){
                return true;
            }
        }
        return false;
    }
    public void wateringOperationRegister(Integer sector, Integer duration, java.util.Date date, java.util.Date time) throws SQLException {
        CallableStatement callableStatement = null;
        try{
            Connection connection = DatabaseConnection.getInstance().getConnection();
            callableStatement = connection.prepareCall("{ call procedimentoInserirOperacaoRega(?,?,?,?) }");

            callableStatement.setInt(1, sector);
            callableStatement.setInt(2, duration);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            callableStatement.setDate(3, sqlDate);
            java.sql.Time sqlTime = new java.sql.Time(time.getTime());
            callableStatement.setTime(4, sqlTime);
            callableStatement.execute();
            connection.commit();
        } finally {
            if(!Objects.isNull(callableStatement)){
                callableStatement.close();
            }
        }
    }
}
