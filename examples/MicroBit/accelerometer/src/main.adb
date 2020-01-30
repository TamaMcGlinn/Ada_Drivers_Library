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

with MMA8653; use MMA8653;

with MicroBit.Display;
with MicroBit.Display.Symbols;
with MicroBit.Accelerometer;
with MicroBit.Console;
with MicroBit.Time;

use MicroBit;

procedure Main is

   package Symbols renames MicroBit.Display.Symbols;

   Data : MMA8653.All_Axes_Data;

   Threshold : constant := 18000;

   type Polar_Magnitude_Type is range 0 .. (2 ** 19);

   type Polar_Type is record
      Direction : Symbols.Direction_Type;
      Magnitude : Polar_Magnitude_Type;
   end record;

   function ConvertToPolarNotation(X : Axis_Data; Y : Axis_Data) return Polar_Type is
      absX : constant Axis_Data'Base := (if X < 0 then -X else X);
      absY : constant Axis_Data'Base := (if Y < 0 then -Y else Y);
      SquaredSum : constant Polar_Magnitude_Type := Polar_Magnitude_Type(absX) ** 2 + 
                                                    Polar_Magnitude_Type(absY) ** 2;
      ClosestDirection : Symbols.Direction_Type;
   begin
      if X / 2 > absY then
         ClosestDirection := Symbols.Left;
      elsif X / 2 < -absY then
         ClosestDirection := Symbols.Right;
      elsif Y / 2 > absX then
         ClosestDirection := Symbols.Top;
      elsif Y / 2 < -absX then
         ClosestDirection := Symbols.Bottom;
      elsif X > 0 and then Y > 0 then
         ClosestDirection := Symbols.Top_Left;
      elsif X > 0 and then Y < 0 then
         ClosestDirection := Symbols.Bottom_Left;
      elsif X < 0 and then Y > 0 then
         ClosestDirection := Symbols.Top_Right;
      elsif X < 0 and then Y < 0 then
         ClosestDirection := Symbols.Bottom_Right;
      end if;
      return (Direction => ClosestDirection, Magnitude => SquaredSum);
   end ConvertToPolarNotation;
begin

   loop
      --  Read the accelerometer data
      Data := Accelerometer.Data;

      --  Print the data on the serial port
      Console.Put_Line ("X:" & Data.X'Img & ASCII.HT &
                        "Y:" & Data.Y'Img & ASCII.HT &
                        "Z:" & Data.Z'Img);
      --  Clear the LED matrix
      Display.Clear;

      --  Draw a symbol on the LED matrix depending on the orientation of the
      --  micro:bit.
      declare
         Polar : constant Polar_Type := ConvertToPolarNotation(X => Data.X, Y => Data.Y);
      begin
         if Polar.Magnitude > Threshold then
            Display.Display (Display.Symbols.Arrows(Polar.Direction));
         else
            Display.Display ('X');
         end if;
      end;

      --  Do nothing for 100 milliseconds
      Time.Sleep (100);
   end loop;
end Main;
