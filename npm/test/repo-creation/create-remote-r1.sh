curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "key": "npm:remote:r1",
   "path_style": "plain",
   "description": "this is a npm remote repo",
   "metadata":
   {
     "changelog": "create repo"
   },
   "disabled": false,
   "name": "r1",
   "type": "remote",
   "packageType": "npm",
   "disable_timeout": -1,
   "cache_timeout_seconds": 0,
   "is_passthrough": false,
   "metadata_timeout_seconds": 0,
   "timeout_seconds": 0,
   "url": "http://registry.npmjs.org/"
 }' 'http://localhost:8080/api/admin/stores/npm/remote'
