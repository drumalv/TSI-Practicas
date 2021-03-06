(define (problem ejercicio1)
    (:domain ejercicio1)
    (:objects
        VCE1 VCE2 VCE3 - Unidades
        marine2 marine1 segador1 - Unidades
        centroMando1 - Edificios
        barracones1 - Edificios
        extractor1 extractor2 - Edificios
        bahiaDeIngenieria1 - Edificios
        deposito1 deposito2 - Edificios
        min1 min2 min3 - Recursos
        gas1 gas2 - Recursos
        investigacion1 - Investigaciones

        loc1_1 loc1_2 loc1_3 loc1_4 loc1_5 loc2_1 loc2_2 loc2_3 loc2_4 loc2_5 loc3_1 loc3_2 loc3_3 loc3_4 loc3_5 loc4_1 loc4_2 loc4_3 loc4_4 loc4_5 loc5_1 loc5_2 loc5_3 loc5_4 loc5_5 - Localizaciones


    )
    (:init
        (conectado loc1_1 loc2_1)
        (conectado loc2_1 loc1_1)
        (conectado loc1_1 loc1_2)
        (conectado loc1_2 loc1_1)
        (conectado loc1_2 loc2_2)
        (conectado loc2_2 loc1_2)
        (conectado loc1_2 loc1_3)
        (conectado loc1_3 loc1_2)
        (conectado loc1_2 loc1_1)
        (conectado loc1_1 loc1_2)
        (conectado loc1_3 loc2_3)
        (conectado loc2_3 loc1_3)
        (conectado loc1_3 loc1_4)
        (conectado loc1_4 loc1_3)
        (conectado loc1_3 loc1_2)
        (conectado loc1_2 loc1_3)
        (conectado loc1_4 loc2_4)
        (conectado loc2_4 loc1_4)
        (conectado loc1_4 loc1_5)
        (conectado loc1_5 loc1_4)
        (conectado loc1_4 loc1_3)
        (conectado loc1_3 loc1_4)
        (conectado loc1_5 loc2_5)
        (conectado loc2_5 loc1_5)
        (conectado loc1_5 loc1_4)
        (conectado loc1_4 loc1_5)
        (conectado loc2_1 loc1_1)
        (conectado loc1_1 loc2_1)
        (conectado loc2_1 loc3_1)
        (conectado loc3_1 loc2_1)
        (conectado loc2_1 loc2_2)
        (conectado loc2_2 loc2_1)
        (conectado loc2_2 loc1_2)
        (conectado loc1_2 loc2_2)
        (conectado loc2_2 loc3_2)
        (conectado loc3_2 loc2_2)
        (conectado loc2_2 loc2_3)
        (conectado loc2_3 loc2_2)
        (conectado loc2_2 loc2_1)
        (conectado loc2_1 loc2_2)
        (conectado loc2_3 loc1_3)
        (conectado loc1_3 loc2_3)
        (conectado loc2_3 loc3_3)
        (conectado loc3_3 loc2_3)
        (conectado loc2_3 loc2_4)
        (conectado loc2_4 loc2_3)
        (conectado loc2_3 loc2_2)
        (conectado loc2_2 loc2_3)
        (conectado loc2_4 loc1_4)
        (conectado loc1_4 loc2_4)
        (conectado loc2_4 loc3_4)
        (conectado loc3_4 loc2_4)
        (conectado loc2_4 loc2_5)
        (conectado loc2_5 loc2_4)
        (conectado loc2_4 loc2_3)
        (conectado loc2_3 loc2_4)
        (conectado loc2_5 loc1_5)
        (conectado loc1_5 loc2_5)
        (conectado loc2_5 loc3_5)
        (conectado loc3_5 loc2_5)
        (conectado loc2_5 loc2_4)
        (conectado loc2_4 loc2_5)
        (conectado loc3_1 loc2_1)
        (conectado loc2_1 loc3_1)
        (conectado loc3_1 loc4_1)
        (conectado loc4_1 loc3_1)
        (conectado loc3_1 loc3_2)
        (conectado loc3_2 loc3_1)
        (conectado loc3_2 loc2_2)
        (conectado loc2_2 loc3_2)
        (conectado loc3_2 loc4_2)
        (conectado loc4_2 loc3_2)
        (conectado loc3_2 loc3_3)
        (conectado loc3_3 loc3_2)
        (conectado loc3_2 loc3_1)
        (conectado loc3_1 loc3_2)
        (conectado loc3_3 loc2_3)
        (conectado loc2_3 loc3_3)
        (conectado loc3_3 loc4_3)
        (conectado loc4_3 loc3_3)
        (conectado loc3_3 loc3_4)
        (conectado loc3_4 loc3_3)
        (conectado loc3_3 loc3_2)
        (conectado loc3_2 loc3_3)
        (conectado loc3_4 loc2_4)
        (conectado loc2_4 loc3_4)
        (conectado loc3_4 loc4_4)
        (conectado loc4_4 loc3_4)
        (conectado loc3_4 loc3_5)
        (conectado loc3_5 loc3_4)
        (conectado loc3_4 loc3_3)
        (conectado loc3_3 loc3_4)
        (conectado loc3_5 loc2_5)
        (conectado loc2_5 loc3_5)
        (conectado loc3_5 loc4_5)
        (conectado loc4_5 loc3_5)
        (conectado loc3_5 loc3_4)
        (conectado loc3_4 loc3_5)
        (conectado loc4_1 loc3_1)
        (conectado loc3_1 loc4_1)
        (conectado loc4_1 loc5_1)
        (conectado loc5_1 loc4_1)
        (conectado loc4_1 loc4_2)
        (conectado loc4_2 loc4_1)
        (conectado loc4_2 loc3_2)
        (conectado loc3_2 loc4_2)
        (conectado loc4_2 loc5_2)
        (conectado loc5_2 loc4_2)
        (conectado loc4_2 loc4_3)
        (conectado loc4_3 loc4_2)
        (conectado loc4_2 loc4_1)
        (conectado loc4_1 loc4_2)
        (conectado loc4_3 loc3_3)
        (conectado loc3_3 loc4_3)
        (conectado loc4_3 loc5_3)
        (conectado loc5_3 loc4_3)
        (conectado loc4_3 loc4_4)
        (conectado loc4_4 loc4_3)
        (conectado loc4_3 loc4_2)
        (conectado loc4_2 loc4_3)
        (conectado loc4_4 loc3_4)
        (conectado loc3_4 loc4_4)
        (conectado loc4_4 loc5_4)
        (conectado loc5_4 loc4_4)
        (conectado loc4_4 loc4_5)
        (conectado loc4_5 loc4_4)
        (conectado loc4_4 loc4_3)
        (conectado loc4_3 loc4_4)
        (conectado loc4_5 loc3_5)
        (conectado loc3_5 loc4_5)
        (conectado loc4_5 loc5_5)
        (conectado loc5_5 loc4_5)
        (conectado loc4_5 loc4_4)
        (conectado loc4_4 loc4_5)
        (conectado loc5_1 loc4_1)
        (conectado loc4_1 loc5_1)
        (conectado loc5_1 loc5_2)
        (conectado loc5_2 loc5_1)
        (conectado loc5_2 loc4_2)
        (conectado loc4_2 loc5_2)
        (conectado loc5_2 loc5_3)
        (conectado loc5_3 loc5_2)
        (conectado loc5_2 loc5_1)
        (conectado loc5_1 loc5_2)
        (conectado loc5_3 loc4_3)
        (conectado loc4_3 loc5_3)
        (conectado loc5_3 loc5_4)
        (conectado loc5_4 loc5_3)
        (conectado loc5_3 loc5_2)
        (conectado loc5_2 loc5_3)
        (conectado loc5_4 loc4_4)
        (conectado loc4_4 loc5_4)
        (conectado loc5_4 loc5_5)
        (conectado loc5_5 loc5_4)
        (conectado loc5_4 loc5_3)
        (conectado loc5_3 loc5_4)
        (conectado loc5_5 loc4_5)
        (conectado loc4_5 loc5_5)
        (conectado loc5_5 loc5_4)
        (conectado loc5_4 loc5_5)

        (en VCE1 loc1_1 )
        (en centroMando1 loc1_5)
        (edifConstruido centroMando1)
        (en deposito1 loc3_5)
        (edifConstruido deposito1)
        (asigRecLoc gas1 loc2_4)
        (asigRecLoc gas2 loc5_1)

        (esTipoRecurso min1 Minerales)
        (esTipoRecurso min2 Minerales)
        (esTipoRecurso min3 Minerales)
        (esTipoInvestigaciones investigacion1 ImpulsorSegador)
        (esTipoUnidad VCE1 VCE)
        (esTipoUnidad VCE2 VCE)
        (esTipoUnidad VCE3 VCE)
        (esTipoUnidad segador1 Segador)
        (esTipoUnidad marine1 Marine)
        (esTipoUnidad marine2 Marine)
        (esTipoRecurso gas1 Gas)
        (esTipoRecurso gas2 Gas)
        (esTipoEdificio centroMando1 CentroDeMando)
        (esTipoEdificio barracones1 Barracones)
        (esTipoEdificio extractor1 Extractor)
        (esTipoEdificio extractor2 Extractor)
        (esTipoEdificio bahiaDeIngenieria1 BahiaDeIngenieria)
        (esTipoEdificio deposito1 Deposito)
        (esTipoEdificio deposito2 Deposito)

        (asigRecLoc min1 loc2_2)
        (asigRecLoc min2 loc4_2)
        (asigRecLoc min3 loc5_2)
        (unidadNecesitaRecurso VCE Minerales)
        (unidadNecesitaRecurso Marine Minerales)
        (unidadNecesitaDosRecursos Segador Minerales Gas)
        (necesitaRecurso Barracones Gas)
        (necesitaRecurso Extractor Minerales)
        (necesitaDosRecursos CentroDeMando Minerales Gas)
        (necesitaDosRecursos BahiaDeIngenieria Minerales Gas)

        (unidadReclutadaEn Marine Barracones)
        (unidadReclutadaEn Segador Barracones)
        (unidadReclutadaEn VCE CentroDeMando)

        (unidadReclutada VCE1)
        (unidadNoAsig VCE1)

        (= (asignadosNodo min1) 0)
        (= (asignadosNodo min2) 0)
        (= (asignadosNodo min3) 0)
        (= (asignadosNodo gas1) 0)
        (= (asignadosNodo gas2) 0)
        (= (hayAlmacenado Gas) 0)
        (= (hayAlmacenado Minerales) 0)

        (locLibre loc1_1)
        (locLibre loc1_2)
        (locLibre loc1_3)
        (locLibre loc1_4)
        (locLibre loc2_1)
        (locLibre loc2_2)
        (locLibre loc2_3)
        (locLibre loc2_4)
        (locLibre loc2_5)
        (locLibre loc3_1)
        (locLibre loc3_2)
        (locLibre loc3_3)
        (locLibre loc3_4)
        (locLibre loc4_1)
        (locLibre loc4_2)
        (locLibre loc4_3)
        (locLibre loc4_4)
        (locLibre loc4_5)
        (locLibre loc5_1)
        (locLibre loc5_2)
        (locLibre loc5_3)
        (locLibre loc5_4)
        (locLibre loc5_5)



        (= (consume CentroDeMando Minerales) 150)
        (= (consume CentroDeMando Gas) 50)
        (= (consume Barracones Minerales) 150)
        (= (consume Barracones Gas) 0)
        (= (consume Extractor Minerales) 75)
        (= (consume Extractor Gas) 0)
        (= (consume BahiaDeIngenieria Minerales) 125)
        (= (consume BahiaDeIngenieria Gas) 0)
        (= (consume Deposito Minerales) 75)
        (= (consume Deposito Gas) 25)
        (= (consume VCE Minerales) 50)
        (= (consume VCE Gas) 0)
        (= (consume Marine Minerales) 50)
        (= (consume Marine Gas) 0)
        (= (consume Segador Minerales) 50)
        (= (consume Segador Gas) 50)
        (= (consume ImpulsorSegador Minerales) 50)
        (= (consume ImpulsorSegador Gas) 200)

        (= (maximoRecAlmacenado Gas) 100)
        (= (maximoRecAlmacenado Minerales) 100)

    )
    (:goal
        (and
            (en segador1 loc1_1)
            (en marine2 loc2_3)
            (en marine1 loc1_1)
        )
    )
)
