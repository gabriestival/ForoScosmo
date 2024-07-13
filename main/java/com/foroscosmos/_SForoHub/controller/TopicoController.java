package com.foroscosmos._SForoHub.controller;

import com.foroscosmos._SForoHub.DTO.TopicoDTO;
import com.foroscosmos._SForoHub.modelo.Topico;
import com.foroscosmos._SForoHub.model.Usuario;
import com.foroscosmos._SForoHub.repository.TopicoRepository;
import com.foroscosmos._SForoHub.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/topicos")
public class TopicoController {

    @Autowired
    private TopicoRepository topicoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @PostMapping
    @Transactional
    public Topico crearTopico(@RequestBody TopicoDTO topicoDTO) {
        Usuario autor = usuarioRepository.findById(topicoDTO.getAutorId())
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        Topico topico = new Topico(topicoDTO.getTitulo(), topicoDTO.getMensaje(), autor, topicoDTO.getCurso());
        return topicoRepository.save(topico);
    }

    @GetMapping
    public List<Topico> obtenerTodosLosTopicos() {
        return topicoRepository.findAll();
    }
}
