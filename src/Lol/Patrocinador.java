package Lol;

public class Patrocinador {
	private int cod_patrocinador;
	private String nombre;

	public Patrocinador(int cod_patrocinador, String nombre) {
		super();
		this.cod_patrocinador = cod_patrocinador;
		this.nombre = nombre;
	}

	public int getCod_patrocinador() {
		return cod_patrocinador;
	}

	public void setCod_patrocinador(int cod_patrocinador) {
		this.cod_patrocinador = cod_patrocinador;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
}
