module Utils.Utils(
    chooseBot,
    validPlay
) where

import Play
import GodBot
import DumbBot
import FairBot

chooseBot :: Int -> (PlayType -> IO PlayType)
chooseBot 1 = playGod
chooseBot 2 = playDumb
chooseBot _ = playFair

validPlay :: Int -> Bool
validPlay playChoice = playChoice >= 1 && playChoice <= 5

