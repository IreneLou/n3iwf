module github.com/free5gc/n3iwf

go 1.14

require (
	git.cs.nctu.edu.tw/calee/sctp v1.1.0
	github.com/antonfisher/nested-logrus-formatter v1.3.1
	github.com/cpuguy83/go-md2man/v2 v2.0.0 // indirect
	github.com/free5gc/aper v1.0.2
	github.com/free5gc/idgenerator v1.0.0
	github.com/free5gc/logger_conf v1.0.0
	github.com/free5gc/logger_util v1.0.0
	github.com/free5gc/ngap v1.0.4
	github.com/free5gc/path_util v1.0.0
	github.com/free5gc/version v1.0.0
	github.com/gin-gonic/gin v1.7.7 // indirect
	github.com/go-playground/validator/v10 v10.9.0 // indirect
	github.com/golang-jwt/jwt v3.2.2+incompatible // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/mattn/go-isatty v0.0.14 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/sirupsen/logrus v1.8.1
	github.com/ugorji/go v1.2.6 // indirect
	github.com/urfave/cli v1.22.5
	github.com/vishvananda/netlink v1.1.0
	github.com/vishvananda/netns v0.0.0-20211101163701-50045581ed74 // indirect
	github.com/wmnsk/go-gtp v0.8.1
	golang.org/x/crypto v0.0.0-20211215153901-e495a2d5b3d3 // indirect
	golang.org/x/net v0.0.0-20211216030914-fe4d6282115f
	golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e
	golang.org/x/text v0.3.7 // indirect
	google.golang.org/protobuf v1.27.1 // indirect
	gopkg.in/yaml.v2 v2.4.0
)

replace github.com/free5gc/ngap v1.0.4 => github.com/ireneLou/ngap v1.0.5-0.20211214030546-dbc96f154d94
