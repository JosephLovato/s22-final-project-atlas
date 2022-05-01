(define (problem jar-anamoly)
        (:domain jar)
        (:objects pickle-jar - jar
                  pickle-lid - lid
                  spot - location
                  other-spot - location)
        (:init (handEmptyJar)
               (handEmptyLid)
               (ontable pickle-jar spot)
               (not (holdingJar pickle-jar))
               (not (holdingLid pickle-lid))
               (attached)
               (not (clear spot))
               (clear other-spot))
        (:goal (and (handEmptyJar)
                    (handEmptyLid)
                    (ontable pickle-jar spot)
                    (ontable pickle-lid other-spot)
                    (not (holdingJar pickle-jar))
                    (not (holdingLid pickle-lid))
                    (not (attached))
                    (not (clear spot))
                    (not (clear other-spot)))))

; Begin plan
; 1 (pick-up-jar pickle-jar spot)
; 1 (grab-lid pickle-lid spot)
; 2 (twist pickle-jar pickle-lid)
; 3 (put-down-lid pickle-lid other-spot)
; 3 (put-down-jar pickle-jar spot)
; End plan
