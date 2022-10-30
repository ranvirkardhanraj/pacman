b="1/1"
for i in $(ssh root@192.168.30.161 kubectl get deployment --no-headers | awk '{print $2}')
do 
	echo $i
	if [ $i == $b ]
	then
		ssh root@192.168.30.161 kubectl port-forward deployment/pacman --address 0.0.0.0 80:80 &
	else
		sleep 300
	fi
done
