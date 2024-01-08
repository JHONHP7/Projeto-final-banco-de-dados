package br.uff.id.jhonatan.pokemonbe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.uff.id.jhonatan.pokemonbe.entities.MoveEntity;

public interface MoveRepository extends JpaRepository<MoveEntity, Long> {

}
