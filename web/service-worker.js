const CACHE_NAME = "florida-handbook-cache-v1";
const FIRESTORE_CACHE_NAME = "florida-handbook-firestore-cache";
const urlsToCache = [
  "/florida_handbook/",
  "/florida_handbook/index.html",
  "/florida_handbook/styles.css",
  "/florida_handbook/app.js",
  "/florida_handbook/icons/Icon-192.png",
  "/florida_handbook/icons/Icon-512.png"
];

// Service Worker インストール時にキャッシュ
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(urlsToCache);
    })
  );
});

// FirestoreデータをIndexedDBに保存
async function saveToIndexedDB(collection, data) {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(FIRESTORE_CACHE_NAME, 1);
    request.onupgradeneeded = (event) => {
      const db = event.target.result;
      if (!db.objectStoreNames.contains(collection)) {
        db.createObjectStore(collection, { keyPath: "id" });
      }
    };
    request.onsuccess = (event) => {
      const db = event.target.result;
      const transaction = db.transaction(collection, "readwrite");
      const store = transaction.objectStore(collection);
      data.forEach((doc) => store.put(doc));
      resolve();
    };
    request.onerror = (error) => reject(error);
  });
}

// FirestoreデータをIndexedDBから取得
async function getFromIndexedDB(collection) {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(FIRESTORE_CACHE_NAME, 1);
    request.onsuccess = (event) => {
      const db = event.target.result;
      const transaction = db.transaction(collection, "readonly");
      const store = transaction.objectStore(collection);
      const request = store.getAll();
      request.onsuccess = () => resolve(request.result);
      request.onerror = (error) => reject(error);
    };
    request.onerror = (error) => reject(error);
  });
}

// オフライン時にFirestoreのデータをIndexedDBから取得
self.addEventListener("fetch", (event) => {
  if (event.request.url.includes("firestore.googleapis.com")) {
    event.respondWith(
      getFromIndexedDB("firestore-data").then((data) => {
        return new Response(JSON.stringify(data), {
          headers: { "Content-Type": "application/json" }
        });
      })
    );
  } else {
    event.respondWith(
      caches.match(event.request).then((response) => {
        return response || fetch(event.request);
      })
    );
  }
});
