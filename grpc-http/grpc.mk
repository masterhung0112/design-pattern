XDG_CACHE_HOME ?= $(HOME)/.cache
TOOLS_BIN_DIR := $(abspath $(XDG_CACHE_HOME)/hk/bin)
TOOLS_MOD := tools/go.mod

BUF := $(TOOLS_BIN_DIR)/buf

GEN_DIR := api/genpb
JSONSCHEMA_DIR := schema/jsonschema
OPENAPI_DIR := schema/openapiv2

define BUF_GEN_TEMPLATE
{\
  "version": "v1",\
  "plugins": [\
    {\
      "name": "go",\
      "out": "$(GEN_DIR)",\
      "opt": "paths=source_relative",\
      "path": "$(PROTOC_GEN_GO)"\
    },\
    {\
      "name": "vtproto",\
      "out": "$(GEN_DIR)",\
      "opt": [\
	    "paths=source_relative",\
	  	"features=marshal+unmarshal+size"\
	  ],\
      "path": "$(PROTOC_GEN_GO_VTPROTO)"\
    },\
    {\
      "name": "validate",\
      "opt": [\
        "paths=source_relative",\
        "lang=go"\
      ],\
      "out": "$(GEN_DIR)",\
      "path": "$(PROTOC_GEN_VALIDATE)"\
    },\
    {\
      "name": "go-grpc",\
      "opt": "paths=source_relative",\
      "out": "$(GEN_DIR)",\
      "path": "$(PROTOC_GEN_GO_GRPC)"\
    },\
    {\
      "name": "go-hashpb",\
      "opt": "paths=source_relative",\
      "out": "$(GEN_DIR)",\
      "path": "$(PROTOC_GEN_GO_HASHPB)"\
    },\
    {\
      "name": "grpc-gateway",\
      "opt": "paths=source_relative",\
      "out": "$(GEN_DIR)",\
      "path": "$(PROTOC_GEN_GRPC_GATEWAY)"\
    },\
    {\
      "name": "openapiv2",\
      "out": "$(OPENAPI_DIR)",\
      "path": "$(PROTOC_GEN_OPENAPIV2)"\
    },\
  ]\
}
endef

$(TOOLS_BIN_DIR):
	@ mkdir -p $(TOOLS_BIN_DIR)

$(BUF): $(TOOLS_BIN_DIR)
	@ GOBIN=$(TOOLS_BIN_DIR) go install -modfile=$(TOOLS_MOD) github.com/bufbuild/buf/cmd/buf

$(PROTOC_GEN_GO): $(TOOLS_BIN_DIR)
	@ GOBIN=$(TOOLS_BIN_DIR) go install -modfile=$(TOOLS_MOD) google.golang.org/protobuf/cmd/protoc-gen-go

.PHONY: proto-gen-deps
proto-gen-deps: $(BUF) $(PROTOC_GEN_GO)
	@ $(BUF) generate --template '$(BUF_GEN_TEMPLATE)' .