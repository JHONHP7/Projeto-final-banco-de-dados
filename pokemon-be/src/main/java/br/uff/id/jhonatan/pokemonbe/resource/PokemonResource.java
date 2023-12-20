package br.uff.id.jhonatan.pokemonbe.resource;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.uff.id.jhonatan.pokemonbe.entities.PokemonEntity;
import br.uff.id.jhonatan.pokemonbe.service.PokemonService;
import br.uff.id.jhonatan.pokemonbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("pokemon")
@Log4j2
@RequiredArgsConstructor
public class PokemonResource {
	private final DateUtil dateUtil;
	private final PokemonService pokemonService;

	@GetMapping
	public ResponseEntity<List<PokemonEntity>> list() {
		log.info(dateUtil.formatLocalDateTimeToDatabaseStyle(LocalDateTime.now()));
		return ResponseEntity.ok(pokemonService.listAll());
	}

	@PostMapping
	public ResponseEntity<PokemonEntity> save(@RequestBody PokemonEntity regiao){
		return new ResponseEntity<>(pokemonService.save(regiao), HttpStatus.CREATED);
	}
}
