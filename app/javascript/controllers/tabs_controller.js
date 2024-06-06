import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [ "content", "link" ]
// Dans cette fonction, recherche de l'onglet "News" et chargement son contenu en appelant la méthode loadContent(newsTab) si l'élément existe.
// Chargement par défaut de l'onglet new lors du chargement de la page
  async connect() {
    const newsTab = this.element.querySelector("#news_tab");
    await this.loadContent(newsTab);
  }
// Dans cette fonction, appel de la méthode loadContent avec l'élément sur lequel l'utilisateur a cliqué (event.currentTarget).
// Cela permet de charger le contenu de l'onglet correspondant au lien cliqué.
  async load(event) {
    event.preventDefault();
    await this.loadContent(event.currentTarget);
  }
//Elle récupère l'URL du lien à partir de l'attribut href, puis effectue une requête fetch pour obtenir le contenu à cette URL.
//Le contenu est extrait de la réponse et inséré dans la cible spécifiée (this.contentTarget).
  async loadContent(tab) {
    const url = tab.getAttribute("href");
    this.contentTarget.innerHTML = "";
    try {
      const response = await fetch(url);
      if (response.ok) {
        const html = await response.text();
        this.contentTarget.innerHTML = html;
      } else {
        console.error("Failed to load content", response.status, response.statusText);
      }
    } catch (error) {
      console.error("Error fetching content", error);
    }
  }

  loadPlannings(event) {
    console.log("coucou");
    event.preventDefault();
    // const planningTab = this.element.querySelector("a[data-target='plannings']");
    // console.log(planningTab);
    // if (planningTab) {
    //   await this.loadContent(planningTab);
    // }
  }
}
