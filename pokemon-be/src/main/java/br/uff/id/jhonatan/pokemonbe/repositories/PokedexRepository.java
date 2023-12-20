package br.uff.id.jhonatan.pokemonbe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.uff.id.jhonatan.pokemonbe.entities.PokedexEntity;

public interface PokedexRepository extends JpaRepository<PokedexEntity, Long> {

}
