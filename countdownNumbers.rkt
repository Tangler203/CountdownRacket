#lang racket


(define l (list 1 4 '+ 3 '-))
(define k (list (list 1 4 '+ 3 '-) (list 3 4 '+ 1 '-)))

(define n (remove-duplicates(cartesian-product(permutations l))))

(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    ;(printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y x) s)]
     [('^ (list x y s ___)) (cons (expt y x) s)]
     [(x s) n(error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

(define (sum x)
  (if (null? x)
      0
      ((writeln (calculate-RPN (car (car x)))) (sum (cdr x)))))


'wait
