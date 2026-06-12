module GodBot (
    playGod
) where

import Play
import Data.Time.Clock.POSIX (getPOSIXTime)

playGod :: PlayType -> IO PlayType
playGod Rock = return Paper
playGod Paper = return Scissor
playGod Scissor = return Rock

playGod Fire = return Water

playGod Water = do
    t <- getPOSIXTime
    let n = floor (t * 1000) `mod` 3

    return $
        case n of
            0 -> Rock
            1 -> Paper
            _ -> Scissor