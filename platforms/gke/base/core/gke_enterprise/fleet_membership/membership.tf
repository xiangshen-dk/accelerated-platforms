# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

resource "google_gke_hub_membership" "cluster" {
  depends_on = [
    google_project_service.gkeconnect_googleapis_com,
    google_project_service.gkehub_googleapis_com,
  ]

  membership_id = data.google_container_cluster.cluster.name
  project       = data.google_project.default.project_id

  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${data.google_container_cluster.cluster.id}"
    }
  }
}