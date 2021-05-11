var map = L.map("mapid").on("load", onMapLoad).setView([41.4, 2.206], 9);

var tiles = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {}).addTo(map);

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

function populateKindFoodSelect(labels) {
  kindFoodList.appendChild(createOptionElement("Ninguno"));
  kindFoodList.appendChild(createOptionElement("Todos"));
  labels.forEach(kind_food => kindFoodList.appendChild(createOptionElement(kind_food)));
}

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

function geolocate() {
  //if (!"geolocation" in navigator) return
  if(!navigator.geolocation) return

  navigator.geolocation.getCurrentPosition(
    ({coords: {latitude: lat, longitude: lng}} = position) => map.setView([lat, lng], 9),
    () => console.log("Unable to retrieve your location")
  );
}

function render_to_map(data_markers, filter) {
  markers.clearLayers();

  restosFiltrados =
    filter === "Todos" ? data_markers : data_markers.filter(({kind_food} = restaurant) => kind_food === filter);

  restosFiltrados.forEach(restaurant => markers.addLayer(createMarker(restaurant)));

  map.addLayer(markers);
}

async function onMapLoad() {
  geolocate();
  
  data_markers = await getRestaurants();
  
  const selectValues = new Set(
    data_markers
    .map(restaurant => restaurant.kind_food)
    .filter(label => label !== "")
    .sort()
    );
    populateKindFoodSelect(selectValues);
}

function fitBounds() {
  const restosLat = restosFiltrados.map(({lat} = resto) => lat);
  const restosLng = restosFiltrados.map(({lng} = resto) => lng);
  const southWest = [Math.min(...restosLat), Math.max(...restosLng)];
  const northEast = [Math.max(...restosLat), Math.min(...restosLng)];
  const bounds = new L.LatLngBounds(southWest, northEast);

  map.fitBounds(bounds, {padding: [50, 50]});
}

kindFoodList.addEventListener("change", e => {
  render_to_map(data_markers, e.target.value);
  fitBounds();
});
