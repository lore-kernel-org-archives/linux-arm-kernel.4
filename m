Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD36606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UjG4bQvL;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=hiHKy9P9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zyqJRAMtWY32BYL/u/7jM8D0VpA5LMH5xunK6iIg3N8=; b=UjG4bQvLfBCDOpiLughDXkLB8T
	OYvpgmx6gn5l/IZKPduAgxF/dTgTgJhX+Y9F6qPoXMtIDIxbMVh/Y6LmlK7txx05W6tEUN4TymYQr
	dWI5YdLgDScSGNLxSnyEErltU0wgpPObuxDnmtnGqNVPykSAAlY28+1MTDLO7DlEGrtsLTIe3Gpjd
	l1coxYtp1PqpDRp8AN4I4Qs14ASYTb2qC7ouNO7ktn+qVPnHNynPGeKZb5Y5P4TndNwqLZIoNl3JE
	UpvUqEMlDtFFGH54beshccTX48CJl1IWLp5Hv7xHLhDqoWu0mSkqmkokVN0B7+ABJn5konVhcgPi/
	iJhglLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmCQ-0000000BxyQ-36gn;
	Fri, 13 Nov 2026 07:59:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmCM-0000000Bxxi-47cB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794556798; x=1826092798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Wf/GdgZT5AvyJaH+VqPN1515v3dOe8ZZKeyFfPTFoG8=;
  b=hiHKy9P9fEHXh/tVRvNmNemxBrG3Vc9PgLFuRUqH9iA+K7O2CqVN8X1W
   0czev0H9hEYS5x2uVuEdr0ELDykVtIyv5KZtkq8ySUji5n0zqfexQ6pKL
   PzTb8HcEfYDymIjzUql3bBk0y6QC4h3fWzjVzpjADhMCzpWdDFjV8iscJ
   Q62D618T9MIxKtx+6DNGsuDuw9j74FcjZSsb1GT0ehscxn9O25ELLPGgU
   JWLqWely/v/y1QLTi6w8TQThV2omUZ4GbU5QIyw2qLSnGhaZLZ315kqLx
   5i9BjKJcGsjNaO+J03eHYKGpYyyx3UNoiMYFN3uxAK1iRxPZq5NT36C0y
   w==;
X-CSE-ConnectionGUID: 76abFsNcRyCWBmv3he/oHA==
X-CSE-MsgGUID: iAxiAinjQBGdOa4AGNbB7A==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="297872081"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2026 00:59:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 13 Nov 2026 00:59:49 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 00:59:46 -0700
Date: Fri, 13 Nov 2026 08:59:46 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next v2 2/9] net: sparx5/lan969x: free the FDMA
 buffers on init errors and deinit
Message-ID: <20261113075946.fptcvcesbmjlahpc@DEN-DL-M70577.microsemi.net>
References: <20261111-sparx5-mtu-change-v2-2-59c91357e8f6@microchip.com>
 <179450479633.2199510.4808333993834819818@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179450479633.2199510.4808333993834819818@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_235951_036528_CC033D12 
X-CRM114-Status: GOOD (  51.48  )
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

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] On lan969x, the ownership tracking for RX pages is still
>   incomplete in the free_page error path of lan969x_fdma_rx_get_frame().
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but both NAPI
>   handlers ignore the return value of fdma_dcb_add() when they refill RX…
> 
> --
> 
> net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
> 
> This patch adds sparx5_fdma_rx_free(), lan969x_fdma_rx_free() and
> lan969x_fdma_tx_free(). They release the RX skbs/pages, the page_pool,
> the TX buffer state and the in-flight TX buffers on init error paths and
> on deinit. It also checks the return value of fdma_dcbs_init() for RX,
> and stores the mapped TX length so it no longer reads skb->len.
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> > index 053d125eda658..8e0f1ddcbf2c4 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> 
> [ ... ]
> 
> > @@ -90,12 +90,29 @@ static void lan969x_fdma_free_pages(struct sparx5_rx *rx)
> >  	struct fdma *fdma = &rx->fdma;
> >  
> >  	for (int i = 0; i < fdma->n_dcbs; ++i) {
> > -		for (int j = 0; j < fdma->n_dbs; ++j)
> > +		for (int j = 0; j < fdma->n_dbs; ++j) {
> > +			if (!rx->page[i][j])
> > +				continue;
> > +
> >  			page_pool_put_full_page(rx->page_pool,
> >  						rx->page[i][j], false);
> > +			rx->page[i][j] = NULL;
> > +		}
> >  	}
> >  }
> 
> [Severity: High]
> Is a non-NULL slot here always a page that the driver still owns?
> 
> lan969x_fdma_rx_get_frame() takes its free_page error path when
> WARN_ON(!port) fires or build_skb() fails:
> 
> free_page:
> 	page_pool_recycle_direct(rx->page_pool, page);
> 
> 	return NULL;
> 
> That returns the page to the pool, but
> rx->page[fdma->dcb_index][fdma->db_index] still points at it.
> lan969x_fdma_napi_poll() then breaks out of the loop without advancing
> or refilling that DB:
> 
> 		skb = lan969x_fdma_rx_get_frame(sparx5, rx);
> 		if (!skb)
> 			break;
> 
> On a later teardown through
> lan969x_fdma_deinit()->lan969x_fdma_rx_free()->lan969x_fdma_free_pages(),
> wouldn't page_pool_put_full_page() run on that stale slot a second time?
> 
> A page in the pool cache still has pp_ref_count == 1. So
> page_pool_unref_netmem() takes the second put as the last reference and
> recycles the page again, this time into the ptr_ring, while it also
> sits in the alloc cache. page_pool_destroy() would then DMA-unmap the
> page twice and call put_page() on it twice.
> 
> The commit message says:
> 
>   "To know which RX buffers are still owned by the driver, clear the RX
>   buffer slot once the buffer has been passed to the stack on Sparx5, and
>   make lan969x_fdma_free_pages() skip and clear the empty slots of the
>   ring."
> 
> However, lan969x does not clear any slot at this commit. A later patch
> in the series, "net: sparx5/lan969x: add support for resizing the FDMA
> buffers", fixes the success path: it sets rx->page[...] = NULL before
> returning the skb. The free_page path still leaves the slot set there.
> 
> That later patch also adds lan969x_fdma_resize(), which calls
> lan969x_fdma_rx_free() on an MTU change. After it, the double put can
> happen without an unbind.
> 
> Separately, and this part predates the patch: the stuck DB stays DONE,
> so the next poll processes the same, already recycled page again. If
> build_skb() succeeds that time, the stack gets an skb on a page that
> the refill can hand straight back to the hardware.
> 
> Would it work to set rx->page[fdma->dcb_index][fdma->db_index] = NULL
> after page_pool_recycle_direct()? The poll loop would also need to
> consume or refill that DB, or reuse the page in place, instead of
> recycling the page while the DB still references it.

I believe this issue is being addressed on net by Zhang Hewei [1]. I asked for
changes on v3, but no response so far, so I see three options:

  1) Wait for Zhang to eventually post a v4.
  2) Send a follow-up fix for this, in case Zhang does not.
  3) Incorporate the fix in v3 of this series.

Either of these works for me, but as I dont know if a v4 is ever sent and how
many respins that fix will require, it'll probably be fastest for me with 2) or
3)

BTW. The high severity issues on patch #6 and #9 have the same root cause as
this. So my response to those are the same as this.

[1] https://lore.kernel.org/netdev/tencent_6BAC076E552C6F338052FC02794D9B28ED0A@qq.com/
[2] https://lore.kernel.org/netdev/20261110105239.5olhrlwa3mck74f4@DEN-DL-M70577/

> 
> [ ... ]
> 
> > @@ -169,14 +186,18 @@ static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5)
> >  		return PTR_ERR(rx->page_pool);
> >  
> >  	err = fdma_alloc_coherent(sparx5->dev, fdma);
> > -	if (err)
> > +	if (err) {
> > +		page_pool_destroy(rx->page_pool);
> >  		return err;
> > +	}
> >  
> > -	fdma_dcbs_init(fdma,
> > -		       FDMA_DCB_INFO_DATAL(fdma->db_size),
> > -		       FDMA_DCB_STATUS_INTR);
> > +	err = fdma_dcbs_init(fdma,
> > +			     FDMA_DCB_INFO_DATAL(fdma->db_size),
> > +			     FDMA_DCB_STATUS_INTR);
> > +	if (err)
> > +		lan969x_fdma_rx_free(sparx5);
> >  
> > -	return 0;
> > +	return err;
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but the same allocation
> failure is still unchecked when the RX DCBs are refilled at runtime. The
> patch only adds the check at init time.
> 
> lan969x_fdma_napi_poll() ignores the return value of fdma_dcb_add():
> 
> 		fdma_dcb_add(fdma,
> 			     old_dcb,
> 			     FDMA_DCB_INFO_DATAL(fdma->db_size),
> 			     FDMA_DCB_STATUS_INTR);
> 
> So does sparx5_fdma_napi_callback() in sparx5_fdma.c:
> 
> 		fdma_dcb_add(fdma, fdma->dcb_index,
> 			     FDMA_DCB_INFO_DATAL(fdma->db_size),
> 			     FDMA_DCB_STATUS_INTR);
> 
> __fdma_db_add() in fdma_api.c writes the status, with DONE cleared,
> before it calls the dataptr callback:
> 
> 	db->status = cpu_to_le64(status);
> 
> 	err = cb(fdma, dcb_idx, db_idx, &dataptr);
> 	if (unlikely(err))
> 		return err;
> 
> Suppose page_pool_dev_alloc_pages() in lan969x_fdma_rx_dataptr_cb() or
> the GFP_ATOMIC __netdev_alloc_skb() in sparx5_fdma_rx_dataptr_cb()
> fails. __fdma_dcb_add() then returns before it links the DCB or updates
> fdma->last_dcb. The next successful add links around that DCB, so the
> hardware skips it.
> 
> Once dcb_index wraps around to that DCB, fdma_has_frames() and
> fdma_db_is_done() return false. Would both NAPI handlers then stop at
> that DCB on every poll? The hardware would fill the remaining DCBs, but
> nothing would consume or refill them, and CPU RX would stay stalled
> until the driver is rebound.
> 
> This code is unchanged through the end of the series.
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-sparx5-mtu-change-v2-0-59c91357e8f6%40microchip.com

