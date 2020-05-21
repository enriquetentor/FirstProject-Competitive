package Lol;

public class Entrenador {
	private int cod_entrenador;
	private String nombre;
	private String apodo;
	private String nacionalidad;
	private String fecha_nacimiento;
	private String categoria;
	private int cod_equipo;

	public Entrenador(int cod_entrenador, String nombre, String apodo, String nacionalidad, String fecha_nacimiento,
			String categoria, int cod_equipo) {
		super();
		this.cod_entrenador = cod_entrenador;
		this.nombre = nombre;
		this.apodo = apodo;
		this.nacionalidad = nacionalidad;
		this.fecha_nacimiento = fecha_nacimiento;
		this.categoria = categoria;
		this.cod_equipo = cod_equipo;
	}

	public int getCod_entrenador() {
		return cod_entrenador;
	}

	public void setCod_entrenador(int cod_entrenador) {
		this.cod_entrenador = cod_entrenador;
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

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public int getCod_equipo() {
		return cod_equipo;
	}

	public void setCod_equipo(int cod_equipo) {
		this.cod_equipo = cod_equipo;
	}
}
