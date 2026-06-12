module Utils.InOut(
    clearScreen,
    readInt,
    printMenu,
    invalidInput,
    printMoves,
    printPlays,
    printResult,
    waitEnter 
) where

import Text.Read (readMaybe)
import Play

clearScreen :: IO ()
clearScreen = putStr (replicate 50 '\n')

readInt :: IO (Maybe Int)
readInt = do
    input <- getLine
    return (readMaybe input)

printMenu :: IO ()
printMenu = do
    putStrLn "===== MENU ====="
    putStrLn "1 - GodBot"
    putStrLn "2 - DumbBot"
    putStrLn "3 - FairBot"
    putStrLn "0 - Sair"


invalidInput :: IO ()
invalidInput = do
    putStrLn "invalido!"
    putStrLn "Pressione ENTER para voltar ao menu..."
    _ <- getLine
    return ()

printMoves :: IO ()
printMoves = do
    putStrLn "Escolha sua jogada:"
    putStrLn "1 - Rock"
    putStrLn "2 - Paper"
    putStrLn "3 - Scissor"
    putStrLn "4 - Water"
    putStrLn "5 - Fire"

printPlays :: PlayType -> PlayType -> IO ()
printPlays playerPlay botPlay = do
    putStrLn $ "Voce jogou: " ++ show playerPlay
    putStrLn $ "Bot jogou: " ++ show botPlay
    putStrLn ""

printResult :: PlayType -> PlayType -> IO ()
printResult playerPlay botPlay =
    if beats playerPlay botPlay
        then putStrLn "Voce venceu!"
        else if beats botPlay playerPlay
            then putStrLn "Bot venceu!"
            else putStrLn "Empate!"

waitEnter :: IO ()
waitEnter = do
    putStrLn ""
    putStrLn "Pressione ENTER para voltar ao menu..."
    _ <- getLine
    return ()