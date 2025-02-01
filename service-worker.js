const CACHE_NAME = "florida-handbook-cache-v1";
const FIRESTORE_CACHE_NAME = "florida-handbook-firestore-cache";
const urlsToCache = [
    "/",
    "/index.html",
    "/flutter_bootstrap.js",
    "/main.dart.js",
    "/manifest.json",
    "/favicon.png",
    "/assets/FontManifest.json",
    "/assets/AssetManifest.bin.json"
];

// Service Worker インストール時にキャッシュ
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log("📦 キャッシュ追加中: ", urlsToCache);
      return cache.addAll(urlsToCache);
    })
  );
});

// 新しいバージョンがあればキャッシュを更新
self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            console.log("🧹 古いキャッシュを削除: ", cache);
            return caches.delete(cache);
          }
        })
      );
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
  const requestUrl = event.request.url;

  // Firestore APIのリクエストならIndexedDBからデータを取得
  if (requestUrl.includes("firestore.googleapis.com")) {
    event.respondWith(
      getFromIndexedDB("firestore-data").then((data) => {
        return new Response(JSON.stringify(data), {
          headers: { "Content-Type": "application/json" }
        });
      })
    );
    return; // ここで処理を終了
  }

  // 通常のキャッシュ処理
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request).catch(() => {
        console.log("⚠️ オフライン - キャッシュにないリソース: ", event.request.url);
        return caches.match("/index.html"); // オフライン時にindex.htmlを返す
      });
    })
  );
});
