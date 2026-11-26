Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnRA/iRv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhWvMs/7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BCdHGJp82IQM22hQ2Wqg/5L0lUHyT6/T/gJH8BjyT0o=; b=gnRA/iRv0KVPRaUMH6nGyzUF/1
	+OMiR43jc1E0DxBeJpqSsVrw+j9Vc08y/Eu6s2JFsT29cSTHcLYtCJSELN9H4gpk8hAavWalEKV+6
	fdwuByXMUMM7B3fXI3vbPhz7r6cHqwi6PdGD1uQSaQuTyAAdZzaQjXEz4MWF7NdXttyaq0QnuIPX2
	tKosKCkJjWTwxQDmzX0fLuYGWE9Urc3x+EL9A3YUowjnKDJX49L3+LiFfmF5lbOW8g1oZupQpF4VW
	mZAFrPzCIOWXWPd/DdRk+0ILjOmbR2o/qa5pUSUm90j3EzM4CRSVAAVgogFj1kbtNydL/fYB/rnKt
	UZAXxHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbLs-0000000Dj9s-0Wyf;
	Thu, 26 Nov 2026 15:25:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbLo-0000000Dj8D-4BQO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:25:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE6E24169C;
	Thu, 26 Nov 2026 15:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DE61F000CA;
	Thu, 26 Nov 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706732;
	bh=BCdHGJp82IQM22hQ2Wqg/5L0lUHyT6/T/gJH8BjyT0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZhWvMs/7JK6zkWUKM5XM4vSRCW44q9letrqUunmnuhC1f5wKSR6g8O5rrr4Q7JjfT
	 f/DaUYqBgTKBhzsVzSBHfEQ0NN2hmQkirtG6pVjZ/HScmBdNprHuqHhGIkQN7sBlli
	 W8FuRdw0w4cpu7UKrGRXvw/CW/s8C4m9x7a86Wqu1cz3xgTQydlliYBZ8Mzfq4R32V
	 hh9DVCn+WNA9YPjQeXtsxKhOpa8T4MdXAxYW1le/QQylf42UITE3V4jBEurDAuA5AM
	 MB5UNy0Y8ZJkmDxuq6c7UXI9dubhXj4Ed26ieEr8WP98kO+PlIiw7jMvUvG+128gAP
	 z4lYGCfH0qyrw==
Date: Thu, 26 Nov 2026 15:25:25 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: netdev-bot+sashiko@kernel.org, marco.crivellari@suse.com,
	kees+treewide@kernel.org, laixiangwu@cmss.chinamobile.com,
	philippe.schenker@impulsing.ch, haokexin@gmail.com,
	devnexen@gmail.com, jacob.e.keller@intel.com, sdf@fomichev.me,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, vigneshr@ti.com, danishanwar@ti.com
Subject: Re: [PATCH net-next 1/2] net: ti: icssg-prueth: Add multi-flow RX
 support with per-flow NAPI
Message-ID: <20261126152525.GD31322@horms.kernel.org>
References: <20261118184729.2302130-2-m-malladi@ti.com>
 <179537406410.3135.5804903978186343042@kernel.org>
 <20261125121153.GU31322@horms.kernel.org>
 <0eed48e6-c525-4274-afd9-c42d99d860d5@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0eed48e6-c525-4274-afd9-c42d99d860d5@ti.com>
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

On Thu, Nov 26, 2026 at 11:29:43AM +0530, Meghana Malladi wrote:
> Hi Simon,
> 
> On 11/25/26 17:41, Simon Horman wrote:
> > On Sun, Nov 22, 2026 at 07:01:04PM +0000, netdev-bot+sashiko@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 19 potential
> > > issue(s) to consider.
> > > 
> > > Critical: 2 · High: 1 · Medium: 12 · Low: 4
> > > 
> > > If you believe none of the issues are legitimate, please reply to each
> > > issue of Medium severity or higher and explain why the AI is wrong.
> > > If any of them are legitimate and you plan to respin, please let patchwork
> > > know by including "pw-bot: cr" as a separate line at the end of your reply
> > > (one such reply per series is enough).
> > > 
> > > - [Critical] SR1 data RX path is out of bounds.
> > > - [Critical] SR1 management-channel buffers get invalid DMA addresses.
> > > - [High] On a running interface, a failed XSK enable/disable leaves the
> > >    flow half torn down, and the next ndo_stop then hangs or the driver…
> > > - [Medium] Multi-flow RX does not work on AM65x SR2 ('ti,am654-icssg-
> > >    prueth'), which uses NAVSS UDMA rather than PKTDMA, but the driver…
> > > - [Medium] SR1 management-channel teardown is incomplete compared with
> > >    before the patch.
> > > - [Medium] Misplaced error label in SR1 emac_ndo_open().
> > > - [Medium] An AF_XDP pool bound while the interface is down silently
> > >    stops working after ndo_open.
> > > - [Medium] All flows share one desc_pool, and the XSK runtime refill
> > >    budget comes from the pool-wide free count, which other CPUs change…
> > > - [Medium] The SR1 data-flow page pool is never destroyed.
> > > - [Medium] SR1 now gets an RX coalescing hrtimer but never cancels it.
> > > - [Medium] prueth_xsk_pool_disable() can return an uninitialised value.
> > > - [Medium] On a running interface, XSK enable/disable now reconfigures a
> > >    single flow while the shared UDMA RX channel stays enabled.
> > > - [Medium] Racy irq_disabled handling in prueth_destroy_rxq() and the
> > >    prueth_create_rxq() error path.
> > > - [Medium] RX drop and error counters can lose updates now that RX runs
> > >    in several NAPIs at once.
> > > - [Medium] A coalesce setting is not applied to RX flows added later.
> > > - [Low] The ethtool channel range does not match what SR1 implements.
> > > - [Low] In the SR1 mgm flow setup in emac_ndo_open(), the IRQ check is
> > >    wrong for the signed field.
> > > - [Low] Leftover field and mixed-in cleanups.
> > > - [Low] net: ti: icssg: missing skb_record_rx_queue() in RX packet paths
> > 
> > This is quite a list of issues. And I would appreciate if you could
> > respond to them as requested above. For patch 1/2, the four that look most
> > likely to require a respin are:
> > 
> >    - [Critical] SR1 data RX path is out of bounds.
> >    - [Critical] SR1 management-channel buffers get invalid DMA addresses.
> >    - [High] On a running interface, a failed XSK enable/disable leaves the
> >      flow half torn down, and the next ndo_stop then hangs or the driver...
> >    - [Medium] Multi-flow RX does not work on AM65x SR2 ('ti,am654-icssg-
> >      prueth'), which uses NAVSS UDMA rather than PKTDMA, but the driver...
> > 
> > Patch 2/2 likely needs attention as well, but I have not reviewed it.
> > 
> 
> Yes, I am working on addressing the issues for both patches. There's been a
> gap in my upstreaming work and I've gotten a bit rusty, so I'm picking
> things back up slowly.
> 
> I am a bit confused about the bot reviews here. I receive reviews from two
> bots—sashiko-bot and netdev-bot_sashiko—and both provide a different set of
> comments. For every patch series I post, should I wait for reviews from both
> of them before posting the next version? Also, one expects a response while
> the other doesn't. Should I respond only to the one that asks, or to both?

I suggest focussing on the one that asks.

> Additionally, how do I ensure that any comments I skip (false positives) are
> not flagged by Sashiko again?

I think Sashiko is getting better there.
But I for one do try to examine mailing list history in this regard.

