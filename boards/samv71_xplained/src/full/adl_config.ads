--  This package was generated by the Ada_Drivers_Library project wizard script
package ADL_Config is
   Vendor                         : constant String  := "Atmel";             -- From board definition
   Max_Mount_Points               : constant         := 2;                   -- From user input
   Max_Mount_Name_Length          : constant         := 128;                 -- From user input
   Runtime_Profile                : constant String  := "ravenscar-full";    -- From user input
   Device_Name                    : constant String  := "ATSAMV71x";         -- From board definition
   Device_Family                  : constant String  := "SAM";               -- From board definition
   Runtime_Name                   : constant String  := "ravenscar-full-samv71"; -- From user input
   Has_Ravenscar_Full_Runtime     : constant String  := "True";              -- From board definition
   CPU_Core                       : constant String  := "ARM Cortex-M7F";    -- From mcu definition
   Board                          : constant String  := "SAMV71_XPLAINED";   -- From user input
   Has_ZFP_Runtime                : constant String  := "True";              -- From board definition
   Has_Ravenscar_SFP_Runtime      : constant String  := "True";              -- From board definition
   Max_Path_Length                : constant         := 1024;                -- From user input
   Runtime_Name_Suffix            : constant String  := "samv71";            -- From board definition
   Architecture                   : constant String  := "ARM";               -- From board definition
end ADL_Config;
