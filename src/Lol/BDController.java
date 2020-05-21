package Lol;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BDController {
	private Connection conexion;

	public BDController() {
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto multidisciplinar3",
					"root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en el constructor vacio del BDController.");
			e.printStackTrace();
		}
	}

	public Connection getConexion() {
		return conexion;
	}

	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}

	public ArrayList<Jugador> dameJugadores() {
		ArrayList<Jugador> Jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM jugadores;");
			while (rs.next() == true) {
				Jugadores.add(new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("rol"), rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameJugadores\"");
			e.printStackTrace();
		}
		return Jugadores;
	}

	public Jugador dameJugador(int cod_jugador) {
		Jugador jugador = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM jugadores WHERE cod_jugador=" + cod_jugador + ";");
			while (rs.next() == true) {
				jugador = new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre_completo"), rs.getString("apodo"),
						rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"), rs.getString("rol"),
						rs.getInt("cod_equipo"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameJugador\"");
			e.printStackTrace();
		}
		return jugador;
	}

	public ArrayList<Jugador> dameJugadoresRegion(String region) {
		ArrayList<Jugador> Jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM `jugadores` WHERE cod_equipo in"
					+ "(SELECT cod_equipo FROM equipos WHERE cod_region in(SELECT cod_region FROM region WHERE nombre='"
					+ region + "'));");
			while (rs.next() == true) {
				Jugadores.add(new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("rol"), rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameJugadoresRegion\"");
			e.printStackTrace();
		}
		return Jugadores;
	}

	public ArrayList<Campeonato> dameCampeonatos() {
		ArrayList<Campeonato> Campeonatos = new ArrayList<Campeonato>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM campeonatos;");
			while (rs.next() == true) {
				Campeonatos.add(new Campeonato(rs.getInt("cod_campeonato"), rs.getString("nombre"),
						rs.getString("fecha_inicio"), rs.getString("fecha_fin"), rs.getString("region"),
						rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameCampeonatos\"");
			e.printStackTrace();
		}
		return Campeonatos;
	}

	public ArrayList<Campeonato> dameCampeonatosRegion(String region) {
		ArrayList<Campeonato> Campeonatos = new ArrayList<Campeonato>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM campeonatos WHERE region='" + region + "';");
			while (rs.next() == true) {
				Campeonatos.add(new Campeonato(rs.getInt("cod_campeonato"), rs.getString("nombre"),
						rs.getString("fecha_inicio"), rs.getString("fecha_fin"), rs.getString("region"),
						rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameCampeonatosRegion\"");
			e.printStackTrace();
		}
		return Campeonatos;
	}

	public ArrayList<Campeonato> dameCampeonatosAño(int año) {
		ArrayList<Campeonato> Campeonatos = new ArrayList<Campeonato>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM campeonatos WHERE YEAR(fecha_inicio)=" + año + ";");
			while (rs.next() == true) {
				Campeonatos.add(new Campeonato(rs.getInt("cod_campeonato"), rs.getString("nombre"),
						rs.getString("fecha_inicio"), rs.getString("fecha_fin"), rs.getString("region"),
						rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameCampeonatosAño\"");
			e.printStackTrace();
		}
		return Campeonatos;
	}

	public ArrayList<Campeonato> dameCampeonatosRegionAño(String region, int año) {
		ArrayList<Campeonato> Campeonatos = new ArrayList<Campeonato>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT*FROM campeonatos WHERE region='" + region + "' AND YEAR(fecha_inicio)=" + año + ";");
			while (rs.next() == true) {
				Campeonatos.add(new Campeonato(rs.getInt("cod_campeonato"), rs.getString("nombre"),
						rs.getString("fecha_inicio"), rs.getString("fecha_fin"), rs.getString("region"),
						rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameCampeonatosRegionAño\"");
			e.printStackTrace();
		}
		return Campeonatos;
	}

	public ArrayList<Entrenador> dameEntrenadores() {
		ArrayList<Entrenador> Entrenadores = new ArrayList<Entrenador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM entrenadores;");
			while (rs.next() == true) {
				Entrenadores.add(new Entrenador(rs.getInt("cod_entrenador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("categoria"), rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEntrenadores\"");
			e.printStackTrace();
		}
		return Entrenadores;
	}

	public Entrenador dameEntrenador(int cod_entrenador) {
		Entrenador entrenador = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT*FROM entrenadores WHERE cod_entrenador=" + cod_entrenador + ";");
			while (rs.next() == true) {
				entrenador = new Entrenador(rs.getInt("cod_entrenador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("categoria"), rs.getInt("cod_equipo"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEntrenador\"");
			e.printStackTrace();
		}
		return entrenador;
	}

	public ArrayList<Entrenador> dameEntrenadoresRegion(String region) {
		ArrayList<Entrenador> Entrenadores = new ArrayList<Entrenador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM `entrenadores` WHERE cod_equipo in"
					+ "(SELECT cod_equipo FROM equipos WHERE cod_region in(SELECT cod_region FROM region WHERE nombre='"
					+ region + "'));");
			while (rs.next() == true) {
				Entrenadores.add(new Entrenador(rs.getInt("cod_entrenador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("categoria"), rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEntrenadoresRegion\"");
			e.printStackTrace();
		}
		return Entrenadores;
	}

	public ArrayList<Equipo> dameEquipos() {
		ArrayList<Equipo> Equipos = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM equipos;");
			while (rs.next() == true) {
				Equipos.add(new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getString("pais_fundacion"),
						rs.getString("fecha_fundacion"), rs.getString("propietario"), rs.getInt("cod_sede"),
						rs.getInt("cod_region")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEquipos\"");
			e.printStackTrace();
		}
		return Equipos;
	}

	public Equipo dameEquipo(int cod_equipo) {
		Equipo equipo = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM equipos WHERE cod_equipo=" + cod_equipo + ";");
			while (rs.next() == true) {
				equipo = new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getString("pais_fundacion"),
						rs.getString("fecha_fundacion"), rs.getString("propietario"), rs.getInt("cod_sede"),
						rs.getInt("cod_region"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEquipo\"");
			e.printStackTrace();
		}
		return equipo;
	}

	public ArrayList<Equipo> dameEquiposRegion(String region) {
		ArrayList<Equipo> Equipos = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT*FROM equipos WHERE cod_region in(SELECT cod_region FROM region WHERE nombre='"
							+ region + "');");
			while (rs.next() == true) {
				Equipos.add(new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getString("pais_fundacion"),
						rs.getString("fecha_fundacion"), rs.getString("propietario"), rs.getInt("cod_sede"),
						rs.getInt("cod_region")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEquiposRegion\"");
			e.printStackTrace();
		}
		return Equipos;
	}

	public ArrayList<Patrocinador> damePatrocinadores() {
		ArrayList<Patrocinador> Patrocinadores = new ArrayList<Patrocinador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM patrocinadores;");
			while (rs.next() == true) {
				Patrocinadores.add(new Patrocinador(rs.getInt("cod_patrocinador"), rs.getString("nombre")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"damePatrocinadores\"");
			e.printStackTrace();
		}
		return Patrocinadores;
	}

	public ArrayList<Region> dameRegiones() {
		ArrayList<Region> Regiones = new ArrayList<Region>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM region;");
			while (rs.next() == true) {
				Regiones.add(new Region(rs.getInt("cod_region"), rs.getString("nombre"), rs.getString("siglas")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameRegiones\"");
			e.printStackTrace();
		}
		return Regiones;
	}

	public Region dameRegion(String regionName) {
		Region region = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM region WHERE nombre='" + regionName + "';");
			while (rs.next() == true) {
				region = new Region(rs.getInt("cod_region"), rs.getString("nombre"), rs.getString("siglas"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameRegion\"");
			e.printStackTrace();
		}
		return region;
	}

	public Region dameRegion2(int cod_region) {
		Region region = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM region WHERE cod_region=" + cod_region + ";");
			while (rs.next() == true) {
				region = new Region(rs.getInt("cod_region"), rs.getString("nombre"), rs.getString("siglas"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameRegion2\"");
			e.printStackTrace();
		}
		return region;
	}

	public ArrayList<Sede> dameSedes() {
		ArrayList<Sede> Sedes = new ArrayList<Sede>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM sede;");
			while (rs.next() == true) {
				Sedes.add(new Sede(rs.getInt("cod_sede"), rs.getString("localizacion")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameSedes\"");
			e.printStackTrace();
		}
		return Sedes;
	}

	public ArrayList<Equipo_Campeonato> dameEquipos_Campeonatos() {
		ArrayList<Equipo_Campeonato> Equipos_Campeonatos = new ArrayList<Equipo_Campeonato>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM equipo_campeonato;");
			while (rs.next() == true) {
				Equipos_Campeonatos.add(new Equipo_Campeonato(rs.getInt("cod_equipo"), rs.getInt("cod_campeonato")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEquipos_Campeonatos\"");
			e.printStackTrace();
		}
		return Equipos_Campeonatos;
	}

	public ArrayList<Equipo_Patrocinador> dameEquipos_Patrocinadores() {
		ArrayList<Equipo_Patrocinador> Equipo_Patrocinadores = new ArrayList<Equipo_Patrocinador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM equipo_patrocinador;");
			while (rs.next() == true) {
				Equipo_Patrocinadores
						.add(new Equipo_Patrocinador(rs.getInt("cod_equipo"), rs.getInt("cod_patrocinador")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEquipos_Patrocinadores\"");
			e.printStackTrace();
		}
		return Equipo_Patrocinadores;
	}

	public ArrayList<Patrocinador> damePatrocinadoresDeEquipo(int cod_equipo) {
		ArrayList<Patrocinador> Patrocinadores = new ArrayList<Patrocinador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM patrocinadores WHERE cod_patrocinador IN(SELECT cod_patrocinador FROM equipo_patrocinador WHERE "
							+ "cod_equipo =(SELECT cod_equipo FROM equipos WHERE cod_equipo=" + cod_equipo + "));");
			while (rs.next() == true) {
				Patrocinadores.add(new Patrocinador(rs.getInt("cod_patrocinador"), rs.getString("nombre")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"damePatrocinadoresDeEquipo\"");
			e.printStackTrace();
		}
		return Patrocinadores;
	}

	public ArrayList<Jugador> dameJugadoresEquipo(int cod_equipo) {
		ArrayList<Jugador> Jugadores = new ArrayList<Jugador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM jugadores WHERE cod_equipo=" + cod_equipo + ";");
			while (rs.next() == true) {
				Jugadores.add(new Jugador(rs.getInt("cod_jugador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("rol"), rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameJugadoresEquipo\"");
			e.printStackTrace();
		}
		return Jugadores;
	}

	public ArrayList<Entrenador> dameEntrenadoresEquipo(int cod_equipo) {
		ArrayList<Entrenador> Entrenadores = new ArrayList<Entrenador>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM entrenadores WHERE cod_equipo=" + cod_equipo + ";");
			while (rs.next() == true) {
				Entrenadores.add(new Entrenador(rs.getInt("cod_entrenador"), rs.getString("nombre_completo"),
						rs.getString("apodo"), rs.getString("nacionalidad"), rs.getString("fecha_nacimiento"),
						rs.getString("categoria"), rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEntrenadoresEquipo\"");
			e.printStackTrace();
		}
		return Entrenadores;
	}

	public ArrayList<Campeonato> dameCampeonatosEquipo(int cod_equipo) {
		ArrayList<Campeonato> Campeonatos = new ArrayList<Campeonato>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM campeonatos WHERE cod_equipo=" + cod_equipo + ";");
			while (rs.next() == true) {
				Campeonatos.add(new Campeonato(rs.getInt("cod_campeonato"), rs.getString("nombre"),
						rs.getString("fecha_inicio"), rs.getString("fecha_fin"), rs.getString("region"),
						rs.getInt("cod_equipo")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameCampeonatosEquipo\"");
			e.printStackTrace();
		}
		return Campeonatos;
	}

	public ArrayList<Equipo> dameEquiposCampeonato(int cod_campeonato) {
		ArrayList<Equipo> Equipos = new ArrayList<Equipo>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM equipos WHERE cod_equipo IN(SELECT cod_equipo FROM equipo_campeonato WHERE cod_campeonato =(SELECT cod_campeonato FROM campeonatos WHERE cod_campeonato= "
							+ cod_campeonato + "));");
			while (rs.next() == true) {
				Equipos.add(new Equipo(rs.getInt("cod_equipo"), rs.getString("nombre"), rs.getString("pais_fundacion"),
						rs.getString("fecha_fundacion"), rs.getString("propietario"), rs.getInt("cod_sede"),
						rs.getInt("cod_region")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEquiposCampeonato\"");
			e.printStackTrace();
		}
		return Equipos;
	}

	public Campeonato dameCampeonato(int cod_campeonato) {
		Campeonato Campeonato = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT*FROM campeonatos WHERE cod_campeonato=" + cod_campeonato + ";");
			while (rs.next() == true) {
				Campeonato = new Campeonato(rs.getInt("cod_campeonato"), rs.getString("nombre"),
						rs.getString("fecha_inicio"), rs.getString("fecha_fin"), rs.getString("region"),
						rs.getInt("cod_equipo"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameCampeonato\"");
			e.printStackTrace();
		}
		return Campeonato;
	}

	public Sede dameSedeEquipo(int cod_equipo) {
		Sede sede = null;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT*FROM sede WHERE cod_sede in(select cod_sede from equipos where cod_equipo="
							+ cod_equipo + ");");
			while (rs.next() == true) {
				sede = new Sede(rs.getInt("cod_sede"), rs.getString("localizacion"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameSedeEquipo\"");
			e.printStackTrace();
		}
		return sede;
	}

	public ArrayList<Region> dameRegionEquipo(int cod_equipo) {
		ArrayList<Region> Regiones = new ArrayList<Region>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT*FROM region WHERE cod_region in(select cod_region from equipos where cod_equipo="
							+ cod_equipo + ");");
			while (rs.next() == true) {
				Regiones.add(new Region(rs.getInt("cod_region"), rs.getString("nombre"), rs.getString("siglas")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameRegionEquipo\"");
			e.printStackTrace();
		}
		return Regiones;
	}

	public ArrayList<String> dameAñosCampeonato(String region) {
		ArrayList<String> añosCameponato = new ArrayList<String>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT YEAR(fecha_inicio) as 'años' FROM `campeonatos` WHERE region='" + region
							+ "' GROUP BY YEAR(fecha_inicio);");
			while (rs.next() == true) {
				añosCameponato.add(rs.getString("años"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameAñosCampeonato\"");
			e.printStackTrace();
		}
		return añosCameponato;
	}

	public ArrayList<String> dameAñosCampeonatos() {
		ArrayList<String> añosCameponato = new ArrayList<String>();
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT YEAR(fecha_inicio) as 'años' FROM `campeonatos` GROUP BY YEAR(fecha_inicio);");
			while (rs.next() == true) {
				añosCameponato.add(rs.getString("años"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameAñosCampeonatos\"");
			e.printStackTrace();
		}
		return añosCameponato;
	}

	public int dameEdadJugador(String fecha_nac, int cod_jugador) {
		int EdadJugador = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT TIMESTAMPDIFF(YEAR, '" + fecha_nac
					+ "', CURDATE()) as 'edad' FROM `jugadores` WHERE cod_jugador=" + cod_jugador);
			while (rs.next() == true) {
				EdadJugador = rs.getInt("edad");
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"dameEdadJugador\"");
			e.printStackTrace();
		}
		return EdadJugador;
	}

	public boolean regionExiste(String region) {
		boolean exist = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT*FROM region WHERE nombre='" + region + "';");
			while (rs.next() == true) {
				exist = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"regionExiste\"");
			e.printStackTrace();
		}
		return exist;
	}

	public int calcularCodSede() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_sede) FROM sede;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodSede\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public int calcularCodRegion() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_region) FROM region;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodRegion\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public int calcularCodPatrocinador() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_patrocinador) FROM patrocinadores;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodPatrocinador\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public int calcularCodJugador() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_jugador) FROM jugadores;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodJugador\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public int calcularCodEquipo() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_equipo) FROM equipos;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodEquipo\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public int calcularCodEntrenador() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_entrenador) FROM entrenadores;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodEntrenador\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public int calcularCodCampeonato() {
		int MaxCod = 0;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT max(cod_campeonato) FROM campeonatos;");
			while (rs.next() == true) {
				MaxCod = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"calcularCodCampeonato\"");
			e.printStackTrace();
		}
		return MaxCod;
	}

	public void altaSede(Sede sede) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into sede values (" + sede.getCod_sede() + ",\"" + sede.getLocalizacion() + "\");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaSede\"");
			e.printStackTrace();
		}
	}

	public void altaRegion(Region region) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into region values (" + region.getCod_region() + ",'" + region.getNombre() + "','"
					+ region.getSiglas() + "');";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaRegion\"");
			e.printStackTrace();
		}
	}

	public void altaPatrocinador(Patrocinador patrocinador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into patrocinadores values (" + patrocinador.getCod_patrocinador() + ",'"
					+ patrocinador.getNombre() + "');";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaPatrocinador\"");
			e.printStackTrace();
		}
	}

	public void altaJugador(Jugador jugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into jugadores values (" + jugador.getCod_jugador() + ",'" + jugador.getNombre()
					+ "','" + jugador.getApodo() + "','" + jugador.getNacionalidad() + "','"
					+ jugador.getFecha_nacimiento() + "','" + jugador.getRol() + "'," + jugador.getCod_equipo() + ");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaJugador\"");
			e.printStackTrace();
		}
	}

	public void altaEquipo(Equipo equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into equipos values (" + equipo.getCod_equipo() + ",'" + equipo.getNombre() + "','"
					+ equipo.getPais_fundacion() + "','" + equipo.getFecha_fundacion() + "','" + equipo.getPropietario()
					+ "'," + equipo.getCod_sede() + "," + equipo.getCod_region() + ");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaEquipo\"");
			e.printStackTrace();
		}
	}

	public void altaEntrenador(Entrenador entrenador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into entrenadores values (" + entrenador.getCod_entrenador() + ",'"
					+ entrenador.getNombre() + "','" + entrenador.getApodo() + "','" + entrenador.getNacionalidad()
					+ "','" + entrenador.getFecha_nacimiento() + "','" + entrenador.getCategoria() + "',"
					+ entrenador.getCod_equipo() + ");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaEntrenador\"");
			e.printStackTrace();
		}
	}

	public void altaCampeonato(Campeonato campeonato) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into campeonatos values (" + campeonato.getCod_campeonato() + ",'"
					+ campeonato.getNombre() + "','" + campeonato.getFecha_inicio() + "','" + campeonato.getFecha_fin()
					+ "','" + campeonato.getRegion() + "'," + campeonato.getCod_equipo() + ");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaCampeonato\"");
			e.printStackTrace();
		}
	}

	public void altaEquipo_Campeonato(Equipo_Campeonato equipo_campeonato) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into equipo_campeonato values (" + equipo_campeonato.getCod_equipo() + ","
					+ equipo_campeonato.getCod_campeonato() + ");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaEquipo_Campeonato\"");
			e.printStackTrace();
		}
	}

	public void altaEquipo_Patrocinador(Equipo_Patrocinador equipo_patrocinador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Add = "insert into equipo_patrocinador values (" + equipo_patrocinador.getCod_equipo() + ","
					+ equipo_patrocinador.getCod_patrocinador() + ");";
			miStatement.executeUpdate(Add);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"altaEquipo_Patrocinador\"");
			e.printStackTrace();
		}
	}

	public void bajaJugador(int cod_jugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from jugadores where cod_jugador=" + cod_jugador + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaJugador\"");
			e.printStackTrace();
		}
	}

	public void bajaEntrenador(int cod_entrenador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from entrenadores where cod_entrenador=" + cod_entrenador + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEntrenador\"");
			e.printStackTrace();
		}
	}

	public void bajaEquipo_Campeonatos(int cod_equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_campeonato where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo_Campeonatos\"");
			e.printStackTrace();
		}
	}

	public void bajaEquipo_Campeonato(int cod_equipo, int cod_campeonato) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_campeonato where cod_equipo=" + cod_equipo + " and cod_campeonato="
					+ cod_campeonato + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo_Campeonato\"");
			e.printStackTrace();
		}
	}

	public void bajaEquipo_Patrocinadores(int cod_equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_patrocinador where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo_Patrocinadores\"");
			e.printStackTrace();
		}
	}

	public void bajaEquipo_Patrocinador(int cod_equipo, int cod_patrocinador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_patrocinador where cod_equipo=" + cod_equipo + " and cod_patrocinador="
					+ cod_patrocinador + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo_Patrocinador\"");
			e.printStackTrace();
		}
	}

	public void bajaPatrocinador_Equipos(int cod_patrocinador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_patrocinador where cod_patrocinador=" + cod_patrocinador + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaPatrocinador_Equipos\"");
			e.printStackTrace();
		}
	}

	public void bajaPatrocinador(int cod_patrocinador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_patrocinador where cod_patrocinador=" + cod_patrocinador + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaPatrocinador1\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from patrocinadores where cod_patrocinador=" + cod_patrocinador + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaPatrocinador2\"");
			e.printStackTrace();
		}
	}

	public void bajaCampeonato(int cod_campeonato) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_campeonato where cod_campeonato=" + cod_campeonato + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaCampeonato1\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from campeonatos where cod_campeonato=" + cod_campeonato + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaCampeonato2\"");
			e.printStackTrace();
		}
	}

	public void bajaSede(int cod_sede) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipos where cod_sede=" + cod_sede + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaSede1\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from sede where cod_sede=" + cod_sede + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaSede2\"");
			e.printStackTrace();
		}
	}

	public void bajaRegion(int cod_region) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipos where cod_region=" + cod_region + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaRegion1\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from region where cod_region=" + cod_region + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaRegion2\"");
			e.printStackTrace();
		}
	}

	public void bajaEquipo(int cod_equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_patrocinador where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo1\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from campeonatos where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo2\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipo_campeonato where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo3\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from jugador where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo4\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from entrenadores where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo5\"");
			e.printStackTrace();
		}
		try {
			Statement miStatement = this.conexion.createStatement();
			String Delete = "delete from equipos where cod_equipo=" + cod_equipo + ";";
			miStatement.executeUpdate(Delete);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"bajaEquipo6\"");
			e.printStackTrace();
		}
	}

	public void modificarSede(Sede sede) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE sede SET localizacion='" + sede.getLocalizacion() + "' WHERE cod_sede="
					+ sede.getCod_sede() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarSede\"");
			e.printStackTrace();
		}
	}

	public void modificarRegion(Region region) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE region SET nombre='" + region.getNombre() + "', siglas='" + region.getSiglas()
					+ "' WHERE cod_sede=" + region.getCod_region() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarRegion\"");
			e.printStackTrace();
		}
	}

	public void modificarPatrocinador(Patrocinador patrocinador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE patrocinadores SET nombre='" + patrocinador.getNombre()
					+ "' WHERE cod_patrocinador=" + patrocinador.getCod_patrocinador() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarPatrocinador\"");
			e.printStackTrace();
		}
	}

	public void modificarCampeonato(Campeonato campeonato) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE campeonatos SET nombre='" + campeonato.getNombre() + "', fecha_inicio='"
					+ campeonato.getFecha_inicio() + "', fecha_fin='" + campeonato.getFecha_fin() + "', region='"
					+ campeonato.getRegion() + "', cod_equipo=" + campeonato.getCod_equipo()
					+ " WHERE cod_patrocinador=" + campeonato.getCod_campeonato() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarCampeonato\"");
			e.printStackTrace();
		}
	}

	public void modificarEquipo(Equipo equipo) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE equipos SET nombre='" + equipo.getNombre() + "', pais_fundacion='"
					+ equipo.getPais_fundacion() + "', fecha_fundacion='" + equipo.getFecha_fundacion()
					+ "', propietario='" + equipo.getPropietario() + "', cod_sede=" + equipo.getCod_sede()
					+ ", cod_region=" + equipo.getCod_region() + " WHERE cod_equipo=" + equipo.getCod_equipo() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarEquipo\"");
			e.printStackTrace();
		}
	}

	public void modificarEntrenador(Entrenador entrenador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE entrenadores SET nombre_completo='" + entrenador.getNombre() + "', apodo='"
					+ entrenador.getApodo() + "', nacionalidad='" + entrenador.getNacionalidad()
					+ "', fecha_nacimiento='" + entrenador.getFecha_nacimiento() + "', categoria='"
					+ entrenador.getCategoria() + "', cod_equipo=" + entrenador.getCod_equipo()
					+ " WHERE cod_entrenador=" + entrenador.getCod_entrenador() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarEntrenador\"");
			e.printStackTrace();
		}
	}

	public void modificarJugador(Jugador jugador) {
		try {
			Statement miStatement = this.conexion.createStatement();
			String update = "UPDATE jugadores SET nombre_completo='" + jugador.getNombre() + "', apodo='"
					+ jugador.getApodo() + "', nacionalidad='" + jugador.getNacionalidad() + "', fecha_nacimiento='"
					+ jugador.getFecha_nacimiento() + "', rol='" + jugador.getRol() + "', cod_equipo="
					+ jugador.getCod_equipo() + " WHERE cod_jugador=" + jugador.getCod_jugador() + ";";
			System.out.println(update);
			miStatement.executeUpdate(update);
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en la clase BDController, método \"modificarJugador\"");
			e.printStackTrace();
		}
	}
}
