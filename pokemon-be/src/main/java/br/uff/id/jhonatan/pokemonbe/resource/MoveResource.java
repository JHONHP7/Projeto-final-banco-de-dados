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

import br.uff.id.jhonatan.pokemonbe.entities.MoveEntity;
import br.uff.id.jhonatan.pokemonbe.service.MoveService;
import br.uff.id.jhonatan.pokemonbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("moves")
@Log4j2
@RequiredArgsConstructor
public class MoveResource {
	private final DateUtil dateUtil;
	private final MoveService moveService;

	@GetMapping
	public ResponseEntity<List<MoveEntity>> list() {
		log.info(dateUtil.formatLocalDateTimeToDatabaseStyle(LocalDateTime.now()));
		return ResponseEntity.ok(moveService.listAll());
	}

	@PostMapping
	public ResponseEntity<MoveEntity> save(@RequestBody MoveEntity move) {
		return new ResponseEntity<>(moveService.saveOrUpdate(move), HttpStatus.CREATED);
	}

	@PutMapping
	public ResponseEntity<MoveEntity> update(@RequestBody MoveEntity move) {
		return new ResponseEntity<>(moveService.saveOrUpdate(move), HttpStatus.CREATED);
	}
	
	@DeleteMapping
	public ResponseEntity<Void> delete(@RequestBody MoveEntity move){
		moveService.delete(move);
		return ResponseEntity.noContent().build();
	}

}
