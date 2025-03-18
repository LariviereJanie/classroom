use context starter2024

#BUT( programme qui permet de
#calculer le prix minimum d'un billet de cinéma afin que les recettes
# annuelles couvrent les frais d'exploitation)

# - le nombre de salles en activité,
# - le nombre de jours par année durant lesquels le cinéma est ouvert.

# nombre de billets vendus par année.
#1 film = 2h
#8h / jour
#1 salle = 150 pers = pers-salle

#Pour obtenir les frais d'exploitation, il faudra calculer les salaires
# que le cinéma doit verser aux employé·es, ainsi que les frais dus aux
# distributeurs.

#Pour chaque salle en activité, deux commis aux caisses sont nécessaires.
#Les commis sont rémunéré·es au taux horaire de 20\$. Une personne
#superviseure, rémunérée 25\$ de l'heure, est également nécessaire pour
#chaque tranche de dix commis. Par exemple, une personne est nécessaire
# pour superviser cinq commis, tandis que deux personnes le sont pour en
#superviser onze.

#licence annuelle aux distributeurs, d'un coût
#de 10,000\$. À cette licence s'ajoutent des frais de 200$ par
# projection.

#nb de salle Act = nb-salles-act 
#nb de jours / an ouvert =nb-jour
#nb de billet vendu / an = nb-billet
#duree 1 film=2h
#heure/jour ouvert= h-jour = 8
#film/an = film-total

#film_jour = 8h / 2h = 4
#film_jour = 4
#film-total = film-jour * nb-salles * jour-ouv

film-jour = 4
#film-total = nb de film total / an =(nb-salles * jour-ouv) * 4
fun film-total(nb-salles :: Number, jour-ouv :: Number, film-jour :: Number) -> Number:
  doc: "calcul le nombre de film total présentés par année."
  nb-salles * jour-ouv * film-jour
where:
  nb-salles(4) is (4 / nb-salles)
  jour-ouv(200) is (200 / jour-ouv)
  film-jour(4) is (4 / film-jour)
end
#EX_film-total_4 * 150 * 4 = 2400 film par année
#EX_film-total_2 *200 * 4 = /1600/ film par année

#total-billet = film-total * pers_salle
#total-billet = film-total * 150

fun total-billet(film-total :: Number, pers-salle :: Number) -> Number:
  doc: "calcul le nombre total de billets vendus par année."
  film-total * pers-salle
where:
  film-total(1600) is (1600 / film-total)
  pers-salle(150) is (150 / pers-salle)
end

#total-billet = film-total * 150
#EX_total-billet =/1600/ * 150
#EX_total-billet = /240 000/ billet total vendu par année

# salaire annuel = ((nb d`emp * sal/h) + (nb sup * sal/h)) * h-jour * jour-ouv
#nb-emp = nb-salles * emp-salle
#EX_nb-emp = 4 * 2 = 8
#EX_nb-emp = 2 * 2 = /4/
# sal-total = nb-emp * sal-h(20) + nb-sup * sal-h(25) 
# le cerveau me lache.  J`essaie de trouver la facon de formuler 1 sup / max 10 emp..????
#EX sal-total = ((/4/ * 20) + (? * 25)) * 8 * /200/

fun sal-emp(nb-emp * sal-hr):
  doc: "calcul le salaire total des employés par année."
  nb-emp(4) is (4 / nb-emp)
  sal-hr(20) is (20 / sal-hr)
end

fun sal-sup(nb-sup * sal-sup):
  doc: "calcul le salaire total des superviseurs par année."
  nb-sup(1) is (1 / nb-sup)
  sal-sup(25) is (25 / sal-sup)
end

fun sal-total(sal-emp + sal-sup) * hr-jour * jour-ouv):
  doc: "calculer le salaire annuel total par année de tout les employés."
sal-emp + sal-sup) * hr-jour * jour-ouv
where
sal-emp(80) is (80 / sal-emp)
sal-sup(25) is (25 / sal-sup)
hr-jour(8) is (8 / hr-jour)
jour-ouv(200) is (200 / jour-ouv)
end

#1 sup/10 emp
#frais/an =10 000$ + 200$/film
#1 salle =2 emp
#nb_emp =emp_salle * nb_salle  
#nb_emp = 2 * nb_salle

fun nb-emp(emp-salle :: number, nb-salle :: number)  -> number:
  doc: "calcul le nombre d`employés regulier nécessaire pour le bon fonctionnement sur 1 an."
nb-emp = emp-salle * nb-salles 
where:
emp-salle(2) is (2 / emp-salle)
nb-salles(2) is (2 / nb-salles)
end

#licence annuelle aux distributeurs, d'un coût
#de 10,000\$. À cette licence s'ajoutent des frais de 200$ par
# projection.
  
#licence annuelle = linc = 10 000$
#frais = 200$/ film
#total-dist= (film-total * frais) + 10 000$

fun total-dist((film-total * 200) + 10 000):
doc: "calcul les frais total annuel aux distributeurs."
where:
frais(1600, 200) is (1600 / film_total) * 200
total-dist(320 000, 10 000) is (320 000 / frais) + 10 000
end

#calculer le prix minimum d'un billet de cinéma afin que les recettes
# annuelles couvrent les frais d'exploitation)

#frais d`exploitation annuel = total-expl
#total-expl = sal-total + total-dist
fun total-expl(sal-total + total-dist):
doc: "calcul l`ensemble des frais total d`exploitation par année."
where:
sal-total(168 000) is (168 000 / sal-total)
total-dist(330 000) is (330 000 / total-dist)
end

total-expl = 168 000 + 330 000 = 498 000

#calculer le prix minimum d'un billet = prix-min
#prix-min = total-expl / total-billet
fun prix-min(total-expl / total-billet):
doc: "calcul le prix minimum d`un billet afin de couvrir les frais totals d`exploitation par année."
where:
total-expl(498 000) is (498 000 / total-expl)
total-billet(240 000) is (240 000 / total-billet)
end

#prix-min= 498000 / 240000 = 2,075$
   
  #(nb-emp(4, 20) is (4 / nb-emp) * 20) +
  #(nb-sup(1, 25) is (1 / nb-sup) *25)  (8) is (8 / h-jour) * (200) is (200 / jour-ouv)
  #end
  #80+25 = 105
  #105 * 8 * 200= 168 000
  #1600 * 200 = 320 000
  #320 000 + 10 000 = 330 000


### Je suis brulée/done, jai amélioré quelques trucs que j`ai compris à force d`en faire et refaire, mais là, même plus capable
#de réviser ou CLEANER.  i`m out of order lolllll