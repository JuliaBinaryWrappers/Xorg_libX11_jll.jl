# Autogenerated wrapper script for Xorg_libX11_jll for aarch64-linux-gnu
export libX11, libX11_xcb

using Xorg_libxcb_jll
using Xorg_xtrans_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libX11`
const libX11_splitpath = ["lib", "libX11.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libX11_path = ""

# libX11-specific global declaration
# This will be filled out by __init__()
libX11_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libX11 = "libX11.so.6"


# Relative path to `libX11_xcb`
const libX11_xcb_splitpath = ["lib", "libX11-xcb.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libX11_xcb_path = ""

# libX11_xcb-specific global declaration
# This will be filled out by __init__()
libX11_xcb_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libX11_xcb = "libX11-xcb.so.1"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Xorg_libX11")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Xorg_libxcb_jll.PATH_list, Xorg_xtrans_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Xorg_libxcb_jll.LIBPATH_list, Xorg_xtrans_jll.LIBPATH_list,))

    global libX11_path = normpath(joinpath(artifact_dir, libX11_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libX11_handle = dlopen(libX11_path)
    push!(LIBPATH_list, dirname(libX11_path))

    global libX11_xcb_path = normpath(joinpath(artifact_dir, libX11_xcb_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libX11_xcb_handle = dlopen(libX11_xcb_path)
    push!(LIBPATH_list, dirname(libX11_xcb_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

