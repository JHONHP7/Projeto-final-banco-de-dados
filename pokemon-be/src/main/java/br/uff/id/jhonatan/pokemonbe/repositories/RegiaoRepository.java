package br.uff.id.jhonatan.pokemonbe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.uff.id.jhonatan.pokemonbe.entities.RegiaoEntity;

@Repository
public interface RegiaoRepository extends JpaRepository<RegiaoEntity, Long>{

}
