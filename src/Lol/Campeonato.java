package Lol;

public class Campeonato {
	private int cod_campeonato;
	private String nombre;
	private String fecha_inicio;
	private String fecha_fin;
	private String region;
	private int cod_equipo;

	public Campeonato(int cod_campeonato, String nombre, String fecha_inicio, String fecha_fin, String region,
			int cod_equipo) {
		super();
		this.cod_campeonato = cod_campeonato;
		this.nombre = nombre;
		this.fecha_inicio = fecha_inicio;
		this.fecha_fin = fecha_fin;
		this.region = region;
		this.cod_equipo = cod_equipo;
	}

	public int getCod_campeonato() {
		return cod_campeonato;
	}

	public void setCod_campeonato(int cod_campeonato) {
		this.cod_campeonato = cod_campeonato;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFecha_inicio() {
		return fecha_inicio;
	}

	public void setFecha_inicio(String fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}

	public String getFecha_fin() {
		return fecha_fin;
	}

	public void setFecha_fin(String fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}
}
