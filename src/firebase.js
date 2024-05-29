// Import the functions you need from the SDKs you need
//import { initializeApp } from "firebase/app";
//import { getAnalytics } from "firebase/analytics";
import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAfcoTlavdGIvPTodly1GxAvgOeWSyi8Ig",
  authDomain: "chessproject-3b7d3.firebaseapp.com",
  databaseURL: "https://chessproject-3b7d3-default-rtdb.europe-west1.firebasedatabase.app",
  projectId: "chessproject-3b7d3",
  storageBucket: "chessproject-3b7d3.appspot.com",
  messagingSenderId: "932943917613",
  appId: "1:932943917613:web:044c4e615cf0029824bea4",
  measurementId: "G-C8M1QY0BH4"
};

// Initialize Firebase
//const analytics = getAnalytics(app);
const app = initializeApp(firebaseConfig);

// Initialize Firestore
const db = getFirestore(app);

export { db };