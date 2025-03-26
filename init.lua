server_core = {
    storage = core.get_mod_storage(),
    code_loc = core.get_modpath("server_core") .. "/src",

    -- moduals
    auto_restart = core.settings:get_bool("server_core_auto_shutdown", true)
}



if server_core.auto_restart then
    dofile(server_core.code_loc .. "/auto_restart.lua")
end