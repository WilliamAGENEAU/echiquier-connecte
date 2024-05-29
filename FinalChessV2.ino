//Les capteurs Digital
int DS_A1 = 2;
int DS_A2 = 3;
int DS_A3 = 4;
int DS_A4 = 5;
int DS_A5 = 6;
int DS_A6 = 7;
int DS_A7 = 8;
int DS_A8 = 9;
int DS_B1 = 10;
int DS_B2 = 11;
int DS_B3 = 12;
int DS_B4 = 13;
int DS_B5 = 14;
int DS_B6 = 15;
int DS_B7 = 16;
int DS_B8 = 17;
int DS_C1 = 18;
int DS_C2 = 19;
int DS_C3 = 20;
int DS_C4 = 21;
int DS_C5 = 22;
int DS_C6 = 23;
int DS_C7 = 24;
int DS_C8 = 25;
int DS_D1 = 26;
int DS_D2 = 27;
int DS_D3 = 28;
int DS_D4 = 29;
int DS_D5 = 30;
int DS_D6 = 31;
int DS_D7 = 32;
int DS_D8 = 33;
int DS_E1 = 34;
int DS_E2 = 35;
int DS_E3 = 36;
int DS_E4 = 37;
int DS_E5 = 38;
int DS_E6 = 39;
int DS_E7 = 40;
int DS_E8 = 41;
int DS_F1 = 42;
int DS_F2 = 43;
int DS_F3 = 44;
int DS_F4 = 45;
int DS_F5 = 46;
int DS_F6 = 47;
int DS_F7 = 48;
int DS_F8 = 49;
//Les capteurs Analog
int AS_G1 = A0;
int AS_G2 = A1;
int AS_G3 = A2;
int AS_G4 = A3;
int AS_G5 = A4;
int AS_G6 = A5;
int AS_G7 = A6;
int AS_G8 = A7;
int AS_H1 = A8;
int AS_H2 = A9;
int AS_H3 = A10;
int AS_H4 = A11;
int AS_H5 = A12;
int AS_H6 = A13;
int AS_H7 = A14;
int AS_H8 = A15;

// 0 = vide
// 1 = pion
// 2 = Cavalier
// 3 = Fou
// 4 = Tour
// 5 = Roi
// 6 = Reine
/*int actualChessBoard[8][8] = {
  {4, 2, 3, 5, 6, 3, 2, 4},  // Première rangée des pièces pour les blancs
  {1, 1, 1, 1, 1, 1, 1, 1},  // Pions pour les blancs
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases vides
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases vides
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases vides
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases vides
  {-1, -1, -1, -1, -1, -1, -1, -1},  // Pions pour les noirs
  {-4, -2, -3, -5, -6, -3, -2, -4}  // Première rangée des pièces pour les noirs
};*/

/* Pour optimisatioon un tableau avec le nom des variables
String postionName[64] = {
  "DS"
}*/

int previousChessBoard[8][8] = {
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases pleines blancs
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases pleines blancs
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases pleines noirs
  {0, 0, 0, 0, 0, 0, 0, 0}  // Cases pleines noirs
};

int actualChessBoard[8][8] = {
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases pleines blancs
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases pleines blancs
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {1, 1, 1, 1, 1, 1, 1, 1},  // Cases vides
  {0, 0, 0, 0, 0, 0, 0, 0},  // Cases pleines noirs
  {0, 0, 0, 0, 0, 0, 0, 0}  // Cases pleines noirs
};

struct PinChess {
  int value; 
  String caseName; 
  
  PinChess(int value, String caseName) : value(value), caseName(caseName) {}

  int getValue(){
    return value;
  }

  String getCaseName(){
    return caseName; 
  }

};


//PinChess listePinChess[]; 




void setup() {
  Serial.begin(9600);

  //Init
  pinMode(DS_A1, INPUT);
  pinMode(DS_A2, INPUT);
  pinMode(DS_A3, INPUT);
  pinMode(DS_A4, INPUT);
  pinMode(DS_A5, INPUT);
  pinMode(DS_A6, INPUT);
  pinMode(DS_A7, INPUT);
  pinMode(DS_A8, INPUT);
  pinMode(DS_B1, INPUT);
  pinMode(DS_B2, INPUT);
  pinMode(DS_B3, INPUT);
  pinMode(DS_B4, INPUT);
  pinMode(DS_B5, INPUT);
  pinMode(DS_B6, INPUT);
  pinMode(DS_B7, INPUT);
  pinMode(DS_B8, INPUT);
  pinMode(DS_C1, INPUT);
  pinMode(DS_C2, INPUT);
  pinMode(DS_C3, INPUT);
  pinMode(DS_C4, INPUT);
  pinMode(DS_C5, INPUT);
  pinMode(DS_C6, INPUT);
  pinMode(DS_C7, INPUT);
  pinMode(DS_C8, INPUT);
  pinMode(DS_D1, INPUT);
  pinMode(DS_D2, INPUT);
  pinMode(DS_D3, INPUT);
  pinMode(DS_D4, INPUT);
  pinMode(DS_D5, INPUT);
  pinMode(DS_D6, INPUT);
  pinMode(DS_D7, INPUT);
  pinMode(DS_D8, INPUT);
  pinMode(DS_E1, INPUT);
  pinMode(DS_E2, INPUT);
  pinMode(DS_E3, INPUT);
  pinMode(DS_E4, INPUT);
  pinMode(DS_E5, INPUT);
  pinMode(DS_E6, INPUT);
  pinMode(DS_E7, INPUT);
  pinMode(DS_E8, INPUT);
  pinMode(DS_F1, INPUT);
  pinMode(DS_F2, INPUT);
  pinMode(DS_F3, INPUT);
  pinMode(DS_F4, INPUT);
  pinMode(DS_F5, INPUT);
  pinMode(DS_F6, INPUT);
  pinMode(DS_F7, INPUT);
  pinMode(DS_F8, INPUT);
  
  //Init Analog
  pinMode(AS_G1, INPUT);
  pinMode(AS_G2, INPUT);
  pinMode(AS_G3, INPUT);
  pinMode(AS_G4, INPUT);
  pinMode(AS_G5, INPUT);
  pinMode(AS_G6, INPUT);
  pinMode(AS_G7, INPUT);
  pinMode(AS_G8, INPUT);
  pinMode(AS_H1, INPUT);
  pinMode(AS_H2, INPUT);
  pinMode(AS_H3, INPUT);
  pinMode(AS_H4, INPUT);
  pinMode(AS_H5, INPUT);
  pinMode(AS_H6, INPUT);
  pinMode(AS_H7, INPUT);
  pinMode(AS_H8, INPUT);


  //PinChess DS_A1(2, "A1");

  //listePinChess[0] = new PinChess(2,"A1");

}

void loop() {
  
  DetectPieces();
  String message = DetectChange();
  //Serial.println("---------------------------------------");
  //Serial.println("Echiquier actuel :");
  //for (int i = 0; i < 8; i++) {
    //for (int j = 0; j < 8; j++) {
      //Serial.print(actualChessBoard[i][j]);
      //Serial.print("\t");  // Tabulation pour une meilleure lisibilité
    //}
    //Serial.println();  // Nouvelle ligne après chaque ligne de la matrice
  //}
  //Serial.println("---------------------------------------");
  SendInformations(message);
  delay(1000);

}



//méthode pour redondance 

void DetectPieces(){
  //ligne 1 
  int value_A1 = digitalRead(DS_A1);
  actualChessBoard[0][0] = value_A1;
  int value_B1 = digitalRead(DS_B1);
  actualChessBoard[0][1] = value_B1;
  int value_C1 = digitalRead(DS_C1);
  actualChessBoard[0][2] = value_C1;
  int value_D1 = digitalRead(DS_D1);
  actualChessBoard[0][3] = value_D1;
  int value_E1 = digitalRead(DS_E1);
  actualChessBoard[0][4] = value_E1;
  int value_F1 = digitalRead(DS_F1);
  actualChessBoard[0][5] = value_F1;
  int value_G1 = digitalRead(AS_G1);
  actualChessBoard[0][6] = value_G1;
  int value_H1 = digitalRead(AS_H1);
  actualChessBoard[0][7] = value_H1;

  //ligne 2 
  int value_A2 = digitalRead(DS_A2);
  actualChessBoard[1][0] = value_A2;
  int value_B2 = digitalRead(DS_B2);
  actualChessBoard[1][1] = value_B2;
  int value_C2 = digitalRead(DS_C2);
  actualChessBoard[1][2] = value_C2;
  int value_D2 = digitalRead(DS_D2);
  actualChessBoard[1][3] = value_D2;
  int value_E2 = digitalRead(DS_E2);
  actualChessBoard[1][4] = value_E2;
  int value_F2 = digitalRead(DS_F2);
  actualChessBoard[1][5] = value_F2;
  int value_G2 = digitalRead(AS_G2);
  actualChessBoard[1][6] = value_G2;
  int value_H2 = digitalRead(AS_H2);
  actualChessBoard[1][7] = value_H2;

  //ligne 3 
  int value_A3 = digitalRead(DS_A3);
  actualChessBoard[2][0] = value_A3;
  int value_B3 = digitalRead(DS_B3);
  actualChessBoard[2][1] = value_B3;
  int value_C3 = digitalRead(DS_C3);
  actualChessBoard[2][2] = value_C3;
  int value_D3 = digitalRead(DS_D3);
  actualChessBoard[2][3] = value_D3;
  int value_E3 = digitalRead(DS_E3);
  actualChessBoard[2][4] = value_E3;
  int value_F3 = digitalRead(DS_F3);
  actualChessBoard[2][5] = value_F3;
  int value_G3 = digitalRead(AS_G3);
  actualChessBoard[2][6] = value_G3;
  int value_H3 = digitalRead(AS_H3);
  actualChessBoard[2][7] = value_H3;

  //ligne 4 
  int value_A4 = digitalRead(DS_A4);
  actualChessBoard[3][0] = value_A4;
  int value_B4 = digitalRead(DS_B4);
  actualChessBoard[3][1] = value_B4;
  int value_C4 = digitalRead(DS_C4);
  actualChessBoard[3][2] = value_C4;
  int value_D4 = digitalRead(DS_D4);
  actualChessBoard[3][3] = value_D4;
  int value_E4 = digitalRead(DS_E4);
  actualChessBoard[3][4] = value_E4;
  int value_F4 = digitalRead(DS_F4);
  actualChessBoard[3][5] = value_F4;
  int value_G4 = digitalRead(AS_G4);
  actualChessBoard[3][6] = value_G4;
  int value_H4 = digitalRead(AS_H4);
  actualChessBoard[3][7] = value_H4;

  //ligne 5 
  int value_A5 = digitalRead(DS_A5);
  actualChessBoard[4][0] = value_A5;
  int value_B5 = digitalRead(DS_B5);
  actualChessBoard[4][1] = value_B5;
  int value_C5 = digitalRead(DS_C5);
  actualChessBoard[4][2] = value_C5;
  int value_D5 = digitalRead(DS_D5);
  actualChessBoard[4][3] = value_D5;
  int value_E5 = digitalRead(DS_E5);
  actualChessBoard[4][4] = value_E5;
  int value_F5 = digitalRead(DS_F5);
  actualChessBoard[4][5] = value_F5;
  int value_G5 = digitalRead(AS_G5);
  actualChessBoard[4][6] = value_G5;
  int value_H5 = digitalRead(AS_H5);
  actualChessBoard[4][7] = value_H5;

  //ligne 6 
  int value_A6 = digitalRead(DS_A6);
  actualChessBoard[5][0] = value_A6;
  int value_B6 = digitalRead(DS_B6);
  actualChessBoard[5][1] = value_B6;
  int value_C6 = digitalRead(DS_C6);
  actualChessBoard[5][2] = value_C6;
  int value_D6 = digitalRead(DS_D6);
  actualChessBoard[5][3] = value_D6;
  int value_E6 = digitalRead(DS_E6);
  actualChessBoard[5][4] = value_E6;
  int value_F6 = digitalRead(DS_F6);
  actualChessBoard[5][5] = value_F6;
  int value_G6 = digitalRead(AS_G6);
  actualChessBoard[5][6] = value_G6;
  int value_H6 = digitalRead(AS_H6);
  actualChessBoard[5][7] = value_H6;


  //ligne 7 
  int value_A7 = digitalRead(DS_A7);
  actualChessBoard[6][0] = value_A7;
  int value_B7 = digitalRead(DS_B7);
  actualChessBoard[6][1] = value_B7;
  int value_C7 = digitalRead(DS_C7);
  actualChessBoard[6][2] = value_C7;
  int value_D7 = digitalRead(DS_D7);
  actualChessBoard[6][3] = value_D7;
  int value_E7 = digitalRead(DS_E7);
  actualChessBoard[6][4] = value_E7;
  int value_F7 = digitalRead(DS_F7);
  actualChessBoard[6][5] = value_F7;
  int value_G7 = digitalRead(AS_G7);
  actualChessBoard[6][6] = value_G7;
  int value_H7 = digitalRead(AS_H7);
  actualChessBoard[6][7] = value_H7;

  //ligne 8 
  int value_A8 = digitalRead(DS_A8);
  actualChessBoard[7][0] = value_A8;
  int value_B8 = digitalRead(DS_B8);
  actualChessBoard[7][1] = value_B8;
  int value_C8 = digitalRead(DS_C8);
  actualChessBoard[7][2] = value_C8;
  int value_D8 = digitalRead(DS_D8);
  actualChessBoard[7][3] = value_D8;
  int value_E8 = digitalRead(DS_E8);
  actualChessBoard[7][4] = value_E8;
  int value_F8 = digitalRead(DS_F8);
  actualChessBoard[7][5] = value_F8;
  int value_G8 = digitalRead(AS_G8);
  actualChessBoard[7][6] = value_G8;
  int value_H8 = digitalRead(AS_H8);
  actualChessBoard[7][7] = value_H8;

}

void SendInformations(String message){
  Serial.println(message);
}

String DetectChange(){

  for (int i=0; i<8; i++){
    for(int j = 0; j<8; j++){
      if(actualChessBoard[i][j]!=previousChessBoard[i][j]){
        previousChessBoard[i][j] = actualChessBoard[i][j];
        if(actualChessBoard[i][j]==1){
          return String("DB:") + j + "/" + i;
        }else if(actualChessBoard[i][j]==0){
          return String("DA:") + j + "/" + i;
        }else{
          return String("ERROR");
        }
      }
    }
  }
  
  
  return "";
}

/*void FindMovement(int columnMovement, int lineMovement){

  do{
    columnMovement = FindMovementColumn();
    lineMovement = FindMovementLine();
  }while(columnMovement == 0 || lineMovement == 0);

}


int FindMovementColumn(){

  //Lire chaque colonne
  int value_column1 = digitalRead(column1);
  int value_column2 = digitalRead(column2);
  int value_column3 = digitalRead(column3);
  int value_column4 = digitalRead(column4);
  int value_column5 = digitalRead(column5);
  int value_column6 = digitalRead(column6);
  int value_column7 = digitalRead(column7);
  int value_column8 = digitalRead(column8);
  
  //for(int i=1; i<9; i++){
    //if(digitalRead(i) == 0){
      //return i;
    //}
  //}

  return 0;

}


int FindMovementLine(){

  //Lire chaque ligne
  int value_line1 = digitalRead(line1);
  int value_line2 = digitalRead(line2);
  int value_line3 = digitalRead(line3);
  int value_line4 = digitalRead(line4);
  int value_line5 = digitalRead(line5);
  int value_line6 = digitalRead(line6);
  int value_line7 = digitalRead(line7);
  int value_line8 = digitalRead(line8);

  //for(int i=9; i<17; i++){
    //if(digitalRead(i) == 0){
      //return i;
  //  }
  //}

  return 0;
}*/

/*
int FindPiece(int column, int line){

  return chessBoard[column][line];

}*/

void PossibleMoves(int piece){

  if(piece == 1){
    //pion
    //if premier deplacement possible déplacement 2 cases
    //Avance d'une case devant - Ne peut pas revenir en arrière
    //if pions adverse en première case en diagonal gauche ou droite, peut alors prendre le pion et changer de colonne 
    //if pion devant alors impossible d'avancer
    //[Optionnel] if pion à la dernière case adverse, alors promotion 
  }else if(piece == 2){
    //cavalier
    //Se déplace en L donc 2 case horizontales et 1 case vertical ou inversement
    //Capable de sauter par dessus des pièces
  }else if(piece == 3){
    //fou
    //Se déplace en diagonal d'un nbr de case indifférent 
    //column + (8 - line) et line + (8 - column) / column + (8 - line) et line - (column - 1) / column - (line - 1) et line + (8 - column) / column - (line - 1) 
  }else if(piece == 4){
    //tour
    //Se déplace en verticale et horizontale d'un nbr de case indifférent 
    //column + (8 - line)  / column - (line - 1) / line + (8 - column) / line - (column -1)
  }else if(piece == 5){
    //Roi
    //Se déplace de 1 case dans toutes les directions (horizontales / verticales / diagonales)
    //column + 1 / column - 1 / line + 1 / line - 1 / column + 1 et line + 1 / column +1 et line -1 / column -1 et line +1 / column -1 et line -1
  }else if(piece == 6){
    //Reine
    //Se déplace d'un nbr indiférrent de case dans toutes les directions (horizontales / verticales / diagonales)
  }else{
    //error
  }

}






