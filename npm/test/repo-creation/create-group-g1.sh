curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
   "key": "npm:group:g1",
   "description": "this is a npm group repo",
   "metadata":
   {
     "changelog": "create repo"
   },
   "name": "g1",
   "type": "group",
   "packageType": "npm",
   "disable_timeout": -1,
   "constituents": [ "npm:remote:r1", "npm:hosted:h1" ]
}' 'http://localhost:8080/api/admin/stores/npm/group'
