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

import br.uff.id.jhonatan.pokemonbe.entities.RegiaoEntity;
import br.uff.id.jhonatan.pokemonbe.service.RegiaoService;
import br.uff.id.jhonatan.pokemonbe.util.DateUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("regioes")
@Log4j2
@RequiredArgsConstructor
public class RegiaoResource {
	private final DateUtil dateUtil;
	private final RegiaoService regiaoService;

	@GetMapping
	public ResponseEntity<List<RegiaoEntity>> list() {
		log.info(dateUtil.formatLocalDateTimeToDatabaseStyle(LocalDateTime.now()));
		return ResponseEntity.ok(regiaoService.listAll());
	}

	@PostMapping
	public ResponseEntity<RegiaoEntity> save(@RequestBody RegiaoEntity regiao){
		return new ResponseEntity<>(regiaoService.save(regiao), HttpStatus.CREATED);
	}
}
