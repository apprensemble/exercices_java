package cours_regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Regme {
	public static void test1(String ex1) {
		String patternString = "\\d";
		String text = "age5r43";
		Pattern p = Pattern.compile(patternString);
		Matcher m = p.matcher(text);
		System.out.println("R.E.: " + patternString);
		System.out.println("Test: " + text);
		boolean found = m.find();
		if (found) {
		System.out.println("Succès : " + found);
		System.out.println("Position début : " + m.start());
		System.out.println("Avant : " + text.substring(0,m.start()));
		System.out.println("Sélection : " + m.group());
		// System.out.println("Groupe : " + m.group(1));
		System.out.println("Position fin : " + m.end());
		System.out.println("Après : " + text.substring(m.end()));
		}
		}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String ex1 = "^0$|-?[1-9]+[0-9]*";
				test1(ex1);
	}

}
