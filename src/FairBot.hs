module FairBot (
    playFair
) where

import Play
import Data.Time.Clock.POSIX (getPOSIXTime)

playFair :: PlayType -> IO PlayType

playFair _ = do
    t <- getPOSIXTime
    return $ [Rock, Paper, Scissor, Water, Fire] !! (floor (t * 1000) `mod` 5)