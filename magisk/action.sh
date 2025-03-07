# Copyright [2023 - now] [Tritium Developers]
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


URL="https://github.com/DreamPractice/Tritium/issues/new?assignees=&labels=&projects=&template=bug-%E5%8F%8D%E9%A6%88.md&title="
am start -a android.intent.action.VIEW -d "$URL"
exit 0