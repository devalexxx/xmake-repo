---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by alspin.
--- DateTime: 20/01/2024 10:36
---

package("orion")
    set_description("The orion package")
    set_homepage("https://github.com/alspin8/Orion")
    set_license("MIT")

    set_urls("https://github.com/alspin8/Orion.git")

    --add_versions("1.0a2", "450e46eb6d3437055d1c0bb92d81803fe73adc2f")

    add_deps("glfw", "glew", "fmt", "stb")

    on_install(function (package)
        local configs = {}
        configs.unittest = false
        configs.sandbox  = false
        configs.examples = false
        configs.nogpu    = false

        if package:is_debug() then
            configs.mode = "debug"
        else
           configs.mode = "release"
        end

        configs.option = table.insert(configs.option or {},{ shared = package:configs("share") and "y" or "n" } )

        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            void test(int args, char** argv) {
                orion::Vector3f v;
            }
        ]]}, { configs = {languages = "c++23"}, includes = { "orion/omath.h" } }))
    end)