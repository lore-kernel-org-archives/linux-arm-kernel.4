Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzvU98k2;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ckFZon5Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f+KYKIglFh//POKwGwtOiHFDzLYwRxyWG8VR6hZzeIs=; b=IzvU98k2BAAnPE
	8V5XZjlEKWnQVzRrvhAAsPbXvlT09klFZnsUyCI+LHq3fLAlj6ZDTzHzj5reCrBHWvA9WBVAifngl
	O8WNfjBhwyxwB/uorxprt9UwGLnhphFGCOJY1ptTYQyg7LnebORbEwqAhoVOnmKs5LjjS6VLcFWZk
	EnNUnaKzPWRtfpfgRcKgRaK20Bvv8cQ/k5eBhE9Fz3TV594y4COtGPfXvyLudgiHXJdad4b5gDRRg
	tXD0fNjgzIlFAmE4wEmUGkTjceUQKSvNTIK9UDY/m6K9rhXgtPrv4QtIO/4NEoDFIweqRxvuBVq38
	n1H/P60BtYfthazdS6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFaz-0000000DzWP-1S4v;
	Fri, 20 Nov 2026 03:47:29 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFat-0000000DzTp-0FZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:47:25 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso325717a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146442; x=1795751242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+KYKIglFh//POKwGwtOiHFDzLYwRxyWG8VR6hZzeIs=;
        b=ckFZon5Ycrd9UQwuWWcDWdnb9H77o7FJMp42Ss4AI3lbN5m5Rtdgap4n/aHkRhZ6V/
         y/LmqfRpHC8drl+p21QuW6FRnrkwpuhmmB0x2vIs9Lmu/exfFK7ZhNU0Oi5bhEUAXhNd
         2eyQUyVrCyzEJwlAtBIb2F1N/+Ye0+NJKJ+Rf6KdYGblXOFj8i0xxXPaesfIWadiZFw6
         3nh3SIIJdZzKq7lQEq2llKAnyJgYeK1BDNrHNbQrRvDYF0YKG0sqtRKcUjjZKbUY4s3E
         DlonOlPLo6Gb2wDlx5nwxCZ4cpKuW3LlqtH/muG3d89fJ6Sy+/Y5jvSX9PEGDc/U/Ud6
         fnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146442; x=1795751242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+KYKIglFh//POKwGwtOiHFDzLYwRxyWG8VR6hZzeIs=;
        b=yOyWMS/duxtI1wUekmyOwlqmHZ6u51Wa+/7fQeW3i2tbrdVAg5tttT1sKKW1DUh9qi
         H5kiy1udPpN2LP7m3ioDIyrgFobXkNtxLVs1cJIlT1XOHjeUvT3OJF/hl2qO5U7yGQ6V
         EhwhSg0fwT3fS5cOgrp6exchwdPrpIQWAQG6dJoG3lnNV0SpAFYdNfy2/9oF9PCuC6Yn
         yaFpWX0KLbRNYMWKB+satoTl9025ks/bROrETBn/g2zLKttftkocGgVRS3lfrNWv6iB/
         O/2D08Yna7oVvWj2sUvC+ubA806blgHThA0pLurM5SC9i5Wroo71nUKwb41HsDKoi1iK
         srTw==
X-Forwarded-Encrypted: i=1; AL+hErE2trqPk/L9BBTXcUluBve/PtCUofzw3WT4giL/H/nRYKyppIvKgP8aJZQ2XbPV0SOHnaj9MCpQxkPNK4GRYnzw@lists.infradead.org
X-Gm-Message-State: APuU4Z+3rWjtPs6wPQvZI+MBILHcRi0PWbxaJXbKCR8C6znKQYB9+DnS
	cquWXWI8U/tAfMnLXUGpvTxAtqynTdbfR6uzap4j8TeTb6Tl2SWqx8ZqBSIZvpIZ7w==
X-Gm-Gg: AZFdTZeSazEzsgsY0Iv0hIFDeUp1SyFfUFTd4AgFl5+t/w9wce3aFNB6TC0mok0bGAr
	amoboLHWsCdeGlRTZujIfPXHrcST4dWajujzvJE0OBl5YAJQfQXRBEhqD1RIZpgGZlj/4epx5UO
	3qWB9+YdA7oRxy58DZjqm80vbyQePqq/jJrcKkj2PJIUXkIne9+n85IKIf5tNiFI1ceRyBefJBh
	BObjabp4ZVE3YTJX3v0ABvOMi7SxEdoJlk7WSzp9zANd8G5l/wHDkr9wukDdZlS331zwMi72Ts8
	e8pbhQ0gthmhviLIFrJkdNE8YInaiiwBJrJNyHd7OIAV1JpAzKHfqJyaATdEKFIrdFDQk00kPhk
	TBnudpblwlqcGRTAmimK3emLqKfwj9/i5nvzqV5eSwNQO25oiEmpy+XCyjlguZgaog9CGXBxenD
	WQ3m7JGCQCQmjxUwH4AOCywyqAbpuRes08RYt94Iln+tEzbLFjsVveXjNo29ZSGVBeTKftR8qDI
	liDqgTWBSQ8Ivm1KKz5U/qO2fG+K7qF6fTTJ3FE++V8PFWWkfDxByk4NfQUjdtRdLfOu3WYUrr4
	pGOFmsZF+JwBlQdtcy4Mqg/geDwW/JLKVHyaEMdvIAIKVoLeD8G8ahvJT/NqpRJwAPj/VK+vFIZ
	7jFb565ke9iyvvONzkg==
X-Received: by 2002:a17:90b:2c86:b0:3ac:9c37:9430 with SMTP id 98e67ed59e1d1-3b41c9b2bbfmr1458119a91.21.1795146441986;
        Thu, 19 Nov 2026 19:47:21 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:21 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 2/2] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Fri, 20 Nov 2026 10:47:01 +0700
Message-ID: <4af45df52cdd96da920bc36d29bc341615bbe95b.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795143925.git.jjc@jclark.com>
References: <cover.1795143925.git.jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_194723_136526_B795B4F4 
X-CRM114-Status: GOOD (  39.18  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add hardware-supported PTP_SYS_OFFSET_PRECISE to the CPTS driver for
TI K3 SoCs.

The system counter of these SoCs, the Global Timebase Counter (GTC),
can export one of its bits on a push event output, selected by the
PUSHEVT_EXPBIT_SEL field of GTC_CFG0_PUSHEVT. The Time Sync Router can
route that output to a CPTS hardware timestamp input. The CPTS then
timestamps rising edges that fall at known counter values (with bit b
selected, at k * 2^(b + 1) + 2^b), so each timestamp gives an exact
pair of PHC time and system counter value.

Implement getcrosststamp with these timestamps when the CPTS node has a
ti,gtc-push property. The property names the GTC CFG0 syscon and the
push input to which the router delivers the push event. The router is
set up separately, as it is for ti,pps. If the input is one of the extts
channels, that channel can no longer be enabled.

A push event timestamp contains just the PHC time, so the driver needs
to work out which GTC edge it corresponds to. The push input is
normally disabled. For each getcrosststamp request, the driver reads
the GTC, enables the input, reads the GTC again, waits for a push
event and then disables the input. The timestamp in that event must
correspond to the first edge after the earlier reading, provided that
edge is also after the later reading. If not, the driver retries. The
driver also has to detect a push event lost to an overflow of the CPTS
event FIFO. So it reads the GTC a third time when it takes the event
from the FIFO, and retries if that reading is a period or more after
the expected edge. After three failed attempts, the request fails with
-EBUSY.

Usually drivers capture the pair in the callback to
get_device_system_crosststamp(), but this works only when the capture
is fast, because the core calls the callback inside a timekeeper
seqcount loop and repeats it whenever the timekeeper is updated. So
this driver captures the pair before the call, and the callback just
returns it.

The choice of counter bit is a tradeoff: each attempt waits for half a
period on average; a longer period makes retries rarer but makes each
attempt longer. The driver uses bit 15, which at 200 MHz gives a period
of 328 us, chosen after testing a range of possible values. This is
sufficiently long to ensure each attempt fails rarely (0.2% to 0.9%
depending on CPU and memory load); failure of all three attempts
required extreme conditions (50 kHz extts flood with memory load).

The driver reads the GTC through the clocksource, which assumes that
the clocksource counter value equals the GTC count, that is a CNTVOFF
of 0. This holds on the tested boards. The cross-timestamp in
dwmac-socfpga makes the same assumption.

The timestamps are not corrected for the delay from the push output to
the CPTS latching the edge, estimated at about 11ns on a BeagleY-AI; the
driver similarly does not correct extts timestamps for their input
delay.

Tested on a BeagleY-AI (TI AM67A / J722S), on the MCU CPSW of a
BeagleBone AI-64 (TI TDA4VM / J721E) and on a BeaglePlay (TI AM625).

Signed-off-by: James Clark <jjc@jclark.com>
---
v2:
- Checked the EXPBIT_SEL read-back (Sashiko)
- Made a failed ti,gtc-push lookup a warning; the probe continues
  without PTP_SYS_OFFSET_PRECISE (Rob Herring)
- Added a wait after a FIFO pop before testing TS_PEND when arming, to
  comply with the TRM
- Zeroed the snapshot in the push event handler

 drivers/net/ethernet/ti/am65-cpts.c | 313 ++++++++++++++++++++++++++++
 1 file changed, 313 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpts.c b/drivers/net/ethernet/ti/am65-cpts.c
index 3ce3b2245efb..4987909d3bc2 100644
--- a/drivers/net/ethernet/ti/am65-cpts.c
+++ b/drivers/net/ethernet/ti/am65-cpts.c
@@ -5,11 +5,14 @@
  *
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/if_vlan.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/net_tstamp.h>
@@ -19,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/ptp_classify.h>
 #include <linux/ptp_clock_kernel.h>
+#include <linux/regmap.h>
 
 #include "am65-cpts.h"
 
@@ -128,6 +132,10 @@ struct am65_cpts_regs {
 #define AM65_CPTS_EVENT_2_REG_DOMAIN_MASK	(0xFF)
 #define AM65_CPTS_EVENT_2_REG_DOMAIN_SHIFT	(0)
 
+/* GTC_CFG0_PUSHEVT_REG */
+#define AM65_CPTS_GTC_PUSHEVT			0x8
+#define AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL	GENMASK(5, 0)
+
 enum {
 	AM65_CPTS_EV_PUSH,	/* Time Stamp Push Event */
 	AM65_CPTS_EV_ROLL,	/* Time Stamp Rollover Event */
@@ -152,6 +160,11 @@ struct am65_cpts_event {
 #define AM65_CPTS_EVENT_RX_TX_TIMEOUT	(20) /* ms */
 #define AM65_CPTS_SKB_TX_WORK_TIMEOUT	1 /* jiffies */
 #define AM65_CPTS_MIN_PPM		0x400
+#define AM65_CPTS_GTC_PUSH_BIT		15 /* 328 us period at 200 MHz */
+#define AM65_CPTS_GTC_PUSH_PERIOD	BIT_ULL(AM65_CPTS_GTC_PUSH_BIT + 1)
+#define AM65_CPTS_GTC_PUSH_TIMEOUT	(20) /* ms */
+#define AM65_CPTS_GTC_PUSH_TRIES	3
+#define AM65_CPTS_GTC_PUSH_DRAIN_PASSES	8
 
 struct am65_cpts {
 	struct device *dev;
@@ -186,6 +199,13 @@ struct am65_cpts {
 	bool pps_present;
 	u32 pps_hw_ts_idx;
 	u32 pps_genf_idx;
+	struct regmap *gtc;
+	u32 gtc_push_hw_idx;
+	u64 gtc_push_ts;
+	u64 gtc_push_cycles; /* the counter when the event was read */
+	bool gtc_push_armed;
+	wait_queue_head_t gtc_push_wq;
+	struct mutex gtc_push_lock; /* serialises crosststamp requests */
 	/* context save/restore */
 	u64 sr_cpts_ns;
 	u64 sr_ktime_ns;
@@ -290,6 +310,22 @@ static bool am65_cpts_fifo_pop_event(struct am65_cpts *cpts,
 	return true;
 }
 
+static void am65_cpts_gtc_push_event(struct am65_cpts *cpts,
+				     struct am65_cpts_event *event)
+{
+	/* an invalid snapshot leaves cycles at 0, which is before any edge */
+	struct system_time_snapshot snap = {};
+
+	/* keep the first event of a request; later edges are not used */
+	if (!cpts->gtc_push_armed)
+		return;
+	ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
+	cpts->gtc_push_ts = event->timestamp;
+	cpts->gtc_push_cycles = snap.cycles;
+	WRITE_ONCE(cpts->gtc_push_armed, false);
+	wake_up(&cpts->gtc_push_wq);
+}
+
 static int __am65_cpts_fifo_read(struct am65_cpts *cpts)
 {
 	struct ptp_clock_event pevent;
@@ -345,6 +381,11 @@ static int __am65_cpts_fifo_read(struct am65_cpts *cpts)
 			break;
 		case AM65_CPTS_EV_HW:
 			pevent.index = am65_cpts_event_get_port(event) - 1;
+			if (cpts->gtc &&
+			    pevent.index == cpts->gtc_push_hw_idx) {
+				am65_cpts_gtc_push_event(cpts, event);
+				break;
+			}
 			pevent.timestamp = event->timestamp;
 			if (cpts->pps_enabled && pevent.index == cpts->pps_hw_ts_idx) {
 				pevent.type = PTP_CLOCK_PPSUSR;
@@ -620,6 +661,9 @@ static int am65_cpts_extts_enable(struct am65_cpts *cpts, u32 index, int on)
 	if (cpts->pps_present && index == cpts->pps_hw_ts_idx)
 		return -EINVAL;
 
+	if (cpts->gtc && index == cpts->gtc_push_hw_idx)
+		return -EINVAL;
+
 	if (((cpts->hw_ts_enable & BIT(index)) >> index) == on)
 		return 0;
 
@@ -797,6 +841,243 @@ static int am65_cpts_ptp_enable(struct ptp_clock_info *ptp,
 	return -EOPNOTSUPP;
 }
 
+struct am65_cpts_gtc_push {
+	u64 ts;
+	u64 cycles;
+};
+
+/* the first rising edge of the exported bit after cycles */
+static u64 am65_cpts_gtc_push_next_edge(u64 cycles)
+{
+	u64 half = AM65_CPTS_GTC_PUSH_PERIOD / 2;
+
+	return round_down(cycles - half, AM65_CPTS_GTC_PUSH_PERIOD) + half +
+	       AM65_CPTS_GTC_PUSH_PERIOD;
+}
+
+static int am65_cpts_gtc_push_read(ktime_t *device,
+				   struct system_counterval_t *system,
+				   void *ctx)
+{
+	struct am65_cpts_gtc_push *push = ctx;
+
+	*device = ns_to_ktime(push->ts);
+	system->cycles = push->cycles;
+	system->cs_id = CSID_ARM_ARCH_COUNTER;
+	system->use_nsecs = false;
+
+	return 0;
+}
+
+/* select the counter bit the GTC exports on its push event output */
+static int am65_cpts_gtc_push_select(struct am65_cpts *cpts)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_update_bits(cpts->gtc, AM65_CPTS_GTC_PUSHEVT,
+				 AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL,
+				 FIELD_PREP(AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL,
+					    AM65_CPTS_GTC_PUSH_BIT));
+	if (ret)
+		return ret;
+	/*
+	 * Read the register back. This flushes the posted write before the
+	 * input is enabled, and checks that the selection took effect.
+	 */
+	ret = regmap_read(cpts->gtc, AM65_CPTS_GTC_PUSHEVT, &val);
+	if (ret)
+		return ret;
+	if (FIELD_GET(AM65_CPTS_GTC_PUSHEVT_EXPBIT_SEL, val) !=
+	    AM65_CPTS_GTC_PUSH_BIT)
+		return -EIO;
+	return 0;
+}
+
+/*
+ * Read the FIFO until it is empty, then accept the next push event. One
+ * __am65_cpts_fifo_read() takes at most AM65_CPTS_FIFO_DEPTH events, and after
+ * a burst of push edges (a request that wakes up late leaves the input enabled
+ * for many periods) more can be waiting. A push event left behind would be
+ * taken for the next attempt's. With the push input disabled no new push
+ * events arrive, so after enough passes every old one has been read even if
+ * packet events keep the FIFO busy. The lock is dropped between passes; a push
+ * event read meanwhile by the IRQ thread is ignored, as nothing is armed.
+ */
+static int am65_cpts_gtc_push_arm(struct am65_cpts *cpts)
+{
+	unsigned long flags;
+	int i;
+
+	for (i = 0; i < AM65_CPTS_GTC_PUSH_DRAIN_PASSES; i++) {
+		spin_lock_irqsave(&cpts->lock, flags);
+		__am65_cpts_fifo_read(cpts);
+		/*
+		 * TS_PEND is valid only once four CPTS_RFT_CLK periods plus
+		 * four CPPI_ICLK periods have passed since a pop. Read a
+		 * register so that the last pop has reached the CPTS, then
+		 * wait. 100 ns is enough for clocks of 80 MHz or more.
+		 */
+		am65_cpts_read32(cpts, intstat_raw);
+		ndelay(100);
+		if (!(am65_cpts_read32(cpts, intstat_raw) &
+		      AM65_CPTS_INTSTAT_RAW_TS_PEND)) {
+			cpts->gtc_push_armed = true;
+			spin_unlock_irqrestore(&cpts->lock, flags);
+			return 0;
+		}
+		spin_unlock_irqrestore(&cpts->lock, flags);
+	}
+	return -EBUSY;
+}
+
+static void am65_cpts_gtc_push_disarm(struct am65_cpts *cpts)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&cpts->lock, flags);
+	cpts->gtc_push_armed = false;
+	spin_unlock_irqrestore(&cpts->lock, flags);
+}
+
+/*
+ * Enable or disable the push input and read CONTROL back. After a disable,
+ * the read-back means no event of an edge captured before the disable
+ * reaches the FIFO after the next drain.
+ */
+static void am65_cpts_gtc_push_enable(struct am65_cpts *cpts, bool on)
+{
+	mutex_lock(&cpts->ptp_clk_lock);
+	am65_cpts_extts_enable_hw(cpts, cpts->gtc_push_hw_idx, on);
+	am65_cpts_read32(cpts, control);
+	mutex_unlock(&cpts->ptp_clk_lock);
+}
+
+/*
+ * Wait for the event of the edge at counter value edge. Returns -EAGAIN if no
+ * event arrives in time or the event may not be of that edge.
+ */
+static int am65_cpts_gtc_push_wait(struct am65_cpts *cpts, u64 edge,
+				   struct am65_cpts_gtc_push *push)
+{
+	unsigned long tmo = msecs_to_jiffies(AM65_CPTS_GTC_PUSH_TIMEOUT);
+	unsigned long flags;
+	u64 popped;
+
+	if (!wait_event_timeout(cpts->gtc_push_wq,
+				!READ_ONCE(cpts->gtc_push_armed), tmo)) {
+		dev_dbg(cpts->dev, "%s: no event for edge %llu\n",
+			__func__, edge);
+		return -EAGAIN;
+	}
+
+	/*
+	 * The event handler read the counter when it took the event from the
+	 * FIFO. The event of the edge cannot be taken before the edge. If it
+	 * was taken a period or more after the edge, the event may be of a
+	 * later edge: when the FIFO overruns, the CPTS loses events.
+	 */
+	spin_lock_irqsave(&cpts->lock, flags);
+	push->ts = cpts->gtc_push_ts;
+	popped = cpts->gtc_push_cycles;
+	spin_unlock_irqrestore(&cpts->lock, flags);
+	if ((s64)(popped - edge) < 0 ||
+	    (s64)(popped - edge) >= (s64)AM65_CPTS_GTC_PUSH_PERIOD) {
+		dev_dbg(cpts->dev, "%s: event read at %llu, edge %llu\n",
+			__func__, popped, edge);
+		return -EAGAIN;
+	}
+
+	push->cycles = edge;
+	return 0;
+}
+
+/*
+ * Make one attempt to capture a push event. Whatever the outcome, the input
+ * is left disabled and the request disarmed.
+ */
+static int am65_cpts_gtc_push_try(struct am65_cpts *cpts, clockid_t clock_id,
+				  struct system_time_snapshot *before,
+				  struct am65_cpts_gtc_push *push)
+{
+	struct system_time_snapshot after;
+	u64 edge;
+	int ret;
+
+	ret = am65_cpts_gtc_push_arm(cpts);
+	if (ret)
+		return ret;
+
+	/*
+	 * Read the counter before and after enabling the input. An edge at or
+	 * before the first read reaches the CPTS long before the enable does,
+	 * which needs a CONTROL read first. After the read-back of CONTROL the
+	 * input is enabled, so an edge after the second read is captured. If
+	 * no edge lies between the two reads, the first event is of the first
+	 * edge after the first read.
+	 */
+	ktime_get_snapshot_id(clock_id, before);
+	am65_cpts_gtc_push_enable(cpts, true);
+	ktime_get_snapshot_id(clock_id, &after);
+
+	if (!before->valid || !after.valid ||
+	    before->cs_id != CSID_ARM_ARCH_COUNTER ||
+	    after.cs_id != CSID_ARM_ARCH_COUNTER) {
+		ret = -ENODEV;
+		goto disable;
+	}
+
+	edge = am65_cpts_gtc_push_next_edge(before->cycles);
+	if (edge <= after.cycles) {
+		dev_dbg(cpts->dev, "%s: edge %llu during enable\n",
+			__func__, edge);
+		ret = -EAGAIN;
+		goto disable;
+	}
+
+	ret = am65_cpts_gtc_push_wait(cpts, edge, push);
+
+disable:
+	am65_cpts_gtc_push_enable(cpts, false);
+	am65_cpts_gtc_push_disarm(cpts);
+
+	return ret;
+}
+
+static int am65_cpts_ptp_getcrosststamp(struct ptp_clock_info *ptp,
+					struct system_device_crosststamp *cts)
+{
+	struct am65_cpts *cpts = container_of(ptp, struct am65_cpts, ptp_info);
+	struct system_time_snapshot before;
+	struct am65_cpts_gtc_push push;
+	int i, ret;
+
+	mutex_lock(&cpts->gtc_push_lock);
+
+	ret = am65_cpts_gtc_push_select(cpts);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < AM65_CPTS_GTC_PUSH_TRIES; i++) {
+		ret = am65_cpts_gtc_push_try(cpts, cts->clock_id, &before,
+					     &push);
+		if (ret != -EAGAIN)
+			break;
+	}
+	/* as other drivers do when a cross-timestamp cannot be had now */
+	if (ret == -EAGAIN)
+		ret = -EBUSY;
+	if (ret)
+		goto out;
+
+	/* before can serve as history_begin: the edge is after it */
+	ret = get_device_system_crosststamp(am65_cpts_gtc_push_read, &push,
+					    &before, cts);
+out:
+	mutex_unlock(&cpts->gtc_push_lock);
+	return ret;
+}
+
 static long am65_cpts_ts_work(struct ptp_clock_info *ptp);
 
 static struct ptp_clock_info am65_ptp_info = {
@@ -1154,6 +1435,7 @@ static int cpts_of_mux_clk_setup(struct am65_cpts *cpts,
 
 static int am65_cpts_of_parse(struct am65_cpts *cpts, struct device_node *node)
 {
+	struct regmap *gtc;
 	u32 prop[2];
 
 	if (!of_property_read_u32(node, "ti,cpts-ext-ts-inputs", &prop[0]))
@@ -1179,6 +1461,29 @@ static int am65_cpts_of_parse(struct am65_cpts *cpts, struct device_node *node)
 		}
 	}
 
+	if (of_property_present(node, "ti,gtc-push")) {
+		gtc = syscon_regmap_lookup_by_phandle_args(node, "ti,gtc-push",
+							   1, &prop[0]);
+		/*
+		 * Don't return -EPROBE_DEFER. The lookup returns it for a
+		 * phandle to a node that is not a syscon, and the probe
+		 * would then be deferred for ever.
+		 */
+		if (IS_ERR(gtc)) {
+			dev_warn(cpts->dev, "Failed to get GTC syscon: %pe\n",
+				 gtc);
+		} else if (prop[0] > 7 ||
+			   (cpts->pps_present &&
+			    prop[0] == cpts->pps_hw_ts_idx)) {
+			dev_err(cpts->dev,
+				"invalid GTC push HWx_TS_PUSH index: %u\n",
+				prop[0]);
+		} else {
+			cpts->gtc = gtc;
+			cpts->gtc_push_hw_idx = prop[0];
+		}
+	}
+
 	return cpts_of_mux_clk_setup(cpts, node);
 }
 
@@ -1215,11 +1520,13 @@ struct am65_cpts *am65_cpts_create(struct device *dev, void __iomem *regs,
 		return ERR_PTR(ret);
 
 	mutex_init(&cpts->ptp_clk_lock);
+	mutex_init(&cpts->gtc_push_lock);
 	INIT_LIST_HEAD(&cpts->events_tx);
 	INIT_LIST_HEAD(&cpts->events_rx);
 	INIT_LIST_HEAD(&cpts->pool);
 	spin_lock_init(&cpts->lock);
 	skb_queue_head_init(&cpts->txq);
+	init_waitqueue_head(&cpts->gtc_push_wq);
 
 	for (i = 0; i < AM65_CPTS_MAX_EVENTS; i++)
 		list_add(&cpts->pool_data[i].list, &cpts->pool);
@@ -1248,6 +1555,8 @@ struct am65_cpts *am65_cpts_create(struct device *dev, void __iomem *regs,
 		cpts->ptp_info.n_per_out = cpts->genf_num;
 	if (cpts->pps_present)
 		cpts->ptp_info.pps = 1;
+	if (cpts->gtc)
+		cpts->ptp_info.getcrosststamp = am65_cpts_ptp_getcrosststamp;
 
 	am65_cpts_set_add_val(cpts);
 
@@ -1295,6 +1604,10 @@ void am65_cpts_suspend(struct am65_cpts *cpts)
 {
 	/* save state and disable CPTS */
 	cpts->sr_control = am65_cpts_read32(cpts, control);
+	/* the GTC push input is enabled only during a request */
+	if (cpts->gtc)
+		cpts->sr_control &= ~BIT(AM65_CPTS_CONTROL_HW1_TS_PUSH_OFFSET +
+					 cpts->gtc_push_hw_idx);
 	cpts->sr_int_enable = am65_cpts_read32(cpts, int_enable);
 	cpts->sr_rftclk_sel = am65_cpts_read32(cpts, rftclk_sel);
 	cpts->sr_ts_ppm_hi = am65_cpts_read32(cpts, ts_ppm_hi);
-- 
2.56.0


