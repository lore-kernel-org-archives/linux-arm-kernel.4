Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27662606D812
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZojygZ9W;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJGDUGFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R9mxM4jj9umMgpGEnC3ywyFmHTkF33AVyWG7Zk844IE=; b=ZojygZ9Wb8PzXqKfw1cIU6M7k3
	qk893mpw8y5WLNyOOb+i0zS3YXHakpuu2o1QxkAiDX/l6c8Ni82hn2B2V11oTWI9B5DPmWQ/4wNWt
	tbqbKUrq8xMJT3qFlk8dTKjUtLRKg8mzHWtnHo3JtTRXotFotsoOSpMnsDghGZdSRMkXfW4QwXTmn
	wx8RnscwogkwIGhYHGxnUB/BEYC1xa59ihlVgjtetpYprIJM3jFyAUrtIGf2OTU1vmSre990EIo4A
	D9VZ5AQ2/Ii52VyEyNWp8EkEZBXy/qBHN9ziCrOkuYKQlp9svOp5djZBENZKGeJE2fQt4Qs/MdAS8
	5kGcgXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPoSe-0000000FRsV-42ZM;
	Sat, 07 Nov 2026 22:00:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPoSd-0000000FRsJ-1WvX;
	Sat, 07 Nov 2026 22:00:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B432E43D43;
	Sat,  7 Nov 2026 22:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9BA1F0089F;
	Sat,  7 Nov 2026 22:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794088830;
	bh=R9mxM4jj9umMgpGEnC3ywyFmHTkF33AVyWG7Zk844IE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BJGDUGFMJe2pGxq+tPXY5B/2pUVIbR0qIdoNuJBE36kppS7P4bakHEMXwc1lLnznC
	 0LtswL9qQkT7s8mpn4zp/XC96TTPeIkBihLgAst9ZtUAPDnuGj7x4OGBRaCtBDf8Jh
	 4VNO4bm9jGh9fMhJmGMb60bRQdapfG13MwECWc1vBGnbCaFRUJ8wi5U1lw8HC4UURq
	 KoXqNhLU0sTuRW+zFiF6Jw5mD87pFynMF0N0DKxvKW2iRcJn6ofibSSCGOCv7WfFN+
	 lmgh6PNw80pZYdWLereKkRSya8xC3+RT8p7rOy+4SSOSb0jXJYrw2/eUPOLcClaW5A
	 ltoreifmz8HAQ==
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Cc: netdev@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 mason-cw.chang@mediatek.com, frank-w@public-files.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 22:00:29 +0000
Message-ID: <179408882923.994134.9885831030402062778@kernel.org>
In-Reply-To: <patch-79206c12217411fcdbff905b65eecfb2@loljews.com>
References: <patch-79206c12217411fcdbff905b65eecfb2@loljews.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The page_pool gate added in mtk_rx_alloc()
  (drivers/net/ethernet/mediatek/mtk_eth_soc.c:2827) checks…
- [Low] The commit message gives the reason for the gate as "On NETSYS v2
  and later every RX ring gets a page_pool ... The HW-LRO ring already…

--

net: ethernet: mtk_eth_soc: skip page_pool

With this change, mtk_rx_alloc() creates a page_pool for an RX ring only
when ring->frag_size fits in PAGE_SIZE. Rings with larger buffers fall
back to the existing netdev_alloc_frag()/mtk_max_lro_buf_alloc() path.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index ad0fdc4133fb6..29370376f0322 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2819,7 +2819,12 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>  	if (!ring->data)
>  		return -ENOMEM;
>  
> -	if (mtk_page_pool_enabled(eth)) {
> +	/* page_pool hands out order-0 pages and the pool is created with
> +	 * MTK_PP_MAX_BUF_SIZE, so only rings whose buffers fit in a page can
> +	 * use it.  The larger rings (HW-LRO, and 9K jumbo once enabled) take
> +	 * the netdev_alloc_frag()/mtk_max_lro_buf_alloc() path below.
> +	 */

[Severity: Low]
Is the HW-LRO part of this comment and of the commit message accurate?
The commit message says:

    On NETSYS v2 and later every RX ring gets a page_pool.
    ...
    The HW-LRO ring already needs 12K buffers, and 9K jumbo adds more such
    rings; for those the descriptor length is larger than a page, so the
    pool cannot back them.

mtk_page_pool_enabled() returns mtk_is_netsys_v2_or_greater(eth). MTK_HWLRO
is set only in mt2701_data, mt7622_data, mt7623_data and mt7629_data, and
all of those are .version = 1. MT7981_CAPS, MT7986_CAPS and MT7988_CAPS
don't include it. So a HW-LRO ring is never allocated on a SoC that has
page_pool enabled.

At this commit, every ring that reaches the new check uses ETH_DATA_LEN,
and mtk_add_mac() limits max_mtu:

	eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;

As a result, ring->frag_size <= PAGE_SIZE is always true here. The patch
doesn't change behavior until the following "add 9K jumbo" patch.

Could the commit message describe this as preparation for jumbo frames?
As written, it could be read as a fix for an existing HW-LRO overrun on
v2+, for example by stable backporters.

The next patch in the series renames mtk_max_lro_buf_alloc() to
mtk_max_buf_alloc() and enables 9K jumbo. After that, this comment still
says mtk_max_lro_buf_alloc() and "9K jumbo once enabled". Should that
patch also update the comment?

> +	if (mtk_page_pool_enabled(eth) && ring->frag_size <= PAGE_SIZE) {

[Severity: Medium]
Does this check match what the pool can actually hold? The comment refers
to MTK_PP_MAX_BUF_SIZE, but the condition compares frag_size with
PAGE_SIZE.

The pool uses the page_pool layout:

mtk_create_page_pool() {
    ...
		.offset = MTK_PP_HEADROOM,
		.max_len = MTK_PP_MAX_BUF_SIZE,
    ...
}

#define MTK_PP_MAX_BUF_SIZE	(PAGE_SIZE - MTK_PP_PAD)

MTK_PP_PAD is XDP_PACKET_HEADROOM (256) plus the aligned skb_shared_info.

The descriptor length is calculated for the netdev_alloc_frag() layout
instead:

mtk_max_buf_size() {
	int buf_size = frag_size - NET_SKB_PAD - NET_IP_ALIGN -
		       SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
    ...
}

mtk_rx_alloc() then programs that value for page_pool buffers too:

	rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size);

buf_size is larger than MTK_PP_MAX_BUF_SIZE once frag_size goes above
about PAGE_SIZE - 256 + NET_SKB_PAD + NET_IP_ALIGN (around 3906 with 4K
pages). Those rings still pass the frag_size <= PAGE_SIZE check.

For example, with the "add 9K jumbo" patch applied, consider an MT7988
with 4K pages, CONFIG_MAX_SKB_FRAGS between 42 and 45, and an MTU set
before ifup so that rx_buf_len is 3072:

    frag_size = 3200 + 768 = 3968   (passes this check)
    buf_size = 3134
    MTK_PP_MAX_BUF_SIZE = 4096 - 256 - 768 = 3072

The hardware may then DMA up to page offset 256 + 3134 = 3390, which is
past the start of skb_shared_info at 3328.

In that case PP_FLAG_DMA_SYNC_DEV syncs only max_len bytes for the
device. In mtk_poll_rx(), build_skb(data, PAGE_SIZE) sets up shinfo on top
of the received bytes. For pktlen > 3072, skb_put() would move tail past
skb->end and hit skb_over_panic().

It isn't confirmed whether the MAC actually delivers frames between 3073
and 3134 bytes, since that depends on hardware frame length limits. With
the default CONFIG_MAX_SKB_FRAGS=17, this window isn't reached.

Would ring->buf_size <= MTK_PP_MAX_BUF_SIZE be a better condition here?
It would match the limits mtk_change_mtu() and mtk_xdp_setup() already
check against MTK_PP_MAX_BUF_SIZE.

>  		struct page_pool *pp;
>  
>  		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-2793186c653124c4c0b3d463bde2ea3a%40loljews.com

