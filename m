Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hmmvQfeB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d2PcsH4x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MxC6/goI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aGe5/35woBldXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=; b=hmmvQfeBAbU+YI
	XeTDHFEqEgWPSk1D7xRhZ6Omu+CSRxifgrilVaI0EgoBt6kxC6G5LFG3Cd6FfTKJKOtiJGI+xpwBR
	L7THr7hll03UqqHntoY/xPMOQgZ8LXQ5afQzUyyD62dPw2V6o4CBCVbj4PIesqGwKAX7HsMX7lpTm
	O7k2SUEJnzePB92IJxckEJFtXGE/OneDtM6CLRjvLrSY9pvL8Y5nYZROmli8b7d8G8u+XZNH44nvP
	VzX5rMRX8jhid8zz2DPKTSGf32vFwW1JXPoj2Dmy4xDR5nq/b+QDov7iDDccTOW9URbdtLDYFB2VX
	cvaN34SORjc9SXLM2TXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTczo-00000008ZRM-28N0;
	Wed, 18 Nov 2026 10:34:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTczY-00000008ZFB-2nDz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:34:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9le16835314
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aGe5/35woBl
	dXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=; b=d2PcsH4x0fz27gATpvfFFjXUxTP
	Iqx+SHqvWPtcqOe4Nxybmu0h89MAVxrgdfDrOs1maertntw//gd1ZBJMh4Ji0HR0
	xUDL6FfeQ+rBgBcpwwSD5em/fHxN5aTuuPH6I+v9FtJULznJpih9vTAmvhWa6q/X
	S1M3E22AYYZs+GAVKWGxSo6TOCIz8+YX3i72Q61Jlrlyk1GChiS+J2cS2HealNJ3
	Theko5Uolj2m7PSzSXLhJEbG2yLe5Ll3CZTt7MG7zMNggyXz3Y9s/yiNtd3sBvbB
	NaGx5AfukLxxkGH+RoCrvQNA5Bxuta00iVhUSBHXWaPo0OrmQB3Z5gzPJJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcjkdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 10:34:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so189196085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998055; x=1795602855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGe5/35woBldXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=;
        b=MxC6/goIB6oNJm2/WnQ41Xo3TyWn2gyDmh1mM8rnfpjBRDOxMm8XzhnNZDendLBsbp
         JEnUVu7xzEDyn9z+ljxA69MDj59oplzbIOlsEvy5pGNxzpiftsvjmCFDcli8TsZdONTP
         8bXQhIGk6+vQrurmjZ0xvaixMsqJOhDUHVBKQY25kc9vsEVUqB8ZFyoE6xIw7hhmXKzc
         GcsQ1n5BHXgCAfxTp4wxHYTlUyBxZV5+QCnfKM/bhVQP9WYb+hkYwvLJ7mkCQlBu6WRr
         uXDdZuY9iHLOjfp7Y487fiMtLUasOVZH3jSdPvG7R0K/j5GHCGNANSSuszJiyRuwIvn6
         /bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998055; x=1795602855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGe5/35woBldXiPfqQ49uVeqf5gd1K2N9K/JlpgH0bM=;
        b=zVFkL58bN3cm04dPXT9f6eA8oWyd0uevjx/oNKc8xi4ugRZS165rewZVhGRW82trx9
         sfYQgEm7UYB38gG5uI2CnGCI79vLWt0Oap0AlJS7cSjiGCm4uZqaERdh86febJuMVCCe
         0jCSdJxfrBvmTDgfHcxibzerX3PT9dNPhIEbE+fVKQlDIH99bLLTolnMEc32vL+ek3QJ
         g7Uxiqs7Zfk/HdCZDu2BVSfKKx+NvvUVbsKHv5aHJJXRXD2kxeN88ep8m5pB42kH7f8K
         bjr90K320R5xI3dhEEZFoQEo2kQYjc+eWTuRVIXMjdavCtkt1/1VIiiaMEeQ/fLqttGp
         UgCQ==
X-Forwarded-Encrypted: i=1; AL+hErFX2MaGv1CJvSpDYqFdrdor75RSsoHV9iMT93P0YYrFrKauLYsn5FZfMrZ8F1LLoAT889KomDO/mGzQliUM0ggX@lists.infradead.org
X-Gm-Message-State: APuU4Z9EPxxSd5EvP1y10ruyjiAxa8yTH1jG0laBDe9f0YxrTiU0oZRv
	pIe33baj5tO/vpEXLYhTE8G+uO0yN0sopXnsshZXx64B95qXg+h64Y9e3hJcZ1Kft3fSxAjwmqF
	j+dF68WINGG+IneSnPuyQZ6wg74/7MscIk4eXsq6uQwfbGrrkGZVpDwk9BMj632LJGaD7nGUFJo
	PRJQ==
X-Gm-Gg: AYBFou3BxZ3gHd6SJdSNT6lS5cWsKtiotWV1VeHIXj29GKnWO2GyNwdShtP1lncimto
	RqaEmeWXKD4jVzIkQYNY2qpQS+tZnv29zeij4g/nCnUBho1avGLzja4LRJ6SF+VYzSM07Ezc5PA
	kyyBPlMNkS1g1r//rFkkpDTOmpVJLqoBXNFj8Co/3CYeqE74/iT4Mmf090/oDoYWiAC1509XT1Z
	EHDX6/b1I7d61uTobegapvLZ6q5nTbgoHiJrgFtYXHVK+qFYteCKqHm1igacBa1YoJQzlOuITql
	KM1OkHsJSQIJRbL0+yZzqlK+ZUltxoFRfvOywQdPtVSsFcTPbB3yhRN1Rxx/8vM/uDf6zbI5woF
	TarVA8GJdQZQdUuKpSPF7bfJKggAvkYrSf/3BvbWemU6C9qNOdsRCVSi7IAGmgDNBd3jJEcIDO9
	sL
X-Received: by 2002:a05:620a:3710:b0:947:8344:17a7 with SMTP id af79cd13be357-949995f8716mr384302285a.11.1794998054769;
        Wed, 18 Nov 2026 02:34:14 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:947:8344:17a7 with SMTP id af79cd13be357-949995f8716mr384298685a.11.1794998054258;
        Wed, 18 Nov 2026 02:34:14 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm4519631f8f.8.2026.11.18.02.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:34:13 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] powercap: idle_inject: Create per-CPU threads on registration
Date: Wed, 18 Nov 2026 11:33:49 +0100
Message-ID: <0fd0b28b29f6d9ad38bc91f3582bfee511fbf4f8.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd7f27 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=z2xlO20o2AOZ5rEB0BcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: 8NHxO_WYgiv6wJnLyvH5Snw3-Nor7VRP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX2PfVqtwjjl5H
 wwu0wZL4xtTjmpY8Dso5ERHoqHy7CBRX8fWqcGXFK5ldzJrPN+zYfnO/KgVvckopw6m4VDNxnNz
 rryM9ICIaWVoi2sHvfDCsUafyUGGQ3Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXw/b1rSB1L93a
 dx9AoHJk5rYmBiX5TF7k5FQbP55+bAaVGvaQf48bhKreU8WbNpkJ5jEcUUXBwtvzgaoffMglQWy
 o5jQfnJXjZ/EdcFuiZWGlYdZvV/E7xblZ1pFFw7BvMszACGDNjdy2D7p+TaFJizHHJngMMCKjwO
 vu6dWoXlPjF5jLBXrH9/YnF0hCzG90qdzrwWYSdqARyBYJw+VQGt3aWAviAWpY8+4Nx/aX47vqe
 SwP6HW+oLJBlDmte7D+43DWA40+n7PgHG79ddKwrOujM3Cx4ilY4vwnq6TVmzh10Hr7+6pcTcH2
 gnlLn/BhgyFbB61DfJK2ckGAo1xiMkA3jI2/W14E0oNujj1AtNgL4A1poEHXx0CwqHhDvSfehTx
 P5VrO91LyxsvrnpOqZvewlNekFTsAHYVdgTuXtaG3H3ePx98awlvK4VRYhv/6dngBaaEg3R95j3
 83KK7XB6HPPmEDI49cg==
X-Proofpoint-ORIG-GUID: 8NHxO_WYgiv6wJnLyvH5Snw3-Nor7VRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_023416_820810_785EBB9B 
X-CRM114-Status: GOOD (  26.34  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Create idle injection threads when a device registers instead of
creating them unconditionally during early initialization. Destroy the
threads when the device unregisters.

Use a per-device smpboot descriptor with the device's CPU mask so thread
creation and CPU hotplug handling are limited to the CPUs registered by
that device. Allow stopping devices whose offline CPUs have not yet had
a thread created, and update the registration documentation to describe
the thread lifecycle and possible failures.

Serialize CPU ownership checks and claims with a framework-wide mutex.
Without serialization, registrations with overlapping masks can both
observe an unclaimed CPU and overwrite each other's device pointer.
Their smpboot descriptors can then share the same per-CPU task, allowing
one device's teardown to destroy a thread belonging to another device.
Registration rollback can also clear another caller's ownership.

Hold the mutex through smpboot registration and failure rollback, and
during thread unregistration through ownership release. This prevents a
CPU from being claimed again until its previous thread is destroyed.

Stop idle injection before acquiring the mutex, keeping timer callback
cancellation and stop-side hotplug exclusion outside the ownership
critical section. Neither the idle injection threads nor their smpboot
hotplug paths acquire this mutex. The existing caller-side lifecycle
synchronization requirement remains in effect.

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
---
 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/powercap/idle_inject.c b/drivers/powercap/idle_inject.c
index a25eb2018acd..24646b8be9ac 100644
--- a/drivers/powercap/idle_inject.c
+++ b/drivers/powercap/idle_inject.c
@@ -10,11 +10,9 @@
  * It relies on the smpboot kthreads feature providing common code for CPU
  * hotplug and thread [un]parking.
  *
- * All of the kthreads used for idle injection are created at init time.
- *
- * Next, the users of the idle injection framework provide a cpumask via
- * its register function. The kthreads will be synchronized with respect to
- * this cpumask.
+ * Users of the idle injection framework provide a cpumask via its register
+ * function. The kthreads are created on demand for CPUs in this mask and
+ * will be synchronized with respect to it.
  *
  * The idle + run duration is specified via separate helpers and that allows
  * idle injection to be started.
@@ -40,6 +38,7 @@
 #include <linux/cpu.h>
 #include <linux/hrtimer.h>
 #include <linux/kthread.h>
+#include <linux/mutex.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/smpboot.h>
@@ -60,6 +59,7 @@ struct idle_inject_thread {
 /**
  * struct idle_inject_device - idle injection data
  * @timer: idle injection period timer
+ * @threads: per-device CPU hotplug thread descriptor
  * @idle_duration_us: duration of CPU idle time to inject
  * @run_duration_us: duration of CPU run time to allow
  * @latency_us: max allowed latency
@@ -82,6 +82,7 @@ struct idle_inject_thread {
  */
 struct idle_inject_device {
 	struct hrtimer timer;
+	struct smp_hotplug_thread threads;
 	unsigned int idle_duration_us;
 	unsigned int run_duration_us;
 	unsigned int latency_us;
@@ -92,6 +93,9 @@ struct idle_inject_device {
 static DEFINE_PER_CPU(struct idle_inject_thread, idle_inject_thread);
 static DEFINE_PER_CPU(struct idle_inject_device *, idle_inject_device);
 
+/* Serialize CPU ownership changes and the associated thread lifecycle. */
+static DEFINE_MUTEX(idle_inject_lock);
+
 /**
  * idle_inject_wakeup - Wake up idle injection threads
  * @ii_dev: target idle injection device
@@ -279,7 +283,8 @@ void idle_inject_stop(struct idle_inject_device *ii_dev)
 		iit = per_cpu_ptr(&idle_inject_thread, cpu);
 		iit->should_run = 0;
 
-		wait_task_inactive(iit->tsk, TASK_ANY);
+		if (iit->tsk)
+			wait_task_inactive(iit->tsk, TASK_ANY);
 	}
 
 	cpu_hotplug_enable();
@@ -319,12 +324,12 @@ static int idle_inject_should_run(unsigned int cpu)
  * idle
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it. This
+ * given set of CPUs, registers their kthreads and initializes the timer. This
  * function also allows to register update()callback.
  * It does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 
 struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
@@ -342,6 +347,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 	ii_dev->latency_us = UINT_MAX;
 	ii_dev->update = update;
 
+	mutex_lock(&idle_inject_lock);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask)) {
 
 		if (per_cpu(idle_inject_device, cpu)) {
@@ -352,6 +359,20 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu) = ii_dev;
 	}
 
+	ii_dev->threads = (struct smp_hotplug_thread) {
+		.store = &idle_inject_thread.tsk,
+		.setup = idle_inject_setup,
+		.thread_fn = idle_inject_fn,
+		.thread_comm = "idle_inject/%u",
+		.thread_should_run = idle_inject_should_run,
+		.cpumask = to_cpumask(ii_dev->cpumask),
+	};
+
+	if (smpboot_register_percpu_thread(&ii_dev->threads))
+		goto out_rollback;
+
+	mutex_unlock(&idle_inject_lock);
+
 	return ii_dev;
 
 out_rollback:
@@ -361,6 +382,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu_rb) = NULL;
 	}
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 
 	return NULL;
@@ -372,11 +395,11 @@ EXPORT_SYMBOL_NS_GPL(idle_inject_register_full, "IDLE_INJECT");
  * @cpumask: CPUs to be affected by idle injection
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it.  It does not
- * start any injection cycles.
+ * given set of CPUs, registers their kthreads and initializes the timer. It
+ * does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 struct idle_inject_device *idle_inject_register(struct cpumask *cpumask)
 {
@@ -398,23 +421,15 @@ void idle_inject_unregister(struct idle_inject_device *ii_dev)
 
 	idle_inject_stop(ii_dev);
 
+	mutex_lock(&idle_inject_lock);
+
+	smpboot_unregister_percpu_thread(&ii_dev->threads);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask))
 		per_cpu(idle_inject_device, cpu) = NULL;
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 }
 EXPORT_SYMBOL_NS_GPL(idle_inject_unregister, "IDLE_INJECT");
-
-static struct smp_hotplug_thread idle_inject_threads = {
-	.store = &idle_inject_thread.tsk,
-	.setup = idle_inject_setup,
-	.thread_fn = idle_inject_fn,
-	.thread_comm = "idle_inject/%u",
-	.thread_should_run = idle_inject_should_run,
-};
-
-static int __init idle_inject_init(void)
-{
-	return smpboot_register_percpu_thread(&idle_inject_threads);
-}
-early_initcall(idle_inject_init);
-- 
2.43.0


