function dcrs -a service
    dc stop $service
    dcb $service
    dcu -d $service
end
