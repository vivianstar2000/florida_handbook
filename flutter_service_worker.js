'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b6d7ec73cac077a5b64ad1001576edbb",
"pwa.yaml": "2db05d0bf2bb07be9386e928e80a5a0b",
"version.json": "84afb7b05b120035371b47388a995168",
"index.html": "a8db5bf213c3d1fe6c7cf91975a93fe7",
"/": "a8db5bf213c3d1fe6c7cf91975a93fe7",
"main.dart.js": "3d3c195f80cc844615fc45843895b4da",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-192.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-maskable-192.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-maskable-512.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-512.png": "e4d81fbe244ba7c737d1199e8bb35376",
"manifest.json": "b958e6228585c43329a8438b1fdb49ce",
"service-worker.js": "bf046e8a98ddeddb06bab765df525147",
"assets/AssetManifest.json": "40e686f76f34428313240b441086cffe",
"assets/NOTICES": "9ba0368de0b86d4540926c6f41273ae4",
"assets/app_icon.png.png": "e4d81fbe244ba7c737d1199e8bb35376",
"assets/FontManifest.json": "d0aec0f15b2abf2ab02748cd9e4f9997",
"assets/AssetManifest.bin.json": "dd8b3849d71268c6192b73f410085f49",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "bfb95ec8fe2ca0c4173ce0bc231124bc",
"assets/fonts/MaterialIcons-Regular.otf": "95f87c4fb37582e7f697c88ced779ce3",
"assets/assets/items.jpg": "7325dfc827b77527e92c99edc9750383",
"assets/assets/i.png": "137a3467a0bf54a5aae5566b43fea1e3",
"assets/assets/dennis.jpeg": "2c9442c4bac2e2fdbf3e7eeb75e90a3c",
"assets/assets/app_icon.jpg": "88718c4ceff76b6006e0828467dffbc6",
"assets/assets/melinda.jpeg": "e80f70a237899648f8cff156602dd411",
"assets/assets/mco.png": "5a53f5a94a333a109ea24bead5469664",
"assets/assets/alena.jpeg": "bda9875f22efadd29582f05436a65c86",
"assets/assets/family.jpg": "976e5275ac9f98cd7db16014db3f9d62",
"assets/assets/alex.jpeg": "48f8e2854deff49e658e0203c1d4ee82",
"assets/assets/captain.jpg": "ca5eff09435bc7da539ab523ca156e26",
"assets/assets/notes.jpg": "ede51edcf4846496cefab90ccb184557",
"assets/assets/grandma.jpeg": "64fb86edead36d34baaf33d4159d18ce",
"assets/assets/airplane.png": "5688f0734d4116c917cf655b35996ae4",
"assets/assets/ayden.jpeg": "91e3b28c51ac95e14e72a8ead584c696",
"assets/assets/grandpa.jpeg": "59df970fa7d0a63b9d35afdf1a6bb776",
"assets/assets/schedule.jpg": "70f836ec036cc13fb7dc755e401ac984",
"assets/assets/pensacola.png": "d8e86a3274e3675a2cf82ccf8f19a56a",
"assets/assets/anthony.jpeg": "5834136cc126439e83e08dfc4884e775",
"assets/assets/ava.jpeg": "c9b2e3e290b590660a32ff9132e24d51",
"assets/assets/makayla.jpeg": "0b0fc11fe50f2e2a28739f91ffa00180",
"assets/assets/handbook%25E8%25A1%25A8%25E7%25B4%2599.jpg": "045ea0a51bc2f7ff46b240f95e60088d",
"assets/assets/fonts/Merriweather-Bold.ttf": "79ea53fed59f391498dfc6f2fbea97c2",
"assets/assets/fonts/NotoSansJP-Bold.ttf": "1bdb5bf9e923e1bc6418342bcf6fb3e0",
"assets/assets/fonts/Merriweather-Regular.ttf": "e2f219e63a575a41e10f991e9c95819a",
"assets/assets/fonts/Itim-Regular.ttf": "4a3f2cf1ced5257b6af803f4b86bf427",
"assets/assets/fonts/NotoSansJP-VariableFont_wght.ttf": "fdf96f36f855256a5bb5d664fd146557",
"assets/assets/fonts/NotoSansJP-ExtraBold.ttf": "a4f1e854cd8a6816fccea648d4b1b7ac",
"assets/assets/fonts/Nunito-VariableFont_wght.ttf": "ea0ad4c72a135f9a43ec7bb83f2469aa",
"assets/assets/fonts/NotoSansJP-Medium.ttf": "7aa0d1123977dab52b1e01f61f0a9a7f",
"assets/assets/fonts/NotoSansJP-Regular.ttf": "dd4fa7df965b4d3227bf42b9a77da3e0",
"assets/assets/fonts/NotoSansJP-Black.ttf": "c7cf13f6288ece850a978a0cfa764cd4",
"assets/assets/fonts/NotoSansJP-SemiBold.ttf": "c44d4e4829263260330f8a6b181ec9a8",
"assets/assets/fonts/Roboto-Italic-VariableFont_wdth,wght.ttf": "5b03341126c5c0b1d4db52bca7f45599",
"assets/assets/fonts/Nunito-Italic-VariableFont_wght.ttf": "14e83abff83f855acdf3bfd30da3ad79",
"assets/assets/fonts/Roboto-VariableFont_wdth,wght.ttf": "3aa911d4a1e76c8946952fe744ce7434",
"assets/assets/marissa.jpeg": "e5679b111204e96c131998f9296e0eb3",
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
