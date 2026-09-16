package com.adocao.animal.controller;

import com.adocao.animal.dto.AnimalRequest;
import com.adocao.animal.dto.AnimalResponse;
import com.adocao.animal.model.Animal;
import com.adocao.animal.service.AnimalService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/animais")
public class AnimalController {

    private final AnimalService animalService;

    public AnimalController(AnimalService animalService) {
        this.animalService = animalService;
    }

    @PostMapping
    public ResponseEntity<AnimalResponse> cadastrar(@Valid @RequestBody AnimalRequest request) {
        Animal animal = animalService.cadastrar(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(AnimalResponse.fromEntity(animal));
    }

    @GetMapping
    public ResponseEntity<List<AnimalResponse>> listarTodos() {
        List<AnimalResponse> animais = animalService.listarTodos()
                .stream()
                .map(AnimalResponse::fromEntity)
                .toList();
        return ResponseEntity.ok(animais);
    }

    @GetMapping("/{id}")
    public ResponseEntity<AnimalResponse> buscarPorId(@PathVariable Long id) {
        Animal animal = animalService.buscarPorId(id);
        return ResponseEntity.ok(AnimalResponse.fromEntity(animal));
    }

    @PutMapping("/{id}")
    public ResponseEntity<AnimalResponse> atualizar(@PathVariable Long id,
                                                    @Valid @RequestBody AnimalRequest request) {
        Animal animal = animalService.atualizar(id, request);
        return ResponseEntity.ok(AnimalResponse.fromEntity(animal));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> excluir(@PathVariable Long id) {
        animalService.excluir(id);
        return ResponseEntity.noContent().build();
    }
}