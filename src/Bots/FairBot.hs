module Bots.FairBot (
    playFair
) where

import Utils.Play
import Utils.Random (getRandom)

playFair :: PlayType -> IO PlayType
playFair _  = fmap (([Rock, Paper, Scissor, Water, Fire] !!)) (getRandom 5)
