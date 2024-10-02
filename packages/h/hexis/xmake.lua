---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by devalexx.
--- DateTime: 10/02/2024 23:26
---

package("hexis")
    set_description("The hexis package")
    set_homepage("https://github.com/devalexxx/Hexis")
    set_license("MIT")

    set_urls("https://github.com/devalexxx/Hexis.git")

    add_versions("latest", "5478bc292638998f8860b28272cc1ae5dab9ce17")

    on_install(function (package)
        local configs = {}
        configs.unittest = false

        configs.mode   = package:is_debug() and "debug" or "release"
        configs.shared = package:config("shared")

        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            void test(int args, char** argv) {
                Hexis::Vec3f v;
            }
        ]]}, { configs = {languages = "c++23"}, includes = { "Hexis/Math/Vec3.h" } }))
    end)