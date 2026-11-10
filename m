Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61D606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAz9j5VX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwFeguy7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C5jgHy1nXhTFAfsOl+lfPzRSNERj7WQscjo2eO2ih+g=; b=pAz9j5VXRZsY+w/16BSiw5eNca
	nEEXTXTQTpP2JNIPEKFarNc6QudbrGjvneu1mOdHzxrHqicessdnYOqDUrQOg8pHZwAX+saxikJhE
	hSyr2u+RT0ruH3zEZo9WijpJ/UdZyfetwAOrJjh7vJyHdOwKA9JDGcHB61WK+TurPS8y3LEycZrrC
	tbawppBDyaO/Zq1miLH7AaWI/T9FtA9tJ2vHrICk02NiOHDHhPAuxUJUdE7pKimw4BkqCvCOCrccN
	raSedfMrQxxjOYvee6ol/3bcbAo4vbQm4ooAGprhAaHS/DKdCDjVRMFGbKDNmSF2CKBHfLEzGjkJW
	Axrp4GRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmIy-0000000484o-3nau;
	Tue, 10 Nov 2026 13:54:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQmIw-0000000484c-39XA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:54:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD5B66377C;
	Tue, 10 Nov 2026 13:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844621F0089F;
	Tue, 10 Nov 2026 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794318869;
	bh=C5jgHy1nXhTFAfsOl+lfPzRSNERj7WQscjo2eO2ih+g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XwFeguy7OAl2B0xbZEZf+YNpbRPun6Uxy12IDapJUugAkfnMkJMQWrACI3LnYamvS
	 sZ7QpagwdZSe2JBSLE/lYuBRyfQnngmWmP6ZH3stPJyDv6Rg7qptN27/8L8uX1Fvf+
	 zT2GiHGpAI8WdjU0Nx1Pyc+3Guh5HO2o5ewC8vA7wigAewUpzEcQIjSnGCAzyvJQ/v
	 sVSxam0PSbINufDpdJBaTDu2mBq7kmD513kzL7LTM/dwxDYrdBxnLv7AHU6cqE86PR
	 Sn4WjxxefUuJelWxydwRIVb6dHLsocUJGeARSLJdiZZ3duTvqAkZIZjq0ZH3306O78
	 roJsnXIWaMIAw==
Subject: Re: [PATCH net-next v9] net: stmmac: rework stmmac_rx to support XDP
 rx multi-buff
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org, nb@tipi-net.de
Date: Tue, 10 Nov 2026 13:54:28 +0000
Message-ID: <179431886808.994134.6784700644892681429@kernel.org>
In-Reply-To: <20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com>
References: <20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The skb head truesize grows on every received frame, including
  with no XDP program loaded, and the commit message does not say so.
- [Low] The commit message overstates one change.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  makes it wider.

--

net: stmmac: rework stmmac_rx to support XDP rx multi-buff

This reworks stmmac_rx() to collect all the descriptors of a frame into an
xdp_buff, so programs with frags support see the whole packet. On XDP_PASS
the skb is built from the xdp_buff head and its fragments. The patch also
saves the in-progress xdp_buff in rx_q->state across NAPI polls, advertises
NETDEV_XDP_ACT_RX_SG, and strips the FCS with a driver-local tail shrink.

> - carry the XDP metadata written with bpf_xdp_adjust_meta() into the skb
>   via skb_metadata_set(), so it is no longer dropped and TC/BPF programs
>   can read it through data_meta;

[Severity: Low]
Is this item accurate? The XDP_PASS path in stmmac_rx() already did this
before the patch. The patch removes these lines from stmmac_rx():

-			metasize = ctx.xdp.data - ctx.xdp.data_meta;
-			if (metasize)
-				skb_metadata_set(skb, metasize);

The same logic now lives in stmmac_build_skb().

Metadata on linear frames was not being dropped before. The only frames
that never got metadata were multi-descriptor or buf2 frames, and XDP mode
dropped those outright. The commit message already covers that elsewhere.

Could this item be reworded so it does not read as a fix for a metadata
loss bug?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a2177777727ef..c215cc70caa19 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -2290,10 +2294,6 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>  			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
>  	num_pages = DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
>  
> -	rx_q->queue_index = queue;
> -	rx_q->priv_data = priv;
> -	rx_q->napi_skb_frag_size = num_pages * PAGE_SIZE;
> -
>  	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
>  	pp_params.pool_size = dma_conf->dma_rx_size;
>  	pp_params.order = order_base_2(num_pages);
> @@ -2321,6 +2321,10 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>  	if (!addr)
>  		return -ENOMEM;
>  
> +	rx_q->queue_index = queue;
> +	rx_q->priv_data = priv;
> +	rx_q->napi_skb_frag_size = PAGE_SIZE << pp_params.order;
> +

[Severity: Medium]
Does this change the skb head truesize for every received frame, even when
no XDP program is attached?

Before the patch the head size was num_pages * PAGE_SIZE. Now it is rounded
up to the page_pool allocation order, and skb->truesize is derived from it
here:

stmmac_rx()
	bufsz = rx_q->napi_skb_frag_size;
	...
	xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);

stmmac_build_skb()
	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);

On 4K pages, a dma_buf_sz of 8188 (BUF_SIZE_8KiB) gives num_pages = 3, so
the head grows from 12K to 16K. A dma_buf_sz of 16368 (BUF_SIZE_16KiB)
gives num_pages = 5, so the head grows from 20K to 32K.

That shrinks the effective socket receive buffer for jumbo MTU users who
never load XDP. The commit message calls out the fragment truesize change
as a behavior change, but not this one. Should this be mentioned too?

[ ... ]

> @@ -5962,120 +6073,79 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)

[ ... ]

> +		skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
> +		/* For Not XDP_PASS verdict */
> +		if (IS_ERR(skb)) {
> +			unsigned int xdp_res = -PTR_ERR(skb);
> +
> +			if (xdp_res & STMMAC_XDP_CONSUMED) {
> +				stmmac_xdp_put_buff(rx_q, &ctx.xdp, true);
> +				rx_dropped++;
> +			} else if (xdp_res & (STMMAC_XDP_TX |
> +					      STMMAC_XDP_REDIRECT)) {
> +				xdp_status |= xdp_res;
> +			}
> +			goto next;
> +		}

[Severity: High]
This isn't a bug introduced by this patch, but multi-buffer frames can now
reach XDP_TX, which makes it worse. Does XDP_TX completion recycle pages
into this RX queue's page_pool direct cache from the wrong NAPI context?

stmmac_xdp_xmit_back() picks the TX queue by CPU, not by RX queue:

stmmac_xdp_get_tx_queue()
	while (index >= priv->plat->tx_queues_to_use)
		index -= priv->plat->tx_queues_to_use;

Completion then runs in that channel's tx_napi:

stmmac_napi_poll_tx()
  stmmac_tx_clean()
    xdp_return_frame_rx_napi(xdpf)
      __xdp_return(..., napi_direct=true)    /* head and every frag */
        page_pool_put_unrefed_netmem(..., allow_direct=true)
          page_pool_recycle_in_cache()

stmmac_tx_clean() {
	...
		if (xdpf &&
		    tx_q->tx_skbuff_dma[entry].buf_type == STMMAC_TXBUF_T_XDP_TX) {
			xdp_return_frame_rx_napi(xdpf);
	...
}

When allow_direct is already true, page_pool_put_unrefed_netmem() skips the
page_pool_napi_local() check. That means pool->alloc.cache and
pool->alloc.count are updated without a lock.

The tx_napi is a separate NAPI instance from the rx_napi that owns the
pool. Meanwhile the owning rx_napi can be on another CPU running
stmmac_rx_refill() or the allow_direct=true puts in stmmac_xdp_put_buff(),
stmmac_build_xdp_frags() and stmmac_xdp_shrink_tail().

Can this corrupt the alloc cache? If so, the same page could be handed to
two RX descriptors, or recycled while an skb still holds it.

The race dates back to XDP_TX support. With this patch, though, each
XDP_TX frame can push the head plus several fragment pages down this path.
Would returning XDP_TX frames with xdp_return_frame() in stmmac_tx_clean()
avoid this?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106-stmmac-rx-mb-v9-1-c099c923664b%40oss.qualcomm.com

