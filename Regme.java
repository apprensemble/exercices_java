
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regme {
  public static void test1(String ex1,String texte) {
    String patternString = "\\d";
    patternString = ex1;
    String text = "age5r43";
    text = texte;
    Pattern p = Pattern.compile(patternString);
    Matcher m = p.matcher(text);
    System.out.println("R.E.: " + patternString);
    System.out.println("Test: " + text);
    boolean found = m.find();
    if (found) {
      System.out.println("Succes : " + found);
      System.out.println("Position debut : " + m.start());
      System.out.println("Avant : " + text.substring(0,m.start()));
      System.out.println("Selection : " + m.group());
      // System.out.println("Groupe : " + m.group(1));
      System.out.println("Position fin : " + m.end());
      System.out.println("Apres : " + text.substring(m.end()));
    }
  }
  public static void main(String[] args) {
    // TODO Auto-generated method stub
    String ex1 = "^0$|-?[1-9]+[0-9]*";
    String texte = "-300";
    texte = args[0];
    ex1 = args[1];
    System.out.println("regex : " + ex1 + " texte : " + texte);
    test1(ex1,texte);
  }

}
