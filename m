Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFAB606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbkChZ6e;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hs6HABx6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=97Oq3h61nNGl6LLTRfZVkFwajsAV8PVh6RmhEZUOMCg=; b=IbkChZ6eH7jxH2CX9TUqAR2vD3
	CIUCy/kicLRiKnYGQrrAH+ZiQLQyRKyAVfXBJktQWRZXkp1dO0RWvO4wFM1mG0AESKJU35IDY9qgn
	XDfRpGkH+y2y+v+egNFa33kyQC/I+K/33p/bsX4/2PLyBrTB61utnxo4igTZkTXlGKfL3GULr2jf7
	fhWY0mfL2F7fhqMKDj+rF2EmbKzVMPJxZ7zNPeMgOKqcbzfcsrW6tBXGb3SQ3I5zx9SdEIb3asg5W
	CRZ38FCX84OOlf+z/vQtMCsPFmDHGydfcF7uY0jU9UMAQ6O+c+5YDc7JCm/IjgkwBau1H6Wd+4tUw
	lzwPhTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHIC-0000000HLov-2sBw;
	Mon, 09 Nov 2026 04:47:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHIB-0000000HLoT-0omK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:47:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3738A6133D;
	Mon,  9 Nov 2026 04:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE3D1F0089F;
	Mon,  9 Nov 2026 04:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794199657;
	bh=97Oq3h61nNGl6LLTRfZVkFwajsAV8PVh6RmhEZUOMCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hs6HABx6vSELnk8cm8cfChFZua9xIEEKQSWqtTW3oajmjkrUSCvrgq4t5l8WsC7Rx
	 pflLZ5C2RQn6HdR9sdt83Ms2z4k2JpnezxZ0e7hAmX8wt5MVWaylh7v+nczzOnWVvB
	 hqA2oIYUCYmQVtFChOPf32RZgdxLNKKu/tuRiiSXrXXcVKF7CzlxMMTQHexPiRBeeg
	 yOXWEruDQzzACNv+JgXdSAyd8XJh7YjOX7beBZVA/4c7Tkx3UHvHV4FlLo5ecnpVyI
	 QHIYAbKkawSNiirr8MQtbYosZBdXZHdpVfmC0ZrNgrKc3f+5qLxJWXjFkj0oGVEt/B
	 2cqLDZq1IrTEA==
Date: Mon, 9 Nov 2026 12:27:24 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Disable checksum insertion for XDP frame TX
Message-ID: <avFLrDFxQdj4mbpN@xhacker>
References: <20260929121025.20821-1-jszhang@kernel.org>
 <f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
 <atn0mF-dukVTK6Lh@xhacker>
 <741319db-17fb-4768-8606-9105df6bf905@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <741319db-17fb-4768-8606-9105df6bf905@lunn.ch>
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

On Thu, Oct 22, 2026 at 03:54:54PM +0200, Andrew Lunn wrote:
> On Thu, Oct 22, 2026 at 07:33:44PM +0800, Jisheng Zhang wrote:
> > On Tue, Sep 29, 2026 at 10:29:14PM +0200, Andrew Lunn wrote:
> > > On Tue, Sep 29, 2026 at 08:10:25PM +0800, Jisheng Zhang wrote:
> > > > stmmac enables TX checksum insertion for XDP frames whenever the queue
> > > > supports it. XDP frames carry no TX checksum offload request, so this
> > > > can overwrite a checksum already present in the packet.
> > > > 
> > > > Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
> > > > so that the packet is sent with its checksum fields unchanged.
> > > 
> > > This seems odd to me.
> > > 
> > > If the frame contains a checksum, it is either correct, and the
> > > hardware calculated one will come out the same, not an issue.  Or the
> > > checksum in the frame is actually wrong, because the frame has got
> > > mangled by eBPF before sending it out, and you want the hardware to
> > > calculate the correct value.
> > > 
> > > What an i missing?
> > > 
> > Hi Andrew and all,
> > 
> > some discussions happened in below thread
> > https://lore.kernel.org/netdev/athAoWfW-xesPhFP@xhacker/
> > 
> > Since it has been merged. Let's move the discussion back to my patch.
> > 
> > AIUI, dwmac can only do HW checksum for normal particular packets
> > layouts, such as TCP, UDP etc. The stmmac_has_ip_ethertype() has
> > well demostrated this limitation.
> > Different with normal tx where the common stack supplies the skb->ip_summed
> > metadata, XDP path doesn't have the necessary metadata. So to make
> > the XDP always work properly when transmiting tranmist arbitrary Eth
> > frames, dwmac HW csum needs to be disabled by default currently.
> 
> I don't know the XDP code. But...
> 
> Zoom out, look at the big picture:
> 
> What do other MAC drivers does? Do they also disable hardware checksum
> when XDP is enabled on a queue?

I checked ixgbe and i40e. AIUI, their ordinary XDP tx paths don't
request checksum insertion: ixgbe_xmit_xdp_ring() leaves the checksum
offload bits clear, and i40e_xmit_xdp_ring() supplies no checksum
command or header offsets.

So this patch likewise changes the descriptor for each XDP frame. NOTE,
it doesn't disable checksum for normal skb transmissions.

Also disabling insertion doesn't introduce an automatic software
checksum calculation. An unchanged forwarded pkt already has its
checksum. If an XDP prog modifies checksum-covered fields, it's
responsible for updating the checksum.

> 
> Should XDP actually have the needed meta data? Can it be added in a
> low overhead way? Does the overhead of having it cost less than
> forcing software check sums?

This needs XDP common code path changes, I think, it needs a separate
discussion.

