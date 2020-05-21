package Lol;

public class Sede {
	private int cod_sede;
	private String localizacion;

	public Sede(int cod_sede, String localizacion) {
		super();
		this.cod_sede = cod_sede;
		this.localizacion = localizacion;
	}

	public int getCod_sede() {
		return cod_sede;
	}

	public void setCod_sede(int cod_sede) {
		this.cod_sede = cod_sede;
	}

	public String getLocalizacion() {
		return localizacion;
	}

	public void setLocalizacion(String localizacion) {
		this.localizacion = localizacion;
	}
}
