package com.adocao.animal.dto;

import com.adocao.animal.model.Animal;
import com.adocao.animal.model.Especie;
import com.adocao.animal.model.Porte;
import com.adocao.animal.model.Status;

public record AnimalResponse(
        Long id,
        String nome,
        Especie especie,
        String raca,
        Integer idade,
        String sexo,
        Porte porte,
        String descricao,
        Status status
) {

    public static AnimalResponse fromEntity(Animal animal) {
        return new AnimalResponse(
                animal.getId(),
                animal.getNome(),
                animal.getEspecie(),
                animal.getRaca(),
                animal.getIdade(),
                animal.getSexo(),
                animal.getPorte(),
                animal.getDescricao(),
                animal.getStatus()
        );
    }
}