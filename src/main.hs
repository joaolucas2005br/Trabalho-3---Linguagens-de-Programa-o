module Main where

import Play
import GodBot
import DumbBot
import FairBot
import Text.Read (readMaybe)

numberToPlay :: Int -> PlayType
numberToPlay 1 = Rock
numberToPlay 2 = Paper
numberToPlay 3 = Scissor
numberToPlay 4 = Water
numberToPlay 5 = Fire
numberToPlay _ = error "Jogada invalida"

clearScreen :: IO ()
clearScreen = putStr (replicate 50 '\n')

readInt :: IO (Maybe Int)
readInt = do
    input <- getLine
    return (readMaybe input)

gameLoop :: IO ()
gameLoop = do
    clearScreen

    putStrLn "===== MENU ====="
    putStrLn "1 - GodBot"
    putStrLn "2 - DumbBot"
    putStrLn "3 - FairBot"
    putStrLn "0 - Sair"

    mbBotChoice <- readInt

    case mbBotChoice of
        Nothing -> do
            putStrLn "Entrada invalida!"
            putStrLn "Pressione ENTER para voltar ao menu..."
            _ <- getLine
            gameLoop

        Just botChoice ->
            case botChoice of
                0 -> putStrLn ""

                1 -> startGame botChoice
                2 -> startGame botChoice
                3 -> startGame botChoice

                _ -> do
                    putStrLn "Bot invalido!"
                    putStrLn "Pressione ENTER para voltar ao menu..."
                    _ <- getLine
                    gameLoop

startGame :: Int -> IO ()
startGame botChoice = do
    clearScreen

    putStrLn "Escolha sua jogada:"
    putStrLn "1 - Rock"
    putStrLn "2 - Paper"
    putStrLn "3 - Scissor"
    putStrLn "4 - Water"
    putStrLn "5 - Fire"

    mbPlayChoice <- readInt

    case mbPlayChoice of
        Nothing -> do
            putStrLn "Jogada invalida!"
            putStrLn "Pressione ENTER para voltar ao menu..."
            _ <- getLine
            gameLoop

        Just playChoice ->
            if playChoice < 1 || playChoice > 5
                then do
                    putStrLn "Jogada invalida!"
                    putStrLn "Pressione ENTER para voltar ao menu..."
                    _ <- getLine
                    gameLoop
                else do
                    let playerPlay = numberToPlay playChoice

                    botPlay <-
                        case botChoice of
                            1 -> playGod playerPlay
                            2 -> playDumb playerPlay
                            3 -> playFair playerPlay

                    clearScreen

                    putStrLn $ "Voce jogou: " ++ show playerPlay
                    putStrLn $ "Bot jogou: " ++ show botPlay
                    putStrLn ""

                    if beats playerPlay botPlay
                        then putStrLn "Voce venceu!"
                        else if beats botPlay playerPlay
                            then putStrLn "Bot venceu!"
                            else putStrLn "Empate!"

                    putStrLn ""
                    putStrLn "Pressione ENTER para voltar ao menu..."
                    _ <- getLine

                    gameLoop

main :: IO ()
main = gameLoop