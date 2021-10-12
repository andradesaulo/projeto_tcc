import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();
  //PERIGO
  Future delDatabase() async {
    String path = join(await getDatabasesPath(), "database.db");
    return await deleteDatabase(path);
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "database.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure
    );
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE tb_usuario(
      id_usuario 	INTEGER,
      nome   			TEXT 
  			          CONSTRAINT nn_usuario_nome NOT NULL
                  CONSTRAINT ck_usuario_nome
                    CHECK(length(nome) <= 60)
                  CONSTRAINT un_usuario_nome UNIQUE,
      data_nasc 	TEXT,
      genero  		TEXT
                  CONSTRAINT ck_usuario_genero 
                    CHECK(genero="m" OR genero="f" OR genero="o"),
      CONSTRAINT pk_usuario_id_usuario PRIMARY KEY(id_usuario)
      )
    ''');
    batch.execute(
    '''
      CREATE TRIGGER trig_tb_usuario_insert_BEFORE
          BEFORE INSERT ON tb_usuario
          FOR EACH ROW
          WHEN 	dateTime(NEW.data_nasc, "localtime") < 
      dateTime("now", "-130 years", "localtime")
      BEGIN
          SELECT RAISE(ROLLBACK, "data de nascimento invalida");
      END
    ''');
    batch.execute(
    '''
      CREATE TRIGGER trig_tb_usuario_update_BEFORE
          BEFORE UPDATE ON tb_usuario
          FOR EACH ROW
          WHEN 	dateTime(NOW.data_nasc, "localtime") < 
      dateTime("now", "-130 years", "localtime")
      BEGIN
          SELECT RAISE(ROLLBACK, "data de nascimento invalida");
      END
    ''');
    batch.execute(
    '''
      CREATE TABLE tb_animal (
      id_animal 		    INTEGER,
      id_usuario 	      INTEGER,
      id_raca 		      INTEGER,
      nome 			        TEXT
                        CONSTRAINT nn_animal_nome NOT NULL
                        CONSTRAINT ck_animal_nome
                          CHECK(length(nome) <= 60),
      ano_nasc 	  	    INTEGER
                        CONSTRAINT ck_animal_ano_nasc
                          CHECK(length(ano_nasc) = 4),
      sexo 	    		    TEXT
                        CONSTRAINT nn_animal_sexo NOT NULL 
                        CONSTRAINT ck_animal_sexo 
                          CHECK(sexo="m" OR sexo="f" OR sexo="n"),
      problemas_saude 	TEXT,
      peso 			        REAL
                        CONSTRAINT ck_animal_peso 
                          CHECK(peso >= 0.001 AND peso <= 200),
      altura 		        INTEGER 
                        CONSTRAINT ck_animal_altura 
                          CHECK(altura >= 1 AND altura <= 300),
      CONSTRAINT pk_animal_id_animal PRIMARY KEY(id_animal),
      CONSTRAINT fk_animal_id_usuario FOREIGN KEY(id_usuario)
        REFERENCES tb_usuario(id_usuario),
      CONSTRAINT fk_animal_id_raca FOREIGN KEY(id_raca)
          REFERENCES tb_raca(id_raca)
      )
    ''');
    batch.execute(
    '''
      CREATE TRIGGER trig_tb_animal_insert_BEFORE
        BEFORE INSERT ON tb_animal
          FOR EACH ROW
          WHEN CAST(strftime('%Y', 'now', 'localtime') as integer) - NEW.ano_nasc > 30
      BEGIN
        SELECT RAISE(ROLLBACK, "ano de nascimento invalido");
      END
    ''');
    batch.execute(
    '''
      CREATE TRIGGER trig_tb_animal_update_BEFORE
        BEFORE UPDATE ON tb_animal
          FOR EACH ROW
          WHEN CAST(strftime('%Y', 'now', 'localtime') as integer) - NEW.ano_nasc > 30
      BEGIN
        SELECT RAISE(ROLLBACK, "ano de nascimento invalido");
      END
    ''');
    batch.execute(
    '''
      CREATE TABLE tb_coleira (
      id_coleira 	  TEXT
                    CONSTRAINT nn_coleira_id_coleira NOT NULL
                    CONSTRAINT ck_coleira_id_coleira
                      CHECK(length(id_coleira) = 5),
      id_animal 	  INTEGER,
      descricao 	  TEXT
                    CONSTRAINT ck_coleira_descricao
                      CHECK (descricao LIKE "coleira % conectada ao animal % em %"),
      data_animal 	TEXT,
      CONSTRAINT pk_coleira_id_coleira PRIMARY KEY(id_coleira),
      CONSTRAINT fk_coleira_id_animal FOREIGN KEY(id_animal) 
        REFERENCES tb_animal(id_animal)
      )
    ''');
    batch.execute(
    '''
      CREATE TABLE tb_raca(
      id_raca	INTEGER,
      nome 		TEXT
              CONSTRAINT nn_raca_nome NOT NULL
              CONSTRAINT ck_raca_nome
                CHECK(length(nome) <= 40),
      tipo 		TEXT
                CONSTRAINT nn_raca_tipo NOT NULL 
                CONSTRAINT ck_raca_tipo 
                  CHECK(tipo = "g" OR tipo = "c"),
      CONSTRAINT pk_raca_id_raca PRIMARY KEY(id_raca)
      )
    ''');
    batch.execute(
    '''
      CREATE TABLE tb_afericao(
      id_afericao 	INTEGER,
      id_animal 		INTEGER,
      saturacao_ox 	INTEGER
                    CONSTRAINT nn_afericao_saturacao_ox NOT NULL
                    CONSTRAINT ck_afericao_saturacao_ox 
                      CHECK(saturacao_ox >= 1 AND saturacao_ox <= 100),
      bpm 			    INTEGER
                    CONSTRAINT nn_afericao_bpm NOT NULL
                    CONSTRAINT ck_afericao_bpm 
                      CHECK(BPM >= 1 AND BPM <= 250),
      data_horario 	TEXT
                    CONSTRAINT nn_afericao_data_horario not NULL,
      CONSTRAINT pk_afericao_id_afericao PRIMARY KEY(id_afericao),
      CONSTRAINT fk_afericao_id_animal FOREIGN KEY(id_animal)
        REFERENCES tb_animal(id_animal)
      )
    ''');
    batch.execute(
    '''
      INSERT INTO tb_usuario (nome, data_nasc, genero)
      VALUES 
      ("Saulo", null, "m"), 
      ("Ana Laura", "1999-05-31", null),
      ("Teresa", null, null),
      ("Maria", "2000-03-04", "f"),
      ("João", "1970-08-22", "m")
    ''');
    batch.execute(
    '''
      INSERT INTO tb_raca (nome, tipo)
      VALUES
      ("Sem raça definida", "c"),
      ("Sem raça definida", "g"),
      ("Poodle", "c"),
      ("Chihuahua", "c"),
      ("Pug", "c"),
      ("Shih Tzu", "c"),
      ("Chow Chow", "c"),
      ("Beagle", "c"),
      ("Corgi", "c"),
      ("Golden Retriever", "c"),
      ("Pastor Alemão", "c"),
      ("Rottweiler", "c"),
      ("Siamês", "g"),
      ("Don Sphynx", "g"),
      ("Birmanês", "g"),
      ("Russo", "g"),
      ("Angorá", "g"),
      ("Siberiano", "g"),
      ("Persa", "g"),
      ("Maine Coon", "g"),
      ("American Shorthair", "g"),
      ("American Wirehair", "g")
    ''');
    batch.execute(
    '''
      INSERT INTO tb_animal (id_usuario, id_raca, nome, sexo, ano_nasc, problemas_saude, peso, altura)
      VALUES
      (1, 8, "Snoopy", 'm', 2019, "pulgas,carrapatos", 10, 40),
      (3, 17, "Garfield",'m', 2012,"imunodeficiência,rinotraqueite", null, null),
      (4, 6, "Scooby", 'm', 2015, null, 6, 25),
      (1, 15, "Marie", 'f', null, null, 4, 22),
      (2, 4, "Lassie", 'f', 2015, "doença do carrapato,cinomose,artrite", 1.5, 15),
      (2, 16, "Tom", 'm', 2020, null, null, null);
    ''');
    for(int i = 0; i < 100; i++) {
      batch.insert(
        'tb_afericao',
        {
          'id_animal': 1,
          'saturacao_ox': (Random().nextInt(3) + 97).toString(),
          'bpm': (Random().nextInt(7) + 87).toString(),
          'data_horario': DateTime(2021, 10, 8, (7 + (i / 60).floor()), i % 60).toString()
        }
      );
    }
    for(int i = 0; i < 100; i++) {
      batch.insert(
        'tb_afericao',
        {
          'id_animal': 2,
          'saturacao_ox': (Random().nextInt(2) + 98).toString(),
          'bpm': (Random().nextInt(7) + 110).toString(),
          'data_horario': DateTime(2021, 10, 8, (7 + (i / 60).floor()), i % 60).toString()
        }
      );
    }
    for(int i = 0; i < 100; i++) {
      batch.insert(
        'tb_afericao',
        {
          'id_animal': 3,
          'saturacao_ox': (Random().nextInt(2) + 98).toString(),
          'bpm': (Random().nextInt(6) + 100).toString(),
          'data_horario': DateTime(2021, 10, 8, (7 + (i / 60).floor()), i % 60).toString()
        }
      );
    }
    for(int i = 0; i < 100; i++) {
      batch.insert(
        'tb_afericao',
        {
          'id_animal': 4,
          'saturacao_ox': (Random().nextInt(2) + 98).toString(),
          'bpm': (Random().nextInt(8) + 110).toString(),
          'data_horario': DateTime(2021, 10, 8, (7 + (i / 60).floor()), i % 60).toString()
        }
      );
    }
    for(int i = 0; i < 100; i++) {
      batch.insert(
        'tb_afericao',
        {
          'id_animal': 5,
          'saturacao_ox': (Random().nextInt(4) + 92).toString(),
          'bpm': (Random().nextInt(21) + 110).toString(),
          'data_horario': DateTime(2021, 10, 8, (7 + (i / 60).floor()), i % 60).toString()
        }
      );
    }
    for(int i = 0; i < 100; i++) {
      batch.insert(
        'tb_afericao', 
        {
          'id_animal': 6,
          'saturacao_ox': (Random().nextInt(4) + 92).toString(),
          'bpm': (Random().nextInt(11) + 120).toString(),
          'data_horario': DateTime(2021, 10, 8, (7 + (i / 60).floor()), i % 60).toString()
        }
      );  
    }
    await batch.commit(noResult: true);
  }
}