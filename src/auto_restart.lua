

server_core.register_timed_callbacks(core.settings:get("server_core_auto_shutdown_interval") or 43200, function()
    core.chat_send_all("Automated server shutdown in 30 seconds")
    core.request_shutdown("Please reconnect shortly", true, 30)
end)
