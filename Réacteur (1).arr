use context starter2024
#vous devez développer le système de contrôle d'un réacteur nucléaire.

 



#Si le réacteur est dans un état inférieur à la criticité = il peut être endommagé

#Si l'état du réacteur dépasse la criticité, il peut surcharger et entraîner une fusion. Nous voulons réduire les risques de fusion, et gérer correctement

#La première tâche: 
#vérifier, étant donné une température et une quantité de neutrons par seconde, si le réacteur est dans un état critique. Un réacteur est dit critique s'il satisfait les conditions suivantes :
#critique:
#Sa température est de moins de 700 degrés Kelvin.
#La quantité de neutrons émis par seconde est plus grande que 500.
#Le produit de la température et des neutrons émis par seconde est inférieur à 50 000.


#état critique = 
#temperature < 700 degrés Kelvin
#quantité de neutrons émis par seconde > 500
#Le produit de la température et des neutrons émis par seconde < 50 000

t = temperature 
q-n-s = quantite de neutrons emis par seconde

fun  criticite(t :: Number, q-n-s :: Number) -> boolean 
  doc: " verifier  si le reacteur est dans un etat critique."
    is cond1 = t < 700
    is cond2 = q-n-s > 500
    is cond3 = (t * q-n-s) < 50 000
where:
  criticite(500 * 700) is true
  criticite(900 * 400) is false
  end


#Par exemple, étant donné une tension de 200, un courant de 50, et une puissance maximale de 15000, la couleur représentative de l'efficacité du réacteur est orange.

#La deuxième tâche de votre programme est de déterminer l'efficacitétension, son courant et sa puissance maximale théorique

#(tension) (courant)  (puissance maximale)  

#catégories :
#vert : efficacité de 80% ou plus.
#orange : efficacité inférieure à 80%, mais d'au moins 60%.
#rouge : efficacité inférieure à 60%, mais d'au moins 30%.
#noir : efficacité inférieure à 30%.

#L'efficacité d'un réacteur est le quotient de la puissance qu'il génère et de sa puissance maximale, multipliée par 100

#(puissance qu'il génère / puissance maximale) * 100
  
#La puissance générée est calculée en multipliant la tension et le courant.

# tension 200 * courant 50 = puissance générée
# 10 000 / 15 000 = 0.6666
# 0.6666666 * 100 = 66.66 - orange

# tension 50 * courant 15 = puissance générée
# 750 / 6 000 = 0.125
# 0.125 * 100 = 12.5 - noir


fun puissance-gen(tension :: Number, courant :: Number) -> Number
  doc: "sert a calculer la puissance qu`un reacteur genere."
  tension * courant
where:
  puissance-gen(200, 50) is 200 * 50
  puissance-gen(50, 15) is 50 * 15
end


fun efficacite(puissance-gen :: Number, puissance-max :: Number) -> Number
  doc: " Determine l`efficcite d`un recteur en %."
  ( puissance-gen / puissance-max) * 100
where:
  efficacite(750, 6000) is (750 / 6000) * 100
  efficacite(10 000, 15 000) is (10 000 / 15 000) * 100
end
      
    
fun greet(categorie :: Number) -> string
  doc: "determine par code de couleur l`efficacite d`un reacteur."
  is-vert = (categorie >= 80) and (categorie <= 100)
  is-orange = (categorie >= 60) and (categorie <= 79)
  is-rouge = (categorie >= 30) and (categorie <= 59)
  is-noir = (categorie >= 0) and (categorie <= 29)
  if is-vert:
    "vert"
  else if is-orange:
    "orange"
  else if is-rouge:
    "rouge"
  else if is-noir:
    "noir"
  else:
    ""
  end
where:
  greet(101) is ""
  greet(80) is "vert"
  greet(100) is "vert"
  greet(60) is "orange"
  greet(79) is "orange"
  greet(30) is "rouge"
  greet(59) is "rouge"
  greet(0) is "noir"
  greet(29) is "noir"
  greet(-1) is ""
end


Pour ce devoir, vous devez développer le système de contrôle d'un réacteur nucléaire