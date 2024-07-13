

CREATE TABLE IF NOT EXISTS usuario (
                                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                       correo_electronico VARCHAR(255) NOT NULL,
                                       contrasena VARCHAR(255) NOT NULL,
                                       perfiles VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS topico (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      titulo VARCHAR(255) NOT NULL,
                                      mensaje TEXT NOT NULL,
                                      fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                      status VARCHAR(50) DEFAULT 'ABIERTO',
                                      `grupo` VARCHAR(255),
                                      autor_id BIGINT,
                                      FOREIGN KEY (autor_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS respuesta (
                                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                         mensaje TEXT NOT NULL,
                                         fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                         autor_id BIGINT,
                                         topico_id BIGINT,
                                         solucion BOOLEAN DEFAULT FALSE,
                                         FOREIGN KEY (autor_id) REFERENCES usuario(id),
                                         FOREIGN KEY (topico_id) REFERENCES topico(id)
);

CREATE TABLE IF NOT EXISTS perfil (
                                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                      nombre_usuario VARCHAR(255) NOT NULL
);
