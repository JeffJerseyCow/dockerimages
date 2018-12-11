# libFuzzer Docker Wrapper
The image has four directories it works with:
- /build -- should be empty as it's only involved in the build process
- /in -- where you mount your source code containing a build.sh file that outputs a single fuzz.me binary
- /corpus -- where testcases are stored
- /artifacts -- where fuzzing data is stored in the case on an unexpected event

## Example
```docker run --rm -ti -v /path/to/src:/in -v /tmp/corpus:/corpus -v /tmp/artifacts:/artifacts jeffjerseycow/libfuzzer:v0.0.1```
