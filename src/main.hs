module Main where

import Play
import GodBot
import DumbBot
import FairBot

numberToPlay :: Int -> PlayType
numberToPlay 1 = Rock
numberToPlay 2 = Paper
numberToPlay 3 = Scissor
numberToPlay 4 = Water
numberToPlay 5 = Fire
numberToPlay _ = error "Jogada invalida"

clearScreen :: IO ()
clearScreen = putStr (replicate 50 '\n')

gameLoop :: IO ()
gameLoop = do
    clearScreen

    putStrLn "===== MENU ====="
    putStrLn "1 - GodBot"
    putStrLn "2 - DumbBot"
    putStrLn "3 - FairBot"
    putStrLn "0 - Sair"

    botChoice <- readLn :: IO Int

    if botChoice == 0
        then putStrLn "Tchau!"
        else do
            clearScreen

            putStrLn "Escolha sua jogada:"
            putStrLn "1 - Rock"
            putStrLn "2 - Paper"
            putStrLn "3 - Scissor"
            putStrLn "4 - Water"
            putStrLn "5 - Fire"

            playChoice <- readLn :: IO Int

            let playerPlay = numberToPlay playChoice

            botPlay <-
                case botChoice of
                    1 -> playGod playerPlay
                    2 -> playDumb playerPlay
                    3 -> playFair playerPlay
                    _ -> error "Bot invalido"

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