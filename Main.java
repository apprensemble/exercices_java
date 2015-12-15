public class Main {

	public static void main(String[] args) {
		exercice1();

	}

	public static void exercice1() {
		Consumer<String> cs = s -> {
			int rien = s.length;
			System.out.format("coucou %s",s);
		};
		cs.accept("hello");
	}

}
