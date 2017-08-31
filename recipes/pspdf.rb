
# PSPDF
if !File.exist? "/usr/local/bin/pspdftool"

    remote_file '/tmp/pspdftool.tar' do
        source 'https://sourceforge.net/projects/pspdftool/files/latest/download?source=typ_redirect'
        owner 'root'
        group 'root'
        # checksum 'abc123'
    end

    execute "untar_pspdftool" do
        user "root"
        group "root"
        cwd "/tmp"
        action :run
        command "tar xvf pspdftool.tar"
        not_if ::File.exist?("/usr/local/bin/pspdftool")
    end

    bash 'install_pspdftool' do
        user 'root'
        cwd '/tmp/pspdftool-0.03'
        code <<-EOH
./configure
make
make install
EOH
    end
end
