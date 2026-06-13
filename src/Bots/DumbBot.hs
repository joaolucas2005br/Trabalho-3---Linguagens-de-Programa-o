module Bots.DumbBot (
    playDumb
) where

import Utils.Play
import Utils.Random (getRandom)

playDumb :: PlayType -> IO PlayType
playDumb Rock    = return Scissor
playDumb Paper   = return Rock
playDumb Scissor = return Paper
playDumb Water   = return Fire
playDumb Fire = fmap (([Rock, Paper, Scissor] !!)) (getRandom 3)