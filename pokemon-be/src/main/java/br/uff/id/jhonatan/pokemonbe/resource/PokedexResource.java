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

import br.uff.id.jhonatan.pokemonbe.entities.PokedexEntity;
import br.uff.id.jhonatan.pokemonbe.entities.PokemonEntity;
import br.uff.id.jhonatan.pokemonbe.service.PokedexService;
import br.uff.id.jhonatan.pokemonbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("pokedex")
@Log4j2
@RequiredArgsConstructor
public class PokedexResource {
	private final DateUtil dateUtil;
	private final PokedexService pokedexService;

	@GetMapping
	public ResponseEntity<List<PokedexEntity>> list() {
		log.info(dateUtil.formatLocalDateTimeToDatabaseStyle(LocalDateTime.now()));
		return ResponseEntity.ok(pokedexService.listAll());
	}

	@PostMapping
	public ResponseEntity<PokedexEntity> save(@RequestBody PokedexEntity pokedex) {
		return new ResponseEntity<>(pokedexService.saveOrUpdate(pokedex), HttpStatus.CREATED);
	}

	@PutMapping
	public ResponseEntity<PokedexEntity> update(@RequestBody PokedexEntity pokedex) {
		return new ResponseEntity<>(pokedexService.saveOrUpdate(pokedex), HttpStatus.CREATED);
	}

	@DeleteMapping
	public ResponseEntity<Void> delete(@RequestBody PokedexEntity entity) {
		pokedexService.delete(entity);
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
