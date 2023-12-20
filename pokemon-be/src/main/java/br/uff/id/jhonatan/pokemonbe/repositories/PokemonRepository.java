package br.uff.id.jhonatan.pokemonbe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.uff.id.jhonatan.pokemonbe.entities.PokemonEntity;

@Repository
public interface PokemonRepository extends JpaRepository<PokemonEntity, Long>{

}
