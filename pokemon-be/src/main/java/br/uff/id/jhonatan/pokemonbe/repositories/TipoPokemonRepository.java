package br.uff.id.jhonatan.pokemonbe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.uff.id.jhonatan.pokemonbe.entities.TipoPokemonEntity;

public interface TipoPokemonRepository extends JpaRepository<TipoPokemonEntity, Long> {

}
