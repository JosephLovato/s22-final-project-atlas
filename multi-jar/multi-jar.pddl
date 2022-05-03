(define (domain jar)
    (:requirements :typing)
  (:types jar - object
          lid - object
          location - object)
(:predicates    (handEmptyJar)
                (handEmptyLid)
                (holdingJar ?x - jar)
                (holdingLid ?x - lid)
                (attached)
                (ontableJar ?x - jar ?loc - location)
                (ontableLid ?x - lid ?loc - location)
                (clear ?x) ;; deleted - location
                (onJar ?x - jar ?y - jar)
                (onLid ?x - lid ?y - lid)
)

(:action pick-up-jar
    :parameters (?x - jar ?loc - location)
    :precondition (and (handEmptyJar)
                       (not (handEmptyLid))
                       (ontableJar ?x ?loc)
                       (not (attached)))
    :effect (and (not(handEmptyJar))
                 (not (ontableJar ?x ?loc))
                 (holdingJar ?x)
                 (clear ?loc))
)

(:action grab-lid
    :parameters (?x - lid)
    :precondition (and (handEmptyLid)
                       (not (attached)))
    :effect (and (not(handEmptyLid))
                 (holdingLid ?x))
)

(:action put-down-jar
    :parameters (?x - jar ?loc - location)
    :precondition (and (holdingJar ?x)
                       (not (attached))
                       (clear ?loc))
    :effect (and (not (holdingJar ?x))
                 (handEmptyJar)
                 (ontableJar ?x ?loc)
                 (not (clear ?loc)))
)

(:action put-down-lid
    :parameters (?x - lid ?loc - location)
    :precondition (and (holdingLid ?x)
                       (not (handEmptyJar))
                       (not (attached))
                       (clear ?loc))
    :effect (and (not (holdingLid ?x))
                 (handEmptyLid)
                 (ontableLid ?x ?loc)
                 (not (clear ?loc)))
)

(:action stack-jar
    :parameters (?x - jar ?y - jar)
    :precondition (and (holdingJar ?x) (clear ?y))
    :effect (and (not (holdingJar ?x))
                (handEmptyJar)
                (not (clear ?y))
                (clear ?x)
                (onJar ?x ?y)))

(:action stack-lid
    :parameters (?x - lid ?y - lid)
    :precondition (and (holdingLid ?x) (clear ?y))
    :effect (and (not (holdingLid ?x))
                (handEmptyLid)
                (not (clear ?y))
                (clear ?x)
                (onLid ?x ?y)))

;(:action twist
;    :parameters (?x - jar ?y - lid)
;    :precondition (and (holdingJar ?x)
;                  (holdingLid ?y)
;                  (not (attached)))
;    :effect (and (holdingJar ?x)
;                 (holdingLid ?y)
;                 (not (attached)))
;)
)