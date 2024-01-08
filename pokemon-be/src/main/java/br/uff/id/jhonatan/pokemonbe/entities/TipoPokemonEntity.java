package br.uff.id.jhonatan.pokemonbe.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "TIPO_POKEMON")
public class TipoPokemonEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7133353420264009166L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TIPO_POKEMON_ID")
	private Long id;
	private String descricao;
	private String nome;


}
