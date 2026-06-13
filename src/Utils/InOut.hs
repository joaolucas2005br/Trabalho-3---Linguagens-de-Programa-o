module Utils.InOut(
    clearScreen,
    readInt,
    handleMaybeInt,
    printMenu,
    invalidInput,
    printMoves,
    printPlays,
    printResult,
    waitEnter 
) where

import Text.Read (readMaybe)
import Utils.Play

clearScreen :: IO ()
clearScreen = putStr (replicate 50 '\n')

readInt :: IO (Maybe Int)
readInt = do
    input <- getLine
    return (readMaybe input)

handleMaybeInt :: Maybe Int -> IO a -> (Int -> IO a) -> IO a
handleMaybeInt Nothing retry _ = do
    invalidInput
    retry

handleMaybeInt (Just x) _ success =
    success x

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