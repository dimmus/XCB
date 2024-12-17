project('X C Binding', 'c', 
    license: 'MIT', 
    version: '11.8.1',
    meson_version: '>=0.59.0',
)

cc = meson.get_compiler('c')

# add_project_arguments(
#   language: 'c'
# )

add_project_link_arguments(
  '-no-undefined',
  language: 'c'
)

dir_prefix  = get_option('prefix')
dir_bin     = dir_prefix / get_option('bindir')
dir_data    = dir_prefix / get_option('datadir')
dir_include = dir_prefix / get_option('includedir')
dir_lib     = dir_prefix / get_option('libdir')
dir_man     = dir_prefix / get_option('mandir')

dir_build   = meson.project_build_root()
dir_source  = meson.project_source_root()

dep_m            = cc.find_library('m',  required: false) # libxcvt
dep_dl           = cc.find_library('dl', required: false) # xvmc, xserver
# dep_zlib         = dependency('zlib') # xfont
# dep_bzip2        = dependency('bzip2') # xfont
# dep_freetype2    = dependency('freetype2') # xfont
# dep_zlib         = dependency('zlib') # fontenc
# dep_xcb          = dependency('xcb', version: '>= 1.11.1') # x11
# dep_uuid         = dependency('uuid', required: false) # sm
# dep_freetype2    = dependency('freetype2', version: '>= 2.1.6') # xft
# dep_fontconfig   = dependency('fontconfig', version: '>= 2.5.92') # xft
# dep_gettext      = dependency('gettext', required: false) # xpm
# # xserver
# dep_null         = dependency('', required: false)
# dep_xshmfence    = dependency('xshmfence', version: '>= 1.1', required: false)
# dep_pixman       = dependency('pixman-1')
# dep_libbsd       = dependency('libbsd-overlay', required: false)
# dep_xkbcomp      = dependency('xkbcomp', required: false)
# dep_dbus         = dependency('dbus-1', version: '>= 1.0', required: get_option('systemd_logind') == 'true')
# dep_fontutil     = dependency('fontutil', required: false)
# dep_drm          = dependency('libdrm', version: '>= 2.4.116')

python = import('python').find_installation()
pkg    = import('pkgconfig')

conf = configuration_data()

inc_config = include_directories('.')
inc_xcb    = []

f_check  = []
h_check  = []

subdir('include')
subdir('lib')
subdir('proto')
subdir('utils')
# if WITH_TESTS
# subdir('test')
# endif

fs = import('fs')
FIRST_RUN = not fs.is_dir(dir_build / 'src')

# speed up when run meson reconfigure
if FIRST_RUN
  f_unique = []
  foreach f: f_check
    if not f_unique.contains(f)
      conf.set('HAVE_@0@'.format(f.to_upper()), cc.has_function(f))
      if f == 'arc4random_buf'
        h_check += ['sys/random.h']
      endif
      f_unique += f
    endif
  endforeach

  h_unique = []
  foreach h: h_check
    if not h_unique.contains(h)
      conf.set('HAVE_@0@'.format(h.underscorify().to_upper()), cc.has_header(h))
      h_unique += h
    endif
  endforeach

  if not cc.has_function('strcasecmp')
    if cc.has_function('_stricmp')
      conf.set('strcasecmp', '_stricmp', description: 'Replacement for strcasecmp, if necessary')
    else
      error('strcasecmp (or _stricmp) is mandatory')
    endif
  endif
endif

# if WITH_DOC and WITH_MAN
#   prog_sed = find_program('sed')
#   subdir('doc' / 'man')
# endif

configure_file(
  output: 'config.h',
  configuration: conf
)