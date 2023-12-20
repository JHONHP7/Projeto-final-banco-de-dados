package br.uff.id.jhonatan.pokemonbe.entities;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "POKEDEX")
public class PokedexEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5719506174272457841L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "POKEDEX_ID")
	private Long id;
	private String descricao;
	@OneToMany(mappedBy = "pokedex")
	private List<PokemonEntity> pokemon;

}
