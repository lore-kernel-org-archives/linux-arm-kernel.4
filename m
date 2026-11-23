Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70349606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4UvdBHbh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2pLYXdw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T6qSvEjZyD41I87wlBj9dRMtlhR3Lhe1Gpro/JPPIOw=; b=4UvdBHbhbyPGM7PJr1h/FnxqoR
	0S4aL1LBWjesSPn++S4wF6F13S+FxmGYouQ371sb8/SURf9SuZzqgF7HXhSX3Bmdb+vs4VQNPbJhQ
	Vy5YyXBxqlEayRbdtyeInAR+qZU40iS1Kk/VKqzHIaBRebybznx4MN98KDjLNW+OWEmyl38ewqVEj
	4n+rLNHfiprMCjs7uBJZ60xekoBpbu5hyPmp8KjSxwaInkXBmF19cikz42gk08QR7YH5DrIshdZ/1
	CBJ+Qc8CNFT3YZts9MyB+vwxFKsrySTYu/R5wFP01y4bKSKlva2yo1RWCoOhNtzw7UTQwg4bScKMU
	DaPE9Yzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVCu-00000003lbd-0RY8;
	Mon, 23 Nov 2026 14:39:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVCk-00000003lZG-0wop
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:39:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D64A140E16;
	Mon, 23 Nov 2026 14:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A073E1F000C0;
	Mon, 23 Nov 2026 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444777;
	bh=T6qSvEjZyD41I87wlBj9dRMtlhR3Lhe1Gpro/JPPIOw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d2pLYXdwb8Uu/UC8PAUm7O6721joxh6PjGnTSg2poM9FgumP76d9CiuKwpxfRdWuP
	 BAv4UZejLB4E0suNJ2cmLmHczG9XwiPJYRExlk4e3jtz4elbAMG5UhFKGNsDq8l3rs
	 aBocclsNgdUoIRqaZaijgFIRnCFp3lC7K3N+3Sxd7axFht9rSRY8nb6BQEBWrQYzbW
	 InLRSD/zSu1o24my0gOwC27rq9azN/cKQr5laV2Dj1Lnu8MHULW3kCEF5gpZLXsL0D
	 kgr9UONXRfUQqw8vRzA9rLCZwEIpsPHp4HeqQyU3X6GFpq7Vx1zw2EgAInHaoVu/Jo
	 fv3oTR9JtQY2w==
Subject: Re: [PATCH net v8 3/4] net: stmmac: restore RX descriptor buffer
 addresses on resume
From: netdev-bot+sashiko@kernel.org
To: dinghui1111@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com, fujiahui@lixiang.com, zhoujing3@lixiang.com
Date: Mon, 23 Nov 2026 14:39:36 +0000
Message-ID: <179544477624.3135.5494306095846250622@kernel.org>
In-Reply-To: <52672e4d879760b1434a92e12f3c7d5b2287e086.1795096430.git.dinghui@lixiang.com>
References: <52672e4d879760b1434a92e12f3c7d5b2287e086.1795096430.git.dinghui@lixiang.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch adds a failure point to stmmac_resume(): `ret =
  stmmac_resume_descriptors(priv); if (ret) goto error_unlock;`.
- [Medium] The new early failure in stmmac_resume()
  (stmmac_resume_descriptors() returning -ENOMEM) jumps to error_unlock.
- [Low] Part of the commit message describes code that is not in the
  tree.
- [Low] The commit message frames the bug only as GMAC4/XGMAC writeback
  overwriting buffer addresses, which leads to a 'fatal bus error'.

--

net: stmmac: restore RX descriptor buffer addresses on resume

The patch restores RX descriptor buffer addresses on resume. On GMAC4 and
XGMAC, hardware writeback during suspend can overwrite them. Buffer
preparation is factored into stmmac_prepare_rx_buffer() and
stmmac_prepare_rx_buffer_zc(). A new stmmac_reinit_rx_descriptors()
allocates any missing pages with GFP_KERNEL, and the per-ring resume work
is gathered in stmmac_resume_descriptors().

> Rebuild chain pointers and use stmmac_reset_rx_queue() to discard partial
> receive state from before the DMA reset. Initialize RX descriptors after
> restoring their addresses,
> using the existing per-queue initializer to preserve the watchdog policy
> and legacy control fields. Keep the unpopulated XSK suffix CPU-owned when
> DMA restarts. This replaces the separate final ownership-setting loop.

[ ... ]

> The RX rings no longer undergo initialization before address restoration.

[Severity: Low]
Which ownership-setting loop does this replace? Before this patch,
stmmac_resume() only called stmmac_reset_queues_param(),
stmmac_free_tx_skbufs() and stmmac_clear_descriptors().
stmmac_set_rx_owner() is only used in stmmac_rx_refill() and
stmmac_rx_refill_zc().

The second sentence has the same problem. The old resume path never
restored RX addresses, so nothing was ever initialized "before address
restoration".

Both sentences read like notes against an earlier, unposted version. Could
they be reworded to describe what changes relative to the current tree?

> Share buffer preparation with the refill paths and restore addresses
> from attached buffers. Allocate missing primary and secondary pages
> independently with GFP_KERNEL. If allocation fails, return the error
> without restarting DMA and leave the device detached.

[Severity: Low]
The commit message doesn't say why pages can be missing at resume time.

stmmac_rx() hands buf->page to the stack or page_pool and sets
buf->page = NULL. If the GFP_ATOMIC refill in stmmac_rx_refill() then
fails, that entry is left with no page attached.

The old resume path set OWN on every RX descriptor through
stmmac_clear_descriptors() whether a page was attached or not. On cores
whose writeback leaves the address word intact, the re-armed descriptor
still pointed at a page the driver no longer owned. DMA could then write
into recycled memory.

The new stmmac_reinit_rx_descriptors() fixes this too. Could the commit
message describe this case, so stable backporters know the patch also
fixes it?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f9ac82d2e7266..1508cf08f03b0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -8563,10 +8659,9 @@ int stmmac_resume(struct device *dev)
>  
>  	mutex_lock(&priv->lock);
>  
> -	stmmac_reset_queues_param(priv);
> -
> -	stmmac_free_tx_skbufs(priv);
> -	stmmac_clear_descriptors(priv, &priv->dma_conf);
> +	ret = stmmac_resume_descriptors(priv);
> +	if (ret)
> +		goto error_unlock;

[Severity: High]
If stmmac_resume_descriptors() fails here, does NAPI stay disabled while
netif_running() is still true?

stmmac_suspend() already called stmmac_disable_all_queues(), and
error_unlock skips stmmac_enable_all_queues(). Any later stmmac_suspend()
or stmmac_release() would then call napi_disable() a second time on the
same instances:

stmmac_release()
  __stmmac_release()
    stmmac_disable_all_queues()
      __stmmac_disable_all_queues()
        napi_disable(&ch->rx_napi)
          napi_disable_locked()

net/core/dev.c:napi_disable_locked() {
    ...
		while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
			usleep_range(20, 200);
			val = READ_ONCE(n->state);
		}
    ...
}

SCHED is still set from the first disable. Wouldn't this loop spin forever?
In the close path (ip link set down, MTU change, XDP setup, ring resize) it
would hold rtnl_lock. On the next system suspend it would hold priv->lock.

The -ENOMEM comes from the GFP_KERNEL page_pool allocations in
stmmac_reinit_rx_descriptors() -> stmmac_init_rx_buffers(). These run
during resume with the PM gfp restriction in place, so failure looks
reachable under memory pressure.

The commit message says "If allocation fails, return the error without
restarting DMA and leave the device detached". Is that detached state safe
to leave the device in? The stmmac_hw_setup() failure path already behaves
this way, but this patch adds a new way to reach it.

[Severity: Medium]
On the same failure path, is the MAC receiver left enabled?

error_unlock only powers down the legacy SerDes and drops the locks. Only
error_stop_dma calls stmmac_mac_set(priv, priv->ioaddr, false). With
Wake-on-LAN enabled, stmmac_suspend() never disables the MAC:

	if (priv->wolopts) {
		stmmac_pmt(priv, priv->hw, priv->wolopts);
		priv->irq_wake = 1;
	} else {
		stmmac_mac_set(priv, priv->ioaddr, false);

dwmac4_pmt() sets GMAC_CONFIG_RE when it arms wake-up. The
stmmac_pmt(priv, priv->hw, 0) call earlier in stmmac_resume() only writes
PMT=0 and leaves RE set. Because stmmac_hw_setup() is skipped, no DMA soft
reset clears the configuration either.

After the failure, the MAC keeps receiving with the link still up, while
RX DMA is stopped. The failing queue's descriptors have already been made
CPU-owned by the OWN-clearing loop at the top of
stmmac_reinit_rx_descriptors(). Incoming frames fill the MTL FIFO with
nothing to drain it. STMMAC_DOWN is not set, so the pre-suspend interrupt
enables can still reach stmmac_interrupt().

Should this path disable the MAC (and the DMA interrupts) before
returning? Otherwise the device is neither armed for wake-up nor quiesced.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795096430.git.dinghui%40lixiang.com

