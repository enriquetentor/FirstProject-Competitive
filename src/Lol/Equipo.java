package Lol;

public class Equipo {
	private int cod_equipo;
	private String nombre;
	private String pais_fundacion;
	private String fecha_fundacion;
	private String propietario;
	private int cod_sede;
	private int cod_region;

	public Equipo(int cod_equipo, String nombre, String pais_fundacion, String fecha_fundacion, String propietario,
			int cod_sede, int cod_region) {
		super();
		this.cod_equipo = cod_equipo;
		this.nombre = nombre;
		this.pais_fundacion = pais_fundacion;
		this.fecha_fundacion = fecha_fundacion;
		this.propietario = propietario;
		this.cod_sede = cod_sede;
		this.cod_region = cod_region;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPais_fundacion() {
		return pais_fundacion;
	}

	public void setPais_fundacion(String pais_fundacion) {
		this.pais_fundacion = pais_fundacion;
	}

	public String getFecha_fundacion() {
		return fecha_fundacion;
	}

	public void setFecha_fundacion(String fecha_fundacion) {
		this.fecha_fundacion = fecha_fundacion;
	}

	public String getPropietario() {
		return propietario;
	}

	public void setPropietario(String propietario) {
		this.propietario = propietario;
	}

	public int getCod_sede() {
		return cod_sede;
	}

	public void setCod_sede(int cod_sede) {
		this.cod_sede = cod_sede;
	}

	public int getCod_region() {
		return cod_region;
	}

	public void setCod_region(int cod_region) {
		this.cod_region = cod_region;
	}
}
