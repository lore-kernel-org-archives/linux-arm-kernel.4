Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE8A606D808
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 06:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FMmQCs7H;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=neLHx5rF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vva7iXLKmqzxW6bOy9Y/PVkyCGWqTmEYhH94TgnKVwQ=; b=FMmQCs7HKfGs+Z6AUF/f3sVMNX
	OIrO8RR0S5eHJzVpJjyUOr/dMML8asWMbyrhojExLEg294uNyfzWsuMh/lA1Us2Lier0NfWKxKoJF
	sEDFeJSf2+ecVN9joGppWb9bJqxohAoEoRTX4FUTL0gTOyJv+jWiJrIobrVR3SrTpaTY29/Z8UpZu
	ARxKmpXq/cMwyIZf9gUNUcReYCXga7q3XO/ZYBg9hwkhwTEKel47KSZlMUNQ2hhiGtu5T6ACNfdZy
	YIypdGMf8QKchA6utGeUw/TnekNSa/O2fQJTU2yDhQ/n+FDJe7CuFRilpHlhxwAYtfaeMloJHVwWJ
	KN2kbkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwsJ-0000000Fj6k-0jXr;
	Sun, 08 Nov 2026 06:59:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwsH-0000000Fj6e-2JPg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 06:59:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D773940236;
	Sun,  8 Nov 2026 06:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A22F1F008A6;
	Sun,  8 Nov 2026 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794121171;
	bh=vva7iXLKmqzxW6bOy9Y/PVkyCGWqTmEYhH94TgnKVwQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=neLHx5rFirJcj1fN5b+9sWjkf513iEWsGo4ex/spWYT3B41qzfbmTqcTcwAtFDRvJ
	 3iHTMYTIq8SA1h5Fu+J/ck1GR52vLyI8SCHOUhVjDpvLw4owvhyfnYyeXvE8a0xTII
	 MkLhvMA1Y3wRfYvXz3BJH/8vxfcDSZYI/JQUaBR0AlFtyV7pIu4pLwa6moJ2dqw8g5
	 SJ1hQlGa6djQmBFbAboxMSZZqqaELyRim3Ge2nGsoaHLkBcYxEY5kFziPq7R0OgTU9
	 +JM76HfSH82JkhMjhKSm+FDgz4JFb5qr4t8mgPWkNstBO7ALbSrM5TpjxUl9GnkHxF
	 GSALqTtGtCK8Q==
Subject: Re: [PATCH net] net: ti: icss-iep: fix deadlock when disabling PPS
From: netdev-bot+sashiko@kernel.org
To: hj351016@gmail.com
Cc: danishanwar@ti.com, rogerq@kernel.org, netdev@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 08 Nov 2026 06:59:30 +0000
Message-ID: <179412117075.994134.3223982666310946745@kernel.org>
In-Reply-To: <20261107063726.3388730-1-hj351016@gmail.com>
References: <20261107063726.3388730-1-hj351016@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch moves cancel_work_sync(&iep->work) out of the
  ptp_clk_mutex critical section in icss_iep_pps_enable()…
- [Medium] After the patch, an icss_iep_cap_cmp_work() instance can run
  after icss_iep_pps_enable(0) has disabled and cleared the compare…
- [Medium] The commit message says that because the compare is disabled
  before the drain, 'no new work can be scheduled once the mutex is…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the shared
  iep->work is never drained when periodic output (perout) is disabled,…

--

net: ti: icss-iep: fix deadlock when disabling PPS

This commit moves cancel_work_sync(&iep->work) in icss_iep_pps_enable()
out of the ptp_clk_mutex critical section. The PPS disable path then no
longer waits for icss_iep_cap_cmp_work() while it holds the mutex that the
work handler needs.

> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index ec085897edf09..6264061a4eab3 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c

[ ... ]

> @@ -607,7 +608,7 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
>  	} else {
>  		ret = icss_iep_perout_enable_hw(iep, &rq.perout, on);
>  		if (iep->cap_cmp_irq)
> -			cancel_work_sync(&iep->work);
> +			drain_work = true;
>  	}
>  
>  	if (!ret)
> @@ -616,6 +617,15 @@ static int icss_iep_pps_enable(struct icss_iep *iep, int on)
>  exit:
>  	mutex_unlock(&iep->ptp_clk_mutex);

[Severity: Medium]
Once the mutex is dropped here, can icss_iep_cap_cmp_work() run against
compare hardware that has just been disabled and cleared?

There seem to be two ways for this to happen:

  - A handler already blocked in mutex_lock(&iep->ptp_clk_mutex) now
    continues. This is the case the patch fixes.

  - A work item that was pending but not yet started begins running
    between mutex_unlock() and cancel_work_sync(). In that case
    cancel_work_sync() only waits for it to finish.

The handler doesn't check pps_enabled or perout_enabled after it takes the
mutex:

icss_iep_cap_cmp_work() {
	mutex_lock(&iep->ptp_clk_mutex);

	ns = readl(iep->base + reg_offs[ICSS_IEP_CMP1_REG0]);
	...
	ns_next = ns + iep->period;
	writel(lower_32_bits(ns_next),
	       iep->base + reg_offs[ICSS_IEP_CMP1_REG0]);
	...
	pevent.pps_times.ts_real = ns_to_timespec64(ns);
	pevent.type = PTP_CLOCK_PPSUSR;
	pevent.index = 0;
	ptp_clock_event(iep->ptp_clock, &pevent);
	...
}

icss_iep_perout_enable_hw(on=0) has just written 0 to CMP1_REG0/REG1. The
late handler would then set CMP1 to 0 + iep->period, which undoes the
"clear CMP regs" step. It would also send a PTP_CLOCK_PPSUSR event with a
zero (1970) timestamp.

pps_event() doesn't check whether PPS is enabled. It records the assert,
increments assert_sequence, wakes /dev/ppsN readers and calls
pps_kc_event(), all after userspace has turned PPS off.

Before this patch, the blocked case deadlocked and the pending case was
cancelled under the mutex, so this behaviour is new.

Should icss_iep_cap_cmp_work() return early under the mutex when neither
pps_enabled nor perout_enabled is set?

>  
> +	/*
> +	 * Drain the capture-compare work only after dropping ptp_clk_mutex.
> +	 * icss_iep_cap_cmp_work() acquires ptp_clk_mutex itself, so calling
> +	 * cancel_work_sync() while the mutex is held deadlocks when a handler
> +	 * instance is already running and waiting for that same mutex.
> +	 */
> +	if (drain_work)
> +		cancel_work_sync(&iep->work);

[Severity: Medium]
The drain now runs outside ptp_clk_mutex and doesn't re-check
pps_enabled or perout_enabled. Could it cancel work that belongs to a
later enable?

pps_enable_store() and period_store() in drivers/ptp/ptp_sysfs.c call
ops->enable() without ptp->pincfg_mux. That means they aren't serialized
against the PTP_ENABLE_PPS ioctl path or against each other.

One possible sequence:

CPU0 (disable)                       CPU1 (sysfs enable)
icss_iep_pps_enable(iep, 0)
  pps_enabled = false
  mutex_unlock()
                                     icss_iep_pps_enable(iep, 1)
                                       program CMP1, set CMP_EN
                                       pps_enabled = true
                                     first CMP1 hit:
                                     icss_iep_cap_cmp_irq()
                                       schedule_work(&iep->work)
  cancel_work_sync(&iep->work)
    removes the new session's work

icss_iep_cap_cmp_work() is the only code that moves CMP1 forward. Once
its work is cancelled, no further compare events or PPS pulses are
produced, while the driver still reports pps_enabled == true.

The other order is possible as well. Suppose an old-session work instance
is blocked in mutex_lock() and gets the mutex after CPU1's enable. It
would read the new boundary B from CMP1, write B + period and send a
PPSUSR event stamped B before time B arrives. The first real edge of the
new session would be skipped.

Before this patch the cancel ran under ptp_clk_mutex, so a concurrent
enable had to wait for it.

[Severity: Medium]
The commit message says:

    The hardware compare is
    already disabled by icss_iep_perout_enable_hw() before the drain, so no new
    work can be scheduled once the mutex is released.

Is that guaranteed? icss_iep_cap_cmp_irq() reads pps_enabled with no lock
and no ordering against this path. Nothing calls
synchronize_irq(iep->cap_cmp_irq) before the drain:

icss_iep_cap_cmp_irq() {
	val = readl(iep->base + reg_offs[ICSS_IEP_CMP_STAT_REG]);
	if (val & BIT(1)) {
		writel(BIT(1), iep->base + reg_offs[ICSS_IEP_CMP_STAT_REG]);
		if (iep->pps_enabled || iep->perout_enabled)
			schedule_work(&iep->work);
	...
}

Suppose a CMP1 hit was latched just before CMP_EN was cleared, and its
handler on CPU1 has already read pps_enabled == true.

CPU0 can then set pps_enabled = false, drop the mutex and call
cancel_work_sync(). That call returns immediately because nothing is
pending.

CPU1 then calls schedule_work(), and the work runs after PPS has been
disabled.

On teardown, ptp_clock_unregister() -> ptp_disable_all_events() ->
icss_iep_pps_enable(0) runs first. After that the pps source and
ptp_clock are released, and icss_iep_exit() sets iep->ptp_clock to NULL.
A work item queued this late could call ptp_clock_event() on a freed or
NULL ptp_clock.

On PREEMPT_RT the handler is force-threaded and can be preempted between
the flag read and schedule_work(), so the window is wider there.

The old code had the same race with a larger window. However, the commit
message's argument depends on this window being closed.

Would a synchronize_irq() after clearing pps_enabled, together with a
state check in the work handler, close it?

> +
>  	return ret;
>  }
>  

[Severity: High]
This isn't a bug introduced by this patch, but the perout disable path has
a related problem. icss_iep_cap_cmp_irq() also queues iep->work when
perout_enabled is set, but icss_iep_perout_enable(..., 0) never drains it:

icss_iep_perout_enable() {
	...
	ret = icss_iep_perout_enable_hw(iep, req, on);
	if (!ret)
		iep->perout_enabled = !!on;

exit:
	mutex_unlock(&iep->ptp_clk_mutex);

	return ret;
}

On teardown, icss_iep_exit() unregisters the clock and sets it to NULL
before perout is turned off:

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

The ptp_disable_all_events() call inside ptp_clock_unregister() only
disables EXTTS and PPS. The PPS disable returns -EBUSY while perout is
enabled, so the work isn't drained there either.

Can a work item queued while perout is active run icss_iep_cap_cmp_work()
after this point? It could be queued before teardown, or by an IRQ that
arrives before CMP_EN is cleared. If it runs, ptp_clock_event() would use
a NULL or freed iep->ptp_clock and pps_device.

This can be reached from ndo_stop via prueth_emac_common_stop(), or from
prueth_remove(). It needs an IEP with an iep_cap_cmp interrupt and the
icssg_prueth clockops, which set n_per_out = 1.

Also, iep->ptp_clock = NULL is assigned without holding ptp_clk_mutex.

Should icss_iep_perout_enable() also call cancel_work_sync() on disable?
And should icss_iep_exit() drain iep->work before it unregisters the
clock?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261107063726.3388730-1-hj351016%40gmail.com

