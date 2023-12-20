package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.PokemonEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.PokemonRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PokemonService {
	private final PokemonRepository pokemonRepository;

	public List<PokemonEntity> listAll() {
		return pokemonRepository.findAll();
	}

	public PokemonEntity save(PokemonEntity pokemon) {
		return pokemonRepository.save(pokemon);
	}

	public PokemonEntity findById(Long id) {
		return pokemonRepository.findById(id).orElseThrow();
	}
}
