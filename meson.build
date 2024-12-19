project('X C Binding', 'c', 
    license: 'MIT', 
    version: '1.17.0',
    meson_version: '>=0.59.0',
)

cc = meson.get_compiler('c')

add_project_arguments(
  '-DHAVE_CONFIG_H',
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

pymod = import('python')
# python = pymod.find_installation('python3', required : true, modules : ['jinja2'])
python = pymod.find_installation('python3')
python_39 = python.language_version().version_compare('>=3.9')
# Environment for using the local xcbgen module
python_env = {
  'PYTHONPATH': dir_source / 'proto' / 'xcbgen'
}

pkg    = import('pkgconfig')

dep_xau    = dependency('xau')
dep_xdmcp  = dependency('xdmcp')

conf = configuration_data()

inc_xcb    = [include_directories('.')]

f_check  = []
h_check  = []

subdir('include')
# subdir('proto')
subdir('lib')
subdir('utils')
# if WITH_TESTS
# subdir('test')
# endif

fs = import('fs')
FIRST_RUN = not fs.is_dir(dir_build / 'lib')

if FIRST_RUN
  f_unique = []
  foreach f: f_check
    if not f_unique.contains(f)
      conf.set('HAVE_@0@'.format(f.to_upper()), cc.has_function(f))
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
endif

# if WITH_DOC and WITH_MAN
#   prog_sed = find_program('sed')
#   subdir('doc' / 'man')
# endif

configure_file(
  output: 'config.h',
  configuration: conf
)