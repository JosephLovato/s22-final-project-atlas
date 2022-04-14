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
                (ontable ?x ?loc - location)
                (clear ?x - location)
)

(:action pick-up-jar
    :parameters (?x - jar ?loc - location)
    :precondition (and (handEmptyJar)
                       (ontable ?x ?loc)
                       (attached))
    :effect (and (not(handEmptyJar))
                 (not (ontable ?x ?loc))
                 (holdingJar ?x)
                 (clear ?loc))
)

(:action grab-lid
    :parameters (?x - lid ?loc - location)
    :precondition (and (handEmptyLid)
                       (attached))
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
                 (ontable ?x ?loc)
                 (not (clear ?loc)))
)

(:action put-down-lid
    :parameters (?x - lid ?loc - location)
    :precondition (and (holdingLid ?x)
                       (not (attached))
                       (clear ?loc))
    :effect (and (not (holdingLid ?x))
                 (handEmptyLid)
                 (ontable ?x ?loc)
                 (not (clear ?loc)))
)

(:action twist
    :parameters (?x - jar ?y - lid)
    :precondition (and (holdingJar ?x)
                  (holdingLid ?y)
                  (attached))
    :effect (and (holdingJar ?x)
                 (holdingLid ?y)
                 (not (attached)))
))