package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.PokemonEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.PokemonRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PokemonService {
	private final PokemonRepository pokemonRepository;

	public List<PokemonEntity> listAll() {
		return pokemonRepository.findAll();
	}

	public PokemonEntity saveOrUpdate(PokemonEntity pokemon) {
		if (pokemon.getId() != null) {
			PokemonEntity hasPokemon = findById(pokemon.getId());
			if (hasPokemon != null) {
				return pokemonRepository.save(pokemon);
			} else {
				throw new EntityNotFoundException("Pokemon with ID " + pokemon.getId() + " not found.");
			}

		} else {
			return pokemonRepository.save(pokemon);
		}
	}
	
	public PokemonEntity findById(Long id) {
		return pokemonRepository.findById(id).orElseThrow();
	}

	public void delete(PokemonEntity pokemon) {
		pokemonRepository.delete(findById(pokemon.getId()));
	}

}
