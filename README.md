
# 🎵 Melody – Mini Katalog Uygulaması

Melody, Flutter ve Dart kullanılarak geliştirilen, müzik aletlerinin keşfedilmesini, kategorilere göre filtrelenmesini, detaylarının incelenmesini ve sepete eklenmesini sağlayan bir mobil katalog uygulamasıdır.

Bu proje, TNC Group Software Persona Mobil Uygulama Geliştirme eğitimi kapsamında geliştirilmiştir.

## 📌 Projenin Amacı

Flutter ile mobil uygulama geliştirme sürecini öğrenmek; widget yapısı, sayfalar arası navigasyon, veri modelleme, JSON veri yönetimi ve temel state yönetimi konularını uygulamalı olarak pekiştirmektir.

## ✨ Uygulama Özellikleri

- 9 farklı müzik aletinin listelenmesi
- GridView ile ürün kartlarının gösterilmesi
- Ürün adına göre arama
- Kategoriye göre filtreleme
- Ürün detay ekranı
- Sepete ürün ekleme
- Sepetteki ürün adedini artırma
- Sepetten ürün çıkarma
- Boş sepet ekranı
-  Enstrümanları favorilere ekleme
- Favorilerden ürün çıkarma
- Favori enstrümanları listeleme
- JSON üzerinden dinamik veri yükleme
- Siyah ve altın tonlarından oluşan arayüz tasarımı

## 📱 Uygulama Ekran Görüntüleri

### Ana Sayfa

Müzik aletlerinin kartlar halinde listelendiği, arama ve kategori filtreleme işlemlerinin yapılabildiği ekrandır.

<img width="372" height="741" alt="image" src="https://github.com/user-attachments/assets/24558544-386f-438d-a537-98346d164f95" />


### Arama ve Filtreleme

Kullanıcıların ürün adına veya enstrüman kategorisine göre arama yapabildiği bölümdür.

<img width="363" height="745" alt="image" src="https://github.com/user-attachments/assets/e13352a4-b05c-418d-b749-0bfb42b30ef8" />


### Ürün Detay Ekranı

Seçilen enstrümanın görselinin, adının, fiyatının, kategorisinin ve açıklamasının gösterildiği ekrandır.

<img width="356" height="731" alt="image" src="https://github.com/user-attachments/assets/6ccd92cd-3529-4299-bbd9-9e573c8735bc" />


### Sepet Ekranı

Sepete eklenen ürünlerin listelendiği, ürün adetlerinin artırılabildiği ve ürünlerin sepetten çıkarılabildiği ekrandır.

<img width="361" height="740" alt="image" src="https://github.com/user-attachments/assets/b1ce9a4d-4d52-4307-8176-609aba0b1955" />


### Boş Sepet Ekranı

Sepette herhangi bir ürün bulunmadığında gösterilen ekrandır.

<img width="355" height="727" alt="image" src="https://github.com/user-attachments/assets/ff75ee34-87e2-4630-8931-afd59f948c55" />

### Favoriler Ekranı

Kullanıcıların beğendikleri enstrümanları favorilerine
ekleyebildiği, listeleyebildiği ve favorilerinden
çıkarabildiği ekrandır.

<img width="351" height="718" alt="image" src="https://github.com/user-attachments/assets/87e2d436-3d39-4478-abb7-21c81ea31d8a" />



## 🛠️ Kullanılan Teknolojiler

| Teknoloji | Kullanım Amacı |
|---|---|
| Flutter | Mobil uygulama geliştirme |
| Dart | Programlama dili |
| Material Design | Arayüz tasarımı |
| JSON | Ürün verilerinin saklanması |
| Visual Studio Code | Kod geliştirme ortamı |
| Android Studio | Android geliştirme ve emülatör ortamı |
| Git & GitHub | Versiyon kontrolü |

## ⚙️ Kullanılan Flutter Yapıları

- StatelessWidget
- StatefulWidget
- MaterialPageRoute
- Navigator.push / Navigator.pop
- Route Arguments
- GridView.builder
- ListView.builder
- Image.asset
- setState
- fromJson / toJson
- rootBundle
- jsonDecode

## 📂 Proje Klasör Yapısı

```text
Melody/
├── assets/
│   ├── data/
│   │   └── products.json
│   └── images/
├── lib/
│   ├── models/
│   │   └── instrument.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── instrument_detail_screen.dart
│   │   └── cart_screen.dart
│   └── main.dart
├── test/
├── pubspec.yaml
└── README.md
```

## 📊 JSON Veri Yönetimi

Uygulamada kullanılan enstrüman verileri `assets/data/products.json` dosyasında saklanmaktadır.

Her ürün için aşağıdaki bilgiler bulunmaktadır:

- Ürün adı
- Fiyat
- Kategori
- Görsel dosya yolu
- Ürün açıklaması

JSON verileri `rootBundle` ve `jsonDecode` kullanılarak okunmakta, `fromJson` metodu ile Instrument nesnelerine dönüştürülmektedir.

Proje kapsamında harici bir API yerine uygulamanın konseptine uygun yerel JSON verileri kullanılmıştır.


## 🚀 Kurulum ve Çalıştırma

### 1. Projeyi klonlayın

```bash
git clone https://github.com/bengoksu/Melody.git
```

### 2. Proje klasörüne girin

```bash
cd Melody
```

### 3. Gerekli bağımlılıkları yükleyin

```bash
flutter pub get
```

### 4. Uygulamayı çalıştırın

Android emülatörünü başlatın veya fiziksel Android cihazınızı bilgisayarınıza bağlayın.

```bash
flutter run
```

## 🎯 Proje Kazanımları

Bu proje kapsamında;

- Flutter widget yapısı,
- Mobil arayüz tasarımı,
- Sayfalar arası navigasyon,
- Veri modelleme,
- JSON veri yönetimi,
- Dinamik listeleme,
- Asset yönetimi,
- Temel state yönetimi

konularında uygulamalı deneyim kazanılmıştır.
## 🔗 Proje Bağlantısı

[Melody – GitHub Repository](https://github.com/bengoksu/Melody)

## 👩‍💻 Geliştirici

**Göksu Balaban**

Bilgisayar Mühendisliği Öğrencisi

GitHub: [bengoksu](https://github.com/bengoksu)

