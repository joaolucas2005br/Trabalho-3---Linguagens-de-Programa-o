module Main where

import Play
import GodBot
import DumbBot
import FairBot
import Utils.InOut
import Utils.Utils

gameLoop :: IO ()
gameLoop = do
    
    clearScreen

    printMenu

    mbBotChoice <- readInt

    handleMaybeInt mbBotChoice gameLoop(\botChoice ->
            case botChoice of
                0 -> return ()
                1 -> startGame botChoice
                2 -> startGame botChoice
                3 -> startGame botChoice
                _ -> do
                    invalidInput
                    gameLoop
            )
                    
startGame :: Int -> IO ()
startGame botChoice = do
    clearScreen

    printMoves

    mbPlayChoice <- readInt

    handleMaybeInt mbPlayChoice gameLoop (\playChoice ->
            if not (validPlay playChoice)
                then do
                    invalidInput
                    gameLoop
                else do
                    let playerPlay = numberToPlay playChoice

                    botPlay <- chooseBot botChoice playerPlay

                    clearScreen

                    printPlays playerPlay botPlay

                    printResult playerPlay botPlay

                    waitEnter

                    gameLoop
        )

main :: IO ()
main = gameLoop