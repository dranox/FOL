/* Gender */
male(prince_phillip).
male(prince_charles).
male(captain_mark_phillips).
male(timothy_laurence).
male(prince_andrew).
male(prince_edward).
male(prince_william).
male(prince_harry).
male(peter_phillips).
male(mike_tindall).
male(james_viscount_severn).
male(prince_george).

/* Female */
female(queen_elizabeth_II).
female(princess_diana).
female(camilla_parker_bowles).
female(princess_anne).
female(sarah_ferguson).
female(sophie_rhys_jones).
female(kate_middleton).
female(autumn_kelly).
female(zara_phillips).
female(princess_beatrice).
female(princess_eugenie).
female(lady_louise_mountbatten_windsor).
female(princess_charlotte).
female(savannah_phillips).
female(isla_phillips).
female(mia_grace_tindall).

/* Marital status*/
married(queen_elizabeth_II, prince_phillip).
married(prince_phillip,queen_elizabeth_II).
married(prince_charles, camilla_parker_bowles).
married(camilla_parker_bowles, prince_charles).
married(princess_anne, timothy_laurence).
married(timothy_laurence, princess_anne).
married(prince_edward, sophie_rhys_jones).
married(sophie_rhys_jones, prince_edward).
married(prince_william, kate_middleton).
married(kate_middleton, prince_william).
married(autumn_kelly, peter_phillips).
married(peter_phillips, autumn_kelly).
married(zara_phillips, mike_tindall).
married(mike_tindall, zara_phillips).

/* Divorced */
divorced(princess_diana, prince_charles).
divorced(prince_charles, princess_diana).
divorced(captain_mark_phillips, princess_anne).
divorced(princess_anne, captain_mark_phillips).
divorced(princess_andrew, sarah_ferguson).
divorced(sarah_ferguson, princess_andrew).


/* Family relationship */
parent(queen_elizabeth_II, prince_charles).
parent(prince_phillip, prince_charles).
parent(queen_elizabeth_II, prince_andrew).
parent(prince_phillip, prince_andrew).
parent(queen_elizabeth_II, princess_anne).
parent(prince_phillip, princess_anne).
parent(queen_elizabeth_II, prince_edward).
parent(prince_phillip, prince_edward).
parent(princess_diana, prince_william).
parent(prince_charles, prince_william).
parent(princess_diana, prince_harry).
parent(prince_charles, prince_harry).
parent(princess_anne, peter_phillips).
parent(captain_mark_phillips, peter_phillips).
parent(princess_anne, zara_phillips).
parent(captain_mark_phillips, zara_phillips).
parent(sarah_ferguson, princess_beatrice).
parent(prince_andrew, princess_beatrice).
parent(sarah_ferguson, princess_eugenie).
parent(prince_andrew, princess_eugenie).
parent(sophie_rhys_jones, james_viscount_severn).
parent(prince_edward, james_viscount_severn).
parent(sophie_rhys_jones, lady_louise_mountbatten_windsor).
parent(prince_edward, lady_louise_mountbatten_windsor).
parent(kate_middleton, prince_george).
parent(prince_william, prince_george).
parent(kate_middleton, princess_charlotte).
parent(prince_william, princess_charlotte).
parent(autumn_kelly,savannah_phillips).
parent(peter_phillips,savannah_phillips).
parent(autumn_kelly,isla_phillips).
parent(peter_phillips,isla_phillips).
parent(zara_phillips, mia_grace_tindall).
parent(mike_tindall, mia_grace_tindall).


/* Rules */
husband(Person,Wife) :- married(Person,Wife), male(Person), female(Wife).
wife(Person,Husband) :- married(Person,Husband), male(Husband), female(Person).
father(Parent,Child) :- parent(Parent,Child), male(Parent).
mother(Parent,Child) :- parent(Parent,Child), female(Parent).
child(Child,Parent) :- parent(Parent,Child).
son(Child,Parent) :- child(Child,Parent), male(Child).
daughter(Child,Parent) :- child(Child,Parent), female(Child).
grandparent(GP,GC) :- parent(GP,Parent), parent(Parent,GC).
grandmother(GM,GC) :- grandparent(GM,GC), female(GM).
grandfather(GF,GC) :- grandparent(GF,GC), male(GF).
grandchild(GC,GP) :- grandparent(GP,GC).
grandson(GS,GP) :- grandchild(GS,GP),male(GS).
granddaughter(GD,GP) :- grandchild(GD,GP), female(GD).
sibling(Person1,Person2) :- parent(X,Person1), parent(X,Person2), isDiff(Person1,Person2).
brother(Person,Sibling) :- sibling(Person, Sibling), male(Person).
sister(Person,Sibling) :- sibling(Person, Sibling), female(Person).
aunt(Person, NieceNephew) :- parent(Person1,NieceNephew), parent(Person2,Person),parent(Person2,Person1),female(Person), isDiff(Person1,Person).
uncle(Person, NieceNephew) :- parent(Person1,NieceNephew), parent(Person2,Person),parent(Person2,Person1),male(Person), isDiff(Person1,Person).
niece(Person, AuntUncle) :- parent(Person1,Person), parent(Person2,AuntUncle),parent(Person2,Person1),female(Person), isDiff(Person1,AuntUncle).
nephew(Person, AuntUncle) :- parent(Person1,Person), parent(Person2,AuntUncle),parent(Person2,Person1),male(Person), isDiff(Person1,AuntUncle).