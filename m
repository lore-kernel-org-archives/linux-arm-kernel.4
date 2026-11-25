Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TdjTtf1K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDXyQVo9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zoIAFYAcrw2In7mPsz0I79pd13SW8TJXMyFwyHpwC1k=; b=TdjTtf1KQwclSjzUMWgwm34Rw0
	XZRIhOeR1U4SRmiqQQcW35lf1xPuXht8+rkVsx/O6H0DJzjOA62OmcszTIBfrRPwGDKpacweQa+/7
	ZKUrbPevG2U/5TU92c/5EVqbh+gT5gZ7O/Cb+rx6aaLMAb74ZwvWewD4zaqtfDm4FoPhLh4s5CSGW
	nybmoNuUWRTDVDl+I8G30VBnGo2H2rjaxpVionTgmGUKRgMxzhIckmJXHqx+i2W6ErHwUGMNzO9uI
	gI2Exsvd9j4OCLhpRZHCtmPQUAElo0UFDUGc0kM9BRaMCGC6djq3P8ldMxFG9jgCDZ99JzV3Qzwvk
	6xS79iXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBr0-00000009mBR-4149;
	Wed, 25 Nov 2026 12:12:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBqz-00000009mB9-0q5d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:12:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A21B142AFE;
	Wed, 25 Nov 2026 12:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2691F000CA;
	Wed, 25 Nov 2026 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608720;
	bh=zoIAFYAcrw2In7mPsz0I79pd13SW8TJXMyFwyHpwC1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UDXyQVo9ECntjvpQbMJ/hC9fIhbVdR2aq4mM07ICQmsBluEJnMw5Ew6ycPsnPcXgN
	 NSnZ4LttzwNCF1DLgS0McSQRLtvQNhEzNGSnNHLG+BgTcnVqxQJOcYZq1ZNhpjwAOr
	 MK2gVwEXQyqOcgotezSvv4KSlBUnBdwn3K3/EtmDeyrXO4xqs+YFWmsjdhambuX9er
	 ikcTTeaXXypizqg0q02qJ9ssWdRN8Pt2dc06DXLDy+5vpiUzHAutcK2pK5wA+5OZ29
	 j9QCRqj4Qyp7IJZCUUd3iVqz7ichk2hcGRiOzEYJl1LikyJGa03l4rYeMuEu4CwvP3
	 l1+KJWq8amdPQ==
Date: Wed, 25 Nov 2026 12:11:53 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: m-malladi@ti.com, marco.crivellari@suse.com, kees+treewide@kernel.org,
	laixiangwu@cmss.chinamobile.com, philippe.schenker@impulsing.ch,
	haokexin@gmail.com, devnexen@gmail.com, jacob.e.keller@intel.com,
	sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
	danishanwar@ti.com
Subject: Re: [PATCH net-next 1/2] net: ti: icssg-prueth: Add multi-flow RX
 support with per-flow NAPI
Message-ID: <20261125121153.GU31322@horms.kernel.org>
References: <20261118184729.2302130-2-m-malladi@ti.com>
 <179537406410.3135.5804903978186343042@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179537406410.3135.5804903978186343042@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 07:01:04PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 19 potential
> issue(s) to consider.
> 
> Critical: 2 · High: 1 · Medium: 12 · Low: 4
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Critical] SR1 data RX path is out of bounds.
> - [Critical] SR1 management-channel buffers get invalid DMA addresses.
> - [High] On a running interface, a failed XSK enable/disable leaves the
>   flow half torn down, and the next ndo_stop then hangs or the driver…
> - [Medium] Multi-flow RX does not work on AM65x SR2 ('ti,am654-icssg-
>   prueth'), which uses NAVSS UDMA rather than PKTDMA, but the driver…
> - [Medium] SR1 management-channel teardown is incomplete compared with
>   before the patch.
> - [Medium] Misplaced error label in SR1 emac_ndo_open().
> - [Medium] An AF_XDP pool bound while the interface is down silently
>   stops working after ndo_open.
> - [Medium] All flows share one desc_pool, and the XSK runtime refill
>   budget comes from the pool-wide free count, which other CPUs change…
> - [Medium] The SR1 data-flow page pool is never destroyed.
> - [Medium] SR1 now gets an RX coalescing hrtimer but never cancels it.
> - [Medium] prueth_xsk_pool_disable() can return an uninitialised value.
> - [Medium] On a running interface, XSK enable/disable now reconfigures a
>   single flow while the shared UDMA RX channel stays enabled.
> - [Medium] Racy irq_disabled handling in prueth_destroy_rxq() and the
>   prueth_create_rxq() error path.
> - [Medium] RX drop and error counters can lose updates now that RX runs
>   in several NAPIs at once.
> - [Medium] A coalesce setting is not applied to RX flows added later.
> - [Low] The ethtool channel range does not match what SR1 implements.
> - [Low] In the SR1 mgm flow setup in emac_ndo_open(), the IRQ check is
>   wrong for the signed field.
> - [Low] Leftover field and mixed-in cleanups.
> - [Low] net: ti: icssg: missing skb_record_rx_queue() in RX packet paths

This is quite a list of issues. And I would appreciate if you could
respond to them as requested above. For patch 1/2, the four that look most
likely to require a respin are:

  - [Critical] SR1 data RX path is out of bounds.
  - [Critical] SR1 management-channel buffers get invalid DMA addresses.
  - [High] On a running interface, a failed XSK enable/disable leaves the
    flow half torn down, and the next ndo_stop then hangs or the driver...
  - [Medium] Multi-flow RX does not work on AM65x SR2 ('ti,am654-icssg-
    prueth'), which uses NAVSS UDMA rather than PKTDMA, but the driver...

Patch 2/2 likely needs attention as well, but I have not reviewed it.

-- 
pw-bot: changes-requested

