local common_router = require("app.routes.common")
local auth_router = require("app.routes.auth")
local topic_router = require("app.routes.topic")
local topics_router = require("app.routes.topics")
local comment_router = require("app.routes.comment")
local comments_router = require("app.routes.comments")
local user_router = require("app.routes.user")
local upload_router = require("app.routes.upload")
local category_router = require("app.routes.category")
local notification_router = require("app.routes.notification")
local error_router = require("app.routes.error")

return function(app)

--[[    
    app:get("/jd_root.txt", function(req, res, next)
        ngx.header['Content-Type'] = 'text/plain; charset=UTF-8'
        ngx.say("e95d2f4a675fe6f2dc7e74d53c171cf89e470ebcc12b51b0")
        --res:send("e95d2f4a675fe6f2dc7e74d53c171cf89e470ebcc12b51b0")
    end)
--]]
    app:get("/bugfeel.txt", function(req, res, next)
	    res:send("f124fd1737479b581620dd49b178d86e")
    end)

    app:use("/auth", auth_router())
    app:use("/error", error_router())
    app:use("/user", user_router())
    app:use("/category", category_router())
    app:use("/topic", topic_router())
    app:use("/topics", topics_router())
    app:use("/comment", comment_router())
    app:use("/comments", comments_router())
    app:use("/notification", notification_router())
    app:use("/upload", upload_router())


    app:get("/", common_router.index)
    --app:get("/", auth_router)
    --app:use("/auth", auth_router())
    app:get("/index", common_router.index)
    app:get("/share", common_router.share)
    app:get("/ask", common_router.ask)
    app:get("/settings", common_router.settings)
    app:get("/about", common_router.about)
    app:get("/app", common_router.app)
    app:get("/news", common_router.news)

end

