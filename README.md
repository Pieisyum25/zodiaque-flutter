# My Flutter App - "Zodiaque":

<p float="left">
  <img src="https://github.com/Pieisyum25/zodiaque-flutter/assets/80517108/a2843c53-75ff-451d-bab4-de256031e01b.JPG" alt="signs screen" width="250"/>
  <img src="https://github.com/Pieisyum25/zodiaque-flutter/assets/80517108/78036171-0946-40aa-80a2-dbf59ce5a2c2.JPG" alt="sign detail screen" width="250"/>
  <br>
  <img src="https://github.com/Pieisyum25/zodiaque-flutter/assets/80517108/dcc3b0b3-ac91-4442-9493-8e307ce53ddd.JPG" alt="forum screen" width="250"/>
  <img src="https://github.com/Pieisyum25/zodiaque-flutter/assets/80517108/e06db15d-2e13-41da-9181-21c08dfd8b70.JPG" alt="forum detail screen" width="250"/>
  <br>
  <img src="https://github.com/Pieisyum25/zodiaque-flutter/assets/80517108/82b022f6-7ffc-4b07-9061-234b45637147.JPG" alt="journal screen" width="250"/>
  <img src="https://github.com/Pieisyum25/zodiaque-flutter/assets/80517108/f85f1255-7fcb-47b1-87a8-afd903f479ef.JPG" alt="journal detail screen" width="250"/>
</p>

### App Description:

"Zodiaque" is an essential app for all astrology fanatics. Pick a zodiac sign, see a selection of horoscopes collated from the top horoscope sites, and talk about how they relate to your day in an online forum.

Technologies:
- Built in Flutter with the Dart programming language following an MVC architecture.
- Uses HTTP, HTML, and HTML parsing APIs for webscraping horoscope data.
- Uses the MQTT client and server client packages for connecting to an external MQTT broker server and sending/receiving forum posts.
- Uses a lightweight Hive database for storing local journal data.

How to run:
- Clone the repository with "git clone <repo url>".
- Inside the folder, enter "flutter pub get" to download all the required packages (requires flutter cli).
- Once that is done, enter "flutter run" to start the application.
- Finally, to open the app on your desired platform, follow the instructions that appear.
- I personally used the Windows app for testing (can be opened by pressing 1, but requires Visual Studio's C/C++ Workload).

Main Features:
- Users can quickly access daily horoscopes from a variety of websites for their preferred zodiac sign.
- Users can read and post instant messages on a public forum with a range of topics (one topic for each sign, plus a general topic). This acts similar to old online chatrooms, where message history is deleted upon closing the app, and users can be as anonymous as desired. This makes it great for passively sharing experiences and thoughts about today's horoscope.
- Users can create, edit, and delete journal entries in a private journal, with all data stored on the user's device. This is perfect for those personal thoughts about the daily horoscope that you might not want to publicly disclose.
- Users can easily move between these three main screens via the bottom tabs.

Target Demographic:
- Anyone maybe a little too interested in astrology, zodiac signs, or horoscopes.
