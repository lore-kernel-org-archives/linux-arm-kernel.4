Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BS3cxYrd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LkXca84u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yYcw0Falz++hoNxE0Fb+2KmUKtbLZH7CzeMBLg0tNac=; b=BS3cxYrdo4pcp9R9gEsQWwaGc3
	xLYxODHTZjKz9gQoP0+9f2c+T/tIyagTxc65ldoLJq4N8p7MPAsC3HY09d8zVSWnGyFyziUb2rskJ
	TItg+Vy/f8+94/I2Sb0QK5WViGMrRwl4jqO9y4n/dHx/8ZG3wyXc1O4Pxwl8/NLvek0jgdHwrkl4o
	Vy+sprqjEDtJWm/TOpPf2zvWzZF44P9CsYI2hQN/J/JX6SZmkJkoRhReqR/tKT1TjO0JsCN/3hACQ
	rXOB6ibyF1uZvFhY+DRW3GP5hy2j5T0pfYQPpI5HKV9P8hnZAhE4xGL/rYDyUrGMrKc6PDknmWn5E
	q7R+CiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ1T-00000005sKN-0rmK;
	Tue, 17 Nov 2026 13:14:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ1O-00000005sIx-3YXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:14:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4169B62782;
	Tue, 17 Nov 2026 13:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29411F000D4;
	Tue, 17 Nov 2026 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921290;
	bh=yYcw0Falz++hoNxE0Fb+2KmUKtbLZH7CzeMBLg0tNac=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LkXca84uOBWW3hAjwHdbezdaR173l+h/2ljhuXUAyucU/2yhvepmlMLPiOukT/6JG
	 ceP81avO08loKcZP37BGljJkTdYfwQ2odY+Wf3wC61sCCRDreHXfLS2R8lTTiD/+iy
	 tbKhwqmIA3TNEeNyjpY3SwUYZqCt83aCa3MpFx6B77Hax926OQjdYQGnd9QAEPA3/a
	 kQ7mWl5ZAlIv2CkujIJXbKzkmFAx7BABZw6akcB5A087xGUTlKF0fDqZDm2DQfAyyt
	 t3pYpaYEU5LT+w2D0lEm0g8+8ljZGZ98dvBd/9GXHjlqm5nSk/fvFcIUdLtkWCh4no
	 gwh3AiZGkXrqg==
Subject: Re: [PATCH net-next v4 7/8] net: xilinx: tsn: add the endpoint TX data path
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, git@amd.com, neelisrinivas18@gmail.com
Date: Tue, 17 Nov 2026 13:14:48 +0000
Message-ID: <179492128844.3136.901676801121295751@kernel.org>
In-Reply-To: <20261113-patches_v2_external-v4-7-56bb26f042a4@amd.com>
References: <20261113-patches_v2_external-v4-7-56bb26f042a4@amd.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ep_start_xmit() takes and releases xchan->tx_lock with
  spin_lock_bh()/spin_unlock_bh() at lines 396/404/413/416 and…
- [Medium] The TX path assumes every submitted MCDMA descriptor comes
  back through exactly one in-order completion callback, with a per-…
- [Medium] ep_stop() sets ep->closing and calls
  dmaengine_terminate_sync() on every TX channel (line 498) before…
- [Medium] net: xilinx: tsn: ep_start_xmit() TX flow control ignores DMA
  segment limit
- [Low] The commit body covers only TX channel selection, map/submit and
  queue stop/wake.
- [Low] Several hot-path checks in ep_start_xmit() can never fire, and
  the commit message ('The driver consults tx_dma_chan_map[] only to…

--

net: xilinx: tsn: add the endpoint TX data path

This commit adds the transmit path for the Xilinx TSN endpoint driver.
Frames are mapped into a scatterlist and submitted to the MCDMA TX channel
for their logical queue, and BQL drives queue stop/wake from the
completion callback. It also adds software TX timestamping and reorders
ep_stop() so the TX channels are terminated before the queues are
disabled.

> Add the transmit path so the endpoint can send frames.
>
> Select the TX channel by indexing tx_chans[] with the frame's logical
> queue. ep_init_dmaengine() fills that array in logical-queue order, so the
> index maps to the channel that queue's descriptors were set up on. The
> driver consults tx_dma_chan_map[] only to reject a queue with no mapping.
> Map the frame and submit it to that channel. Stop the queue when the ring
> runs out of space, and wake it from the completion callback once a slot
> opens.

[Severity: Low]
This isn't a bug, but the commit message only covers channel selection,
map/submit and queue stop/wake. Should it also mention these other changes
in the patch?

  - software TX timestamping through skb_tx_timestamp(), plus the new
    .get_ts_info = ethtool_op_get_ts_info, which changes ethtool -T output
  - BQL accounting through netdev_tx_sent_queue(),
    __netif_txq_completed_wake() and netdev_tx_reset_subqueue()
  - the reordered ep_stop(), where dmaengine_terminate_sync() now runs on
    each TX channel before netif_tx_disable()

The reasons for the ep_stop() ordering and for the timestamping are only
in the v3/v4 changelog below the --- line. That text does not end up in
the git history.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index f179062c7d148..6e2721a74f287 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -311,8 +316,151 @@ static void ep_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  	ep_rx_refill(xchan, true);
>  }
>  
> +static void ep_dma_tx_cb(void *data, const struct dmaengine_result *result)
> +{

[ ... ]

> +	scoped_guard(spinlock_bh, &xchan->tx_lock) {
> +		skbuf_dma = ep_get_desc(xchan,
> +					xchan->ring_tail & (xchan->ring_size - 1));
> +		if (!skbuf_dma || !skbuf_dma->skb)
> +			return;

[ ... ]

> +	if (unlikely(result->result != DMA_TRANS_NOERROR)) {
> +		DEV_STATS_INC(ndev, tx_errors);
> +		dev_kfree_skb_any(skb);
> +	} else {

[Severity: Medium]
What happens to the TX ring after an MM2S DMA error?

In the xilinx_dma provider, xilinx_mcdma_irq_handler() only sets
chan->err when it sees XILINX_MCDMA_IRQ_ERR_MASK. Descriptors only
complete when IOC is set. xilinx_dma_complete_descriptor() stops at the
first descriptor whose last segment lacks XILINX_DMA_BD_COMP_MASK.

So the descriptors that did complete in that IRQ are the ones reported
with an error result. An error IRQ without IOC produces no callbacks at
all.

ep_start_xmit() sets callback_param to xchan rather than to the per-slot
skbuf_dma, so this callback always consumes the ring_tail slot. If one
callback never arrives, does every later completion land on the wrong
slot? That would unmap and free the wrong skb, and report the wrong length
to BQL and tx_bytes.

Also, xilinx_mcdma_start_transfer() returns early while chan->err is set,
so the channel stays halted. It only recovers when the next
xilinx_dma_tx_submit() calls xilinx_dma_chan_reset(). That reset is
controller-wide, so it can disturb the RX channels too, and stale entries
are left on active_list.

Nothing in the driver terminates or resyncs the channel after an error.
ep_netdev_ops has no .ndo_tx_timeout, so the TX watchdog is never armed.

Once the ring fills, can this queue stay stopped until the interface is
taken down and up again?

[ ... ]

>  static netdev_tx_t ep_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  {

[ ... ]

> +	if (ep->tx_dma_chan_map[queue] == TSN_DMA_CH_INVALID) {
> +		if (net_ratelimit())
> +			netdev_warn(ndev, "Logical TX queue %d has invalid DMA mapping\n",
> +				    queue);
> +		goto err_drop_skb;
> +	}

[Severity: Low]
This isn't a bug, but can this check ever fire?

ep_parse_tx_queue_config() does all of the following:

  - rejects queue indices >= num_tx_queues
  - rejects duplicate queues through queue_seen
  - requires each node to name a valid channel listed in dma-names
  - requires count == num_tx_queues

So either every logical queue in [0, num_tx_queues) gets a valid mapping,
or probe fails.

The queue >= ep->num_tx_queues check above looks unreachable too. The
netdev has one TX queue per TX DMA channel, and the core caps
queue_mapping.

The !skbuf_dma branch below looks dead as well. ep_alloc_dma_chan()
either allocates every skb_ring[] entry or fails.

The commit message says:

  The driver consults tx_dma_chan_map[] only to reject a queue with no
  mapping.

That wording suggests an unmapped queue can show up at runtime. Should
these checks be dropped, or the commit message reworded?

> +
> +	xchan = ep->tx_chans[queue];
> +
> +	sg_len = skb_shinfo(skb)->nr_frags + 1;
> +	txq = netdev_get_tx_queue(ndev, queue);
> +
> +	spin_lock_bh(&xchan->tx_lock);

[Severity: High]
Is spin_lock_bh() safe in ndo_start_xmit here?

Documentation/networking/netdevices.rst says ndo_start_xmit may be called
with interrupts disabled by netconsole:

netpoll_send_skb()
  local_irq_save(flags);
  __netpoll_send_skb()
    HARD_TX_TRYLOCK()
    netpoll_start_xmit()
      ep_start_xmit()
        spin_unlock_bh(&xchan->tx_lock)
          __local_bh_enable_ip()
            lockdep_assert_irqs_enabled();

The driver does not set IFF_DISABLE_NETPOLL, so netconsole can bind to
this netdev directly. It can also get here through a DSA user port,
because dsa_user_netpoll_setup() sets up netpoll on the conduit, and a
later patch in the series makes this device a conduit.

With lockdep enabled, this splats on every netconsole transmit.

Without lockdep, a pending softirq is still a problem. spin_unlock_bh()
can then call do_softirq(), which runs softirq handlers with interrupts
re-enabled. That happens inside netpoll's irq-off section, while this CPU
still holds the txq _xmit_lock.

If NET_TX then runs qdisc_run()->sch_direct_xmit() on the same txq,
wouldn't HARD_TX_LOCK spin on a lock its own CPU already holds?

The normal xmit path already runs with BH disabled, and the TX completion
runs from the DMA tasklet. Would plain spin_lock() (or spin_lock_irqsave())
be enough here? The same question applies to the second spin_lock_bh()
section around dmaengine_submit().

[ ... ]

> @@ -343,10 +491,16 @@ static int ep_open(struct net_device *ndev)
>  static int ep_stop(struct net_device *ndev)
>  {
>  	struct xlnx_tsn_ep *ep = netdev_priv(ndev);
> +	unsigned int i;
>  
> -	netif_tx_disable(ndev);
>  	WRITE_ONCE(ep->closing, true);
> +	for (i = 0; i < ep->num_tx_queues; i++)
> +		dmaengine_terminate_sync(ep->tx_chans[i]->chan);
> +
> +	netif_tx_disable(ndev);

[Severity: Medium]
Can ep_start_xmit() still run while this loop terminates the TX channels?

The TX queues are still enabled at this point. __dev_close_many() has
called dev_deactivate_many(), but that only quiesces the qdisc paths.

__dev_direct_xmit() is used by PACKET_QDISC_BYPASS and by AF_XDP generic
xmit. It checks netif_running() before taking HARD_TX_LOCK. After that it
only checks netif_xmit_frozen_or_drv_stopped(txq).

So a sender that passed the running check can reach ep_start_xmit() and
call dmaengine_submit() and dma_async_issue_pending() on a channel that is
being terminated. Documentation/driver-api/dmaengine/client.rst calls
that undefined. Also, xilinx_dma_terminate_all() resets the channel and
sets chan->idle without holding chan->lock.

xilinx_dma_free_descriptors() drops the queued descriptors for the
[ring_tail, ring_head) slots without running callbacks, so ring_tail does
not move.

When the newly submitted frame completes, ep_dma_tx_cb() would consume
the oldest terminated slot. It would unmap and consume the wrong skb, and
charge tx_packets, tx_bytes and BQL with that frame's length.

Moving netif_tx_disable() back to the front would reopen the race from
the v4 changelog: a callback that read closing as false could wake the
queue after netif_tx_disable(). Would it work to check closing and do the
wake both under tx_lock, or to disable the queues both before and after
the terminate loop?

>  	ep_exit_dmaengine(ep);
> +	for (i = 0; i < ndev->num_tx_queues; i++)
> +		netdev_tx_reset_subqueue(ndev, i);
>  
>  	return 0;
>  }

[ ... ]

> @@ -311,8 +316,151 @@ static void ep_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  	ep_rx_refill(xchan, true);
>  }
>  
> +static void ep_dma_tx_cb(void *data, const struct dmaengine_result *result)
> +{
> +	struct xlnx_tsn_ep_dma_chan *xchan = data;
> +	struct skbuf_dma_descriptor *skbuf_dma;
> +	struct netdev_queue *txq;
> +	struct net_device *ndev;
> +	struct scatterlist *sgl;
> +	struct sk_buff *skb;
> +	int sg_len;
> +	int len;
> +
> +	scoped_guard(spinlock_bh, &xchan->tx_lock) {
> +		skbuf_dma = ep_get_desc(xchan,
> +					xchan->ring_tail & (xchan->ring_size - 1));
> +		if (!skbuf_dma || !skbuf_dma->skb)
> +			return;
> +
> +		skb = skbuf_dma->skb;
> +		sgl = skbuf_dma->sgl;
> +		sg_len = skbuf_dma->sg_len;
> +
> +		dma_unmap_sg(xchan->dma_dev, sgl, sg_len, DMA_TO_DEVICE);
> +
> +		skbuf_dma->skb = NULL;
> +		WRITE_ONCE(xchan->ring_tail, xchan->ring_tail + 1);
> +	}
> +
> +	ndev = skb->dev;
> +	txq = netdev_get_tx_queue(ndev, skb_get_queue_mapping(skb));
> +	len = skb->len;
> +
> +	if (unlikely(result->result != DMA_TRANS_NOERROR)) {
> +		DEV_STATS_INC(ndev, tx_errors);
> +		dev_kfree_skb_any(skb);
> +	} else {
> +		DEV_STATS_INC(ndev, tx_packets);
> +		DEV_STATS_ADD(ndev, tx_bytes, len);
> +		dev_consume_skb_any(skb);
> +	}
> +
> +	__netif_txq_completed_wake(txq, 1, len,
> +				   CIRC_SPACE(READ_ONCE(xchan->ring_head),
> +					      READ_ONCE(xchan->ring_tail),
> +					      xchan->ring_size), 2,
> +				   READ_ONCE(xchan->ep->closing));
> +}
> +
>  static netdev_tx_t ep_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  {
> +	struct dma_async_tx_descriptor *dma_tx_desc;
> +	struct xlnx_tsn_ep *ep = netdev_priv(ndev);
> +	struct skbuf_dma_descriptor *skbuf_dma;
> +	int queue = skb_get_queue_mapping(skb);
> +	struct xlnx_tsn_ep_dma_chan *xchan;
> +	struct netdev_queue *txq;
> +	int sg_len, nents, ret;
> +	dma_cookie_t cookie;
> +
> +	if (unlikely(queue >= ep->num_tx_queues)) {
> +		if (net_ratelimit())
> +			netdev_warn(ndev, "Invalid TX queue %d (max %u)\n",
> +				    queue, ep->num_tx_queues);
> +		goto err_drop_skb;
> +	}
> +
> +	if (ep->tx_dma_chan_map[queue] == TSN_DMA_CH_INVALID) {
> +		if (net_ratelimit())
> +			netdev_warn(ndev, "Logical TX queue %d has invalid DMA mapping\n",
> +				    queue);
> +		goto err_drop_skb;
> +	}
> +
> +	xchan = ep->tx_chans[queue];
> +
> +	sg_len = skb_shinfo(skb)->nr_frags + 1;
> +	txq = netdev_get_tx_queue(ndev, queue);
> +
> +	spin_lock_bh(&xchan->tx_lock);
> +	if (CIRC_SPACE(xchan->ring_head, READ_ONCE(xchan->ring_tail),
> +		       xchan->ring_size) <= 1) {
> +		netif_txq_try_stop(txq,
> +				   CIRC_SPACE(xchan->ring_head,
> +					      READ_ONCE(xchan->ring_tail),
> +					      xchan->ring_size),
> +				   2);
> +		spin_unlock_bh(&xchan->tx_lock);
> +		if (net_ratelimit())
> +			netdev_warn(ndev, "TSN TX ring full\n");
> +
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	skbuf_dma = ep_get_desc(xchan, xchan->ring_head & (xchan->ring_size - 1));
> +	if (!skbuf_dma) {
> +		spin_unlock_bh(&xchan->tx_lock);
> +		goto err_drop_skb;
> +	}
> +	spin_unlock_bh(&xchan->tx_lock);
> +
> +	sg_init_table(skbuf_dma->sgl, sg_len);
> +	ret = skb_to_sgvec(skb, skbuf_dma->sgl, 0, skb->len);
> +	if (ret < 0)
> +		goto err_drop_skb;
> +	sg_len = ret;
> +
> +	nents = dma_map_sg(xchan->dma_dev, skbuf_dma->sgl, sg_len, DMA_TO_DEVICE);
> +	if (!nents)
> +		goto err_drop_skb;
> +
> +	dma_tx_desc = dmaengine_prep_slave_sg(xchan->chan, skbuf_dma->sgl,
> +					      nents, DMA_MEM_TO_DEV,
> +					      DMA_PREP_INTERRUPT);
> +	if (!dma_tx_desc)
> +		goto err_unmap_sg;
> +
> +	skbuf_dma->skb = skb;
> +	skbuf_dma->sg_len = sg_len;
> +	dma_tx_desc->callback_param = xchan;
> +	dma_tx_desc->callback_result = ep_dma_tx_cb;
> +
> +	skb_tx_timestamp(skb);
> +
> +	spin_lock_bh(&xchan->tx_lock);
> +	cookie = dmaengine_submit(dma_tx_desc);
> +	if (dma_submit_error(cookie)) {
> +		spin_unlock_bh(&xchan->tx_lock);
> +		skbuf_dma->skb = NULL;
> +		goto err_unmap_sg;
> +	}
> +	WRITE_ONCE(xchan->ring_head, xchan->ring_head + 1);
> +	netdev_tx_sent_queue(txq, skb->len);
> +	netif_txq_maybe_stop(txq,
> +			     CIRC_SPACE(xchan->ring_head,
> +					READ_ONCE(xchan->ring_tail),
> +					xchan->ring_size),
> +			     2, 2);
> +	spin_unlock_bh(&xchan->tx_lock);
> +
> +	dma_async_issue_pending(xchan->chan);
> +
> +	return NETDEV_TX_OK;
> +
> +err_unmap_sg:
> +	dma_unmap_sg(xchan->dma_dev, skbuf_dma->sgl, sg_len, DMA_TO_DEVICE);
> +err_drop_skb:
>  	dev_kfree_skb_any(skb);
>  	DEV_STATS_INC(ndev, tx_dropped);
>  	return NETDEV_TX_OK;

[Severity: Medium]
What happens when the MCDMA segment pool runs out before this ring
does?

The driver sets NETIF_F_SG, and skbuf_dma->sgl has room for
MAX_SKB_FRAGS + 1 entries. But the stop and wake decisions in
ep_start_xmit() and ep_dma_tx_cb() only look at CIRC_SPACE() on the
TX_BD_NUM_DEFAULT (64) slot frame ring. That allows up to 62 frames in
flight per channel, however many segments each one uses.

In the xilinx_dma provider, each channel has a fixed pool of
XILINX_DMA_NUM_DESCS (512) segments on chan->free_seg_list.
xilinx_mcdma_prep_slave_sg() takes at least one segment per
scatterlist entry. With fully fragmented skbs at 18 entries each,
28 frames in flight leave too few segments for the next one. At that
point the frame ring is still less than half full.

dmaengine_prep_slave_sg() then returns NULL. The frame is unmapped
and freed through err_unmap_sg and err_drop_skb, and it is counted as
tx_dropped. The queue is never stopped, so the stack keeps handing
over frames that fail the same way until completions return segments
to the pool.

Nothing leaks and the queue does not stall. But sustained SG traffic,
such as zerocopy senders or forwarded paged skbs, sees packet loss
where it should see backpressure.

Should the flow control account for segments as well as frames? For
example, the TX ring could be sized so that ring_size *
(MAX_SKB_FRAGS + 1) fits in the provider's pool. Or the stop
threshold could reserve the worst-case segment count per frame.

Alternatively, should a prep failure with frames still in flight stop
the queue and return NETDEV_TX_BUSY, and rely on ep_dma_tx_cb() to
wake it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-patches_v2_external-v4-0-56bb26f042a4%40amd.com

