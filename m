Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76045606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xoxx+oy0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xz1502gH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JKSjiFFNXoaRnbhFm/6WIkvX9c59tRmnSx3Vjc7t68U=; b=Xoxx+oy0RBhx/O
	4y1Q8x70bvFoK3alB/zv2nl3FUc3sm7V8kuBfKE1Fpvd59F6H7oAp95iwNCM8ONsxLVt6mR7OuBIG
	yy2s4FuqTlihEHbzsX0021VOxOdPdxHT/PV3iD+ZlqrEiKERAi46nRqwl5xLM5+83MAQgmAdDrFL9
	MU5hGLcDZv9hQjvjEFriwpL6tdHmMW/JsVJin1szMH8CGNV94rPB09WHlrZTV1vnBolv0BH9C7yx/
	Gcdz/NQomqffr6AR40JFxLXhtlLnM4Y8ZjLQpKhIc+dj256UEW26+iAb1aqY3zJ6zp5S1KMlpPjFo
	iBVhbGH0rz+2OMmEZJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxdN-0000000Fp7O-196N;
	Sun, 08 Nov 2026 07:48:13 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPxdK-0000000Fp6x-3DPx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 07:48:12 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1093567eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124090; x=1794728890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKSjiFFNXoaRnbhFm/6WIkvX9c59tRmnSx3Vjc7t68U=;
        b=Xz1502gHEO0yJ7Xk8L8ai/Lno2MGgqj8fx4BwwasvdteQYEMB/S6638cu8vDRo1bGr
         rg74ZXjLi4Ja5yyQzyElfYVHy63YnXUvPDwb8icx+uX+TQPPFBkMF5rKQ67NfBl5kAxQ
         Ook8MPfpGHt379a354yQJh/600g41TfbTq/bsV9ioDn0YZzc9xfBpjmYiOylQy2baTeu
         ttl95ywPq85r9HFSNFihFdVbMDAc7+b/Km58UvYsaa2Lq14pAv8BbRXl/zgIh4wG4VuN
         uZHmuIY4IZsviYbHYh/Fu0BMxT87ZWHjfKrPR/2sU+wYgsiOvoPTmzrEt0x7sqJ6u6HE
         qZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124090; x=1794728890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKSjiFFNXoaRnbhFm/6WIkvX9c59tRmnSx3Vjc7t68U=;
        b=pmZ8SoyaaEToHhNz77VMz+9XZaHxqs93x6cwm1NaaiqWfc70UoV+7Wt0NdlzwB5F4X
         H1t17yriEccPpWwocTZdwIANdVZYA6vKXdmGRps7k1c3NzmlsTOgAnnG4YyQP2upuK0E
         jL/z/XIxQJZCNeDJya5onbztmy/t0v1U19lRV5fn1sxQStKH33U8fxiGOha+MOkrDTAC
         DQl9Y+jamiMq8OTvFB4XeIMTInNydBJgiSdWyKtHFHvDO6euRDD+tNDE26+SLGTi183Q
         m2kYVLXR7Oj4poztyA0D7sAp1FWREJuGGQbNqWSnqTBwOn+tJ+pMbXVR86yuz2o92WbT
         Udjg==
X-Forwarded-Encrypted: i=1; AL+hErFY6qHsTJayVJTDVJTz8xQV/PyzKRjxD2kQanmiV6I8PIWV4vpLfcAwdNOuxOB54gA/9VjEcs1s0sGMcDIg+Ln1@lists.infradead.org
X-Gm-Message-State: APuU4Z+zF4+9hkVFxwphBWuxFFPNeDHhctBBGiwGkzvHPihpqzs+ph7I
	X92KHiC/E22NHgXGXavdkcmLkg3k74cRbPvLARZPExAbILwDd+lEvoW8
X-Gm-Gg: AYBFou1eRlv+quQhtBjb6i+IDk2dRqQCnsyZpvmAJGKFMssJ4YRtf90xQxQiQbEwgCB
	qzAr+axLegitIxvAuvLLsHx0E8zInJD0KUN+SNnk0lTe4qQOveNV9fFZl2K+qHdcUCE828CJ8Jq
	UXIOnid9pi/3rMMzfOBmRWgmCOQI7u8tSBlFJRqu2M2ccTBl63zMehOnY+lL0G8u4iGPC7qrABZ
	Sflk/yZphZRzQOpCjeUyppfgbWGwR1zQOJCj/JTUchZXnwVRfXpPjVh8pTRRENSczj8mni6neoX
	7l1Acovlvz6d2HXDzZJa/IcWyq4snsUjDsRS+bdaYs3x7V2s3wY5yupJju4N4OySf7UOi2+PnOy
	DR2JTFN2JfQvxFJzjFINFOEyXTnZOqeiywJ5nyj5lsO8yfJyVP+NQMuQgnRJU1jMuF1hVmdzvD+
	aBuqnT8jtC3UuhZvPy3qwST6gtwmXATiOOwYm5uJNmL/a7erDCsInh5MTPZlxIkh4o0x2TSs6KY
	Vu7Cygz1ZWRh5Jbbg8KjH7IvCHYUOenuicvmEvQtahpV7oyWmPkzM0RapIbJ7K6jXgYoNL5L0UQ
	lv54ZrAHEMi+YWWuWLK/IYTBNZpq16Y1l1SHkYewyvKedTkP
X-Received: by 2002:a05:693c:65c6:b0:36e:53bc:4681 with SMTP id 5a478bee46e88-372569fae2emr2198944eec.37.1794124089700;
        Sat, 07 Nov 2026 23:48:09 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm3795527eec.4.2026.11.07.23.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:48:09 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH net v2] net: ti: icss-iep: fix deadlock when disabling PPS
Date: Sun,  8 Nov 2026 16:47:33 +0900
Message-ID: <20261108074733.248784-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107063726.3388730-1-hj351016@gmail.com>
References: <20261107063726.3388730-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_234810_817690_30111FF7 
X-CRM114-Status: GOOD (  21.31  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

icss_iep_pps_enable() holds iep->ptp_clk_mutex across the whole function.
When PPS is being disabled it calls cancel_work_sync(&iep->work) while that
mutex is still held.

The work handler, icss_iep_cap_cmp_work(), acquires iep->ptp_clk_mutex at
its start. The capture-compare IRQ (icss_iep_cap_cmp_irq) schedules this
work on every CMP1 event while PPS is enabled, so a handler instance can be
running when userspace disables PPS. In that case cancel_work_sync() blocks
waiting for the handler to finish while holding ptp_clk_mutex, and the
handler blocks trying to acquire the same ptp_clk_mutex -> deadlock.
lockdep would report this as a possible circular locking dependency
between the work and ptp_clk_mutex.

Unlike a teardown path, the capture-compare IRQ is not disabled here, so
the race is reachable at runtime simply by toggling PPS off while the
hardware is generating CMP events.

Drain the work only after dropping ptp_clk_mutex, so the disable path no
longer waits for the handler while holding the lock the handler needs.

Dropping the mutex before the drain means a work item that was already
queued (or an IRQ latched just before the compare was disabled) can still
run icss_iep_cap_cmp_work() after PPS/perout has been turned off. Guard the
handler so it returns early, under the mutex, when neither pps_enabled nor
perout_enabled is set, instead of re-arming CMP1 and emitting a stale PPS
event once the event source is gone.

This was found by a static analysis tool -- an in-house shape/pattern
checker that flags cancel_work_sync() calls made while holding a lock the
cancelled work's handler also acquires -- and confirmed by manual review
of the PPS enable/disable path. It was not tested on real hardware: I do
not have a TI ICSSG/PRU (AM65x-family) device, so the deadlock and the
late-work window are established by code inspection rather than an observed
lockdep or KASAN trace.

Fixes: f18ad402cd8b ("net: ti: icss-iep: Enable compare events")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Guard icss_iep_cap_cmp_work() to return early, under ptp_clk_mutex, when
   PPS/perout is disabled, so a work item that runs after the mutex is
   dropped no longer re-arms the compare or emits a stale PPS event
   (addresses the late-work windows raised in review of v1).
 - Soften "lockdep reports" -> "lockdep would report" (not an observed
   trace).
 - Record discovery (static analysis + manual inspection) and that the
   change was not tested on real hardware in the commit message, as
   requested by the netdev commit-message bot.

v1: https://lore.kernel.org/netdev/20261107063726.3388730-1-hj351016@gmail.com/
 drivers/net/ethernet/ti/icssg/icss_iep.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
index ec08589..3b2a88c 100644
--- a/drivers/net/ethernet/ti/icssg/icss_iep.c
+++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
@@ -534,6 +534,17 @@ static void icss_iep_cap_cmp_work(struct work_struct *work)
 
 	mutex_lock(&iep->ptp_clk_mutex);
 
+	/*
+	 * PPS/perout may have been disabled (and the compare hardware
+	 * cleared) while this work was queued or waiting for the mutex.
+	 * Bail out rather than re-arm CMP1 and emit a stale PPS event once
+	 * the event source is gone.
+	 */
+	if (!iep->pps_enabled && !iep->perout_enabled) {
+		mutex_unlock(&iep->ptp_clk_mutex);
+		return;
+	}
+
 	ns = readl(iep->base + reg_offs[ICSS_IEP_CMP1_REG0]);
 	if (iep->plat_data->flags & ICSS_IEP_64BIT_COUNTER_SUPPORT) {
 		val = readl(iep->base + reg_offs[ICSS_IEP_CMP1_REG1]);
@@ -579,6 +590,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 {
 	struct ptp_clock_request rq;
 	struct timespec64 ts;
+	bool drain_work = false;
 	int ret = 0;
 	u64 ns;
 
@@ -607,7 +619,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 	} else {
 		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
 		if (iep->cap_cmp_irq)
-			cancel_work_sync(&iep->work);
+			drain_work = true;
 	}
 
 	if (!ret)
@@ -616,6 +628,15 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
 exit:
 	mutex_unlock(&iep->ptp_clk_mutex);
 
+	/*
+	 * Drain the capture-compare work only after dropping ptp_clk_mutex.
+	 * icss_iep_cap_cmp_work() takes ptp_clk_mutex itself, so cancelling it
+	 * under the mutex deadlocks against a handler instance already running
+	 * and waiting for that same mutex.
+	 */
+	if (drain_work)
+		cancel_work_sync(&iep->work);
+
 	return ret;
 }
 
-- 
2.43.0


