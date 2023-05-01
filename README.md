# Walli

Walli is a multi-platform wallpaper app built with Flutter and the Pixels API. It allows users to browse and download high-quality wallpapers for their devices.

## Features

- Browse and search through a vast collection of wallpapers.
- Download wallpapers to use on your device.
- Filter wallpapers by category or search term
- Preview wallpapers before downloading them
- Save wallpapers to your device or share them with your friends

## Previews 📷

<p align="center">
<img src="https://user-images.githubusercontent.com/62101039/227745528-4cf03145-7b05-4dc1-9d04-62bc51327aaf.png" alt="app preview" width="269px" />
<img src="https://user-images.githubusercontent.com/62101039/227745523-ce4cb9d6-d83e-4d1d-b8c1-99a95192ed8a.png" alt="" width="270px" />
<img src="https://user-images.githubusercontent.com/62101039/227745711-ca1d3c76-951d-4e6a-9492-4c427f39736d.png" alt="choose model" width="270px" />

</br>
</p>

## Dependencies

- http: used for making HTTP requests to the Pixels API
- cached_network_image: used for caching and displaying remote images
- image_gallery_saver: used for saving images to the device's gallery
- permission_handler: used for requesting permission to save images
- url_launcher: used for opening URLs in the device's browser

## Installation

1. Clone this repository.
2. Run `flutter pub get` to install dependencies.
3. Register for a free Pixels API key at [https://www.pexels.com/api/](https://www.pexels.com/api/).
4. Copy your API key into `lib/data/data.dart`.
5. Run the app with `flutter run`.

## Contributing
Contributions are welcome! Please feel free to open an issue or submit a pull request.

## 📝 License
Copyright © 2023 [Ahmed Hosam](https://github.com/ahmedhosam283843). <br />
This project is [MIT](https://github.com/ahmedhosam283843/Walli/blob/master/LICENCE) licensed.
