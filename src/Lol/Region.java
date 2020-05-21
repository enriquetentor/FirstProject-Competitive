package Lol;

public class Region {
	private int cod_region;
	private String nombre;
	private String siglas;

	public Region(int cod_region, String nombre, String siglas) {
		super();
		this.cod_region = cod_region;
		this.nombre = nombre;
		this.siglas = siglas;
	}

	public int getCod_region() {
		return cod_region;
	}

	public void setCod_region(int cod_region) {
		this.cod_region = cod_region;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getSiglas() {
		return siglas;
	}

	public void setSiglas(String siglas) {
		this.siglas = siglas;
	}
}
