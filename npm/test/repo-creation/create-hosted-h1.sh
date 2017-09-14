curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "key": "npm:hosted:h1",
   "description": "this is a npm hosted repo",
   "metadata":
   {
     "changelog": "create repo"
   },
   "name": "h1",
   "type": "hosted",
   "packageType": "npm",
   "disable_timeout": -1,
   "allow_releases": true,
   "allow_snapshots": true,
   "snapshotTimeoutSeconds": 0
}' 'http://localhost:8080/api/admin/stores/npm/hosted'
