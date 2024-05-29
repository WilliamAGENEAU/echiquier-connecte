import serial
import firebase_admin
from firebase_admin import db, credentials, firestore

# authenticate to firebase
cred = credentials.Certificate("credentials.json")
#firebase_admin.initialize_app(cred, {"databaseURL": "https://chessproject-3b7d3-default-rtdb.europe-west1.firebasedatabase.app/"})
firebase_admin.initialize_app(cred)
db = firestore.client()


def send_data_firestore(document_id, turnNumber, data):
    try:
        # Ajouter des données à la collection
        doc_ref = db.collection("games").document(document_id)
        doc_ref.update({
            "moves": firestore.ArrayUnion([data])
        })
        print(f"Data send")
    except Exception as e:
        print(f"Une erreur s'est produite : {e}")


# db.reference("/videos").set(3)
# ref.get()

def send_data_firebase(data, turnNumber) : 
    ref = db.reference("/Turn" + str(turnNumber))
    ref.set(data)

def convert_Position_Chess(x,y) :
    x = int(x)
    y = int(y)
    letters = "abcdefgh"
    return f"{letters[x]}{y+1}"


# Ouvre la connexion série
ser = serial.Serial(port='COM6', baudrate=9600, timeout=.1) 
compteur = 0
positionBefore=""
positionAfter=""
turnNumber = 1
try:
    # Boucle infinie pour lire continuellement les données
    while True:
        # Lis une ligne de données du port série
        line = ser.readline().decode().strip()
        res = line.split()
        #DB = Detected Before
        if line.startswith("DB"):
            print("Detected Before trouve")
            compteur+=1            
            positionBefore = line
        elif line.startswith("DA"):
            print("Detected After trouve")
            compteur+=1
            postionAfter = line
        elif line.startswith("ERROR"):
            print("ERROR DETECTION")

        # Affiche la ligne de données
        print(line)
        

        #envoie les information à firebase
        if(compteur==2) : 
            from_position = convert_Position_Chess(list(positionBefore)[3], list(positionBefore)[5])
            to_position = convert_Position_Chess(list(line)[3], list(line)[5])
            # data={
            #     'positionBeforeX' : list(positionBefore)[3],
            #     'positionBeforeY' : list(positionBefore)[5],
            #     'positionAfterX' : list(line)[3],
            #     'positionAfterY' : list(line)[5]}
            data = {
                'from': from_position,
                'to': to_position
            }
            send_data_firestore("game2", turnNumber, data)
            compteur = 0
            turnNumber+=1

except KeyboardInterrupt:
    # Intercepte une interruption clavier (Ctrl+C) pour arrêter le programme proprement
    print("Arret du programme")
    ser.close()
