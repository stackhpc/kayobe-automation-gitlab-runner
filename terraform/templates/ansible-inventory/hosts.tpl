[${group_name}]
%{ for host in hosts ~}
${host.name} ansible_host=${host.ansible_host} ansible_user=${host.ansible_user}
%{ endfor ~}

