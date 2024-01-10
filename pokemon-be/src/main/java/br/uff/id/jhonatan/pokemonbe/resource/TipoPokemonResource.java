package br.uff.id.jhonatan.pokemonbe.resource;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.uff.id.jhonatan.pokemonbe.entities.TipoPokemonEntity;
import br.uff.id.jhonatan.pokemonbe.service.TipoPokemonService;
import br.uff.id.jhonatan.pokemonbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("tipos")
@Log4j2
@RequiredArgsConstructor
public class TipoPokemonResource {
	private final DateUtil dateUtil;
	private final TipoPokemonService tipoPokemonService;

	@GetMapping
	public ResponseEntity<List<TipoPokemonEntity>> list() {
		log.info(dateUtil.formatLocalDateTimeToDatabaseStyle(LocalDateTime.now()));
		return ResponseEntity.ok(tipoPokemonService.listAll());
	}

	@PostMapping
	public ResponseEntity<TipoPokemonEntity> save(@RequestBody TipoPokemonEntity tipoPokemon) {
		return new ResponseEntity<>(tipoPokemonService.saveOrUpdate(tipoPokemon), HttpStatus.CREATED);
	}

	@PutMapping
	public ResponseEntity<TipoPokemonEntity> update(@RequestBody TipoPokemonEntity tipo) {
		return new ResponseEntity<>(tipoPokemonService.saveOrUpdate(tipo), HttpStatus.CREATED);
	}

	@DeleteMapping
	public ResponseEntity<Void> delete(@RequestBody TipoPokemonEntity tipoPokemon) {
		tipoPokemonService.delete(tipoPokemon);
		return ResponseEntity.noContent().build();
	}

}
