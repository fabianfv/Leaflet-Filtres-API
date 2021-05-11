var map = L.map("mapid").on("load", onMapLoad).setView([41.4, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});

var tiles = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];
var marker;
var restosFiltrados;

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

function createOptionElement(kind_food) {
  const option = document.createElement("option");
  option.innerText = kind_food;
  option.value = kind_food;
  return option;
}

function populateKindFoodSelect(values) {
  kindFoodList.appendChild(createOptionElement("Ninguno"));
  kindFoodList.appendChild(createOptionElement("Todos"));
  values.forEach(kind_food => kindFoodList.appendChild(createOptionElement(kind_food)));
}

kindFoodList.addEventListener("change", e => {
  render_to_map(data_markers, e.target.value);
});

function createMarker({name, address, lat, lng, kind_food, photo}) {
  const marker = L.marker([lat, lng]);
  const message = `
  <img src="images/${photo}" alt="${name}" class="card-photo"/>
  <div class="card-data">
    <p class="resto-name">${name}</p>
    <p class="resto-kind-food">${kind_food}</p>
    <p class="resto-address">${address}</p>
  </div>
  `;
  marker.bindPopup(message);
  return marker;
}

function render_to_map(data_markers, filter) {
  // FASE 3.2
  //1) Limpio todos los marcadores
  markers.clearLayers()
  // 2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
    restosFiltrados =
      filter === "Todos"
        ? data_markers
        : data_markers.filter((
          { kind_food } = restaurant) => kind_food === filter
        );

    restosFiltrados.forEach(restaurant => markers.addLayer(createMarker(restaurant)));

    map.addLayer(markers);
}

async function onMapLoad() {
  // FASE 3.1
  // 1) Relleno el data_markers con una petición a la api
  data_markers = await getRestaurants();

  // 2) Añado de forma dinámica en el select los posibles tipos de restaurantes
  const selectValues = new Set(
    data_markers
      .map(restaurant => restaurant.kind_food)
      .filter(label => label !== "")
      .sort()
  );
  populateKindFoodSelect(selectValues);

  //	3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
  render_to_map(data_markers, "Todos");
}