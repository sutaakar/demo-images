import requests

x = requests.get('https://console-openshift-console.apps.ods-qe-psi-08.osp.rh-ods.com/k8s/all-namespaces/core~v1~Pod?orderBy=desc&sortBy=Created')
print(x.status_code)