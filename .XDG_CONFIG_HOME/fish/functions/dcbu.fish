function dcbu --description 'docker compose build up [service]' -a service_name
	dcb $service_name && dcu $service_name
end