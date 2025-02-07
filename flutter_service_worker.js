'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b6d7ec73cac077a5b64ad1001576edbb",
"pwa.yaml": "2db05d0bf2bb07be9386e928e80a5a0b",
"version.json": "84afb7b05b120035371b47388a995168",
"index.html": "a8db5bf213c3d1fe6c7cf91975a93fe7",
"/": "a8db5bf213c3d1fe6c7cf91975a93fe7",
"main.dart.js": "26e72693a31dc31a9d9119329172f1ed",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-192.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-maskable-192.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-maskable-512.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-512.png": "e4d81fbe244ba7c737d1199e8bb35376",
"manifest.json": "b958e6228585c43329a8438b1fdb49ce",
"service-worker.js": "bf046e8a98ddeddb06bab765df525147",
"assets/AssetManifest.json": "24b1c421228740513d3f36a026d03453",
"assets/NOTICES": "9ba0368de0b86d4540926c6f41273ae4",
"assets/app_icon.png.png": "e4d81fbe244ba7c737d1199e8bb35376",
"assets/FontManifest.json": "41742322d5ed0067f430b83f565175f0",
"assets/AssetManifest.bin.json": "7ad1e9b82cc372e30eba2a262eafbf1f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f921d46f3b2990b2832a4f5021f682be",
"assets/fonts/MaterialIcons-Regular.otf": "95f87c4fb37582e7f697c88ced779ce3",
"assets/assets/items.jpg": "7325dfc827b77527e92c99edc9750383",
"assets/assets/i.png": "137a3467a0bf54a5aae5566b43fea1e3",
"assets/assets/i.jpg": "8e4e62be43a19dc582ff5dd6a518f588",
"assets/assets/dennis.jpeg": "2c9442c4bac2e2fdbf3e7eeb75e90a3c",
"assets/assets/tradutor.jpeg": "b2ee91ec4f4d66fede0aba584cdcb900",
"assets/assets/app_icon.jpg": "88718c4ceff76b6006e0828467dffbc6",
"assets/assets/melinda.jpeg": "e80f70a237899648f8cff156602dd411",
"assets/assets/familyX.jpg": "dbe639dfbd9b984f31aad181db3bc7ad",
"assets/assets/mco.jpg": "dcbc0298b7925af6948421fa7d4948d9",
"assets/assets/iconbox/ririku.png": "a9ce56e30e9e141347f5eba1e2afc1f2",
"assets/assets/iconbox/check.png": "456ea9d3cc8507d0a971ee0d1ee53ccb",
"assets/assets/iconbox/train.png": "6b65d8da2c401ec7fec195280b1cbc96",
"assets/assets/iconbox/coffee.png": "8c5afa4be6369f385be2e676205038e7",
"assets/assets/iconbox/passport2.png": "13b421b6ca9e55141d95954a91abcc14",
"assets/assets/iconbox/castle.png": "c4672eaaa735b0880a5eadc3779e49ec",
"assets/assets/iconbox/tyakuriku.png": "1efc987089a5010335f53cf06e49b51b",
"assets/assets/iconbox/log-out.png": "9d71ced6e58c8794bd91c8952ca6c7ac",
"assets/assets/iconbox/sea-turtle.png": "2f2acada0f569fce838bd6b818a7b7ba",
"assets/assets/iconbox/baggage-carousel.png": "26216940cf94fb275bcb5abdab05b1f3",
"assets/assets/iconbox/poster.pdf": "e6cfe94e1661ecddaf58bcf2f08cf408",
"assets/assets/iconbox/shower.png": "8cfb74e203933dff0343d9e30e179098",
"assets/assets/iconbox/shopping.png": "52b11b24977585b58f84bea416cbabb4",
"assets/assets/iconbox/home.png": "94f8bfa390f4fa27557c463069a6be8c",
"assets/assets/iconbox/restaurant.png": "0689ea509f09b5fd84db069ec14bb11d",
"assets/assets/iconbox/passport.png": "e20d777130cf5d15880bcbef986a5f90",
"assets/assets/iconbox/airplane.png": "6aad00ada4a961a6323dc2cb8dbce125",
"assets/assets/iconbox/airport.png": "6cdaba772aa98cddc326cd4c721ad85b",
"assets/assets/iconbox/suitcase.png": "98ea693ff29dab85c38be4ecdce3be68",
"assets/assets/iconbox/car.png": "ccd315bcb34abe5c12736fe70a05b1f0",
"assets/assets/iconbox/take-a-break.png": "89363cdb2d0277542811bfeed9661839",
"assets/assets/iconbox/camper-van.png": "470d10a5cda6425e96dc5d76d75b8c55",
"assets/assets/iconbox/sun.png": "edf50eb2ab81238f48ac458733fd8344",
"assets/assets/iconbox/night.png": "9ccef2d9e14860a6c8bb6da1d6377784",
"assets/assets/iconbox/aviation.png": "f9f20361d8e5f10aa3bab4a38d0c61c5",
"assets/assets/iconbox/mickey.jpg": "2743e5fe136426b2e1707eb7b018014f",
"assets/assets/mco.png": "5a53f5a94a333a109ea24bead5469664",
"assets/assets/alena.jpeg": "bda9875f22efadd29582f05436a65c86",
"assets/assets/notesX.jpg": "591148d3c5db5339b8b1381f44e5ebbc",
"assets/assets/family.jpg": "976e5275ac9f98cd7db16014db3f9d62",
"assets/assets/AssetManifest.json": "fd9f2216a269821e8084f632ace4939a",
"assets/assets/alex.jpeg": "48f8e2854deff49e658e0203c1d4ee82",
"assets/assets/scheduleX.jpg": "30fe95ecf326eb3dfb9c04ca6d81339d",
"assets/assets/captain.jpg": "ca5eff09435bc7da539ab523ca156e26",
"assets/assets/notes.jpg": "ede51edcf4846496cefab90ccb184557",
"assets/assets/NOTICES": "9ba0368de0b86d4540926c6f41273ae4",
"assets/assets/grandma.jpeg": "64fb86edead36d34baaf33d4159d18ce",
"assets/assets/itemsX.jpg": "22f81f7d2860a16e22b19cd6f60b73c9",
"assets/assets/app_icon.png.png": "e4d81fbe244ba7c737d1199e8bb35376",
"assets/assets/airplane.jpg": "05aaafcb40724cba9f62f4ea61326b43",
"assets/assets/airplane.png": "5688f0734d4116c917cf655b35996ae4",
"assets/assets/FontManifest.json": "41742322d5ed0067f430b83f565175f0",
"assets/assets/AssetManifest.bin.json": "63e73655193b1e164877c0ba9844a42f",
"assets/assets/ayden.jpeg": "91e3b28c51ac95e14e72a8ead584c696",
"assets/assets/grandpa.jpeg": "59df970fa7d0a63b9d35afdf1a6bb776",
"assets/assets/schedule.jpg": "70f836ec036cc13fb7dc755e401ac984",
"assets/assets/pensacola.jpg": "970a28e8c9c81e0c7ea3f3e0fe81dfa0",
"assets/assets/pensacola.png": "d8e86a3274e3675a2cf82ccf8f19a56a",
"assets/assets/englishX.jpg": "18d1d3fc18bbd2aa5085c0125ecb3be8",
"assets/assets/schedule1.jpg": "55405f26c49fbcb44108267272bdab7f",
"assets/assets/995a34e3cd8f9e7508fa40491fb856d8.jpg": "59d18f731415d808646808cab6ec58ca",
"assets/assets/anthony.jpeg": "5834136cc126439e83e08dfc4884e775",
"assets/assets/ava.jpeg": "c9b2e3e290b590660a32ff9132e24d51",
"assets/assets/makayla.jpeg": "0b0fc11fe50f2e2a28739f91ffa00180",
"assets/assets/handbook%25E8%25A1%25A8%25E7%25B4%2599.jpg": "045ea0a51bc2f7ff46b240f95e60088d",
"assets/assets/AssetManifest.bin": "280303a1e2d8304363f041b79d5a0dfd",
"assets/assets/fonts/Merriweather-Bold.ttf": "79ea53fed59f391498dfc6f2fbea97c2",
"assets/assets/fonts/NotoSansJP-Bold.ttf": "1bdb5bf9e923e1bc6418342bcf6fb3e0",
"assets/assets/fonts/Merriweather-Regular.ttf": "e2f219e63a575a41e10f991e9c95819a",
"assets/assets/fonts/Itim-Regular.ttf": "4a3f2cf1ced5257b6af803f4b86bf427",
"assets/assets/fonts/Nunito-Medium.ttf": "d26cecc95cdc8327b337357e6c5c1f5b",
"assets/assets/fonts/NotoSansJP-VariableFont_wght.ttf": "fdf96f36f855256a5bb5d664fd146557",
"assets/assets/fonts/Nunito-ExtraBold.ttf": "5b5a206f5cd32fa496c93925d0caf609",
"assets/assets/fonts/NotoSansJP-ExtraBold.ttf": "a4f1e854cd8a6816fccea648d4b1b7ac",
"assets/assets/fonts/Nunito-VariableFont_wght.ttf": "ea0ad4c72a135f9a43ec7bb83f2469aa",
"assets/assets/fonts/Nunito-Regular.ttf": "b83ce9c59c73ade26bb7871143fd76bb",
"assets/assets/fonts/NotoSansJP-Medium.ttf": "7aa0d1123977dab52b1e01f61f0a9a7f",
"assets/assets/fonts/NotoSansJP-Regular.ttf": "dd4fa7df965b4d3227bf42b9a77da3e0",
"assets/assets/fonts/Nunito-SemiBold.ttf": "38257ec36f55676f98fcdf1264adb69d",
"assets/assets/fonts/Nunito-Bold.ttf": "ba43cdecf9625c0dcec567ba29555e15",
"assets/assets/fonts/Nunito-Black.ttf": "27ee28fd596c0bd4235fa792d0d8b1ce",
"assets/assets/fonts/NotoSansJP-Black.ttf": "c7cf13f6288ece850a978a0cfa764cd4",
"assets/assets/fonts/NotoSansJP-SemiBold.ttf": "c44d4e4829263260330f8a6b181ec9a8",
"assets/assets/fonts/Roboto-Italic-VariableFont_wdth,wght.ttf": "5b03341126c5c0b1d4db52bca7f45599",
"assets/assets/fonts/Nunito-Italic-VariableFont_wght.ttf": "14e83abff83f855acdf3bfd30da3ad79",
"assets/assets/fonts/Roboto-VariableFont_wdth,wght.ttf": "3aa911d4a1e76c8946952fe744ce7434",
"assets/assets/marissa.jpeg": "e5679b111204e96c131998f9296e0eb3",
"assets/assets/assets/items.jpg": "7325dfc827b77527e92c99edc9750383",
"assets/assets/assets/i.png": "137a3467a0bf54a5aae5566b43fea1e3",
"assets/assets/assets/i.jpg": "8e4e62be43a19dc582ff5dd6a518f588",
"assets/assets/assets/dennis.jpeg": "2c9442c4bac2e2fdbf3e7eeb75e90a3c",
"assets/assets/assets/tradutor.jpeg": "b2ee91ec4f4d66fede0aba584cdcb900",
"assets/assets/assets/app_icon.jpg": "88718c4ceff76b6006e0828467dffbc6",
"assets/assets/assets/melinda.jpeg": "e80f70a237899648f8cff156602dd411",
"assets/assets/assets/familyX.jpg": "dbe639dfbd9b984f31aad181db3bc7ad",
"assets/assets/assets/mco.jpg": "dcbc0298b7925af6948421fa7d4948d9",
"assets/assets/assets/mco.png": "5a53f5a94a333a109ea24bead5469664",
"assets/assets/assets/alena.jpeg": "bda9875f22efadd29582f05436a65c86",
"assets/assets/assets/notesX.jpg": "591148d3c5db5339b8b1381f44e5ebbc",
"assets/assets/assets/family.jpg": "976e5275ac9f98cd7db16014db3f9d62",
"assets/assets/assets/AssetManifest.json": "703cf488fe89df842b4ae7320e20ca12",
"assets/assets/assets/alex.jpeg": "48f8e2854deff49e658e0203c1d4ee82",
"assets/assets/assets/scheduleX.jpg": "30fe95ecf326eb3dfb9c04ca6d81339d",
"assets/assets/assets/captain.jpg": "ca5eff09435bc7da539ab523ca156e26",
"assets/assets/assets/notes.jpg": "ede51edcf4846496cefab90ccb184557",
"assets/assets/assets/handbook%2525E8%2525A1%2525A8%2525E7%2525B4%252599.jpg": "045ea0a51bc2f7ff46b240f95e60088d",
"assets/assets/assets/NOTICES": "9ba0368de0b86d4540926c6f41273ae4",
"assets/assets/assets/grandma.jpeg": "64fb86edead36d34baaf33d4159d18ce",
"assets/assets/assets/itemsX.jpg": "22f81f7d2860a16e22b19cd6f60b73c9",
"assets/assets/assets/app_icon.png.png": "e4d81fbe244ba7c737d1199e8bb35376",
"assets/assets/assets/airplane.jpg": "05aaafcb40724cba9f62f4ea61326b43",
"assets/assets/assets/airplane.png": "5688f0734d4116c917cf655b35996ae4",
"assets/assets/assets/FontManifest.json": "41742322d5ed0067f430b83f565175f0",
"assets/assets/assets/AssetManifest.bin.json": "9aa4c447211c9f44c766c8c9c1ac6447",
"assets/assets/assets/ayden.jpeg": "91e3b28c51ac95e14e72a8ead584c696",
"assets/assets/assets/grandpa.jpeg": "59df970fa7d0a63b9d35afdf1a6bb776",
"assets/assets/assets/schedule.jpg": "70f836ec036cc13fb7dc755e401ac984",
"assets/assets/assets/pensacola.jpg": "970a28e8c9c81e0c7ea3f3e0fe81dfa0",
"assets/assets/assets/pensacola.png": "d8e86a3274e3675a2cf82ccf8f19a56a",
"assets/assets/assets/englishX.jpg": "18d1d3fc18bbd2aa5085c0125ecb3be8",
"assets/assets/assets/schedule1.jpg": "55405f26c49fbcb44108267272bdab7f",
"assets/assets/assets/995a34e3cd8f9e7508fa40491fb856d8.jpg": "59d18f731415d808646808cab6ec58ca",
"assets/assets/assets/anthony.jpeg": "5834136cc126439e83e08dfc4884e775",
"assets/assets/assets/ava.jpeg": "c9b2e3e290b590660a32ff9132e24d51",
"assets/assets/assets/makayla.jpeg": "0b0fc11fe50f2e2a28739f91ffa00180",
"assets/assets/assets/AssetManifest.bin": "dc81a27eef148e22a3f8046f409a9b49",
"assets/assets/assets/marissa.jpeg": "e5679b111204e96c131998f9296e0eb3",
"assets/assets/assets/planX.jpg": "9e55e003053272cc90aab448e98193aa",
"assets/assets/assets/plan.jpg": "9d36865e7d6906b8a8978c8053d38c0d",
"assets/assets/assets/english.jpg": "5844acc7e7d8a22034fc77bd3b22def3",
"assets/assets/planX.jpg": "9e55e003053272cc90aab448e98193aa",
"assets/assets/plan.jpg": "9d36865e7d6906b8a8978c8053d38c0d",
"assets/assets/english.jpg": "5844acc7e7d8a22034fc77bd3b22def3",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
