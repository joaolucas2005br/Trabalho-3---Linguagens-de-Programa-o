module GodBot (
    playGod
) where

import Play
import Utils.Random (getRandom)

playGod :: PlayType -> IO PlayType
playGod Rock = return Paper
playGod Paper = return Scissor
playGod Scissor = return Rock

playGod Fire = return Water
playGod Water = fmap (([Rock, Paper, Scissor]  !!)) (getRandom 3)

