package br.uff.id.jhonatan.pokemonbe.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Table(name = "POKEMON")
public class PokemonEntity implements Serializable{
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
    private Long sq_defesa;

    @ManyToOne
    private PokedexEntity pokedex;
}
