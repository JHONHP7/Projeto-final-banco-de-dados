package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.PokedexEntity;
import br.uff.id.jhonatan.pokemonbe.entities.RegiaoEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.PokedexRepository;
import br.uff.id.jhonatan.pokemonbe.repositories.RegiaoRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PokedexService {
	private final PokedexRepository pokedexRepository;

	public List<PokedexEntity> listAll() {
		return pokedexRepository.findAll();
	}

	public PokedexEntity save(PokedexEntity pokedex) {
		return pokedexRepository.save(pokedex);
	}
}
