import React, { useEffect, useState } from "react";
import { Chessboard } from "react-chessboard";
import { db } from "./firebase";
import { doc, onSnapshot, setDoc } from "firebase/firestore";
import { Chess } from "chess.js";
import './App.css';

function App() {
  const [game, setGame] = useState(new Chess());
  const [boardSize, setBoardSize] = useState(400); // taille par défaut du plateau

  useEffect(() => {
    console.log("Setting up Firestore subscription");
    const unsubscribe = onSnapshot(doc(db, "games", "game1"), (doc) => {
      const data = doc.data();
      if (data) {
        const chess = new Chess();
        data.moves.forEach(move => {
          chess.move({ from: move.from, to: move.to });
        });
        setGame(chess);
      }
    });

    return () => unsubscribe();
  }, []);

  const onDrop = (sourceSquare, targetSquare) => {
    const newGame = new Chess(game.fen());
    const move = newGame.move({
      from: sourceSquare,
      to: targetSquare
    });

    if (move === null) return;

    const newMoves = [...game.history({ verbose: true }), move];

    setDoc(doc(db, "games", "game1"), {
      moves: newMoves.map(move => ({ from: move.from, to: move.to }))
    });

    setGame(newGame);
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1 className="App-title">Chess Game</h1>
      </header>
      <div className="chessboard-container" style={{ width: `${boardSize}px`, height: `${boardSize}px` }}>
        <Chessboard
          position={game.fen()}
          onPieceDrop={(sourceSquare, targetSquare) => onDrop(sourceSquare, targetSquare)}
        />
      </div>
      <div>
        <label htmlFor="boardSize">Board Size: </label>
        <input
          id="boardSize"
          type="range"
          min="200"
          max="800"
          value={boardSize}
          onChange={(e) => setBoardSize(e.target.value)}
        />
      </div>
    </div>
  );
}

export default App;
