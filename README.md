# 💧 Drips Water App

A simple yet smart **Water Delivery App** made with Flutter — now featuring a built-in **AI chatbot** powered by Dialogflow!

---

## 🧠 Key Feature

- 🤖 **AI Chatbot (Dialogflow)** — Handles customer queries in real-time  
- 🎨 Clean and modern UI  
- 🔄 Reorder from history (UI only)  
- 🚀 Smooth navigation  
- 📱 Fully responsive layout  

> ⚠️ Note: This is a UI-only app. No backend or real-time database is connected.

---

## 🔧 Setup Instructions


1. **Clone the repo**

git clone https://github.com/DevExplorerr/Drips-Water-App.git
cd Drips-Water-App

Install packages

flutter pub get
Add your Dialogflow credentials

Put your dialog_flow_auth.json file in the assets/ folder.
⚠️ This file is private and not included in the repository.

Then update pubspec.yaml if needed:

flutter:
  assets:
    - assets/dialog_flow_auth.json
    
Run the app:
flutter run
