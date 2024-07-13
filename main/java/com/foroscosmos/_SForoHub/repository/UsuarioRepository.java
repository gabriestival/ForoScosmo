package com.foroscosmos._SForoHub.repository;

import com.foroscosmos._SForoHub.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
