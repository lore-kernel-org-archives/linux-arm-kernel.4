Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22B606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 00:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3wQ6vLxq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=avZhRNI5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D1+tVSm1qhzptOtsD3lZvZFdxkj7JSvU6JS3HDPRTBw=; b=3wQ6vLxqwu3XXPeKN5YwGYJWZR
	6iqcxEqx4FrN0QP6zc8kjaMpLDEVswf78kOC5iMd+/ZztsWyKZs6X372+N+dM/IKWrB7dtbmUk9hi
	JRjvXUSKUiFlH/0rTZYS9yqLnVwzEaHlR0mm/2AA2OXI10nIN/sF/cFIMpkBkYknzDJNHm8kuzbWa
	k2FVtCSGReQuatzqOhl+M923Jr+JF9Cu7qhobFmuuOtxBZv2a0fOEkuApymbnARiDVkChsrPkx9sn
	/EVTeb69eJnk3+G4+KW5StJqUpYvI4KeEbn5VOzyMgS9lHH1IiKd1GTvFn3pDf2Ga1cOpacLKCJyu
	85AZowFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkXL-00000000mrI-3RjM;
	Mon, 16 Nov 2026 00:25:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSkX2-00000000mWi-1RId;
	Mon, 16 Nov 2026 00:25:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11B6F45A3C;
	Mon, 16 Nov 2026 00:25:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794788712;
	b=r0qaZeK9kDSZrnFlDUA4fEJkb7V9eCk7kNMropXbxdJWMu8iVtqb4X+0s79bGjUjh9mB
	 3kqyF9NsvJy+bUKm/hDmZO+3SehX887GkIhJWI6t0V2w5E4Yjec2hcW8Las8FJ2DkXxG+
	 OClhjNiA2wD890SmXAe2wrQk7pCknb7pyspryyavJV9IHehRxJob5czqjEJ14Rdp0oMbX
	 iWjm1EZNuiSujd9kCIeU8OAONQT2H1gbPvZhvI7AxMf9jmP1iRnB6pVzjGPBxlIxEaHT3
	 qEdS60TmGtiUEtRXc9V19ny5Z5xjDo42wFi5GKVoOek8jdJnEsQxkQlWkRxlIcVYdOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794788712;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=D1+tVSm1qhzptOtsD3lZvZFdxkj7JSvU6JS3HDPRTBw=;
	b=DcWBRcAY7f7wUFyQC/WApWcWnFg8zi+KiZYMwtqWm7zoeTgEuxyqsAVYe89mbf2fTFrB
	 Hy9xODpyE4cj5blD3Z0GNvoJbSgN7kKgShfN/VU4MO6Xl8Z6XvF00KMPgWUC4PcZ+HbmB
	 maxN8/d9kehDcHyv3Nq35uOwwI++upQxuIARc5uzWLxeuC705Hs3V1i9WnM9FeQ0j7k1H
	 nwmyZQvFXTHwV8Nvk1cb4MNV0x5yY9DKmDnz9jlnke2UN8I/hSzj16LhOD1iS4A/K7Rlu
	 DuVnoHO7LUwlM0dQc56x2G8qq8QXDGXQkJd/u/9RrLZ5UVgKNc7JEtBYeLUzI5rvAzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AFAA1F000C7;
	Mon, 16 Nov 2026 00:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794788711;
	bh=D1+tVSm1qhzptOtsD3lZvZFdxkj7JSvU6JS3HDPRTBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=avZhRNI5bahCEhz2UwTj5xXCdJKeDx/zvZNBfWiKwd6iN7LvwrFCPhCBKOnGqpeln
	 K2n2Cb0V1mJBVmcXULZM0Z4GI0m06vpLp9MR0EXA3oio/pm/nCxQb1cPGCGfvsDR/p
	 E+VZnwYNW4gPE+8wdWpXca8hYg3bGmFj+8qoBb1EDNXcbWgMKN2Q0ysdVshaCMeJkp
	 Exbo7hobycR+8Zz4z/y8o16E57Dmwu2RGiU7eXEoelwYbwf1OpTdOoSHJtJlZrO6d0
	 /lHqPs81Gn8F3Ut2uuMaVzo4lKijlQCJgl6aM2px6OlIfHSqfSScggdo36/yCNqlgu
	 V99fuzNLaALNg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF6214A29B;
	Mon, 16 Nov 2026 00:25:08 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 16 Nov 2026 00:25:02 +0000
Subject: [PATCH v2 3/8] alarmtimer: Replace the freezer delta with per type
 expiry times
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-b4-alarmtimer-rtc-priority-v2-3-b2c69721e489@iav.lv>
References: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
In-Reply-To: <20261116-b4-alarmtimer-rtc-priority-v2-0-b2c69721e489@iav.lv>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5429; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=0OTcofvxPwIQxlh2z7uyMWINjUjoJiPHkccA7c5PNEw=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFm/fBM6eAw9ljgnNAeaRp1Ktrl5/6jbmqBLfya7Mucvn
 R7//+HnjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjARLwOG//lv/Qx9lhx9orpP
 /cxRW9uaxUfs7Dcy2rVt+2TRHjxj+1WG/6E/X8zy9g03UVeITMvlUWQ8997ONOOewvU7Bfub7r3
 r5gcA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

When the freezer interrupts an alarm clock_nanosleep(),
alarmtimer_freezerset() records the remaining time, the expiry and the
alarm type and keeps the call with the least remaining time.
alarmtimer_suspend() starts its scan with that.

The remaining time is computed when the task is frozen, so it is stale
when the system suspends, and a clock_settime() in between is not taken
into account for REALTIME. A remaining time of exactly 0 counts as no
timer.

Record the earliest expiry per alarm type instead, KTIME_MAX for none, and
compare it with the queue head of its base in alarmtimer_suspend(), so the
remaining time is computed when it is used. The scan also takes KTIME_MAX
instead of 0 as no timer.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Unlike your sketch and what I wrote, this keeps the frozen expiry per
type and compares it with the queue head in the suspend scan instead of
queueing alarms: such an alarm would exist only to be read back, and if
it fires in between, alarmtimer_fired() drops it and suspend proceeds
without the wakeup. A version with alarms came out 44 lines longer.
---
 kernel/time/alarmtimer.c | 75 ++++++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 47 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index 35630f0ff566..066d980fa6d5 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -54,22 +54,20 @@ static struct alarm_base {
  * struct rtc_wakeup - State for waking the system from suspend on alarms
  * @rtc:		RTC programmed on suspend, NULL if none
  * @timer:		RTC timer started on suspend
- * @freezer_delta:	Least remaining time of the clock_nanosleep() calls
- *			which the freezer interrupted, 0 if none
- * @freezer_expires:	Expiry of that call
- * @freezer_type:	Alarm type of that call
+ * @freezer_expires:	Earliest expiry per alarm type of the clock_nanosleep()
+ *			calls which the freezer interrupted, KTIME_MAX if none
  */
 struct rtc_wakeup {
 	struct rtc_device	*rtc;
 	struct rtc_timer	timer;
-	ktime_t			freezer_delta;
-	ktime_t			freezer_expires;
-	enum alarmtimer_type	freezer_type;
+	ktime_t			freezer_expires[ALARM_NUMTYPE];
 };
 
-static struct rtc_wakeup wakeup_ctl;
+static struct rtc_wakeup wakeup_ctl = {
+	.freezer_expires = { [0 ... ALARM_NUMTYPE - 1] = KTIME_MAX },
+};
 
-static DEFINE_SPINLOCK(freezer_delta_lock);
+static DEFINE_SPINLOCK(freezer_lock);
 #endif
 
 #ifdef CONFIG_RTC_CLASS
@@ -221,28 +219,22 @@ EXPORT_SYMBOL_GPL(alarm_expires_remaining);
  */
 static int alarmtimer_suspend(struct device *dev)
 {
-	ktime_t min, now, expires;
+	ktime_t min = KTIME_MAX, expires = 0, now;
 	struct rtc_device *rtc;
+	int i, ret, type = 0;
 	struct rtc_time tm;
-	int i, ret, type;
-
-	scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
-		min = wakeup_ctl.freezer_delta;
-		expires = wakeup_ctl.freezer_expires;
-		type = wakeup_ctl.freezer_type;
-		wakeup_ctl.freezer_delta = 0;
-	}
 
 	rtc = READ_ONCE(wakeup_ctl.rtc);
 	/* If we have no rtcdev, just return */
 	if (!rtc)
 		return 0;
 
-	/* Find the soonest timer to expire */
+	/* Find the soonest timer to expire, frozen clock_nanosleep() included */
 	for (i = 0; i < ALARM_NUMTYPE; i++) {
 		struct alarm_base *base = &alarm_bases[i];
+		ktime_t next_expires = KTIME_MAX;
 		struct timerqueue_node *next;
-		ktime_t next_expires;
+		int next_type = i;
 		ktime_t delta;
 
 		scoped_guard(spinlock_irqsave, &base->lock) {
@@ -250,16 +242,24 @@ static int alarmtimer_suspend(struct device *dev)
 			if (next)
 				next_expires = next->expires;
 		}
-		if (!next)
+		scoped_guard(spinlock_irqsave, &freezer_lock) {
+			if (wakeup_ctl.freezer_expires[i] < next_expires) {
+				next_expires = wakeup_ctl.freezer_expires[i];
+				next_type = i == ALARM_REALTIME ?
+					    ALARM_REALTIME_FREEZER : ALARM_BOOTTIME_FREEZER;
+			}
+			wakeup_ctl.freezer_expires[i] = KTIME_MAX;
+		}
+		if (next_expires == KTIME_MAX)
 			continue;
 		delta = ktime_sub(next_expires, base->get_ktime());
-		if (!min || (delta < min)) {
+		if (delta < min) {
 			expires = next_expires;
 			min = delta;
-			type = i;
+			type = next_type;
 		}
 	}
-	if (min == 0)
+	if (min == KTIME_MAX)
 		return 0;
 
 	if (ktime_to_ns(min) < 2 * NSEC_PER_SEC) {
@@ -454,31 +454,12 @@ EXPORT_SYMBOL_GPL(alarm_forward_now);
 
 static void alarmtimer_freezerset(ktime_t absexp, enum alarmtimer_type type)
 {
-	struct alarm_base *base;
-	ktime_t delta;
-
-	switch(type) {
-	case ALARM_REALTIME:
-		base = &alarm_bases[ALARM_REALTIME];
-		type = ALARM_REALTIME_FREEZER;
-		break;
-	case ALARM_BOOTTIME:
-		base = &alarm_bases[ALARM_BOOTTIME];
-		type = ALARM_BOOTTIME_FREEZER;
-		break;
-	default:
-		WARN_ONCE(1, "Invalid alarm type: %d\n", type);
+	if (WARN_ONCE(type >= ALARM_NUMTYPE, "Invalid alarm type: %d\n", type))
 		return;
-	}
 
-	delta = ktime_sub(absexp, base->get_ktime());
-
-	guard(spinlock_irqsave)(&freezer_delta_lock);
-	if (!wakeup_ctl.freezer_delta || (delta < wakeup_ctl.freezer_delta)) {
-		wakeup_ctl.freezer_delta = delta;
-		wakeup_ctl.freezer_expires = absexp;
-		wakeup_ctl.freezer_type = type;
-	}
+	guard(spinlock_irqsave)(&freezer_lock);
+	if (absexp < wakeup_ctl.freezer_expires[type])
+		wakeup_ctl.freezer_expires[type] = absexp;
 }
 
 /**

-- 
2.43.0



