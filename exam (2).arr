use context starter2024
data Status:
  | normal
  | low
  | danger 
end

fun current-status(
    temperature :: Number, 
    neutrons :: Number,
    threshold :: Number) -> Status: 
  doc: "Détermine l`état d`un réacteur, selon son état de criticité."
  # calculé +-10% de threshol
  criticite = temperature * neutrons
  criticite-bas = threshold * 0.9
  criticite-haut = threshold * 1.1
  if criticite < criticite-bas:
    low
  else if (criticite >= criticite-bas) and (criticite <= criticite-haut):
    normal
  else:
    danger
  end
  
where:
  # Ne pas modifier les exemples ci-dessous.
  current-status(100, 10, 5000) is low
  current-status(400, 10, 5000) is low
  current-status(500, 10, 5000) is normal
  current-status(450, 10, 5000) is normal
  current-status(1000, 20, 5000) is danger
  current-status(1100, 20, 5000) is danger
  current-status(1100, 30, 5000) is danger
  current-status(0, 30, 5000) is low
  current-status(1000, 0, 5000) is low
  current-status(500, 10, 6000) is low
  current-status(1000, 30, 6000) is danger
  current-status(1200, 30, 6000) is danger
end

fun status-message(s :: Status) -> String:
  doc: "Indique aux operateurs ce qu`ils doivent faire selon le status actuel du reacteur par un message."
  if s == low:
    "Remove control rods"
  else if s == normal:
    "Optimum condition"
  else:
    "Shut down"
  end
  where:
  # Ne pas modifier les exemples ci-dessous.
  status-message(low) is "Remove control rods"
  status-message(normal) is "Optimum condition"
  status-message(danger) is "Shut down"
end

#OUFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF ; ) 6h plus tard ds les maritimes