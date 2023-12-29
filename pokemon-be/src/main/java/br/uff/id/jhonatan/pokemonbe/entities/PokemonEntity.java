package br.uff.id.jhonatan.pokemonbe.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
@Table(name = "POKEMON")
public class PokemonEntity implements Serializable {
	private static final long serialVersionUID = 6520877088529170802L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "POKEMON_ID")
	private Long id;
	private String name;
	private Long level;
	private Long defesa;
	private Long ataque;
	private Long velocidade;
	private Long hp;
	private Long sp_ataque;
	private Long sp_defesa;

	@ManyToOne
	private PokedexEntity pokedex;

	public PokemonEntity(Long id, String name, Long level, Long defesa, Long ataque, Long velocidade, Long hp,
			Long sp_ataque, Long sp_defesa, PokedexEntity pokedex) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.defesa = defesa;
		this.ataque = ataque;
		this.velocidade = velocidade;
		this.hp = hp;
		this.sp_ataque = sp_ataque;
		this.sp_defesa = sp_defesa;
		this.pokedex = pokedex;
	}

}
