lab-infrastructure/
├── README.md
├── ansible
│   ├── files
│   │   └── aircast.service
│   ├── hosts.yml
│   └── playbooks
│       ├── 01-conf-airconnect.yml
│       ├── 02-conf-kubernetes.yml
│       └── plays
│           ├── k8s
│           │   ├── k8s-configure-master.ansible.yml
│           │   ├── k8s-configure-metrics.ansible.yml
│           │   ├── k8s-configure-user.ansible.yml
│           │   ├── k8s-configure-worker.ansible.yml
│           │   └── k8s-install-packages.ansible.yml
│           └── vm-initialisation.ansible.yml
├── lab-infrastucture.md
├── packer
│   └── ubuntu-2204-base
│       ├── build.pkr.hcl
│       ├── files
│       │   └── 99-pve.cfg
│       ├── http
│       │   ├── meta-data
│       │   └── user-data
│       ├── source.pkr.hcl
│       └── variables.pkr.hcl
└── terraform
    ├── locals.tf
    ├── main.tf
    ├── modules
    │   └── cloudflare-records
    │       ├── README.md
    │       ├── providers.tf
    │       ├── record.tf
    │       └── variables.tf
    ├── secrets.auto.tfvars
    └── variables.tf

13 directories, 26 files
