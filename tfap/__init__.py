# read configuration file

parameter_servers = ["192.168.122.101:2223"]
workers = ["192.168.122.101:2222",
           "192.168.122.102:2222"]
cluster = tf.train.ClusterSpec({"ps": parameter_servers, "worker": workers})

# input flags
tf.app.flags.DEFINE_string("job_name", "", "Either 'ps' or 'worker'")
tf.app.flags.DEFINE_integer("task_index", 0, "Index of task within the job")
FLAGS = tf.app.flags.FLAGS

# start a server for a specific task
server = tf.train.Server(cluster, job_name=FLAGS.job_name, task_index=FLAGS.task_index)

def tfag(wf):
    if FLAGS.job_name == "ps":
        server.join()
    elif FLAGS.job_name == "worker":
        with tf.device(tf.train.replica_device_setter(
            worker_device="/job:worker/task:%d" % FLAGS.task_index,
            cluster=cluster)):
            wf()
    
