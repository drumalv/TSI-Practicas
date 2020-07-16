(define (domain ejercicio1)
    (:requirements :strips :typing :adl :fluents)
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
        BahiaDeIngenieria CentroDeMando Barracones Extractor Deposito - TipoEdificios
        Minerales Gas - TipoRecursos
    )
    (:functions
        (consume ?obj - object ?trec - TipoRecursos)
        (hayAlmacenado ?trec - TipoRecursos)
        (asignadosNodo  ?rec - Recursos)
        (maximoRecAlmacenado ?trec - TipoRecursos)
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
                (unidadNoAsig ?u)
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
        :parameters(?u - Unidades ?rec - Recursos ?trec - TipoRecursos ?y - Localizaciones)
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
                (increase (asignadosNodo ?rec) 1)
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
                (locLibre ?y)
                (>= (hayAlmacenado Minerales)(consume ?tedif Minerales))
                (>= (hayAlmacenado Gas)(consume ?tedif Gas))
            )
        :effect
            (and
                (when (and (esTipoEdificio ?edif Extractor))
                      (extractorEn ?y)
                )
                (when (and (esTipoEdificio ?edif Deposito))
                      (and (increase (maximoRecAlmacenado Minerales) 100)
                            (increase (maximoRecAlmacenado Gas) 100))
                )
                (en ?edif ?y)
                (not (locLibre ?y))
                (edifConstruido ?edif)
                (decrease (hayAlmacenado Minerales) (consume ?tedif Minerales))
		            (decrease (hayAlmacenado Gas) (consume ?tedif Gas))
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
                (or (not (esTipoUnidad ?u Segador)) (investigacionCompletada ImpulsorSegador))
                (unidadReclutadaEn ?tu ?tedif)
                (en ?edif ?y)
                (>= (hayAlmacenado Minerales)(consume ?tu Minerales))
                (>= (hayAlmacenado Gas)(consume ?tu Gas))
            )
        :effect
            (and
                (unidadReclutada ?u)
                (en ?u ?y)
                (unidadNoAsig ?u)
                (decrease (hayAlmacenado Minerales) (consume ?tu Minerales))
		            (decrease (hayAlmacenado Gas) (consume ?tu Gas))
            )
    )
    (:action Investigar
        :parameters(?edif - Edificios  ?ti - TipoInvestigaciones ?y - Localizaciones)
        :precondition
            (and
                (esTipoEdificio ?edif BahiaDeIngenieria)
                (en ?edif ?y)
                (>= (hayAlmacenado Minerales)(consume ?ti Minerales))
                (>= (hayAlmacenado Gas)(consume ?ti Gas))
                (not (investigacionCompletada ?ti))
            )
        :effect
            (and
                (investigacionCompletada ?ti)
                (decrease (hayAlmacenado Minerales) (consume ?ti Minerales))
		            (decrease (hayAlmacenado Gas) (consume ?ti Gas))
            )
    )
    (:action Desasignar
        :parameters(?u - Unidades ?rec - Recursos ?trec - TipoRecursos ?y - Localizaciones)
        :precondition
            (and (esTipoRecurso ?rec ?trec)
                 (not (unidadNoAsig ?u))
                 (asigRecLoc ?rec ?y)
                 (extrayendoRec ?u ?rec)
                 (en ?u ?y)
            )
        :effect
            (and
                (not (extrayendoRec ?u ?rec))
                (decrease (asignadosNodo ?rec) 1)
                (unidadNoAsig ?u)
            )
    )
    (:action Recolectar
        :parameters(?rec - Recursos ?trec - TipoRecursos)
        :precondition
            (and (> (asignadosNodo ?rec) 0)
                 (esTipoRecurso ?rec ?trec)
                 (<= (+ (* (asignadosNodo ?rec) 25)(hayAlmacenado ?trec) )  (maximoRecAlmacenado ?trec) )
            )
        :effect
            (and (increase (hayAlmacenado ?trec) (* (asignadosNodo ?rec) 25))
            )
    )
)
