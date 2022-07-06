Name:    oscar-naemon-plugins
Summary: Collection of naemon plugins to enhance OSCAR Monitoring
Version: 1.1
Release: 1%{?dist}
Packager: Olivier LAHAYE <olivier.lahaye@cea.fr>
License: GPL
URL: https://github.com/oscar-cluster/oscar-naemon-plugins
Group: Applications/System
BuildArch: noarch
Source: %{name}-%{version}.tar.bz2
Requires: nagios-common

%define naemon_plugin_dir %{_libdir}/nagios/plugins

%description
Collection of naemon plugins to enhance OSCAR Monitoring.

%prep
%setup -q

%install
%__make install DESTDIR=%{buildroot}
#{__mkdir_p} %{buildroot}%{_libdir}/nagios/plugins/
#{__cp} plugins/* %{buildroot}%{_libdir}/nagios/plugins/

%files
%doc AUTHORS README
%{naemon_plugin_dir}/*

%changelog
* Wed Jul  6 2022 Olivier Lahaye <olivier.lahaye@cea.fr> 1.1-1
- Added check_slurm_controler and check_power_supplies

* Wed Jun 25 2014 Olivier Lahaye <olivier.lahaye@cea.fr> 1.0-1
- Initial packaging.


