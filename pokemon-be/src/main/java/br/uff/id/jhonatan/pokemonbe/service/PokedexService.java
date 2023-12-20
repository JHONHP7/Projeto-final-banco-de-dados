package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.PokedexEntity;
import br.uff.id.jhonatan.pokemonbe.entities.PokemonEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.PokedexRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PokedexService {
	private final PokedexRepository pokedexRepository;

	public List<PokedexEntity> listAll() {
		return pokedexRepository.findAll();
	}

	public PokedexEntity saveOrUpdate(PokedexEntity pokedex) {
		if (pokedex.getId() != null) {
			PokedexEntity hasPokemon = findById(pokedex.getId());
			if (hasPokemon != null) {
				return pokedexRepository.save(pokedex);
			} else {
				throw new EntityNotFoundException("Pokemon with ID " + pokedex.getId() + " not found.");
			}

		} else {
			return pokedexRepository.save(pokedex);
		}
	}

	public PokedexEntity findById(Long id) {
		return pokedexRepository.findById(id).orElseThrow();
	}

	public void delete(PokedexEntity pokedex) {
		pokedexRepository.delete(findById(pokedex.getId()));
	}

}
