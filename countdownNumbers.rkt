#lang racket

;Creates static list of numbers and operators
(define l (list 1 4 '+ 3 '-))
(define y (list 1 2 3 6))
(define z (list 4 5 7))

(define n (remove-duplicates(cartesian-product(permutations l))))

; Reverse Polish Notation function, Sourced from https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket

(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    ;(printf "~a\t -> ~a~N" token stack) ; Uncomment to see workings, not recommended for long lists.
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
  (if (null? x) ; checks if list is empty, if so end the function
      0
      ((writeln (calculate-RPN (car(car x)))) (cdr x))))


'ready




(define (valid-rpn? e[s 0])
  (if(null? e)
     (if( = s 1)
        #t
        #f)
     (if(eq? (car e) 1)
        (valid-rpn?(cdr e) (+ 1 s ))
        (valid-rpn?(cdr e) (- 1 s )))))