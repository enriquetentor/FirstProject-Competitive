package Lol;

public class Jugador {
	private int cod_jugador;
	private String nombre;
	private String apodo;
	private String nacionalidad;
	private String fecha_nacimiento;
	private String rol;
	private int cod_equipo;

	public Jugador(int cod_jugador, String nombre, String apodo, String nacionalidad, String fecha_nacimiento,
			String rol, int cod_equipo) {
		super();
		this.cod_jugador = cod_jugador;
		this.nombre = nombre;
		this.apodo = apodo;
		this.nacionalidad = nacionalidad;
		this.fecha_nacimiento = fecha_nacimiento;
		this.rol = rol;
		this.cod_equipo = cod_equipo;
	}

	public int getCod_jugador() {
		return cod_jugador;
	}

	public void setCod_jugador(int cod_jugador) {
		this.cod_jugador = cod_jugador;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApodo() {
		return apodo;
	}

	public void setApodo(String apodo) {
		this.apodo = apodo;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	public String getFecha_nacimiento() {
		return fecha_nacimiento;
	}

	public void setFecha_nacimiento(String fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}
}
