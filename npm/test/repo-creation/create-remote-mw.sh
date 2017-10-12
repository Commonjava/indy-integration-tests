curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "key": "npm:remote:mw",
   "path_style": "plain",
   "description": "this is a npm remote repo of mw",
   "metadata":
   {
     "changelog": "create repo"
   },
   "disabled": false,
   "name": "mw",
   "type": "remote",
   "packageType": "npm",
   "disable_timeout": -1,
   "cache_timeout_seconds": 0,
   "is_passthrough": false,
   "metadata_timeout_seconds": 0,
   "timeout_seconds": 0,
   "url": "http://mwnodereg-devel.hosts.mwqe.eng.bos.redhat.com:49153/"
 }' 'http://localhost:8080/api/admin/stores/npm/remote'
