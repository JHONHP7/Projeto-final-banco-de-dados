package br.uff.id.jhonatan.pokemonbe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.uff.id.jhonatan.pokemonbe.entities.MoveEntity;
import br.uff.id.jhonatan.pokemonbe.repositories.MoveRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MoveService {
	private final MoveRepository moveRepository;

	public List<MoveEntity> listAll() {
		return moveRepository.findAll();
	}

	public MoveEntity saveOrUpdate(MoveEntity move) {
		if (move.getId() != null) {
			MoveEntity hasPokemon = findById(move.getId());
			if (hasPokemon != null) {
				return moveRepository.save(move);
			} else {
				throw new EntityNotFoundException("Move with ID " + move.getId() + " not found.");
			}

		} else {
			return moveRepository.save(move);
		}
	}

	public MoveEntity findById(Long id) {
		return moveRepository.findById(id).orElseThrow();
	}

	public void delete(MoveEntity move) {
		moveRepository.delete(findById(move.getId()));
	}

}
