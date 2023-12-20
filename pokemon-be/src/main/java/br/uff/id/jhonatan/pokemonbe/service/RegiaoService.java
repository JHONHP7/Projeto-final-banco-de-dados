package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.RegiaoEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.RegiaoRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RegiaoService {
	private final RegiaoRepository regiaoRepository;

	public List<RegiaoEntity> listAll() {
		return regiaoRepository.findAll();
	}

	public RegiaoEntity saveOrUpdate(RegiaoEntity regiao) {
		if (regiao.getId() != null) {
			RegiaoEntity hasPokemon = findById(regiao.getId());
			if (hasPokemon != null) {
				return regiaoRepository.save(regiao);
			} else {
				throw new EntityNotFoundException("Pokemon with ID " + regiao.getId() + " not found.");
			}

		} else {
			return regiaoRepository.save(regiao);
		}
	}

	public RegiaoEntity findById(Long id) {
		return regiaoRepository.findById(id).orElseThrow();
	}

	public void delete(Long id) {
		regiaoRepository.delete(findById(id));
	}
}
