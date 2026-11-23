Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679AC606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J5HPX9Gj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IdVmis5V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0cancWVT+8KaS/bAE5+4QwQKl+0ryxVKBdgzf6jnrSE=; b=J5HPX9Gjw5NSlgKsmKWD9xhE95
	LODBe6LzXs5CMis5N0jDqlsXG5WNk8/slqAme8x+QF1lyLiJcXIvTQOD8Tp+UeQwdfE17i4ZZEaBs
	icHjYmMyEC5eg21Gcyc+SnUgRfSsRKEFvt2GsdKMatBNIBvVPF7aN+xA2MSGwvUxoolsXNAR/dI7P
	prX7QeHsgWUt0idvg5YB5nd90VkQK6DVHljaOuM0VGUVeLmfBdmN6Qe3UGpB/beQwdlH5M2ugOMuC
	X1yGYntbfCdjZU4b35Lk0qvK6/e8KNptScUSuko8qmI5DtIbmv0zvApb+DhJjuzPYjmYh7o6AjII2
	GZNafrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVV5-00000003rds-0qtV;
	Mon, 23 Nov 2026 14:58:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVUp-00000003rTw-1Yva
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 234B145984;
	Mon, 23 Nov 2026 14:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234D91F000EC;
	Mon, 23 Nov 2026 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445899;
	bh=0cancWVT+8KaS/bAE5+4QwQKl+0ryxVKBdgzf6jnrSE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IdVmis5Vsp/secoMshwP+eTS91mmFtdhGKevlqVBEtk4N6EZA3qIk/GJFXCTl99kY
	 5NTkw8Qh53VmNJ5z55cCrbbwND6eS3jooVEc6KdxRlCGB24Cf5I2NS0Ac3YLljm503
	 3z8erc7e2ck08sT94aIcjkm5SQ5ZFUPIWpp4+oIBEA47uNQ6oMyAtmTXhTYfhO6qsD
	 1fk2MTCYMxj7sdBc0ySMPbmLvzmn8pi30EXnb6Mz15krCVWjyPAk654YMcRvPbW4sx
	 le8zZg9/AVHXDI7HGgwCBINf93rDzdrpW6ChG/UEk7iEyiodYx2a4LwhTMnt/BuRd/
	 RmaP+UHsgR3gQ==
Subject: Re: [PATCH net-next v3 6/9] net: sparx5/lan969x: add support for
 resizing the FDMA buffers
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:17 +0000
Message-ID: <179544589770.3135.1560770547873397801@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-6-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-6-55c272fe1acc@microchip.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] After a resize, sparx5_fdma_resume() does not turn the injection
  (TX) channel's DB interrupt back on.
- [Low] The new runtime resize path fills the whole replacement RX ring
  from sleepable process context, but it uses the NAPI refill callbacks,…

--

net: sparx5/lan969x: add support for resizing the FDMA buffers

This adds an fdma_resize operation for Sparx5 and lan969x. It allocates
new FDMA buffers sized for a new MTU, then pauses the FDMA, swaps in the
new buffers and resumes. Pausing stops the TX queues and CPU forwarding
and drains the queues before stopping and resetting the FDMA. On lan969x
only the RX buffers and page_pool are replaced.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> index b92d249777f0b..6c6387cb8a505 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c

[ ... ]

> @@ -564,3 +576,174 @@ int sparx5_fdma_stop(struct sparx5 *sparx5)

[ ... ]

> +void sparx5_fdma_pause(struct sparx5 *sparx5)
> +{

[ ... ]

> +	sparx5_fdma_stop(sparx5);
> +
> +	/* Reset FDMA state */
> +	spx5_wr(FDMA_CTRL_NRESET_SET(0), sparx5, FDMA_CTRL);
> +	spx5_wr(FDMA_CTRL_NRESET_SET(1), sparx5, FDMA_CTRL);
> +
> +	/* Discard frames queued for the CPU, as they may not fit the new
> +	 * buffers.
> +	 */
> +	sparx5_xtr_flush(sparx5, XTR_QUEUE);
> +}
> +
> +/* Restart the FDMA and the port TX queues after sparx5_fdma_pause() */
> +void sparx5_fdma_resume(struct sparx5 *sparx5)
> +{
> +	struct sparx5_rx *rx = &sparx5->rx;
> +	struct sparx5_tx *tx = &sparx5->tx;
> +
> +	/* Enable NAPI before the RX interrupt is enabled, as the interrupt
> +	 * handler schedules NAPI, as in sparx5_fdma_start().
> +	 */
> +	napi_enable(&rx->napi);
> +
> +	sparx5_fdma_rx_activate(sparx5, rx);
> +	sparx5_fdma_tx_activate(sparx5, tx);

[Severity: Low]
On lan969x, does the injection channel's DB interrupt stay masked after
a resize?

sparx5_fdma_pause() pulses FDMA_CTRL_NRESET after sparx5_fdma_stop() has
already cleared the RX bit in FDMA_INTR_DB_ENA. Here,
sparx5_fdma_rx_activate() only sets the XTR channel bit:

	spx5_rmw(BIT(fdma->channel_id),
		 BIT(fdma->channel_id) & FDMA_INTR_DB_ENA_INTR_DB_ENA,
		 sparx5, FDMA_INTR_DB_ENA);

sparx5_fdma_tx_activate() does not touch FDMA_INTR_DB_ENA at all.

On lan969x, the TX channel bit is only enabled in
lan969x_fdma_napi_poll(), which runs only after an interrupt has
scheduled NAPI:

	if (counter < weight && napi_complete_done(napi, counter))
		spx5_wr(0xff, sparx5, FDMA_INTR_DB_ENA);

lan969x reclaims TX buffers only from NAPI, in
lan969x_fdma_tx_clear_buf(). lan969x_fdma_xmit() sets
FDMA_DCB_STATUS_INTR on every TX DB and expects that interrupt.

Suppose the NRESET pulse puts FDMA_INTR_DB_ENA back to a cleared
default. Could the TX DCBs then fill up, so that
lan969x_fdma_get_next_dcb() returns -ENOSPC and sparx5_port_xmit_impl()
keeps returning NETDEV_TX_BUSY? That would last until an RX frame
raises the IRQ and NAPI writes 0xff again.

This depends on whether NRESET actually clears FDMA_INTR_DB_ENA, which
the code alone can't confirm. The state after resize would match the
existing post-boot state, since sparx5_fdma_start() also enables only
the RX bit. The behaviour is still present at the end of the series:
"net: sparx5/lan969x: add support for changing the MTU" calls
fdma_resize from ndo_change_mtu without changing sparx5_fdma_resume().

> +
> +	/* Forward frames to the CPU again, now the FDMA can extract them */
> +	sparx5_fdma_cpu_fwd_set(sparx5, true);

[ ... ]

> +int sparx5_fdma_resize(struct sparx5 *sparx5, struct sparx5_port *port,
> +		       int new_mtu)
> +{

[ ... ]

> +	sparx5_fdma_rx_init(sparx5, rx_new, FDMA_XTR_CHANNEL, db_size);
> +	sparx5_fdma_tx_init(sparx5, &tx_new, FDMA_INJ_CHANNEL, db_size);
> +
> +	err = sparx5_fdma_rx_alloc(rx_new);

[Severity: Low]
This runs from sleepable process context under RTNL. The caller is
sparx5_port_change_mtu(), added later in the series. The whole ring is
refilled through the NAPI dataptr callback, though:

sparx5_fdma_resize()
  sparx5_fdma_rx_alloc(rx_new)
    fdma_dcbs_init()
      fdma_dcb_add()
        __fdma_dcb_add()
          sparx5_fdma_rx_dataptr_cb()
            __netdev_alloc_skb(rx->ndev, fdma->db_size, GFP_ATOMIC);

That is FDMA_DCB_MAX * FDMA_RX_DCB_MAX_DBS = 960 skbs. With a jumbo MTU,
db_size is about 14 KB, so each data buffer becomes a 16 KB (order-2)
allocation. That adds up to roughly 15 MB of GFP_ATOMIC allocations
while the old ring of similar size is still allocated.

lan969x_fdma_resize() does the same thing.
lan969x_fdma_rx_alloc(rx_new) fills 64 slots through
lan969x_fdma_rx_dataptr_cb() and page_pool_dev_alloc_pages(), with pages
of up to order 2.

On a fragmented, long-running system, can an MTU increase fail with
-ENOMEM when a GFP_KERNEL allocation, which can reclaim and compact,
would have succeeded? Could the burst also use up the atomic reserves
that other RX paths depend on?

> +	if (err)
> +		goto out;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

