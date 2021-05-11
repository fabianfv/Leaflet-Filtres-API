var map = L.map("mapid").on("load", onMapLoad).setView([41.4, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});

var tiles = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];

const kindFoodList = document.querySelector("#kind_food_selector");

async function getRestaurants() {
  try {
    const response = await fetch("http://localhost/Leaflet+Filtres+API/api/apiRestaurants.php");

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    } else {
      return await response.json();
    }
  } catch (e) {
    console.log(e);
  }
}

async function onMapLoad() {
	// FASE 3.1
  // 1) Relleno el data_markers con una petición a la api
  data_markers = await getRestaurants();

  /*
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/
}

kindFoodList.addEventListener("change", e => {
  render_to_map(data_markers, e.target.value);
});

function render_to_map(data_markers, filter) {
  /*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
	*/
}
