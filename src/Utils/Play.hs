module Utils.Play (
    PlayType(..),
    beats,
    numberToPlay,
    validPlay
) where

data PlayType = Rock | Paper | Scissor | Water | Fire
  deriving (Show,Eq)

beats :: PlayType -> PlayType -> Bool
beats a b = b `elem` defeats a
  where
    defeats Rock    = [Scissor, Water]
    defeats Paper   = [Rock, Water]
    defeats Scissor = [Paper, Water]
    defeats Fire    = [Rock, Paper, Scissor]
    defeats Water   = [Fire]

numberToPlay :: Int -> PlayType
numberToPlay 1 = Rock
numberToPlay 2 = Paper
numberToPlay 3 = Scissor
numberToPlay 4 = Water
numberToPlay 5 = Fire
numberToPlay _ = error "Jogada invalida"

validPlay :: Int -> Bool
validPlay playChoice = playChoice >= 1 && playChoice <= 5
 