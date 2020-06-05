:- dynamic attends/2.

attends(476, im218).
attends(478, im218).
attends(479, im218).
attends(481, im218).
attends(482, im218).
attends(483, im218).
attends(484, im218).
attends(485, im218).
attends(487, im218).
attends(488, im218).
attends(489, im218).
attends(490, im218).
attends(491, im218).
attends(492, im218).
attends(494, im218).
attends(495, im218).
attends(496, im218).
attends(497, im218).
attends(498, im218).
attends(500, im218).
attends(501, im218).
attends(505, im218).
attends(506, im218).
attends(507, im218).
attends(508, im218).
attends(510, im218).
attends(512, im218).
attends(514, im218).
attends(517, im218).
attends(518, im218).
attends(479, im217).
attends(481, im217).
attends(486, im217).
attends(493, im217).
attends(494, im217).
attends(495, im217).
attends(497, im217).
attends(499, im217).
attends(502, im217).
attends(503, im217).
attends(504, im217).
attends(520, im217).
attends(507, im217).
attends(509, im217).
attends(512, im217).
attends(513, im217).
attends(514, im217).
attends(516, im217).
attends(476, im204).
attends(478, im204).
attends(482, im204).
attends(485, im204).
attends(486, im204).
attends(487, im204).
attends(488, im204).
attends(489, im204).
attends(490, im204).
attends(491, im204).
attends(492, im204).
attends(493, im204).
attends(494, im204).
attends(496, im204).
attends(498, im204).
attends(499, im204).
attends(500, im204).
attends(501, im204).
attends(502, im204).
attends(503, im204).
attends(505, im204).
attends(520, im204).
attends(508, im204).
attends(509, im204).
attends(510, im204).
attends(512, im204).
attends(513, im204).
attends(514, im204).
attends(515, im204).
attends(516, im204).
attends(517, im204).
attends(518, im204).
attends(479, im210).
attends(480, im210).
attends(481, im210).
attends(483, im210).
attends(484, im210).
attends(491, im210).
attends(497, im210).
attends(508, im210).
attends(513, im210).
attends(515, im210).
attends(517, im210).
attends(476, im209).
attends(478, im209).
attends(480, im209).
attends(481, im209).
attends(482, im209).
attends(484, im209).
attends(485, im209).
attends(487, im209).
attends(488, im209).
attends(489, im209).
attends(490, im209).
attends(492, im209).
attends(493, im209).
attends(495, im209).
attends(496, im209).
attends(497, im209).
attends(498, im209).
attends(499, im209).
attends(500, im209).
attends(504, im209).
attends(506, im209).
attends(515, im209).
attends(516, im209).
attends(518, im209).
attends(476, im216).
attends(478, im216).
attends(484, im216).
attends(487, im216).
attends(491, im216).
attends(492, im216).
attends(493, im216).
attends(496, im216).
attends(498, im216).
attends(501, im216).
attends(502, im216).
attends(504, im216).
attends(505, im216).
attends(507, im216).
attends(509, im216).
attends(512, im216).
attends(513, im216).
attends(514, im216).
attends(515, im216).
attends(479, im214).
attends(480, im214).
attends(482, im214).
attends(483, im214).
attends(485, im214).
attends(486, im214).
attends(488, im214).
attends(489, im214).
attends(490, im214).
attends(494, im214).
attends(495, im214).
attends(499, im214).
attends(500, im214).
attends(503, im214).
attends(504, im214).
attends(505, im214).
attends(506, im214).
attends(520, im214).
attends(507, im214).
attends(508, im214).
attends(510, im214).
attends(516, im214).
attends(517, im214).
attends(518, im214).
attends(480, im212).
attends(483, im212).
attends(486, im212).
attends(501, im212).
attends(502, im212).
attends(503, im212).
attends(506, im212).
attends(520, im212).
attends(509, im212).
attends(510, im212).

% all available courses

course(im204).
course(im209).
course(im210).
course(im212).
course(im214).
course(im216).
course(im217).
course(im218).

% students list

students(Sorted) :-
    findall(S,attends(S,_),List), sort(List, Sorted).

% create a full-week list

full_week(X,Y,Z,R) :-
    course(X), course(Y), course(Z), X\=Y, Y\=Z, Z\=X, R=[X,Y,Z].

% create a half-week list

half_week(X,Y,R) :-
    course(X), course(Y), X\=Y, R=[X,Y].

% create the schedule predicate 
% (not sure if i implemented the best way to eliminate duplicate courses in lists)
    
schedule(A,B,C) :-
    full_week(X,Y,Z,A), full_week(K,L,M,B), half_week(R,T,C),
    X\=K, X\=L, X\=M, X\=R, X\=T, Y\=K, Y\=L, Y\=M, Y\=R, Y\=T,
    Z\=K, Z\=L, Z\=M, Z\=R, Z\=T, K\=R, K\=T, L\=R, L\=T, M\=R, M\=T.

% check if a student S is unhappy with the program (A,B, the full weeks)

unhappy(S, A, B) :-
    full_week(X,Y,Z,A), full_week(K,L,M,B),
    ((attends(S,X), attends(S,Y), attends(S,Z));
    (attends(S,K), attends(S,L), attends(S,M))).

% create the schedule_errors predicate

schedule_errors(A,B,C,E) :-
    schedule(A,B,C), aggregate_all(count, unhappy(_,A,B), E).