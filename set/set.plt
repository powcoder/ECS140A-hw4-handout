:- initialization main.

main :-
    consult(["set.pl"]),
    (show_coverage(run_tests) ; true),
    halt.

:- begin_tests(set).

test(isUnion1, [true(X == []), nondet]) :-
    isUnion([], [], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion2, [true(X == [a,b]), nondet]) :-
    isUnion([], [a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion3, [true(X == [a,b]), nondet]) :-
    isUnion([a], [a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion4, [true(X == [a,b]), nondet]) :-
    isUnion([a,b], [a], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion5, [true(X == [a,b,c]), nondet]) :-
    isUnion([a,b], [b,c], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion6, [true(X == [a,b,c]), nondet]) :-
    isUnion([b,c], [a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion7, [true(X == [a,b,c,d]), nondet]) :-
    isUnion([a,b], [c,d], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion8, [true(X == [a,[a,b],[b]]), nondet]) :-
    isUnion([a,[b]], [a,[a,b]], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion9, [true(X == [a,b,c,[b,c]]), nondet]) :-
    isUnion([a,b,c], [a,[b,c]], X_Unsorted),
    sort(X_Unsorted, X).
test(isUnion10, [true(X == [a,b,c,[b,[d]]]), nondet]) :-
    isUnion([a,b,c], [a,[b,[d]]], X_Unsorted),
    sort(X_Unsorted, X).

test(isIntersection1, [true(X == []), nondet]) :-
    isIntersection([], [], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection2, [true(X == []), nondet]) :-
    isIntersection([], [a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection3, [true(X == [a]), nondet]) :-
    isIntersection([a], [a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection4, [true(X == [a]), nondet]) :-
    isIntersection([a,b], [a], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection5, [true(X == [b]), nondet]) :-
    isIntersection([a,b], [b,c], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection6, [true(X == [b]), nondet]) :-
    isIntersection([b,c], [a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection7, [true(X == []), nondet]) :-
    isIntersection([a,b], [c,d], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection8, [true(X == [a]), nondet]) :-
    isIntersection([a,[b]], [a,[a,b]], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection9, [true(X == [a]), nondet]) :-
    isIntersection([a,b,c], [a,[b,c]], X_Unsorted),
    sort(X_Unsorted, X).
test(isIntersection10, [true(X == [a,c]), nondet]) :-
    isIntersection([a,b,c,[d]], [a,[b,[d]],c], X_Unsorted),
    sort(X_Unsorted, X).

test(isEqual1, [true, nondet]) :-
    isEqual([],[]).
test(isEqual2, [true, nondet]) :-
    isEqual([a],[a]).
test(isEqual3, [true, nondet]) :-
    isEqual([a,b],[b,a]).
test(isEqual4, [fail, nondet]) :-
    isEqual([a,b,c],[a,b]).
test(isEqual5, [fail, nondet]) :-
    isEqual([a,[a]],[a,a]).
test(isEqual6, [true, nondet]) :-
    isEqual([a,[a]],[[a],a]).
test(isEqual7, [true, nondet]) :-
    isEqual([a,[b],[c]],[[b],[c],a]).
test(isEqual8, [fail, nondet]) :-
    isEqual([a,b,[c,d]],[a,b,c,d]).
test(isEqual9, [fail, nondet]) :-
    isEqual([a,[b],[c,d]],[a,[b],[d,c]]).
test(isEqual10, [fail, nondet]) :-
    isEqual([a,[b,[c,d]]],[a,[[c,d],b]]).

test(powerSet1, [true(X == [[]]), nondet]) :-
    powerSet([], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet2, [true(X == [[],[a]]), nondet]) :-
    powerSet([a], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet3, [true(X == [[],[a],[a,b],[b]]), nondet]) :-
    powerSet([a,b], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet4, [true(X == [[],[a],[b],[b,a]]), nondet]) :-
    powerSet([b,a], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet5, [true(X == [[],[a],[a,[b]],[[b]]]), nondet]) :-
    powerSet([a,[b]], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet6, [true(X == [[],[[a,b]]]), nondet]) :-
    powerSet([[a,b]], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet7, [true(X == [[],[a],[a,[]],[[]]]), nondet]) :-
    powerSet([a,[]], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet8, [true(X == [[],[a],[a,b],[a,b,[c]],[a,[c]],[b],[b,[c]],[[c]]]), nondet]) :-
    powerSet([a,b,[c]], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet9, [true(X == [[],[a],[a,[b,c]],[[b,c]]]), nondet]) :-
    powerSet([a,[b,c]], X_Unsorted),
    sort(X_Unsorted, X).
test(powerSet10, [true(X == [[],[a],[a,[b,[c,[d]]]],[[b,[c,[d]]]]]), nondet]) :-
    powerSet([a,[b,[c,[d]]]], X_Unsorted),
    sort(X_Unsorted, X).

:- end_tests(set).
