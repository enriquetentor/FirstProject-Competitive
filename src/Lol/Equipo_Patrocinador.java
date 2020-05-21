package Lol;

public class Equipo_Patrocinador {
	private int cod_equipo;
	private int cod_patrocinador;

	public Equipo_Patrocinador(int cod_equipo, int cod_patrocinador) {
		super();
		this.cod_equipo = cod_equipo;
		this.cod_patrocinador = cod_patrocinador;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}

	public int getCod_patrocinador() {
		return cod_patrocinador;
	}

	public void setCod_patrocinador(int cod_patrocinador) {
		this.cod_patrocinador = cod_patrocinador;
	}
}
