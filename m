Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6798B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YcK7yEnP;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=FHPYafy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uLkbu6PFGq4GaGataFF9HCmjVwvvmSbMT74bROH5x9E=; b=YcK7yEnPUS6If3WgOxaCdC4pO9
	XdDBsVuN/ELsKuxwKBp5i7EYGY6ykS9eD7YCfk5YpfZAKY9Q+dx55UI3N7LDuFunP7ip1tpZ1v5LZ
	MMSDoqG8ctuw/2SLJX1DgAgazjPNMyzPRJtkRgfMbayKeOAcNipNT8rI+dfH45ZBDwnIvw7rQHWUM
	PxaLgjitKR3efIfgL4P4tWkYpjDG//GfuNSnMcGa7QPlrlucc6tRHzpcsZBQdVf62mdX5cLKvbsXa
	LhCfs0VqHJgVxbN8+anZv3ieVE+js+B5zsljKSVBVXw5vRjEEAd5cSbhGUH/qPewZktwcIFEX4VJA
	4kOgHi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoS0-00000006Iov-1MZp;
	Tue, 24 Nov 2026 11:12:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoRn-00000006In1-3Hjn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795518747; x=1827054747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8IMV+5kyXcaydgm4AH+0bMmqLq0AGEkLqMnvmLyhdO0=;
  b=FHPYafy5nadKb1gneQ55B8vcaVp9uOnPMTKBDVCiGaYeSwhqOcDPPdmS
   KNepSnNvgfUVILFMmwvPLTNyjLtjlnzQkVbvz1VLCOyxK2q7EsoYINfLf
   mlmbH4uyJ58zvxpI6ipCxrdAJSUs+9/TXAGTKZrn2UxTYIq/sY3wMuV1H
   d4pRZlWECEdD5UmhIGQG19tWlmRfSszjNpxOPgecmznYE0+YEshZaqCIE
   0FfUR8eL5YEdxdzWRd8dZ79SK71tA/Dn74YZbbXnxNcpFRDg8RwnG0PdZ
   PfgalicPaR61MfD8g1SYCMoMPhHmIgrdxBAU1NasnOlZ3JCxTOD2En6VB
   w==;
X-CSE-ConnectionGUID: Mms0sh6/SrqftIbCxM3beQ==
X-CSE-MsgGUID: ZY2ka21YQVabXxh7JqpP5g==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="298383094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 04:12:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Tue, 24 Nov 2026 04:12:26 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 04:12:23 -0700
Date: Tue, 24 Nov 2026 12:12:22 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horms@kernel.org>
Subject: Re: [PATCH net-next v3 9/9] net: sparx5/lan969x: add support for
 changing the MTU
Message-ID: <20261124111222.6ouh6ujlnuwqs7d2@DEN-DL-M70577>
References: <20261120-sparx5-mtu-change-v3-9-55c272fe1acc@microchip.com>
 <179544590356.3135.2254557164224979869@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179544590356.3135.2254557164224979869@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_031227_955686_4464E8F5 
X-CRM114-Status: GOOD (  66.52  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 02:58:23PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (2) · Medium: 1 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch raises max_mtu to 13982 in FDMA mode and adds the
>   first caller of ops->fdma_resize (sparx5_port_change_mtu, process…
> - [Low] The commit message says "The MTU of a port is currently fixed to
>   1500".
> - [Low] SPX5_MAX_FRAME_LEN (sparx5_main.h) is defined as 14000 with the
>   comment "Max frame length of the MACs", and the commit message says…
> - [Low] net: sparx5: sparx5_port_change_mtu() fails MTU increase on
>   failed buffer shrink
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but this patch
>   silently closes it without saying so.
> - [High] This problem wasn't introduced by this patch, but it is a crash.
> 
> --
> 
> net: sparx5/lan969x: add support for changing the MTU
> 
> This adds an ndo_change_mtu callback for sparx5 and lan969x ports. The
> callback programs the MAC maximum frame length, resizes the shared FDMA
> buffers, and updates the queue watermarks and the TAS guard band. MTU
> changes are only allowed when the FDMA is used, in which case max_mtu is
> raised to 14000 - ETH_HLEN - ETH_FCS_LEN and the top RMON histogram bucket
> is extended.
> 
> > The MTU of a port is currently fixed to 1500, as the MAC maximum frame
> > length, the FDMA buffers, the queue watermarks and the TAS guard band
> > are all sized for a 1518 byte frame.
> 
> [Severity: Low]
> Is this description accurate? The ports come from devm_alloc_etherdev_mqs()
> -> ether_setup(), so min_mtu is ETH_MIN_MTU (68) and max_mtu is
> ETH_DATA_LEN (1500).
> 
> Before this patch there was no ndo_change_mtu, so __netif_set_mtu() just
> did WRITE_ONCE(dev->mtu, new_mtu). Userspace could already lower the MTU.
> 
> After this patch, sparx5_port_change_mtu() in sparx5_netdev.c returns
> -EOPNOTSUPP for every MTU change when sparx5->fdma_irq <= 0. That includes
> decreases that used to succeed, for example on Sparx5 revision 0, where
> sparx5_frame_io_init() does not use the FDMA.
> 
> In FDMA mode, a decrease now also lowers MAC_MAXLEN_CFG. The port then
> drops hardware forwarded frames larger than the new MTU + 18 that it used
> to accept.
> 
> Rejecting the change in register mode looks correct, since lowering the
> MTU there was memory unsafe (see below). Could the commit message describe
> the previous behaviour, and mention that lowering the MTU in register mode
> now fails?
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
> > index 2c6a5d3bc2bc6..af1fd32c6cef7 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
> > @@ -809,7 +809,7 @@ static const struct ethtool_rmon_hist_range sparx5_rmon_ranges[] = {
> >  	{  256,   511 },
> >  	{  512,  1023 },
> >  	{ 1024,  1518 },
> > -	{ 1519, 10239 },
> > +	{ 1519, SPX5_MAX_FRAME_LEN + 2 * VLAN_HLEN },
> >  	{}
> >  };
> >  
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
> > index 64ace5c3af5ab..a94c025ba3c0d 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
> > @@ -111,6 +111,7 @@ enum sparx5_feature {
> >  #define SPX5_BUFFER_MEMORY     4194280 /* 22795 words * 184 bytes */
> >  #define SPX5_TAS_ENTRIES_PER_PORT 2 /* TAS lists per port */
> >  #define SPX5_HW_MTU(mtu)       ((mtu) + ETH_HLEN + ETH_FCS_LEN)
> > +#define SPX5_MAX_FRAME_LEN     14000 /* Max frame length of the MACs */
> 
> [Severity: Low]
> Does 14000 include VLAN tags or not? The comment calls it the max frame
> length of the MACs, and the commit message says the MACs "support frames
> of up to 14000 bytes".
> 
> In sparx5_register_netdevs(), max_mtu becomes 14000 - ETH_HLEN -
> ETH_FCS_LEN = 13982, so sparx5_port_change_mtu() programs MAC_MAXLEN_CFG to
> 14000.
> 
> sparx5_port_max_tags_set() enables VLAN_LEN_AWR_ENA, which lets a tagged
> frame exceed MAXLEN by 4 bytes per tag. The new RMON bucket above also
> advertises { 1519, SPX5_MAX_FRAME_LEN + 2 * VLAN_HLEN }, which is 14008.
> 
> If 14000 is a hard hardware limit, should max_mtu also subtract
> 2 * VLAN_HLEN, and should the RMON range stop at 14000? If it is not,
> should the comment and the commit message be updated?
> 
> >  
> >  #define XTR_QUEUE     0
> >  #define INJ_QUEUE     0
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > index b3725cf2dd44c..095925752f5f6 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > @@ -250,6 +250,44 @@ static int sparx5_port_hwtstamp_set(struct net_device *dev,
> >  	return sparx5_ptp_hwtstamp_set(sparx5_port, cfg, extack);
> >  }
> >  
> > +static int sparx5_port_change_mtu(struct net_device *dev, int new_mtu)
> > +{
> > +	struct sparx5_port *port = netdev_priv(dev);
> > +	struct sparx5 *sparx5 = port->sparx5;
> > +	bool resize = new_mtu > dev->mtu;
> > +	int err;
> > +
> > +	/* Register based extraction sizes its skbs from the MTU at the time
> > +	 * a frame is read, so it cannot handle frames queued before an MTU
> > +	 * decrease.
> > +	 */
> > +	if (sparx5->fdma_irq <= 0)
> > +		return -EOPNOTSUPP;
> 
> [Severity: Low]
> Can resize be true here while fdma_resize() is actually shrinking the
> buffers?
> 
> resize only compares new_mtu against this port's own dev->mtu. The FDMA
> buffers, however, are shared and sized for the largest MTU of all
> ports. A failed shrink is allowed to leave them larger than needed.
> 
> Consider a port lowered from 9000 to 1500 where the smaller ring cannot
> be allocated. The code warns, keeps the larger buffers and commits
> dev->mtu = 1500.
> 
> If the port is later raised to an intermediate value such as 4000,
> resize is true. But sparx5_fdma_resize() only skips the reallocation
> when db_size == rx->fdma.db_size, and lan969x_fdma_resize() only when
> page_order == rx->page_order. Both will therefore try to shrink again.
> 
> If that allocation also fails, sparx5_port_change_mtu() returns the
> error and the MTU stays at 1500. The currently allocated buffers
> already fit 4000, though.
> 
> That contradicts the commit message, which says a failed shrink keeps
> the new MTU because the current buffers still fit all frames. No
> memory safety problem results, since the MAC max length is not touched
> on this path. It does make the increase fail for no real reason.
> 
> Should the failure only be treated as fatal when the required buffer
> size actually grows? For example, fdma_resize() could tell the caller
> whether it was growing or shrinking. Alternatively, an increase could
> skip the reallocation when the current buffers are already large
> enough.
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but this check also closes a
> heap overflow in register based extraction. The commit message presents it
> only as a limitation.
> 
> sparx5_xtr_grp() sizes the skb from the current MTU, then copies words
> until EOF with no bounds check:
> 
> drivers/net/ethernet/microchip/sparx5/sparx5_packet.c:sparx5_xtr_grp() {
>     ...
> 	skb = netdev_alloc_skb(netdev, netdev->mtu + ETH_HLEN);
>     ...
> 	rxbuf = (u32 *)skb->data;
> 
> 	/* Now, pull frame data */
> 	while (!eof_flag) {
>     ...
> 		default:
> 			*rxbuf = val;
> 			byte_cnt += 4;
> 			rxbuf++;
> 		}
>     ...
> }
> 
> Before this patch, MAC_MAXLEN_CFG stayed at ETH_MAXLEN (1518) from
> sparx5_port_init(), while the core allowed dev->mtu down to 68.
> 
> After "ip link set ethX mtu 68" on a register mode system, a normal
> 1518 byte frame from the wire would be written about 1.4 KB past the skb
> tailroom. That lands in skb_shared_info and adjacent heap memory, and
> skb_put() only checks the length after the copy.
> 
> This has been reachable since commit f3cad2611a77 ("net: sparx5: add
> hostmode with phylink support"). Could it be fixed in a separate patch with
> a Fixes: tag, so stable kernels get the fix too?
> 
> Bounding the copy loop in sparx5_xtr_grp() against the skb tailroom would
> also mean its safety no longer depends on the MTU being frozen in
> register mode.
> 
> > +
> > +	/* Never let the MAC accept frames larger than the RX buffers */
> > +	if (!resize)
> > +		sparx5_port_max_len_set(sparx5, port, SPX5_HW_MTU(new_mtu));
> > +
> > +	err = sparx5->data->ops->fdma_resize(sparx5, port, new_mtu);
> 
> [Severity: Medium]
> With max_mtu now at 13982, this can reach sparx5_fdma_resize() on Sparx5
> with db_size = ALIGN(SPX5_HW_MTU(13982) + IFH_LEN * 4 + 2 * VLAN_HLEN, 128),
> which is 14080. Is GFP_ATOMIC the right flag for the RX ring allocation on
> this path?
> 
> sparx5_port_change_mtu()
>   sparx5_fdma_resize()
>     sparx5_fdma_rx_alloc(rx_new)
>       fdma_dcbs_init()
>         sparx5_fdma_rx_dataptr_cb()   /* 64 DCBs * 15 DBs = 960 calls */
>           __netdev_alloc_skb(rx->ndev, fdma->db_size, GFP_ATOMIC)
> 
> This runs in process context under RTNL and is allowed to sleep. Even so,
> it makes about 960 order-2 allocations (roughly 15 MB) with __GFP_HIGH,
> while the old ring is still allocated.
> 
> Can that drain the reserves needed by real atomic users, such as the NAPI
> RX refill?
> 
> The TX side then does:
> 
> sparx5_fdma_tx_alloc(&tx_new)
>   fdma_alloc_phys()
>     kzalloc(fdma->size, GFP_KERNEL)
> 
> At the max MTU, fdma->size is around 904 KB. That is an order-8 physically
> contiguous allocation without __GFP_NOWARN.
> 
> On a fragmented system, can jumbo MTU changes fail unpredictably, with an
> allocation failure splat? The failure is handled and the MTU is left
> unchanged.
> 
> Would it help to pass a gfp argument down to the RX dataptr callback, so
> this path can use GFP_KERNEL?

The GFP_ATOMIC part was already dismissed on v2 [1]. The TX ring allocation can
sleep, and if it fails the MTU is left unchanged.

[1] https://lore.kernel.org/netdev/20261113080731.a6xdk63hnkjyk5w3@DEN-DL-M70577.microsemi.net/

> 
> > +	if (err) {
> > +		if (resize)
> > +			return err;
> > +
> > +		/* The current, larger, buffers still fit all frames */
> > +		netdev_warn(dev, "Failed to resize FDMA buffers: %d\n", err);
> > +	}
> 
> [ ... ]
> 
> > @@ -306,7 +345,14 @@ int sparx5_register_netdevs(struct sparx5 *sparx5)
> >  
> >  	for (portno = 0; portno < sparx5->data->consts->n_ports; portno++)
> >  		if (sparx5->ports[portno]) {
> > -			err = register_netdev(sparx5->ports[portno]->ndev);
> > +			struct net_device *ndev = sparx5->ports[portno]->ndev;
> > +
> > +			/* The MTU can only be changed when FDMA is used */
> > +			if (sparx5->fdma_irq > 0)
> > +				ndev->max_mtu = SPX5_MAX_FRAME_LEN - ETH_HLEN -
> > +						ETH_FCS_LEN;
> > +
> > +			err = register_netdev(ndev);
> >  			if (err) {
> >  				dev_err(sparx5->dev,
> >  					"port: %02u: netdev registration failed\n",
> 
> [Severity: High]
> This is a pre-existing issue, but if register_netdev() fails after
> earlier ports were registered, this returns without unregistering them.
> mchp_sparx5_probe() then skips sparx5_unregister_netdevs():
> 
> drivers/net/ethernet/microchip/sparx5/sparx5_main.c:mchp_sparx5_probe() {
>     ...
> 	err = sparx5_register_netdevs(sparx5);
> 	if (err) {
> 		dev_err(sparx5->dev, "Failed to register net devices\n");
> 		goto cleanup_ptp;
> 	}
>     ...
> cleanup_netdevs:
> 	sparx5_unregister_netdevs(sparx5);
> cleanup_ptp:
> 	sparx5_ptp_deinit(sparx5);
> cleanup_frame_io:
> 	sparx5_frame_io_deinit(sparx5);
>     ...
> }
> 
> sparx5_frame_io_deinit() frees the FDMA buffers while those ports are still
> registered. When devres later releases the netdevs, devm_free_netdev() ->
> free_netdev() hits BUG_ON(dev->reg_state != NETREG_UNREGISTERED).
> 
> This patch also adds ndo_change_mtu to those registered ports. During that
> window, sparx5_fdma_resize() can run under RTNL while the error path runs
> sparx5_frame_io_deinit() without RTNL.
> 
> Could both end up freeing and swapping the sparx5->rx/tx buffers at the
> same time? Once deinit sets fdma_irq to -ENXIO, the new callback returns
> -EOPNOTSUPP, so the race is limited to that window.
> 
> Should sparx5_register_netdevs() unregister the ports it has already
> registered before returning the error?
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

