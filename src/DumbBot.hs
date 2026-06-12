module DumbBot (
    playDumb
) where

import Play
import Data.Time.Clock.POSIX (getPOSIXTime)

playDumb :: PlayType -> IO PlayType
playDumb Rock = return Scissor
playDumb Paper = return Rock
playDumb Scissor = return Paper

playDumb Water = return Fire

playDumb Fire = do
    t <- getPOSIXTime
    let n = floor (t * 1000) `mod` 3

    return $
        case n of
            0 -> Rock
            1 -> Paper
            _ -> Scissor