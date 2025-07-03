# 🧑‍💻 Flutter Mini Profile Editor

A simple profile editor app built with **Flutter** and **BLoC**, allowing users to:

- View their public profile (read-only)
- Edit their profile information (private, editable)

> 🔐 Authentication is simulated with a hardcoded user.

---

## ✨ Features

- 🔁 **Two main screens**:
    - `ProfileViewPage`: Public view of user profile
    - `EditProfilePage`: Editable profile with validation

- ✅ **Form validation**:
    - Name, Bio, Email, Phone, Location
    - Custom country code and mobile number constraints

- 🔁 **Simulated REST API**:
    - `GET /profile` and `PUT /profile` handled via `Dio` interceptors
    - No real backend required

- 🎯 **State management**:
    - Powered by `flutter_bloc`
    - Handles loading, success, and error states

- 🧪 **UI/UX**:
    - Clean and responsive design using `MediaQuery`
    - Uniform layout across all screens
    - Snackbar on save
    - Save & cancel buttons in bottom navigation bar
    - Save button shows spinner on update

- 💙 **Theme**:
    - Blue primary theme
    - Light mode enforced (no dark theme)

---

## 🧰 Tech Stack

| Area               | Package/Tool      |
|--------------------|-------------------|
| State Management   | flutter_bloc       |
| API Simulation     | Dio + Interceptors |
| Navigation         | go_router          |
| Form Validation    | Native `Form` + custom validators |
| UI Enhancements    | flutter_hooks (for controllers) |
| Toast Messages     | Flutter SnackBar   |

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash

git clone https://github.com/Pavithran-python/Profile-Editor.git
cd flutter-profile-editor