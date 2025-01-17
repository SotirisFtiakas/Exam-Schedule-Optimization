% Team of 2 members.
% 
% AEM 3076 - Sotiris Ftiakas
% AEM 3108 - Grigoris Barmpas

:- dynamic attends/2.

% which modules each student has selected 

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



% create a full-week list
% X is the Monday module
% Y is the Wednesday module
% Z is the Friday module
% R is a list of a full week program (e.g. [im204,im209,im212])

full_week(X,Y,Z,R) :-
    course(X), course(Y), course(Z), X\=Y, Y\=Z, Z\=X, R=[X,Y,Z].



% create a half-week list
% X is the Monday module
% Y is the Wednesday module
% R is a list of a half week program (e.g. [im217,im218])

half_week(X,Y,R) :-
    course(X), course(Y), X\=Y, R=[X,Y].



% create the schedule predicate 
% We need to check that there are no duplicate modules in every specific program
    
schedule(A,B,C) :-
    full_week(X,Y,Z,A), full_week(K,L,M,B), half_week(R,T,C),
    X\=K, X\=L, X\=M, X\=R, X\=T, Y\=K, Y\=L, Y\=M, Y\=R, Y\=T,
    Z\=K, Z\=L, Z\=M, Z\=R, Z\=T, K\=R, K\=T, L\=R, L\=T, M\=R, M\=T.



% This predicate checks if a student S is unhappy with the program.
% (A,B, the full weeks, no need for the half week since it cant fit more than 2 modules)

unhappy(S, A, B) :-
    full_week(X,Y,Z,A), full_week(K,L,M,B),
    ((attends(S,X), attends(S,Y), attends(S,Z));
    (attends(S,K), attends(S,L), attends(S,M))).



% create the schedule_errors predicate
% We need to make sure that A,B,C is a proper schedule (no duplicate modules)
% and then count the number of unhappy students for the specific schedule.
% We use aggregate_all(count) to achieve this.

schedule_errors(A,B,C,E) :-
    schedule(A,B,C), aggregate_all(count, unhappy(_,A,B), E).
    


% create the minimum_schedule_errors predicate
% Here, we need to find the minimum number of unhappy students found in all 
% different schedule permutations, so we use aggregate_all(min) to achieve this. 

minimal_schedule_errors(A,B,C,E) :-
    aggregate_all(min(E), schedule_errors(A,B,C,E), Minimum),  % find minimum E value 
    schedule_errors(A,B,C,E),
    E=Minimum.



% We use this predicate to give a score to a specific half week.
% W is the half week list
% R is the final score result
% To calculate the score here, we give 1 or 7 points for all the students,
% based on each scenario.
% First, we count the number of students that fit in each senario.
% Then, we calculate the final half week score, summing all these numbers multiplied by
% their points together.

score_week_2(W,R) :-
    half_week(X,Y,W),
    aggregate_all(count, ((attends(S,X), attends(S,Y))), Count1),
	aggregate_all(count, (attends(S,Y), not(attends(S,X))), Count2),
	aggregate_all(count, ((attends(S,X), not(attends(S,Y)))), Count3),
    R is Count1 + Count2*7 + Count3*7.



% We use this predicate to give a score to a specific full week.
% W is the full week list
% R is the final score result
% To calculate the score here, we give 1, 3, 7 or -7 points for all the students,
% based on each week scenario.
% First, we count the number of students that fit in each senario.
% Then, we calculate the final full week score, summing all these numbers multiplied by
% their points together.

score_week(W,R) :-
    full_week(X,Y,Z,W),
    aggregate_all(count, ((attends(S,X), attends(S,Y), attends(S,Z))), Count0),
    aggregate_all(count, ((attends(S,X), attends(S,Y), not(attends(S,Z)))), Count1),
	aggregate_all(count, (attends(S,Y), attends(S,Z), not(attends(S,X))), Count2),
	aggregate_all(count, (attends(S,X), attends(S,Z), not(attends(S,Y))), Count3),
	aggregate_all(count, ((attends(S,X), not(attends(S,Y)), not(attends(S,Z)))), Count4),
	aggregate_all(count, ((attends(S,Y), not(attends(S,X)), not(attends(S,Z)))), Count5),
	aggregate_all(count, ((attends(S,Z), not(attends(S,X)), not(attends(S,Y)))), Count6),
    R is Count1 + Count2 + Count3*3 + Count4*7 + Count5*7 + Count6*7 + Count0*(-7).



% create the score_schedule predicate
% S is the score of a specific schedule (A,B,C)
% We need to make sure that we only work on schedules that have the minimal 
% unhappy students, thus using the minimal_schedule_errors.
% Then, we calculate the score of each of the schedules weeks using the predicates
% we have implemented above, and finally we sum the 3 scores together to get the
% schedules score.

score_schedule(A,B,C,S) :-
    minimal_schedule_errors(A,B,C,_),
    score_week(A,S1), 
    score_week(B,S2),
    score_week_2(C,S3),
    S is S1+S2+S3.



% create maximum_score_schedule
% S is the schedule score, E is the number of unhappy students with this schedule (A,B,C).
% Here, we need to find the maximum score found in all different 
% schedule permutations, so we use aggregate_all(max) to achieve this. 

maximum_score_schedule(A,B,C,E,S) :-
    aggregate_all(max(S), score_schedule(A,B,C,S), Maximum), % find maximum S value 
    minimal_schedule_errors(A,B,C,E),
    S=Maximum.
