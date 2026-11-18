Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94012606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3So6NGYj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jNLmMzj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/eUnpfGijmmacs6gMeFB9nlJBGT8B/OrjwsgWkYiIPM=; b=3So6NGYjXDdiy3
	WUlamB2kAp+DtUwXZ/DLDF9hW3kyWoamIukISVZOmewMBxtB0et5BjSiSBpbl3/5ZJgKutY2zDC+J
	DMGAMzJWFl2UYKqfKD+LrGCtaqo6mcAa0+ZxPEdxUyAfGYVRJnBsnS70Gnwm33NjzDN9rjZXPtInv
	DhU7au9UCFv/HFpf3pY6l1raBEBbsAKWWvNYaifRTnTaLfHwgtOyGaJTL0Bf6xVYhqTKkYsaNoK7c
	ObjtbEaz5R8mkfN+DpuMvdnB3WeCQfGFVTk0aPLLvVdyY8YAULJfOoiPc6hauAzF56cEjDUBq48zG
	jz0nq7VrZUzeiUZG0QKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi5Y-00000009OW5-1l0S;
	Wed, 18 Nov 2026 16:00:48 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi5V-00000009OUn-3sYQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:00:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7VeXSmZ3/hUkdPciRRL585AMCPSZFly0ImGRWGDZsag=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795017643; v=1; x=1795622443;
 b=jNLmMzj+LWIEyTsXHqJY/sFju3iEkY8eNZmswrqQ3+o/tdhuTanGZGPjBS4QVzEZXnvxe3Df
 RoQOr0nkcaYMWOCm0tx5xvTulEQxI5GZ+48JZAbb9rV+/J5/Lc/xQxTygPoy3afAp/NqKnNbduI
 yXQPYPgbl+mh+y+IDKYYOqxw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a1dd53c957c54ffa;
	Wed, 18 Nov 2026 16:00:43 +0000
X-Mizu-Trace-ID: a1dd53c957c54ffa
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 16:00:43 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org,
 tglx@linutronix.de
CC: Andrew Morton <akpm@linux-foundation.org>,
 Peter Ziljstra <peterz@infradead.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_smpboot=3A_Allow_res?=
 =?US-ASCII?Q?tricting_per-CPU_threads_to_a_CPU_mask?=
In-Reply-To: <7a1e55d24c39d70caa157e6e2c823d9be5db07e7.1794992905.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com> <7a1e55d24c39d70caa157e6e2c823d9be5db07e7.1794992905.git.daniel.lezcano@oss.qualcomm.com>
Message-ID: <0453960B-FF17-4E49-8672-FC0FDA3EF5DE@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_080046_684954_CEBB42E8 
X-CRM114-Status: GOOD (  18.59  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18 November 2026 10:33:48 GMT, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>smpboot_register_percpu_thread() creates a thread for every online CPU
>and registers the descriptor for subsequent CPU hotplug operations.
>There is currently no way to restrict these threads to a subset of
>CPUs, even when the user only needs work performed on that subset.
>
>For example, an idle injection device targets a specific CPU mask.
>Creating threads outside that mask consumes resources unnecessarily.
>Supporting multiple such devices also requires each descriptor to
>manage only the threads associated with its own CPUs.
>
>Add an optional CPU mask to struct smp_hotplug_thread and apply it
>throughout the thread lifecycle. Registration creates threads only for
>online CPUs in the mask. CPU bring-up creates threads for selected
>CPUs that were offline at registration, while parking and unparking
>are restricted to the same mask.
>
>Apply the restriction to thread destruction as well, both during
>unregistration and registration failure cleanup. This is necessary
>when descriptors with disjoint masks share the same per-CPU task
>storage: tearing down one descriptor must not stop or clear threads
>owned by another descriptor.
>
>Reject registrations that share task storage with an existing
>descriptor and have overlapping CPU masks. Check for overlaps under
>smpboot_threads_lock before creating any threads, warn once and return
>-EBUSY on a conflict. Checking the masks also covers offline CPUs,
>whose task pointers may not yet be populated. This prevents descriptors
>from sharing a thread and interfering with each other's teardown.
>
>Default a NULL mask to cpu_possible_mask at registration, preserving
>the existing all-CPU behavior and allowing the lifecycle helpers to
>use the mask unconditionally. Use scoped guards for the registration
>locks so all error returns release them in the correct order.
>
>The caller must keep the mask valid and unchanged until the descriptor
>is unregistered. smpboot serializes the overlap check and descriptor
>registration against other registration and unregistration operations.

Cheers,

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

>
>Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>---
> include/linux/smpboot.h |  6 ++++++
> kernel/smpboot.c        | 45 ++++++++++++++++++++++++++++++++---------
> 2 files changed, 41 insertions(+), 10 deletions(-)
>
>diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
>index 9d1bc65d226c..57b945d51b19 100644
>--- a/include/linux/smpboot.h
>+++ b/include/linux/smpboot.h
>@@ -5,6 +5,7 @@
> #include <linux/types.h>
> 
> struct task_struct;
>+struct cpumask;
> /* Cookie handed to the thread_fn*/
> struct smpboot_thread_data;
> 
>@@ -27,6 +28,10 @@ struct smpboot_thread_data;
>  *			unparked (cpu online)
>  * @selfparking:	Thread is not parked by the park function.
>  * @thread_comm:	The base name of the thread
>+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
>+ *			valid and unchanged until the descriptor is unregistered.
>+ *			Registration defaults NULL to cpu_possible_mask. Descriptors
>+ *			sharing @store must have disjoint masks.
>  */
> struct smp_hotplug_thread {
> 	struct task_struct		* __percpu *store;
>@@ -40,6 +45,7 @@ struct smp_hotplug_thread {
> 	void				(*unpark)(unsigned int cpu);
> 	bool				selfparking;
> 	const char			*thread_comm;
>+	const struct cpumask		*cpumask;
> };
> 
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread);
>diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>index 4503b60ce9bd..f997fe85f088 100644
>--- a/kernel/smpboot.c
>+++ b/kernel/smpboot.c
>@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 	struct smpboot_thread_data *td;
> 
>+	if (!cpumask_test_cpu(cpu, ht->cpumask))
>+		return 0;
>+
> 	if (tsk)
> 		return 0;
> 
>@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (!cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (!ht->selfparking)
> 		kthread_unpark(tsk);
> }
>@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (!cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (tsk && !ht->selfparking)
> 		kthread_park(tsk);
> }
>@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
> 	for_each_possible_cpu(cpu) {
> 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+		if (!cpumask_test_cpu(cpu, ht->cpumask))
>+			continue;
>+
> 		if (tsk) {
> 			kthread_stop_put(tsk);
> 			*per_cpu_ptr(ht->store, cpu) = NULL;
>@@ -279,28 +291,41 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
>  * 					    to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Creates and starts the threads on all online cpus.
>+ * Creates and starts the threads on online CPUs selected by the descriptor's
>+ * cpumask, or all online CPUs if no mask is specified.
>+ *
>+ * Return: 0 on success, -EBUSY if a registered descriptor shares the same task
>+ * storage and has an overlapping CPU mask, or a thread creation error.
>  */
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>+	struct smp_hotplug_thread *ht;
> 	unsigned int cpu;
>-	int ret = 0;
>+	int ret;
>+
>+	if (!plug_thread->cpumask)
>+		plug_thread->cpumask = cpu_possible_mask;
>+
>+	guard(cpus_read_lock)();
>+	guard(mutex)(&smpboot_threads_lock);
>+
>+	list_for_each_entry(ht, &hotplug_threads, list) {
>+		if (ht->store != plug_thread->store)
>+			continue;
>+		if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, plug_thread->cpumask)))
>+			return -EBUSY;
>+	}
> 
>-	cpus_read_lock();
>-	mutex_lock(&smpboot_threads_lock);
> 	for_each_online_cpu(cpu) {
> 		ret = __smpboot_create_thread(plug_thread, cpu);
> 		if (ret) {
> 			smpboot_destroy_threads(plug_thread);
>-			goto out;
>+			return ret;
> 		}
> 		smpboot_unpark_thread(plug_thread, cpu);
> 	}
> 	list_add(&plug_thread->list, &hotplug_threads);
>-out:
>-	mutex_unlock(&smpboot_threads_lock);
>-	cpus_read_unlock();
>-	return ret;
>+	return 0;
> }
> EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
> 
>@@ -308,7 +333,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
>  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Stops all threads on all possible cpus.
>+ * Stops all threads associated with the descriptor, including offline CPUs.
>  */
> void smpboot_unregister_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>


--- Thanks!

