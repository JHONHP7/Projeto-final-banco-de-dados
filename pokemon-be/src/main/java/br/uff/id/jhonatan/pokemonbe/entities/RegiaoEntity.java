package br.uff.id.jhonatan.pokemonbe.entities;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Table(name = "REGIAO")
public class RegiaoEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -292596498697441949L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REGIAO_ID")
	private Long id;
	private String Name;
	private String descricao;

}
