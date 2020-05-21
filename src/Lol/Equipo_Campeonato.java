package Lol;

public class Equipo_Campeonato {
	private int cod_equipo;
	private int cod_campeonato;

	public Equipo_Campeonato(int cod_equipo, int cod_campeonato) {
		super();
		this.cod_equipo = cod_equipo;
		this.cod_campeonato = cod_campeonato;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}

	public int getCod_campeonato() {
		return cod_campeonato;
	}

	public void setCod_campeonato(int cod_campeonato) {
		this.cod_campeonato = cod_campeonato;
	}
}
