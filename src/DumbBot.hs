module DumbBot (
    playDumb
) where

import Play
import Utils.Random (getRandom)

playDumb :: PlayType -> IO PlayType
playDumb Rock    = return Scissor
playDumb Paper   = return Rock
playDumb Scissor = return Paper
playDumb Water   = return Fire
playDumb Fire = fmap (([Rock, Paper, Scissor] !!)) (getRandom 3)