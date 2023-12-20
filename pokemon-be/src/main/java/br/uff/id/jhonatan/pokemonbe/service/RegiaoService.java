package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.RegiaoEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.RegiaoRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RegiaoService {
	private final RegiaoRepository regiaoRepository;

	public List<RegiaoEntity> listAll() {
		return regiaoRepository.findAll();
	}

	public RegiaoEntity save(RegiaoEntity regiao) {
		return regiaoRepository.save(regiao);
	}
}
