package sem3pl.dei.isep.ipp.pt.lapr3.application.controller;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;


public class ImportLegacyController {
    Set<String> atributosExploracao = new HashSet<>(){{
        add("designacao");
        add("area");
        add("especie");
        add("nomecomum");
        add("variedade");
        add("datasementeira");
        add("datapoda");
        add("datafloracao");
        add("datacolheita");
        add("tipoplantacao");
        add("tipooperacao");
        add("parcela");
        add("cultura");
        add("datainicial");
        add("datafinal");
        add("quantidade");
        add("unidade");
        add("plantacao");
        add("fabricante");
        add("formulacao");
        add("classificacao");
        add("objetivo");
        add("substancia");
        add("percentagem");
        add("data");
        add("modo");
        add("operacao");
        add("fatorproducao");

    }};


    public List<String> readFile(String filename, int sheetIndex) {
        String filePath = "/" + filename; // Note the leading forward slash

        List<String> insertStatements = new ArrayList<>();

        try (InputStream inputStream = ImportLegacyController.class.getResourceAsStream(filePath);
             Workbook workbook = new XSSFWorkbook(inputStream)) {

            Sheet sheet = workbook.getSheetAt(sheetIndex); // Get the specified sheet


            // Assuming the first row contains column names
            Row headerRow = sheet.getRow(0);

            int numColumns = headerRow.getPhysicalNumberOfCells();

            for (Row row : sheet) {
                int cont=0;
                String sheetName=sheet.getSheetName();
                sheetName = switch (sheetName) {
                    case "Plantas" -> "Plantacao";
                    case "Exploração agrícola" -> "Edificio";
                    case "Fator Produção" -> "FatorProducao";
                    case "Culturas" -> "Cultura";
                    case "Operações" -> "Operacao";
                    default -> sheetName;
                };
                if (row.getRowNum() == 0) {
                    continue; // Skip the header row
                }

                if (sheetName.equalsIgnoreCase("edificio")
                        ||sheetName.equalsIgnoreCase("parcela")
                        ||sheetName.equalsIgnoreCase("cultura")){
                    atributosExploracao.remove("classificacao");
                }else {
                    atributosExploracao.add("classificacao");
                }




                String auxSheetName=sheetName;
                if (row.getCell(1)!=null && row.getCell(1).getStringCellValue().equals("Parcela")){
                    sheetName="Parcela";
                }else {
                    sheetName=auxSheetName;

                }





                StringBuilder insert = new StringBuilder("INSERT INTO "+ sheetName + " (");

                StringBuilder values = new StringBuilder(" VALUES (");
                List<String> insertFicha=new ArrayList<>();
                List<String> datas=new ArrayList<>();
                String typeOp="";

                for (int i = 0; i < numColumns; i++) {



                    Cell cell = row.getCell(i);
                    Cell headerCell = headerRow.getCell(i);

                    String columnName = headerCell.getStringCellValue();

                    switch (columnName){
                        case "Área": columnName="area";break;
                        case "Designação":columnName="designacao";break;
                        case"Espécie": columnName="especie";break;
                        case"Nome comum": columnName="nomeComum";break;
                        case "Variedade": columnName=("variedade");break;
                        case "Tipo Plantação": columnName=("tipoPlantacao");break;
                        case "Sementeira/Plantação": columnName=("dataSementeira");break;
                        case "Poda": columnName=("dataPoda");break;
                        case "Floração": columnName=("dataFloracao");break;
                        case "Colheita": columnName=("dataColheita");break;
                        case "Data Inicial": columnName=("dataInicial");break;
                        case "Data Final": columnName=("dataFinal");break;
                        case "Quantidade": columnName=("quantidade");break;
                        case "Unidades", "Unidade": columnName=("unidade");break;
                        case "Cultura": columnName=("plantacao");break;
                        case "Fabricante": columnName=("fabricante");break;
                        case "Formato": columnName=("formulacao");break;
                        case "C1","C2","C3","C4": columnName=("substancia");break;
                        case "Perc": columnName=("percentagem");break;
                        case "Aplicação": columnName=("objetivo");break;
                        case "Tipo": columnName=("classificacao");break;
                        case "Modo": columnName=("modo");break;
                        case "Operação": columnName=("tipooperacao");break;
                        case "Fator de produção": columnName=("fatorproducao");break;
                        case "Data": columnName=("data");break;

                    }

                        String cellValue = "";


                    if (sheetName.equalsIgnoreCase("parcela")){
                        atributosExploracao.remove("unidade");
                    }else {
                        atributosExploracao.add("unidade");
                    }



                    Set<String> operacoes=new TreeSet<>();
                    operacoes.add("Plantação");
                    operacoes.add("Sementeira");
                    operacoes.add("Poda");
                    operacoes.add("Rega");
                    operacoes.add("Incorporação no solo");


                    if (cell!=null) {
                        switch (cell.getCellType()) {
                            case STRING:
                                cellValue = cell.getStringCellValue();
                                break;
                            case NUMERIC:
                                if (DateUtil.isCellDateFormatted(cell)) {
                                    // If the cell contains a date value, format it as needed
                                    Date date = cell.getDateCellValue();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy"); // Adjust the date format as needed
                                    cellValue = sdf.format(date);
                                } else {
                                    cellValue = String.valueOf(cell.getNumericCellValue());
                                }
                                break;
                            case BOOLEAN:
                                cellValue = String.valueOf(cell.getBooleanCellValue());
                                break;
                        }
                    }


                    cellValue =cellValue.trim();
                    cellValue = cellValue.replaceAll("'", " ");

                    if (!cellValue.isEmpty()){
                        cont++;
                    }

                    if (columnName.equals("tipooperacao")){
                         typeOp=cellValue;
                    }


                    if (!typeOp.equals("Fertilização")){
                        atributosExploracao.remove("modo");
                        atributosExploracao.remove("fatorproducao");
                        atributosExploracao.add("tipooperacao");
                    }else{
                        atributosExploracao.add("modo");
                        atributosExploracao.add("fatorproducao");
                        atributosExploracao.remove("tipooperacao");
                    }

                    if (atributosExploracao.contains(columnName.toLowerCase())) {

                        if (!columnName.equals("substancia") && !columnName.equals("dataPoda")
                                && !columnName.equals("dataSementeira") && !columnName.equals("dataColheita")
                                && !columnName.equals("dataFloracao")){
                                    insert.append(columnName);

                        }




                        if (columnName.equals("tipoPlantacao") || columnName.equals("unidade") ||
                                columnName.equals("fabricante") || columnName.equals("formulacao") ||
                                (columnName.equals("classificacao"))|| columnName.equals("objetivo")||
                                columnName.equals("modo")|| columnName.equals("tipooperacao")){


                                String insertType = "Insert into " + columnName + "(" + columnName + ") select ('" + cellValue + "') FROM dual where not exists" +
                                        "( Select 1 From " + columnName + " Where  " + columnName + " = '" + cellValue + "');";

                            if (!cellValue.trim().isEmpty()) {

                                if (!insertStatements.contains(insertType)){
                                    insertStatements.add(insertType);

                                }
                                values.append("(select id from "+columnName+" where "+columnName+"='"+cellValue+"')");

                            }else {
                                values.append("''");

                            }

                        } else if (columnName.equalsIgnoreCase("parcela")) {

                                values.append("(select designacao from "+columnName+" where lower(designacao) like lower('"+cellValue+"'))");


                        }else if (columnName.equalsIgnoreCase("fatorproducao")) {
                            values.append("(select designacao from "+columnName+" where lower(designacao) like lower('"+cellValue+"'))");

                        }  else if (columnName.equalsIgnoreCase("plantacao")) {


                                values.append("(select CASE WHEN COUNT(*) = 1 THEN MAX(id) ELSE NULL" +
                                        " END AS result from " + columnName + " where lower(nomecomum || ' ' || variedade) like lower('%" + cellValue + "%'))");

                        }else if (columnName.equalsIgnoreCase("substancia")) {
                            Cell nextCell=row.getCell(i+1);
                            Cell firstCell=row.getCell(0);
                            if (!cellValue.isEmpty()) {
                                String insertSubs = "Insert into  " + columnName + " (" + columnName + ") select ('" + cellValue + "') FROM dual where not exists" +
                                        "( Select 1 From " + columnName + " Where  " + columnName + " = '" + cellValue + "');";

                                 String ficha = "Insert into  FichaTecnica (substancia,fatorproducao,percentagem) values " +
                                        "((select id from substancia where substancia like '"+cellValue+"')," +
                                        "(select designacao from fatorproducao where designacao like '"+firstCell+"')," +
                                        "'"+nextCell+"'); ";

                                insertStatements.add(insertSubs);
                                insertFicha.add(ficha);
                            }
                        }else if (columnName.equalsIgnoreCase("datasementeira") || columnName.equalsIgnoreCase("datapoda")
                                || columnName.equalsIgnoreCase("datafloracao")|| columnName.equalsIgnoreCase("dataColheita")) {

                                if (!cellValue.isEmpty()) {
                                    Cell nome=row.getCell(1);
                                    Cell var=row.getCell(2);


                                    String data = "Insert into " + columnName + " (plantacao," + columnName + ") " +
                                            "values ((select id from plantacao where nomecomum like '"+nome.getStringCellValue().replaceAll("'"," ")+"' and variedade like '" + var.getStringCellValue().replaceAll("'"," ") + "%'),'" + cellValue + "') ;";
                                    ;

                                    datas.add(data);
                                }
                            } else {
                                    if (columnName.equals("quantidade") && cellValue.isEmpty()){
                                        cellValue= String.valueOf(0);
                                    }
                                    values.append("'").append(cellValue).append("'");

                        }


                        if (i < numColumns - 1) {


                            if (!columnName.equalsIgnoreCase("fatorproducao")&&!columnName.equals("substancia") && !columnName.equals("dataPoda")
                                    && !columnName.equals("dataSementeira") && !columnName.equals("dataColheita")
                                    && !columnName.equals("dataFloracao")){
                                insert.append(", ");
                                values.append(", ");
                            }
                        }
                    }
                }
                if (insert.toString().endsWith(", ")) {
                    insert.delete(insert.length()-2,insert.length());
                }
                if (values.toString().endsWith(", ")) {
                  values.delete(values.length()-2,values.length());
                }

                insert.append(")");
                values.append(");");
                insert.append(values);
                if (cont!=0){
                    if (typeOp.equals("Fertilização")){
                        insertStatements.add(insert.toString().replace("Operacao","operacaofertilizacao"));

                    }else{
                        insertStatements.add(insert.toString());

                    }
                }

                if (!insertFicha.isEmpty()){
                    insertStatements.addAll(insertFicha);
                }

                    if (!datas.isEmpty()){
                        insertStatements.addAll(datas);
                    }

            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return insertStatements;
    }


    public void writeSQLToFile(List<String> sqlStatements, String filePath) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (String sqlStatement : sqlStatements) {
                writer.write(sqlStatement);
                writer.newLine(); // Add a new line after each statement
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

