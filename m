Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBAA606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bnvn+/A4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eMK44TzT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z43ShnxhdTQlmAVIYN6u8onm/dAqvyjq3drmtJzx7RE=; b=bnvn+/A4+P/N7Bz9Dh3AxzoQ11
	ShaENMVTFQiIYQOXxTpWt6OSTU/nRQciVCDn1vbHnXpyRmMy+gtA8WV0Wd5SYarYyfLXyW3Myw4v5
	teltzvsBloPzOKjMqalb5JO6kbPWqvSPd/ShsArnF9GZ3xWGNjpKzvwKX5YEnecS8qUBY2Hy1213x
	X+k6ex9TH9x+AUjr+1nRYXvPbjEa6e5rPiezUqGc3Yoj6Dt09ZVA7fYWtzH1xty4ztUREd9LGQNWq
	5y/tKgC/W5W5vsei+bD9LevxdiGfXaUs7ytKqX4cWkzHxdeWGHe9VK4ETdQRs7eZjvaaEo5xVc4aH
	9stNwCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSo56-000000016PR-09hZ;
	Mon, 16 Nov 2026 04:12:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSo50-000000016OU-41eL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:12:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4AB14248D;
	Mon, 16 Nov 2026 04:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C841F000C4;
	Mon, 16 Nov 2026 04:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794802350;
	bh=z43ShnxhdTQlmAVIYN6u8onm/dAqvyjq3drmtJzx7RE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eMK44TzTHFFW249bFRbScEPdDYnDxGs+KYfnDtY8touTDXVD9l6yqHddvuib7N4Og
	 gHMCmEFFse5NO+AIm8P2RQ4SmeMWt92ooTHGI0gkFRrcEWQUhspOoL4Jea5vXAeCm0
	 8nAThNwW1m9mI6k0psrNzc6wgqLjsBjNRUYxFXqd+OAYr2O8bDy0RlU/5RE96BAAKN
	 mIv0CY76/CVOyvVidaFcc+SC1jUp1l0/tQotJJ/bBEoV62PkwvJY7JuylZbnBaIi5C
	 aYj9+YQvWHb0/aBfV2hKhosnmm1A3ptZeyFNBG/Ci++ZokOwMcuydjrqMBtHFZT192
	 vgzoIUaodOTNA==
Subject: Re: [PATCH net-next v5 3/6] net: xilinx: axienet: Propagate device
 reset failure from ndo_open
From: netdev-bot+sashiko@kernel.org
To: suraj.gupta2@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 04:12:29 +0000
Message-ID: <179480234928.3136.4433132760561916489@kernel.org>
In-Reply-To: <20261114182947.2908628-4-suraj.gupta2@amd.com>
References: <20261114182947.2908628-4-suraj.gupta2@amd.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes user-visible bugs in existing kernels but has
  no Fixes: tag, and it is sent as the third patch of an XXV feature…
- [Medium] net: xilinx: axienet: u32 stats underflow on
  __axienet_device_reset() failure
- [Medium] net: xilinx: axienet: leaked legacy DMA rings and active DMA
  on open failure
- [Low] The commit message presents the resume/stop changes as a side
  effect of the new reset check.
- [Low] The comment added to axienet_stop() justifies the datapath_up
  guard with "axienet_resume() calls ndo_open directly, so unlike the…

--

net: xilinx: axienet: Propagate device reset failure from ndo_open

With this patch, axienet_open() now returns the error from
axienet_device_reset(). A new datapath_up flag makes axienet_stop() a
no-op when ndo_open did not complete. axienet_resume() now propagates
the open failure and calls netif_close() before it reattaches the device.
The patch also clears reset_in_progress on the error path of
__axienet_device_reset().

> That makes a failed ndo_open reachable, which matters for axienet_resume():
> it calls ndo_open directly, so unlike the netdev core it leaves the device
> running when open fails.

[Severity: Low]
Is this description accurate? Before this patch, axienet_open() could
already fail without the reset being involved:

  - phylink_fwnode_phy_connect() failure returns directly
  - request_irq(lp->eth_irq) failure on the dmaengine path goes to err_phy
  - axienet_init_dmaengine() failure (dma_request_chan() or the ring
    allocations) goes to err_free_eth_irq
  - request_irq() failures inside axienet_init_legacy_dma() go to
    err_phy, after napi_disable()

Since a3de357b087e ("net: axiemac: add PM callbacks to support
suspend/resume"), axienet_resume() has ignored the axienet_open() return
value and always called netif_device_attach(). The device stayed IFF_UP
after any of those failures.

A later ndo_stop then ran the full teardown. On the legacy path that is
napi_disable() on an already disabled NAPI with RTNL held, plus
free_irq() on IRQs that were never requested. On the dmaengine path it is
dma_release_channel() on released channels and a second kfree() of
tx_skb_ring/rx_skb_ring.

Could the commit message describe these as existing bugs, rather than as
a consequence of the new reset check?

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 125ad3dbf6aa9..a553150faa89b 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -1834,6 +1851,16 @@ static int axienet_stop(struct net_device *ndev)
>  	struct axienet_local *lp = netdev_priv(ndev);
>  	int i;
>  
> +	/* axienet_resume() calls ndo_open directly, so unlike the netdev core
> +	 * it can leave the device running after a failed open. Tearing down
> +	 * below would then stop a phylink that open already stopped and
> +	 * disconnected, and free interrupts it never requested.
> +	 */
> +	if (!lp->datapath_up)
> +		return 0;

[Severity: Low]
This comment says axienet_resume() can leave the device running after a
failed open. The same patch changes axienet_resume() to call
netif_close() on that failure.

Isn't that netif_close() call the path that actually reaches
axienet_stop() with datapath_up == false?

axienet_resume()
  axienet_open()            <- fails
  netif_close()
    netif_close_many()
      __dev_close_many()
        ops->ndo_stop()     -> axienet_stop()

The device is still IFF_UP at this point, because axienet_suspend()
calls axienet_stop() directly.

Could the comment describe the netif_close() path instead, so the guard
is not later mistaken for dead code and removed?

> +
> +	lp->datapath_up = false;
> +

[ ... ]

> @@ -3419,17 +3446,26 @@ static int axienet_suspend(struct device *dev)
>  static int axienet_resume(struct device *dev)
>  {
>  	struct net_device *ndev = dev_get_drvdata(dev);
> +	int ret;
>  
>  	if (!netif_running(ndev))
>  		return 0;
>  
>  	rtnl_lock();
> -	axienet_open(ndev);
> -	rtnl_unlock();
> -
> +	ret = axienet_open(ndev);
> +	if (ret) {
> +		netdev_err(ndev, "failed to reopen device on resume: %d\n", ret);
> +		/* Drop IFF_UP before reattaching, so that the interface can be
> +		 * brought up again once whatever made open fail is resolved.
> +		 * Reattaching while still up would also let the stack transmit
> +		 * on the datapath open has already torn down.
> +		 */
> +		netif_close(ndev);
> +	}
>  	netif_device_attach(ndev);
> +	rtnl_unlock();
>  
> -	return 0;
> +	return ret;
>  }

[Severity: Medium]
Does this leave the legacy DMA rings allocated and the DMA running
when open fails after the reset?

On the non-dmaengine path, axienet_device_reset() calls
axienet_dma_bd_init(). That allocates lp->tx_bd_v and lp->rx_bd_v
with dma_alloc_coherent(), allocates and maps lp->rx_bd_num RX skbs,
and starts both DMA channels. axienet_device_reset() then runs
mac_init() and enables XAE_OPTION_TXEN | XAE_OPTION_RXEN.

None of the failure exits that follow undo that:

  - mac_init() failing inside axienet_device_reset(), which this
    patch turns into an open failure
  - phylink_fwnode_phy_connect() failing, which returns directly
  - axienet_init_legacy_dma() failing, which goes to err_phy

err_phy only cancels the work items and stops and disconnects
phylink. Nothing calls axienet_dma_stop() or axienet_dma_bd_release(),
and TXEN and RXEN stay set.

With the new datapath_up guard, axienet_stop() will not clean this up
either. That includes the case where it is reached through
netif_close() in axienet_resume():

axienet_resume()
  axienet_open()            <- fails after axienet_dma_bd_init()
  netif_close()
    axienet_stop()          <- datapath_up == false, returns 0

The descriptor rings and the mapped RX skbs are therefore never
freed, and the DMA engine and the MAC keep running while the
interface is down. The next axienet_open() calls
axienet_dma_bd_init() again and overwrites lp->tx_bd_v and
lp->rx_bd_v, which leaks the previous rings.

Should the error paths in axienet_open() unwind axienet_device_reset()
on the legacy path, by stopping the DMA and calling
axienet_dma_bd_release()? Then datapath_up == false would really mean
there is nothing left to tear down.

[Severity: Medium]
This fixes bugs that exist in released kernels. Should it carry Fixes:
tags and go to net as a standalone fix, instead of being the third patch
of the XXV feature series?

The reset return value being overwritten by the
phylink_fwnode_phy_connect() result goes back at least to:

Fixes: 6b1b40f704fc ("net: axienet: Preparatory changes for dmaengine support")

The resume handling that leaves the device IFF_UP after a failed reopen
comes from:

Fixes: a3de357b087e ("net: axiemac: add PM callbacks to support suspend/resume")

Without a Fixes: tag, the stable tooling will not pick up the
datapath_up guard or the netif_close() handling here. In stable kernels,
an ifdown after a failed resume can then hang in napi_disable() with
RTNL held on the legacy DMA path. On the dmaengine path it can release
the DMA channels again and free tx_skb_ring/rx_skb_ring a second time.

[ ... ]

> @@ -702,6 +702,17 @@ static int __axienet_device_reset(struct axienet_local *lp)
>  	}
>  
>  out:
> +	/* On failure the block above is skipped, so clear the flag here.
> +	 * axienet_open() now returns on a reset error without scheduling the
> +	 * statistics work that used to clear it, which would otherwise leave
> +	 * axienet_stat() returning the frozen base until a reset succeeds.
> +	 */
> +	if (ret && (lp->features & XAE_FEATURE_STATS)) {
> +		write_seqcount_begin(&lp->hw_stats_seqcount);
> +		lp->reset_in_progress = false;
> +		write_seqcount_end(&lp->hw_stats_seqcount);
> +	}
> +
>  	mutex_unlock(&lp->stats_lock);
>  	return ret;
>  }

[Severity: Medium]
Does clearing reset_in_progress here leave hw_last_counter[] stale?

At the top of this function, axienet_stats_update(lp, true) stores
the pre-reset counter values in lp->hw_last_counter[] and sets
lp->reset_in_progress. The XAXIDMA_CR_RESET_MASK write that follows
resets the Ethernet core along with the DMA, which zeroes the
statistics counters. On either timeout, the goto out skips the loop
that folds the reset into hw_stat_base[] and reloads
hw_last_counter[].

With reset_in_progress now cleared, axienet_stat() computes

  lp->hw_stat_base[stat] + (counter - lp->hw_last_counter[stat])

where counter is the u32 read back from the core. That value is 0
after the reset. If the DMA reset poll is the one that timed out, it
is whatever the core returns while still held in reset.

For every counter that was non-zero before the reset, the u32
subtraction wraps. ndo_get_stats64 and the ethtool stats then report
values close to 2^32 too high. The next axienet_stats_update(), from
the stats work or the next reset, adds the same wrapped delta into
hw_stat_base[], so the error becomes permanent.

The statistics work this replaces would have hit the same wrap
through axienet_stats_update(lp, false). This patch makes it the
explicit outcome of a failed reset, though.

Should the error path resynchronise hw_last_counter[] from the
hardware when the counters are readable? Or is keeping the frozen
base the safer choice when the core may not have come out of reset?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114182947.2908628-1-suraj.gupta2%40amd.com

