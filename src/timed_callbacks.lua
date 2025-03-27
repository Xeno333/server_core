server_core.timed_callbacks = {}

local registered_callbacks = {}


function server_core.register_timed_callbacks(time, func)
    registered_callbacks[#registered_callbacks+1] = {
        time = os.time() + time,
        func = func
    }
end

local function scheduler()
    local current_time = os.time()
    for i, def in pairs(registered_callbacks) do
        if not (def.time > current_time) then
            def.func()
            registered_callbacks[i] = nil
        end
    end

    core.after(1, scheduler)
end

core.after(1, scheduler)