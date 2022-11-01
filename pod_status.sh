b=1/1
ssh root@192.168.30.161 kubectl create deployment pacman --image=dhanrajranvirkar/pacman:latest
while true
do
	i=$(ssh root@192.168.30.161 kubectl get deployment --no-headers | awk '{print $2}')
	if [ "$i" == "$b" ]
	then
		ssh root@192.168.30.161 kubectl port-forward deployment/pacman --address 0.0.0.0 80:80 &
		break
	else
		echo "Waiting for deployment ready"
	fi
done
