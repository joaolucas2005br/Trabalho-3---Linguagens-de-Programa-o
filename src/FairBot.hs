module FairBot (
    playFair
) where

import Play
import Data.Time.Clock.POSIX (getPOSIXTime)

playFair :: PlayType -> IO PlayType
playFair _ = do
    t <- getPOSIXTime
    let n = floor (t * 1000) `mod` 5

    return $
        case n of
            0 -> Rock
            1 -> Paper
            2 -> Scissor
            3 -> Water
            _ -> Fire