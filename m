Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A9A606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tOi5Exko;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMCp3BRU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8NvrWGProADlBL0hduI2bypI4c8PVT8WdHWktb2NGuo=; b=tOi5ExkoZ0ejMgFN3VVOzvkA3z
	4F93HqKWPOSApohTFwvoCw4rYbXsynne61g0xzIF9fyDWbtsC0+P9XFSyDiDPcFqcPrjR84ixKvuT
	EwSonKIrOtL+c7iTjSkzY47YeB6UXIxFjaPaWV+ZhxP99EBUqAzsUIenJdVx+r6h1MDmi/T4eXHxX
	SkNaVyKIjfXQvGQobRt/0XMoVnJWyKK3Q2mQLzZTXOmHtS3P1g8JNgZf2XCSvnD5ryfx+KjRkz3tv
	9E9iD+PgniF6GcVAKwCeUwbKBjXEMHC7ZRgCe8gw8lMdez9TQj5u2HuWuIxUdKpF4b0mHyUJww2+D
	33icV6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKcq-000000002MQ-0MnW;
	Mon, 09 Nov 2026 08:21:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKcp-000000002M6-2RZA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:21:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FBC840F86;
	Mon,  9 Nov 2026 08:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9E91F0089F;
	Mon,  9 Nov 2026 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794212470;
	bh=8NvrWGProADlBL0hduI2bypI4c8PVT8WdHWktb2NGuo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lMCp3BRUqUrrj+jb5Q2NHm0QikcHJ4w3URKUiP6Q/4drqvgvXbFytXTMJfIlZhPGR
	 NOfNOf9VychSzn1U63DPpe8iw8i89X2DUZxd3kiG6pGogMFwlmOj2R8lpqRwTEqKJ7
	 gt46qs47liLJOHiXfN+oza+bJUbXVHNb4L1QAyRx0A0DIdtttSkpCHQbiKrUJb2yyn
	 leQvIk+1vOxwfDyP/u8gJBZEetgM2klT3RKravPHAEu3R03ttCnFnAUjqP3KpiOQqR
	 XWQs3n2xqFi/0ndlLKwu5dCelovgiywTFbJKvSdyxfsuoXP0a1y3IKybtsNnnE1UFx
	 b5+QohUMn4ssA==
Subject: Re: [PATCH net v2] net: ti: icss-iep: fix deadlock when disabling PPS
From: netdev-bot+sashiko@kernel.org
To: hj351016@gmail.com
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 09 Nov 2026 08:21:09 +0000
Message-ID: <179421246928.994134.4691531527341185507@kernel.org>
In-Reply-To: <20261108074733.248784-1-hj351016@gmail.com>
References: <20261108074733.248784-1-hj351016@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch moves cancel_work_sync(&iep->work) in
  icss_iep_pps_enable() out from under ptp_clk_mutex.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is a use-
  after-free / NULL dereference in the teardown path that the new guard…

--

net: ti: icss-iep: fix deadlock when disabling PPS

This patch changes icss_iep_pps_enable() so that cancel_work_sync(&iep->work)
runs after ptp_clk_mutex is dropped. This avoids a deadlock with
icss_iep_cap_cmp_work(), which takes the same mutex. It also makes
icss_iep_cap_cmp_work() return early when neither pps_enabled nor
perout_enabled is set.

> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index ec085897edf09..3b2a88c2dad88 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -534,6 +534,17 @@ static void icss_iep_cap_cmp_work(struct work_struct *work)
>  
>  	mutex_lock(&iep->ptp_clk_mutex);
>  
> +	/*
> +	 * PPS/perout may have been disabled (and the compare hardware
> +	 * cleared) while this work was queued or waiting for the mutex.
> +	 * Bail out rather than re-arm CMP1 and emit a stale PPS event once
> +	 * the event source is gone.
> +	 */
> +	if (!iep->pps_enabled && !iep->perout_enabled) {
> +		mutex_unlock(&iep->ptp_clk_mutex);
> +		return;
> +	}

[Severity: High]
This is a pre-existing issue, but does this check cover teardown when perout
is enabled instead of PPS?

icss_iep_exit() unregisters the ptp clock before it disables perout:

icss_iep_exit() {
	if (iep->ptp_clock) {
		ptp_clock_unregister(iep->ptp_clock);
		iep->ptp_clock = NULL;
	}
	icss_iep_disable(iep);

	if (iep->pps_enabled)
		icss_iep_pps_enable(iep, false);
	else if (iep->perout_enabled)
		icss_iep_perout_enable(iep, NULL, false);
	...
}

Inside ptp_clock_unregister(), ptp_disable_all_events() only sends
PTP_CLK_REQ_PPS. icss_iep_pps_enable(off) then returns -EBUSY because
perout_enabled is set. So CMP1 stays armed and the work is never drained.

ptp_clock_unregister() then unregisters ptp->pps_source and calls
put_device() on the ptp device, which can free the ptp clock. After that,
iep->ptp_clock is set to NULL without holding ptp_clk_mutex.

Later, icss_iep_perout_enable(iep, NULL, false) clears perout_enabled. It
never calls cancel_work_sync().

During this window icss_iep_cap_cmp_irq() can still queue the work.
icss_iep_cap_cmp_work() gets past the new check because perout_enabled is
still 1, and then reaches:

	ptp_clock_event(iep->ptp_clock, &pevent);

For PTP_CLOCK_PPSUSR, ptp_clock_event() calls pps_event(ptp->pps_source, ...)
without a NULL check. Can this touch a freed pps_source or ptp clock, or
dereference a NULL iep->ptp_clock?

On am654 with icssg_prueth (clockops perout_enable), this looks reachable.
Enable perout with PTP_PEROUT_REQUEST, then bring the interface down, which
goes through prueth_emac_common_stop()->icss_iep_exit().

[ ... ]

> @@ -607,7 +619,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
>  	} else {
>  		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
>  		if (iep->cap_cmp_irq)
> -			cancel_work_sync(&iep->work);
> +			drain_work = true;
>  	}
>  
>  	if (!ret)
> @@ -616,6 +628,15 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
>  exit:
>  	mutex_unlock(&iep->ptp_clk_mutex);
>  
> +	/*
> +	 * Drain the capture-compare work only after dropping ptp_clk_mutex.
> +	 * icss_iep_cap_cmp_work() takes ptp_clk_mutex itself, so cancelling it
> +	 * under the mutex deadlocks against a handler instance already running
> +	 * and waiting for that same mutex.
> +	 */
> +	if (drain_work)
> +		cancel_work_sync(&iep->work);

[Severity: Medium]
Now that the drain runs outside ptp_clk_mutex, is the disable still ordered
before a following PPS or perout enable?

The chardev ioctls hold ptp->pincfg_mux around ops->enable(). In
drivers/ptp/ptp_sysfs.c, pps_enable_store() and period_store() call
ops->enable() without it. That means a second writer can take ptp_clk_mutex
between the mutex_unlock() and the cancel_work_sync() above:

CPU1                                  CPU2
icss_iep_pps_enable(iep, 0)
  icss_iep_perout_enable_hw(off)
  iep->pps_enabled = 0
  mutex_unlock()
                                      icss_iep_pps_enable(iep, 1)
                                        icss_iep_perout_enable_hw(on)
                                        iep->pps_enabled = 1
                                        mutex_unlock()
  cancel_work_sync(&iep->work)

Two outcomes look possible.

In the first, a stale work item from the old session gets the mutex after
CPU2. It may have been queued by a CMP1 IRQ just before the disable, or it
may already be waiting in mutex_lock(). The new check in
icss_iep_cap_cmp_work() only looks at the flags, so the item gets through.
It reads the new start value that icss_iep_update_to_next_boundary() wrote to
CMP1. It writes start + iep->period back, then reports a PPSUSR event for an
edge that has not happened yet.

Would the first pulse of the new session be skipped, with a bogus timestamp
sent to userspace?

In the second, CPU1 is delayed until the new session's first CMP1 match.
icss_iep_cap_cmp_irq() queues the new session's work, and CPU1's late
cancel_work_sync() removes it before it runs.

In the non-clockops path, this work is the only code that advances CMP1 by
iep->period. icssg_prueth_sr1 is one example, since it calls
icss_iep_init(iep, NULL, NULL, 0).

Could PPS stop for good here while pps_enabled is still true?

Before this patch, ptp_clk_mutex serialized the disable, the drain and the
next enable.

> +
>  	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108074733.248784-1-hj351016%40gmail.com

