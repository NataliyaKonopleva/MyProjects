import java.util.Scanner;

public class Main {
    //выполняет арифметические операции
    public static int calcIto(String zn, String s1, String s2){
        switch (zn) {
            case "+" -> {
                return Integer.parseInt(s1) + Integer.parseInt(s2);
            }
            case "-" -> {
                return Integer.parseInt(s1) - Integer.parseInt(s2);
            }
            case "*" -> {
                return Integer.parseInt(s1) * Integer.parseInt(s2);
            }
            case "/" -> {
                return Integer.parseInt(s1) / Integer.parseInt(s2);
            }
        }
       return 0;
    };
    //возвращает результат
    public static String calc(String input) {
        String strRim = "I II III IV V VI VII VIII IX X";
        String strArab = "0 1 2 3 4 5 6 7 8 9 10";
        String strZn = "+*/-";
        int i, indexStr = -1;
        //ищем индекс знака операции в строке
        for (i = 0; (i <= 3 & indexStr == -1); i++) {
          indexStr = input.indexOf(strZn.charAt(i),1);
            }
        //проверка знака
        if (indexStr != -1){
         String zn = input.substring(indexStr,indexStr+1);
         String s1 = input.substring(0,indexStr).trim();
         String s2 = input.substring(indexStr+1).trim();
         // проверка слагаемых
         if ((strRim.contains(s1)) & (strRim.contains(s2))) {
          //преобразование римских цифр в арабские
          //вычисления итога
          //преобразование итога в римское число
          //печать итога
                      }
          else {
           if ((strArab.contains(s1)) & (strArab.contains(s2))) {
           // исключение попытки деления на 0
            try {return String.valueOf(calcIto(zn, s1, s2));
            }
            catch (ArithmeticException exc) {
                return "Попытка деления на нуль";
            }
           } else return "Неверный ввод слагаемых: "+s1+" и/или "+s2;
          }
        } else return "Неверный ввод арифметической операции";
        return "";
    }
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Input: ");
        String s = in.nextLine().trim(); // читаем и убираем лишние пробелы
        System.out.println("Output: "+calc(s));
        in.close();
    }
}