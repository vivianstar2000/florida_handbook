'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "32397be2b7571af1cd57502c8b481e57",
"version.json": "84afb7b05b120035371b47388a995168",
"index.html": "8e09b98c603771b9fef1e65970c63fb4",
"/": "8e09b98c603771b9fef1e65970c63fb4",
"main.dart.js": "565145c99443fabaa1f6ffd060cf0508",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-192.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-maskable-192.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-maskable-512.png": "e4d81fbe244ba7c737d1199e8bb35376",
"icons/Icon-512.png": "e4d81fbe244ba7c737d1199e8bb35376",
"manifest.json": "80eb41916acdabfa47d9253b8b8b3ccc",
"assets/AssetManifest.json": "a334b0006a3d38574470a2d95f57255a",
"assets/NOTICES": "9ba0368de0b86d4540926c6f41273ae4",
"assets/app_icon.png.png": "e4d81fbe244ba7c737d1199e8bb35376",
"assets/FontManifest.json": "d0aec0f15b2abf2ab02748cd9e4f9997",
"assets/AssetManifest.bin.json": "beafd83f1c64fddee36e89ee789b65ab",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "fd44550343ef7742e180d71a0aba780f",
"assets/fonts/MaterialIcons-Regular.otf": "079b4dcda12b4ce3a6e6f8dadd57f696",
"assets/assets/items.jpg": "7325dfc827b77527e92c99edc9750383",
"assets/assets/family.jpg": "976e5275ac9f98cd7db16014db3f9d62",
"assets/assets/notes.jpg": "ede51edcf4846496cefab90ccb184557",
"assets/assets/schedule.jpg": "70f836ec036cc13fb7dc755e401ac984",
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
