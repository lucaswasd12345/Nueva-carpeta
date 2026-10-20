#TODAS LAS CLASES IMPORTAN MYSQLCONNECTION
from flask_app.config.mysqlconnection import connectToMySQL

class Pelicula:

    #metodo constructor
    def __init__(self, data):
        self.id = data.get('id')
        self.nombre = data.get('viaje')
        self.director = data.get('fecha_inicio')
        self.fecha_estreno = data.get('fecha_fin')
        self.sinopsis = data.get('Itinerario')

        self.created_at = data.get('created_at')
        self.updated_at = data.get('updated_at')
        self.usuario_id=data.get('usuario_id')

    #para guardar 1 registro
    @classmethod
    def save(cls, data):
        query = "INSERT INTO viajes (destino, fecha_inicio, fecha_fin, Itinerario, created_at, updated_at, usuario_id) VALUES (%(destino)s, %(fecha_inicio)s, %(fecha_fin)s,%(Itinerario)s, NOW(), NOW(), %(usuario_id)s)"

        return connectToMySQL('certificacion').query_db(query, data)

    #metodo para ver todos los registros
    @classmethod
    def get_all(cls):
        query = "SELECT * FROM viajes"

        viajes_en_db = connectToMySQL('certificacion').query_db(query)
    
        viajes = []
        for viaje in viajes_en_db:
            viajes.append(cls(viaje))

        return viajes


    #metodo para ver 1 registro
    @classmethod
    def get_one(cls,datos):
        query = "SELECT * FROM viajes WHERE id = %(id)s;"
        viaje_en_db = connectToMySQL('certificacion').query_db(query,datos)

        return cls(viaje_en_db[0])

    #metodo para editar registro
    @classmethod
    def update(cls, datos):
        query = "UPDATE viajes SET destino=%(destino)s, fecha_inicio=%(fecha_inicio)s, fecha_fin=%(fecha_fin)s, Itinerario=%(Itinerario)s,updated_at=NOW(), usuario_id=%(usuario_id)s WHERE id = %(id)s;"

        return connectToMySQL('certificacion').query_db(query, datos)
    

    #metodo para eliminar registro
    @classmethod
    def delete(cls, datos):
        query = "DELETE FROM viajes WHERE id = %(id)s;"
        return connectToMySQL('certificacion').query_db(query, datos)