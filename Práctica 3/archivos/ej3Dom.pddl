(define (domain ejercicio1)
    (:requirements :strips :typing :adl)
    (:types
        Edificios Recursos movible Localizaciones - object
        Unidades - movible
    )
    (:constants
        TipoUnidades - Unidades
        TipoRecursos - Recursos
        TipoEdificios - Edificios
        VCE - TipoUnidades
        CentroDeMando Barracones Extractor - TipoEdificios
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
        (recursoRecogido ?trec - TipoRecursos)
        (locLibre ?x - Localizaciones)
        (extractorEn ?x - Localizaciones)
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
                (unidadNoAsig ?u)
                (esTipoEdificio ?edif ?tedif)
                (not (edifConstruido ?edif))
                (en ?u ?y)
                (esTipoUnidad ?u VCE)
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
)
