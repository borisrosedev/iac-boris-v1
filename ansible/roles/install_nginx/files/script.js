// Compteur cote client, purement dynamique en JavaScript - aucun backend
// necessaire. Illustre que les fichiers statiques servis par nginx
// peuvent inclure du JS interactif (consigne : "resultat dynamique").
document.addEventListener("DOMContentLoaded", () => {
  const valueEl = document.getElementById("counter-value");
  const buttonEl = document.getElementById("counter-button");
  let count = 0;

  buttonEl.addEventListener("click", () => {
    count += 1;
    valueEl.textContent = count;

    // Petit effet visuel au clic (aucune dependance externe).
    valueEl.classList.remove("bump");
    void valueEl.offsetWidth; // relance l'animation CSS
    valueEl.classList.add("bump");
  });
});
