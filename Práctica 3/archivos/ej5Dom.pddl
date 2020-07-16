(define (domain ejercicio1)
    (:requirements :strips :typing :adl)
    (:types
        Investigaciones Edificios Recursos movible Localizaciones - object
        Unidades - movible
    )
    (:constants
        TipoUnidades - Unidades
        TipoRecursos - Recursos
        TipoEdificios - Edificios
        TipoInvestigaciones - Investigaciones
        ImpulsorSegador - TipoInvestigaciones
        VCE Marine Segador - TipoUnidades
        BahiaDeIngenieria CentroDeMando Barracones Extractor - TipoEdificios
        Minerales Gas - TipoRecursos
    )
    (:predicates
        (en ?obj - object ?x - Localizaciones)
        (asigRecLoc ?rec - Recursos ?x - Localizaciones)
        (extrayendoRec ?u - Unidades ?rec - Recursos)
        (necesitaRecurso ?edif - TipoEdificios ?rec - TipoRecursos)
        (necesitaDosRecursos ?edif - TipoEdificios ?trec1 - TipoRecursos ?trec2 - TipoRecursos)
        (unidadNoAsig ?u - Unidades)
        (conectado ?x - Localizaciones ?y - Localizaciones)
        (esTipoRecurso ?rec - Recursos ?y - TipoRecursos)
        (esTipoEdificio ?edif - Edificios ?y - TipoEdificios)
        (esTipoUnidad ?edif - Unidades ?y - TipoUnidades)
        (esTipoInvestigaciones ?i - Investigaciones ?ti - TipoInvestigaciones)
        (recursoRecogido ?trec - TipoRecursos)
        (locLibre ?x - Localizaciones)
        (extractorEn ?x - Localizaciones)
        (unidadNecesitaRecurso ?u - TipoUnidades ?rec - TipoRecursos)
        (unidadNecesitaDosRecursos ?u - TipoUnidades ?trec1 - TipoRecursos ?trec2 - TipoRecursos)
        (unidadReclutada ?u - Unidades)
        (unidadReclutadaEn ?u - TipoUnidades ?tedif - TipoEdificios)
        (investigacionCompletada ?ti - TipoInvestigaciones)
        (edifConstruido ?edif - Edificios)
    )
    (:action Navegar
        :parameters(?u - Unidades ?x - Localizaciones ?y - Localizaciones)
        :precondition
            (and
                (en ?u ?x)
                (conectado ?x ?y)
            )
        :effect
            (and
                (en ?u ?y)
                (not (en ?u ?x))
            )
    )
    (:action Asignar
        :parameters(?u - Unidades ?rec - Recursos ?y - Localizaciones ?trec - TipoRecursos)
        :precondition
            (and (esTipoRecurso ?rec ?trec)
                 (unidadNoAsig ?u)
                 (asigRecLoc ?rec ?y)
                 (en ?u ?y)
                 (esTipoUnidad ?u VCE)
                 (or (esTipoRecurso ?rec Minerales)(extractorEn ?y))
            )
        :effect
            (and
                (extrayendoRec ?u ?rec)
                (recursoRecogido ?trec)
                (not (unidadNoAsig ?u))
            )
    )
    (:action Construir
        :parameters(?u - Unidades ?edif - Edificios ?tedif - TipoEdificios
                    ?y - Localizaciones)
        :precondition
            (and
                (esTipoUnidad ?u VCE)
                (not (edifConstruido ?edif))
                (unidadNoAsig ?u)
                (esTipoEdificio ?edif ?tedif)
                (en ?u ?y)
                (or (not (necesitaRecurso ?tedif Gas)) (recursoRecogido Gas))
		            (or (not (necesitaRecurso ?tedif Minerales)) (recursoRecogido Minerales))
		            (or (not (necesitaDosRecursos ?tedif Minerales Gas)) (and (recursoRecogido Minerales)(recursoRecogido Gas)))
                (locLibre ?y)
            )
        :effect
            (and
                (when (and (esTipoEdificio ?edif Extractor))
                      (extractorEn ?y)
                )
                (en ?edif ?y)
                (edifConstruido ?edif)
                (not (locLibre ?y))

            )
    )
    (:action Reclutar
        :parameters(?u - Unidades ?tu - TipoUnidades ?edif - Edificios ?tedif - TipoEdificios
                    ?y - Localizaciones)
        :precondition
            (and
                (not (unidadReclutada ?u))
                (esTipoUnidad ?u ?tu)
                (esTipoEdificio ?edif ?tedif)
                (or (not (unidadNecesitaRecurso ?tu Gas)) (recursoRecogido Gas))
		            (or (not (unidadNecesitaRecurso ?tu Minerales)) (recursoRecogido Minerales))
		            (or (not (unidadNecesitaDosRecursos ?tu Minerales Gas)) (and (recursoRecogido Minerales)(recursoRecogido Gas)))
                (or (not (esTipoUnidad ?u Segador)) (investigacionCompletada ImpulsorSegador))
                (unidadReclutadaEn ?tu ?tedif)
                (en ?edif ?y)
            )
        :effect
            (and
                (unidadReclutada ?u)
                (en ?u ?y)
                (unidadNoAsig ?u)
            )
    )
    (:action Investigar
        :parameters(?edif - Edificios ?y - Localizaciones ?ti - TipoInvestigaciones)
        :precondition
            (and
                (esTipoEdificio ?edif BahiaDeIngenieria)
                (en ?edif ?y)
                (recursoRecogido Minerales)(recursoRecogido Gas)
                (not (investigacionCompletada ?ti))
            )
        :effect
            (and
                (investigacionCompletada ?ti)
            )
    )
)
