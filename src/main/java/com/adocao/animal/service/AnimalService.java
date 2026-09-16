package com.adocao.animal.service;

import com.adocao.animal.dto.AnimalRequest;
import com.adocao.animal.model.Animal;
import com.adocao.animal.model.Status;
import com.adocao.animal.repository.AnimalRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class AnimalService {

    private final AnimalRepository animalRepository;

    public AnimalService(AnimalRepository animalRepository) {
        this.animalRepository = animalRepository;
    }

    public List<Animal> listarTodos() {
        return animalRepository.findAll();
    }

    public Animal buscarPorId(Long id) {
        return animalRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Animal não encontrado com o id: " + id));
    }

    public Animal cadastrar(AnimalRequest request) {
        Animal animal = new Animal(
                request.nome(),
                request.especie(),
                request.raca(),
                request.idade(),
                request.sexo(),
                request.porte(),
                request.descricao(),
                request.status() != null ? request.status() : Status.DISPONIVEL
        );
        return animalRepository.save(animal);
    }

    public Animal atualizar(Long id, AnimalRequest request) {
        Animal animal = buscarPorId(id);

        animal.setNome(request.nome());
        animal.setEspecie(request.especie());
        animal.setRaca(request.raca());
        animal.setIdade(request.idade());
        animal.setSexo(request.sexo());
        animal.setPorte(request.porte());
        animal.setDescricao(request.descricao());
        if (request.status() != null) {
            animal.setStatus(request.status());
        }

        return animalRepository.save(animal);
    }

    public void excluir(Long id) {
        Animal animal = buscarPorId(id);
        animalRepository.delete(animal);
    }
}