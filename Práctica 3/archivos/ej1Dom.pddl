(define (domain ejercicio1)
    (:requirements :strips :typing)
    (:types
        Edificios Recursos movible Localizaciones - object
        Unidades - movible
    )
    (:constants
        TipoUnidades - Unidades
        TipoRecursos - Recursos
        TipoEdificios - Edificios
        VCE - TipoUnidades
        CentroDeMando Barracones - TipoEdificios
        Minerales Gas - TipoRecursos
    )
    (:predicates
        (en ?obj - object ?x - Localizaciones)
        (asigRecLoc ?rec - Recursos ?x - Localizaciones)
        (extrayendoRec ?u - Unidades ?rec - Recursos)
        (necesitaRecurso ?edif - Edificios ?rec - Recursos)
        (unidadNoAsig ?u - Unidades)
        (conectado ?x - Localizaciones ?y - Localizaciones)
        (esTipoRecurso ?rec - Recursos ?y - TipoRecursos)
        (esTipoEdificio ?edif - Edificios ?y - TipoEdificios)
        (esTipoUnidad ?edif - Unidades ?y - TipoUnidades)
        (recursoRecogido ?rec - Recursos)
        (locLibre ?x - Localizaciones)
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
        :parameters(?u - Unidades ?rec - Recursos ?y - Localizaciones)
        :precondition
            (and
                (unidadNoAsig ?u)
                (esTipoUnidad ?u VCE)
                (en ?u ?y)
                (asigRecLoc ?rec ?y)
            )
        :effect
            (and
                (extrayendoRec ?u ?rec)
                (recursoRecogido ?rec)
                (not (unidadNoAsig ?u))
            )
    )
    (:action Construir
        :parameters(?u - Unidades ?edif - Edificios ?y - Localizaciones ?rec - Recursos)
        :precondition
            (and
                (unidadNoAsig ?u)
                (not (edifConstruido ?edif))
                (esTipoUnidad ?u VCE)
                (en ?u ?y)
                (necesitaRecurso ?edif ?rec )
                (recursoRecogido ?rec)
                (locLibre ?y)
            )
        :effect
            (and
                (en ?edif ?y)
                (edifConstruido ?edif)
                (not (locLibre ?y))
            )
    )
)
