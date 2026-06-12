module GodBot (
    playGod
) where

import Play
import Data.Time.Clock.POSIX (getPOSIXTime)

playGod :: PlayType -> IO PlayType
playGod Rock = return Paper
playGod Paper = return Scissor
playGod Scissor = return Rock

playGod Fire = return Water  --agua

playGod Water = do
    t <- getPOSIXTime
    return $ [Rock, Paper, Scissor] !! (floor (t * 1000) `mod` 3)