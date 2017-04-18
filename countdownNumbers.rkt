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
      (if (valid-rpn? (car (car x)))
          ((writeln (calculate-RPN (car(car x)))) (sum (cdr x)))
          (sum (cdr x)))))


'ready

;How validation should work

;2 stacks for validating
;1 stack (s) checks if correct amount of numbers and operands - done
;1 stack (r) checks if expression compatible with rpn - not done

;How would stack s work?
;Create stack s starting at 1.
;Pass through expression.
;If next element in expression is number, increase s by 1.
;If next element in expression is operand, decrease s by 1.
;Check stack after all elements are processed.
;Stack is length compatible if s = 1.

;How would stack r work?
;Create stack r starting at 1.
;Pass through expression.
;If next element in expression is number, increase r by 1.
;If next element in expression is operand, decrease r by 2.
;Check stack after each expression is processed.
;Stack is rpn-compatible if r >= 1


(define (valid-rpn? e[s 0])
  (if(null? e)
     (if( = s 1)
        #t
        #f)
     (if(number? (car e) )
        (valid-rpn?(cdr e) (+ s 1 ))
        (valid-rpn?(cdr e) (- s 1 )))))