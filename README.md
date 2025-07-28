# Daily Chaos  

A fun and simple Flutter app that gives you one mini-challenge per day to break the monotony and spark good habits. Celebrate wins with 🎉 confetti, 🔊 sound, and smooth UI vibes.

##  Features

- ✅ One new challenge per day
- 🔁 Resets and re-rolls possible
- 💾 Local storage using `shared_preferences` for challenge caching
- 🎊 **Confetti animation** on task completion
- 🔊 **Sound feedback** with success jingle
- 🧠 Clean architecture using services and models
- 🎨 Polished UI using `GoogleFonts`, `Lottie`, and custom gradients



## 🛠Tech Stack

- Flutter (Frontend)
- Dart (Logic)
- `shared_preferences` (local cache)
- `audioplayers` (sound)
- `confetti` (animation)
- `lottie` (celebration)
- `google_fonts` (styling)

---

##  How to Run

```bash
git clone https://github.com/WISH-CODES/daily-chaos.git
cd daily-chaos

# Get dependencies
flutter pub get

# Run on emulator or device
flutter run

📂 Project Structure 
lib/
├── main.dart
├── app.dart
├── models/
│   └── challenge_model.dart
├── services/
│   ├── challenge_service.dart
│   └── storage_service.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   └── confetti_widget.dart
├── data/
│   └── challenges.json

⚡ Next Improvements (Coming Soon)
 -Daily notification reminders
 -Global challenge leaderboard (Firebase)
 -Custom user-added challenges
 -Dark mode

Built with ❤️ by @WISH-CODES

yaml
 What you need to do:
- Add `assets/screenshots/home.png` & `completed.png` or remove the screenshot section
- Adjust GitHub URL if it changes
- Add a `LICENSE` file (MIT recommended)
- Commit & push:

```bash
touch README.md
# paste the content above
git add README.md
git commit -m "Add project README"
git push

