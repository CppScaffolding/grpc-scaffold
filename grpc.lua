-- scaffold geniefile for grpc

grpc_script = path.getabsolute(path.getdirectory(_SCRIPT))
grpc_root = path.join(grpc_script, "grpc")

grpc_includedirs = {
	path.join(grpc_script, "config"),
	grpc_root,
}

grpc_libdirs = {}
grpc_links = {}
grpc_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { grpc_includedirs }
	end,

	_add_defines = function()
		defines { grpc_defines }
	end,

	_add_libdirs = function()
		libdirs { grpc_libdirs }
	end,

	_add_external_links = function()
		links { grpc_links }
	end,

	_add_self_links = function()
		links { "grpc" }
	end,

	_create_projects = function()

project "grpc"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		grpc_includedirs,
	}

	defines {}

	files {
		path.join(grpc_script, "config", "**.h"),
		path.join(grpc_root, "**.h"),
		path.join(grpc_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
