package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.MoveEntity;
import br.uff.id.jhonatan.pokemonbe.entities.TipoPokemonEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.TipoPokemonRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TipoPokemonService {
	private final TipoPokemonRepository tipoPokemonRepository;

	public List<TipoPokemonEntity> listAll() {
		return tipoPokemonRepository.findAll();
	}

	public TipoPokemonEntity saveOrUpdate(TipoPokemonEntity tipo) {
		if (tipo.getId() != null) {
			TipoPokemonEntity hasPokemon = findById(tipo.getId());
			if (hasPokemon != null) {
				return tipoPokemonRepository.save(tipo);
			} else {
				throw new EntityNotFoundException("Move with ID " + tipo.getId() + " not found.");
			}

		} else {
			return tipoPokemonRepository.save(tipo);
		}
	}

	public TipoPokemonEntity findById(Long id) {
		return tipoPokemonRepository.findById(id).orElseThrow();
	}

	public void delete(MoveEntity move) {
		tipoPokemonRepository.delete(findById(move.getId()));
	}

}
