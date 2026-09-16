package com.adocao.animal.dto;

import com.adocao.animal.model.Especie;
import com.adocao.animal.model.Porte;
import com.adocao.animal.model.Status;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record AnimalRequest(
        @NotBlank(message = "O nome é obrigatório")
        String nome,

        @NotNull(message = "A espécie é obrigatória")
        Especie especie,

        String raca,

        @NotNull(message = "A idade é obrigatória")
        @Min(value = 0, message = "A idade deve ser maior ou igual a zero")
        Integer idade,

        String sexo,

        @NotNull(message = "O porte é obrigatório")
        Porte porte,

        String descricao,

        Status status
) {
}