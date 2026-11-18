Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00673606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiUTfWVH;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzdA8nap;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8Ij2Dw3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pOB78OBjoKUKg9xXXTUE6AnEpJ3d3Z6dp04LaBMreM8=; b=fiUTfWVH5AkJ4O
	DU/zpLi36jkdFjO2svQ7QJVlabezPMD2YxQNRiYXHydrHhAkvZL01uhXy+7LXGMXQD6X4Dc34U8gT
	pA9uQXEiISXzn4Uu1RJCY7NTj9gT0V5l4TqYGKmKdyyERz9q3TtXI22iVe/S9yOUSaaCgTcCRbMFc
	cO6BjrCt+IMjfxCXrK49MeF/qjZPZ0tVu7WtvC7WevAP1LHIEsYuwBnFz+y0UJpZl6dA3QrZBLbbt
	X2TKAsPpu2ggczcRDfsZToczC7aEEIS2Fij0DHpP8XotXWRDIOHE6gTpW54D8aBbFwVlna18S4eMY
	QzF8slyZWvdJYva/0G1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiLJ-00000009QpR-3phK;
	Wed, 18 Nov 2026 16:17:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiLB-00000009Qkm-00rc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:16:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQJBq633479
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 16:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pOB78OBjoKU
	Kg9xXXTUE6AnEpJ3d3Z6dp04LaBMreM8=; b=XzdA8nap5wPmr2gBgUn7zmPVnYj
	fYLMbHvYy+AzZr7swPl3HfFMHooKsDpx//mbEd1waQBEMOSKQ2dbBlWAfODE0RMu
	T4SnnOnRKeBEiZsD7rS3Mi59wt2Cn5wOm9b0yHXJQgTCow88zwEAzRyltQnBsh8R
	NYVmf29JmyObSXmloI/ckvRMDA1epG65jEx4xPLIQuLeXFlWHSbcb532VpT5Cylz
	whexmf62GQP4zG2DMcqx8Aik+rqC5i1hixtiFbkFrpgHkbfs7KTTQxt7CrA1JxAI
	Od7YQrHKjIFSKDsi7oFRIBet1cak4x6P/HqbHF3yO4foyFmbPw3Env7ZkgA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8uw4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 16:16:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so349865e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795018615; x=1795623415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOB78OBjoKUKg9xXXTUE6AnEpJ3d3Z6dp04LaBMreM8=;
        b=X8Ij2Dw3baPAtXfpav2/aRXIbwYUf4CgqnQqsA1zqe4uNxBNgrgwucPT98mN6FfOhw
         PMcVoRonRy4ZwYKDdLeMLTG6pj8M9ALI5nWJFifaeozWLGIbbiyzZdp/JhlePI14koPg
         x+fnd4nOIyfxpvO6vAXFkYy9VKbRueX3X2jMvYon+Gp0YUZFUa2ifGxbJ0FFWTzkLb51
         m65oLbdG9vWQT8gRadiZyQOlpwxeKC4O2/kccoO4UvM2n9wRJi7ayq8uaVGX/sJ56PTS
         ra5wASbwgks6k8Lrkq1l7oGstNW/4NgeTEMpvAqsTmaeaqssyyEnUzMYFkpEz8n+m1yK
         oP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018615; x=1795623415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOB78OBjoKUKg9xXXTUE6AnEpJ3d3Z6dp04LaBMreM8=;
        b=I7TJA8tIANCMWqZK7hklrt98d4dOH9fYFaL366JtUuBTlfHaGGLS+3JGsgU39EJa/O
         ulJYEhEEjRPjZ6WZ/jIJejFEf9mebVKWqQnprbIb/iZExQfAfkQwYeVKmoaeSFtNl3s4
         9QtAQn0Z19flWfK6VJXzRQBXYUVv2S1L+b9kHF1duN6yR2TQYgZCHI7qPN6Az3+1dpG0
         LNrvzqMgHQU1Pi5P7EI+nb9Qhrt/qveA5ZOOeOa3de9k0WNy2jGCMgQx1/qRIyPQPkn7
         rwB1562VmgcRs70rfqovxZ2VQt4yH+edQv7IQ385ViVxj3dNuA27+OPYZyX2UzRp/zdo
         trrg==
X-Forwarded-Encrypted: i=1; AL+hErGubEpAvx+UHS1efwYv9nv9GmvtyR8XcKHToBLA3GGq8LlzN4QYf/zERLHXVjXLOhsji0EeauY1Qar1qMek5UmI@lists.infradead.org
X-Gm-Message-State: APuU4Z+kzb1ZRZ5kb4tXR/zJaOas6yfFl2B1OrT/4QI4okJiBLQTntYq
	S4MizmDkkEjfGZAjoBSxAkvtxadtbX9840ofvEW5O0vwweVHZJ+pa4K5V0bYsjh/6/Mmelo+TXx
	MNxLzwiQ+7/x981E8dwPGwM2SwGP+RRON/fdofjC9sUZH7tn60niy48b0Jc0jLUhvYs7bWZTcv1
	73+w==
X-Gm-Gg: AYBFou2ifWqfQ0sxnZ0CrTeXXGuqJp33nwq51mSuRFNROBK2rS7+f6suU/LiDO5JU2H
	Msd2L4+TU6y6occWlDiV3SYxMDwWmtIZcMNuEJ1eIk+atcCoSy/0gtNXt1Mqb8PrkqHiboklm9b
	bJOhUALz0j47y6CIwBDwW8hkeqRypCNKbews/B//JzKok/vYbHB3UHDEH6YKlQBTlpMniJEOkOW
	Emg2I/QmsiR+jqGTKtB9PYlC5FqIzqEcEZ8smshyX9zocM43cuSb1P+BcRr/+1NXr7YW8TmlBrO
	foqtaL/uuUtuYv2K2Yl55qC7+hI/gZ2gioQixtHrgXl6su+5doniYWbKvtlphAxobU5xTExUT8o
	aXq+d1y+DB15tB6tZGJzo0Ej4h8nW7p63WxsT3t/8nSJkbjdwrGX25MlQnBlW3RM0+krpdxlVe5
	ch
X-Received: by 2002:a05:6122:62a6:b0:5ec:c162:d58c with SMTP id 71dfb90a1353d-5ee646c8d94mr1575528e0c.9.1795018615276;
        Wed, 18 Nov 2026 08:16:55 -0800 (PST)
X-Received: by 2002:a05:6122:62a6:b0:5ec:c162:d58c with SMTP id 71dfb90a1353d-5ee646c8d94mr1575483e0c.9.1795018614742;
        Wed, 18 Nov 2026 08:16:54 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm217090495e9.8.2026.11.18.08.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:54 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, tglx@linutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Ziljstra <peterz@infradead.org>,
        Bradley Morgan <brads@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        Bradley Morgan <bradley.morgan@linux.dev>,
        Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH RESEND v2 1/2] smpboot: Allow restricting per-CPU threads to a CPU mask
Date: Wed, 18 Nov 2026 17:15:26 +0100
Message-ID: <7a1e55d24c39d70caa157e6e2c823d9be5db07e7.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1794992905.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdcf78 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=5Kbu-F-uTTPTLeMpapkA:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 0Y6DKspFohvjF75U1riPSmeYotjdbeBP
X-Proofpoint-ORIG-GUID: 0Y6DKspFohvjF75U1riPSmeYotjdbeBP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfXxLYoVMtlkenG
 vdW/2lacBJbGu6jNPMoXSKxJEL5X98vwok3uyomuox6Pkwaa1bSswTHYtMkHHHMSEZQ/3otwlY7
 JmCxzH/Dks8uwBu957qKEZ1GHLW6QI9z+qnGxaucKgR2WsWoxJUNS+GdACm6PmkJURiRwjTc5AJ
 I+cVIeviykMfv9PXbKv1I5uGuJGH/zHC/MNYenlvLFKgqxf9bIklUEYnRI9KhKdZDjB6QIqKNI1
 ORvQzfTHQG0nx6wn12jK3mz4z9IxR1kyJbd5njOf2Ay0dxwoBA8lpGzzEm6XRsv3S2BHm52lXi4
 6fshWTTZvri3D8GGoNDfTSINMHND1GL6hswHW50nM7+VhELgXnAdTGIjMn5lPdP6FpG3ma2IsUa
 vyRCm7c4w8Sp+G7zn/esyK2vMg4hIklGqcL/7qnJU2LKjSZRXHVlCqBpRtQTMaypbs+eks+i9y+
 uwav8I4kMFf1viTJs5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NCBTYWx0ZWRfX/9FkKYCMo8L+
 5ieKRXhPvb2rDa7q9gWuYVjLG9+WSKVmgG1i/zxe8jGvcWKetgY8jmgKIsEGJLRjSVKaZaqwG7p
 niCNSr4bruGP5BaoMsl4b+QstkpLc1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081657_054017_D97977FD 
X-CRM114-Status: GOOD (  25.22  )
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
Message-ID: <20261118161526.P8YeER6DayatiTzNXxVivjeKzvBPXNbXCwn-_g2_Zxg@z>

smpboot_register_percpu_thread() creates a thread for every online CPU
and registers the descriptor for subsequent CPU hotplug operations.
There is currently no way to restrict these threads to a subset of
CPUs, even when the user only needs work performed on that subset.

For example, an idle injection device targets a specific CPU mask.
Creating threads outside that mask consumes resources unnecessarily.
Supporting multiple such devices also requires each descriptor to
manage only the threads associated with its own CPUs.

Add an optional CPU mask to struct smp_hotplug_thread and apply it
throughout the thread lifecycle. Registration creates threads only for
online CPUs in the mask. CPU bring-up creates threads for selected
CPUs that were offline at registration, while parking and unparking
are restricted to the same mask.

Apply the restriction to thread destruction as well, both during
unregistration and registration failure cleanup. This is necessary
when descriptors with disjoint masks share the same per-CPU task
storage: tearing down one descriptor must not stop or clear threads
owned by another descriptor.

Reject registrations that share task storage with an existing
descriptor and have overlapping CPU masks. Check for overlaps under
smpboot_threads_lock before creating any threads, warn once and return
-EBUSY on a conflict. Checking the masks also covers offline CPUs,
whose task pointers may not yet be populated. This prevents descriptors
from sharing a thread and interfering with each other's teardown.

Default a NULL mask to cpu_possible_mask at registration, preserving
the existing all-CPU behavior and allowing the lifecycle helpers to
use the mask unconditionally. Use scoped guards for the registration
locks so all error returns release them in the correct order.

The caller must keep the mask valid and unchanged until the descriptor
is unregistered. smpboot serializes the overlap check and descriptor
registration against other registration and unregistration operations.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

---
 include/linux/smpboot.h |  6 ++++++
 kernel/smpboot.c        | 45 ++++++++++++++++++++++++++++++++---------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
index 9d1bc65d226c..57b945d51b19 100644
--- a/include/linux/smpboot.h
+++ b/include/linux/smpboot.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 
 struct task_struct;
+struct cpumask;
 /* Cookie handed to the thread_fn*/
 struct smpboot_thread_data;
 
@@ -27,6 +28,10 @@ struct smpboot_thread_data;
  *			unparked (cpu online)
  * @selfparking:	Thread is not parked by the park function.
  * @thread_comm:	The base name of the thread
+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
+ *			valid and unchanged until the descriptor is unregistered.
+ *			Registration defaults NULL to cpu_possible_mask. Descriptors
+ *			sharing @store must have disjoint masks.
  */
 struct smp_hotplug_thread {
 	struct task_struct		* __percpu *store;
@@ -40,6 +45,7 @@ struct smp_hotplug_thread {
 	void				(*unpark)(unsigned int cpu);
 	bool				selfparking;
 	const char			*thread_comm;
+	const struct cpumask		*cpumask;
 };
 
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread);
diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 4503b60ce9bd..f997fe85f088 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 	struct smpboot_thread_data *td;
 
+	if (!cpumask_test_cpu(cpu, ht->cpumask))
+		return 0;
+
 	if (tsk)
 		return 0;
 
@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (!cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (!ht->selfparking)
 		kthread_unpark(tsk);
 }
@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (!cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (tsk && !ht->selfparking)
 		kthread_park(tsk);
 }
@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
 	for_each_possible_cpu(cpu) {
 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+		if (!cpumask_test_cpu(cpu, ht->cpumask))
+			continue;
+
 		if (tsk) {
 			kthread_stop_put(tsk);
 			*per_cpu_ptr(ht->store, cpu) = NULL;
@@ -279,28 +291,41 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
  * 					    to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Creates and starts the threads on all online cpus.
+ * Creates and starts the threads on online CPUs selected by the descriptor's
+ * cpumask, or all online CPUs if no mask is specified.
+ *
+ * Return: 0 on success, -EBUSY if a registered descriptor shares the same task
+ * storage and has an overlapping CPU mask, or a thread creation error.
  */
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
+	struct smp_hotplug_thread *ht;
 	unsigned int cpu;
-	int ret = 0;
+	int ret;
+
+	if (!plug_thread->cpumask)
+		plug_thread->cpumask = cpu_possible_mask;
+
+	guard(cpus_read_lock)();
+	guard(mutex)(&smpboot_threads_lock);
+
+	list_for_each_entry(ht, &hotplug_threads, list) {
+		if (ht->store != plug_thread->store)
+			continue;
+		if (WARN_ON_ONCE(cpumask_intersects(ht->cpumask, plug_thread->cpumask)))
+			return -EBUSY;
+	}
 
-	cpus_read_lock();
-	mutex_lock(&smpboot_threads_lock);
 	for_each_online_cpu(cpu) {
 		ret = __smpboot_create_thread(plug_thread, cpu);
 		if (ret) {
 			smpboot_destroy_threads(plug_thread);
-			goto out;
+			return ret;
 		}
 		smpboot_unpark_thread(plug_thread, cpu);
 	}
 	list_add(&plug_thread->list, &hotplug_threads);
-out:
-	mutex_unlock(&smpboot_threads_lock);
-	cpus_read_unlock();
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
 
@@ -308,7 +333,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Stops all threads on all possible cpus.
+ * Stops all threads associated with the descriptor, including offline CPUs.
  */
 void smpboot_unregister_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
-- 
2.43.0


