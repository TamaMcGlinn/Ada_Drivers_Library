------------------------------------------------------------------------------
--                                                                          --
--                       Copyright (C) 2019, AdaCore                        --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

--  This package provides procedures to draw symbols on the MicroBit 5x5 LED
--  display.

package MicroBit.Display.Symbols is

   type Direction_Type is (Top_Left, Left, Bottom_Left, Bottom, Bottom_Right, Right, Top_Right, Top);

   Arrows : constant array (Direction_Type) of Glyph :=
     (Top_left =>
      (2#01111#,
       2#00011#,
       2#00101#,
       2#01001#,
       2#10000#),
      Left =>
      (2#00100#,
       2#00010#,
       2#11111#,
       2#00010#,
       2#00100#),
      Bottom_Left =>
      (2#10000#,
       2#01001#,
       2#00101#,
       2#00011#,
       2#01111#),
      Bottom =>
      (2#00100#,
       2#00100#,
       2#10101#,
       2#01110#,
       2#00100#),
      Bottom_Right =>
      (2#00001#,
       2#10010#,
       2#10100#,
       2#11000#,
       2#11110#),
      Right =>
      (2#00100#,
       2#01000#,
       2#11111#,
       2#01000#,
       2#00100#),
      Top_Right =>
      (2#11110#,
       2#11000#,
       2#10100#,
       2#10010#,
       2#00001#),
      Top =>
      (2#00100#,
       2#01110#,
       2#10101#,
       2#00100#,
       2#00100#)
     );

   procedure Left_Arrow;
   procedure Right_Arrow;
   procedure Up_Arrow;
   procedure Down_Arrow;
   procedure Smile;
   procedure Frown;
   procedure Cross;
   procedure Checkmark;
   procedure Heart;

end MicroBit.Display.Symbols;
