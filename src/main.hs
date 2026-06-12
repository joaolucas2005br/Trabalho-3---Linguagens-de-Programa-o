module Main where

import Play
import GodBot
import DumbBot
import FairBot
import Utils.InOut

gameLoop :: IO ()
gameLoop = do
    
    clearScreen

    printMenu

    mbBotChoice <- readInt

    case mbBotChoice of
        Nothing -> do
            invalidInput
            gameLoop

        Just botChoice ->
            case botChoice of
                0 -> return ()
                1 -> startGame botChoice
                2 -> startGame botChoice
                3 -> startGame botChoice
                _ -> do
                    invalidInput
                    gameLoop
                    
startGame :: Int -> IO ()
startGame botChoice = do
    clearScreen

    printMoves

    mbPlayChoice <- readInt

    case mbPlayChoice of
        Nothing -> do
            invalidInput
            gameLoop

        Just playChoice ->
            if playChoice < 1 || playChoice > 5
                then do
                    invalidInput
                    gameLoop
                else do
                    let playerPlay = numberToPlay playChoice

                    botPlay <-
                        case botChoice of
                            1 -> playGod playerPlay
                            2 -> playDumb playerPlay
                            3 -> playFair playerPlay

                    clearScreen
                    
                    printPlays playerPlay botPlay
                    
                    printResult playerPlay botPlay
                    
                    waitEnter

                    gameLoop

main :: IO ()
main = gameLoop