b=0/1
while true
do
	i=$(ssh root@192.168.30.161 kubectl get deployment --no-headers | awk '{print $2}')
	if [ "$i" == "$b" ]
	then
		echo "Waiting for deployment ready"
	else
		#ssh root@192.168.30.161 kubectl port-forward deployment/pacman --address 0.0.0.0 80:80 &
		ssh root@192.168.30.161 kubectl expose deployment pacman --type=LoadBalancer --target-port=80 --port=80
		break
	fi
done
