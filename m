Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38D2606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=koFL54Nr;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eJuqpyR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5AW2nipPEcXSmS9V+T3J/dS9piHtleVZliKtt/7SoWY=; b=koFL54Nr0nUfxFBg91y7Jdsp7P
	x53SR6AtSQEFD4T4N1BID5NgkLlB7oGp/M9q6IARmb+UvpfyFVokwD8uRuU44LWaFX4xOeARPTVJK
	5Trkqn+y7B0AgzZsDRsRnUgJBQwBShjKxhNb37APuxy0J20RurVuu1DquzSqHL0w5ss2pTtao1VSr
	DW9Ub+CthdplQQ6SrPHfR4n6Wj8Jt1UiQHWVF4Mqxh2BoBweMMGWI5oefByXvY/X0SeJFU/gIg9m0
	djBwXmImjIDkMwNxliJWAZmSAi4mf3Uv9vDcW15FrJmfmSzSMFabn7PbyidUuvcdK4j8Cn5UywEF2
	r9FRyDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpCq-00000006Rsm-3ijG;
	Tue, 24 Nov 2026 12:01:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpCW-00000006Rp9-2yTf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:00:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17FC4339;
	Tue, 24 Nov 2026 04:00:39 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62A853F86F;
	Tue, 24 Nov 2026 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795521642; bh=hUx5iWGPxemOHLjtDseDN4hRI9gZTNF4o/86bVlCibE=;
	h=From:Date:Subject:To:Cc:From;
	b=eJuqpyR455142Sz/EpRwc+sVwehwmL2eNwg1JCAkkxha1cvwUWphVSWlo3xs2m+jP
	 UwqcImt+sbaxy4GWwLxkwJGqxHvUZBdhiOpJDTUraLFmO+Dg4xV6O6RNvEPCNhsiYo
	 EAmLwS0eHHNrwpRh3AdwHc8g6xAQkheXE+SgCL+k=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 24 Nov 2026 12:00:25 +0000
Subject: [PATCH] coresight: perf: End AUX output when an event is throttled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
X-B4-Tracking: v=1; b=H4sIAFh8BWsC/x3MSQqAMAxA0atI1hbaOiBeRaQ4RA1oK0kRQby7x
 eWDz39AkAkF2uwBxouEgk8weQbTNvgVFc3JYLWtjbGlGvhwk7iFbhc3DjHu5FcXwinKlFpXBY6
 6aQpIg5MxZf+869/3A2noptVsAAAA
X-Change-ID: 20261124-arm_cs_fix_throttling_oops-140053eb0883
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Vlad Poenaru <vlad.wing@gmail.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>, Song Liu <song@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795521640; l=5856;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hUx5iWGPxemOHLjtDseDN4hRI9gZTNF4o/86bVlCibE=;
 b=GXZh30aCOivjBHKOKp57f9FmHnXlJXGBNgeR3eySWnljlJTaZT7KdRlI771cjTUVnG+qH8xAu
 +lFUlrLLn2tBE+yumLSuHaDHrhN76u3rI+PTR/FVaclklazufkDCRaC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040044_845237_8DDB9FAF 
X-CRM114-Status: GOOD (  19.10  )
X-Spam-Score: -4.4 (----)
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

Perf throttles a group by calling each event's PMU stop callback with
flags set to zero. On a CPU with a trace path, ETM stops tracing and
leaves the AUX transaction open because PERF_EF_UPDATE is clear. When
perf unthrottles the event, perf_aux_output_begin() warns because
aux_nest is still set.

  [  181.161897] ------------[ cut here ]------------
  [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
  [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
  [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
  [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
  [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
  [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
  [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
  [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
  [  181.351280] sp : ffff800080003be0
  [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
  [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
  [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
  [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
  [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
  [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
  [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
  [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
  [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
  [  181.426411] Call trace:
  [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
  [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
  [  181.438665]  perf_event_unthrottle+0x70/0xa8
  [  181.442964]  perf_event_unthrottle_group+0x40/0x170
  [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
  [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
  [  181.458120]  perf_event_task_tick+0xa8/0x290
  [  181.462418]  sched_tick+0x144/0x2c8
  [  181.465937]  update_process_times+0xc0/0x198

End the AUX transaction with size zero on a throttling stop so
unthrottling can acquire a fresh handle. Collect trace data only when
PERF_EF_UPDATE is set.

Check AUX handle ownership before updating the buffer or ending AUX
output. Drop the post-update check because the full stop runs with
local IRQs disabled, which prevents the TRBE IRQ from closing the
handle during the stop.

This patch is limited to fixing the event throttling case. Other issues,
such as CPUs without a trace path and pending TRBE IRQs during sink
teardown, will be addressed by the following patch series [1][2].

[1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com/

Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 34 +++++++-----------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 909bfd5960331d44547a028fde336f7819488a1a..e506116723c4ed723d66bc721021718b5d176117 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -698,7 +698,7 @@ static void etm_event_pause(struct coresight_path *path,
 static void etm_event_stop(struct perf_event *event, int mode)
 {
 	int cpu = smp_processor_id();
-	unsigned long size;
+	unsigned long size = 0;
 	struct coresight_device *source, *sink;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
@@ -757,33 +757,19 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	 * handle due to lack of buffer space), we don't
 	 * have to do anything here.
 	 */
-	if (handle->event && (mode & PERF_EF_UPDATE)) {
-		if (WARN_ON_ONCE(handle->event != event))
-			return;
+	if (!handle->event || WARN_ON_ONCE(handle->event != event))
+		goto out;
 
+	if (mode & PERF_EF_UPDATE) {
 		/* update trace information */
-		if (!sink_ops(sink)->update_buffer)
-			return;
-
-		size = sink_ops(sink)->update_buffer(sink, handle,
-					      event_data->snk_config);
-		/*
-		 * Make sure the handle is still valid as the
-		 * sink could have closed it from an IRQ.
-		 * The sink driver must handle the race with
-		 * update_buffer() and IRQ. Thus either we
-		 * should get a valid handle and valid size
-		 * (which may be 0).
-		 *
-		 * But we should never get a non-zero size with
-		 * an invalid handle.
-		 */
-		if (READ_ONCE(handle->event))
-			perf_aux_output_end(handle, size);
-		else
-			WARN_ON(size);
+		if (sink_ops(sink)->update_buffer)
+			size = sink_ops(sink)->update_buffer(sink, handle,
+							     event_data->snk_config);
 	}
 
+	perf_aux_output_end(handle, size);
+
+out:
 	/* Disabling the path make its elements available to other sessions */
 	coresight_disable_path(path);
 }

---
base-commit: 8e3ac058be1b613aeabcb7ce18c142e4603cc5dd
change-id: 20261124-arm_cs_fix_throttling_oops-140053eb0883

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


