# container-ark-server

Container image and helm chart for running an Ark: Survival Evolved Dedicated server.

## Usage

### Quick Guide

Validate the chart:

`helm lint .`

Dry run and print out rendered YAML:

`helm install --dry-run --debug ark-server charts/ark-server`

Dry run and print out rendered YAML with merged values file:

```
helm install \
  --namespace ark \
  --dry-run \
  --debug \
  -f helm-values.local.yaml \
    ark-server charts/ark-server
```

#### Installation

`helm install ark-server charts/ark-server`

Or, with some different values:

```
helm install ark-server \
  --set image.tag="latest" \
  --set service.type="LoadBalancer" \
    charts/ark-server
```

Or, the same but with a custom values from a file:

```
helm install ark-server \
  -f helm-values.local.yaml \
    charts/ark-server
```

#### Testing

Testing after creation of a release:

`helm test charts/ark-server`

#### Upgrading

Upgrade the chart, with values file:

```
helm upgrade ark-server charts/ark-server \
  -f helm-values.local.yaml
```

#### Uninstallation

Completely remove the chart:

`helm uninstall ark-server`

## Contributing

Please feel free to contribute by making a [pull request](https://github.com/flaccid/container-ark-server/pulls).

## License

- Author: Chris Fordham (<chris@fordham.id.au>)

```text
Copyright 2021, Chris Fordham

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
