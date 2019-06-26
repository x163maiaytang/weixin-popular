java -jar -server -Xms256m -Xmx1g -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=256m -XX:NewRatio=3 -XX:+UseConcMarkSweepGC -XX:ErrorFile=./hs_errp.log -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./heap_dump_errp.hprof -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xloggc:./gc.log -javaagent:./3rd-lib/class-loader-0.0.1.jar -Dloader.path=.,3rd-lib UCenter-0.0.1-classes.jar --spring.profiles.active=default

pause


