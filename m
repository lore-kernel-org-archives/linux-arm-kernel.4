Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w/7vOXsa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aW3ZCB/I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ASxibD7eZkzQFD1xdlQZW+ZvbrwHxv8p5UBEzGgjh6c=; b=w/7vOXsakx1/TT
	lDmKYWZFfcdNcGtPHwxP2jjAUE7c603bncV6NXaoCuxDJKn0zkQ+QSNeIK43lN+5CDCBcapJbkJ3y
	wi7Q81jhoAfa9CP2VGh03xOqCWDqtbZFaULqxz1zKzaci3581rQUPwFUy2yh2koqkuA4Y+2pVHlWV
	MxKWorPjQxQb78p25nuvGe3FuncmCoJeUz1S5wpynxGTWNfx7lpCRi3usSAy3r6m1yPk3k9xFc5Pj
	6N5F5GQFT88h6mxBEBXBoMiVa8MfKHbK7P8o6PHrgAN+ppv3ZWij1r2eNUqVqC1c3aI3HjWYxbML7
	QMaZcQCHPuiqYl9mc8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKJt-00000008UFo-17dB;
	Thu, 12 Nov 2026 02:13:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKJr-00000008UFi-2xw9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:13:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D606C609F8;
	Thu, 12 Nov 2026 02:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF0B1F00A05;
	Thu, 12 Nov 2026 02:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794449622;
	bh=ASxibD7eZkzQFD1xdlQZW+ZvbrwHxv8p5UBEzGgjh6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aW3ZCB/I5FqCT1QTrrYSfnW73l065oZNdZXhjvby7kHi1ZSkeVXLP3eqLlENLiHaP
	 iQnDSIrUQGyoKlO8Q1pv1kn0/pXGMJ0rgxkR9C+PI58GyHZBSvltR5SSAq9Qj5wdGQ
	 IgstssvDXsHNClcHzQTRvOI1pRqhUXqk9Ax9x/rHdZKWnuQYE50XfnKo20q5FqEUsu
	 RczCKoIqSWrmUv3KT65booOJnRKsVUN0XxVKa883AIUYHHRiEhye6H1ZVgId2lvGAa
	 jUaSporZwXBFSDy7qmpiNiMmXb8ql0dG6NcRcowuF3jut3t6FBSiYVBMtbhR/MH0ip
	 HGNU6c8gjHwLw==
Date: Wed, 11 Nov 2026 18:13:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, Nicolai Buchwitz
 <nb@tipi-net.de>
Subject: Re: [PATCH net-next v9] net: stmmac: rework stmmac_rx to support
 XDP rx multi-buff
Message-ID: <20261111181341.56706354@kernel.org>
In-Reply-To: <20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com>
References: <20261106-stmmac-rx-mb-v9-1-c099c923664b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 06 Nov 2026 11:54:19 +0100 Lorenzo Bianconi wrote:
> +static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
> +{
> +	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
> +	u32 metasize = xdp->data - xdp->data_meta;
> +	struct sk_buff *skb;
> +	u8 num_frags = 0;
> +
> +	if (unlikely(xdp_buff_has_frags(xdp)))
> +		num_frags = sinfo->nr_frags;
> +
> +	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
> +	if (!skb)
> +		return NULL;
> +
> +	skb_mark_for_recycle(skb);
> +	skb_reserve(skb, xdp->data - xdp->data_hard_start);
> +	skb_put(skb, xdp->data_end - xdp->data);
> +	if (metasize)
> +		skb_metadata_set(skb, metasize);
> +
> +	if (unlikely(xdp_buff_has_frags(xdp)))
> +		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
> +					  sinfo->xdp_frags_truesize,
> +					  xdp_buff_get_skb_flags(xdp));
> +	return skb;
> +}

This is almost identical to xdp_build_skb_from_buff(), why not use the
common code?

> +static void
> +stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *xdp,
> +		    bool allow_direct)
> +{
> +	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
> +	int i;
> +
> +	if (likely(!xdp_buff_has_frags(xdp)))
> +		goto out;
> +
> +	for (i = 0; i < sinfo->nr_frags; i++)
> +		page_pool_put_full_page(rx_q->page_pool,
> +					skb_frag_page(&sinfo->frags[i]),
> +					allow_direct);
> +out:
> +	page_pool_put_full_page(rx_q->page_pool, virt_to_head_page(xdp->data),
> +				allow_direct);
> +}
> +
> +static int stmmac_xdp_shrink_tail(struct stmmac_rx_queue *rx_q,
> +				  struct xdp_buff *xdp, int offset)
> +{
> +	struct skb_shared_info *sinfo;
> +	int i;
> +
> +	if (unlikely(offset < 0 ||
> +		     offset > (int)xdp_get_buff_len(xdp) - ETH_HLEN))
> +		return -EINVAL;
> +
> +	if (likely(!xdp_buff_has_frags(xdp))) {
> +		xdp->data_end -= offset;
> +		return 0;
> +	}
> +
> +	sinfo = xdp_get_shared_info_from_buff(xdp);
> +	for (i = sinfo->nr_frags - 1; i >= 0 && offset > 0; i--) {
> +		skb_frag_t *frag = &sinfo->frags[i];
> +		int delta = min_t(int, offset, skb_frag_size(frag));
> +
> +		if (delta == skb_frag_size(frag)) {
> +			/* The whole frag is consumed by the strip: return it
> +			 * to the page pool right away. Its ring slot still
> +			 * carries the page DMA address until stmmac_rx_refill()
> +			 * re-arms it at the end of the NAPI poll. This is
> +			 * safe because HW cannot touch the slot until then.
> +			 */
> +			page_pool_put_full_page(rx_q->page_pool,
> +						skb_frag_page(frag), true);
> +			sinfo->nr_frags--;
> +			sinfo->xdp_frags_truesize -= xdp->frame_sz;
> +		} else {
> +			skb_frag_size_sub(frag, delta);
> +		}
> +
> +		sinfo->xdp_frags_size -= delta;
> +		offset -= delta;
> +	}
> +
> +	if (unlikely(!sinfo->nr_frags)) {
> +		xdp_buff_clear_frags_flag(xdp);
> +		xdp_buff_clear_frag_pfmemalloc(xdp);
> +		xdp->data_end -= offset;
> +	}
> +
> +	return 0;
> +}

These two OTOH could easily become new common helpers, they seem to do
nothing stmmac specific?

