#lang racket

;Creates static list of numbers and operators
(define l (list 1 4 '+ 3 '-))

(define l1 (list 1 2 3))
(define l2 (list '+ '- '* '/))


(define n (remove-duplicates(permutations l)))

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

;How validation works.

;1 stack (r) for validating


;Create stack r starting at 0.
;Pass through expression.
;If next element in expression is number, increase r by 1.
;If next element in expression is operand, check if r > 1.
;If r > 1, decrease r by 1 and move on.
;if r < 2, expression is not rpn-compatible. Move on to next expression
;Stack is rpn-compatible if r = 1.
 
(define (express l)
  (remove-duplicates(permutations (append l l2))))


(define (valid-rpn? e[r 0])
  (if(null? e)
     (if (= r 1)
         #t
         #f)
     (if(number? (car e) )
        (valid-rpn? (cdr e) (+ r 1))
        (if(> r 1)
           (valid-rpn? (cdr e) (- r 1))
           #f))))


(define (sum x)
  (if (null? (car x)) ; checks if list is empty, if so end the function
      0
      (if (valid-rpn? (car x))
          ((write (car x)) (writeln (calculate-RPN (car x)))  (sum (cdr x)) )
          (sum (cdr x)))))

'ready