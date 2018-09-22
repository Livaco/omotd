if SERVER then

  include("omotdlua/sv_omotd.lua")
  OMOTD:Initalize()

else

  include("omotdlua/cl_omotd.lua")
  include("omotdlua/vgui/omotd_avatarmask.lua")

end
