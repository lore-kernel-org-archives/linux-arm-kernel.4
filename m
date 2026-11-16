Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e6SKkvAF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikXWlGbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qS3GSR2+QS9Ez6HTQ9xfSuXLdo51J3kjDvzV704q/jg=; b=e6SKkvAF4mDC6fkEwKCwii5MxS
	Pal41KB6+GZxlAy9hcTekns5aijwP9McofeAYP0EqX2apG9IzhAYLjnQgvOmxoqhH24oSDs7WFCSF
	Z5dz1WCBjbHlFBQIQFTGQnqG+BelHPkqIG8k99huArSkOWVObVCz/fggV5DvBDuaPrAlKhBBygbBU
	2vK2LPlZ5wtDPMtPQdhVZzUFBmPftloE2Dxr9Wl0W2k/DIMNqZt+E8JmN6QSWnxz7I4QAXY0BmRqN
	8kD58pMRb6jKh+SbJSI0N9/zk2dEPC8J/pOs0IZ9x8MPbJ7zToznPoOjVBL6Thf58t2cwH+brfeqd
	4QF98w+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0NP-00000003OII-0zPR;
	Mon, 16 Nov 2026 17:20:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0NN-00000003OIA-3U1s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1124061E91;
	Mon, 16 Nov 2026 17:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F291F000C4;
	Mon, 16 Nov 2026 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849616;
	bh=qS3GSR2+QS9Ez6HTQ9xfSuXLdo51J3kjDvzV704q/jg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ikXWlGbM72hknRLH2E8gsiFqH7M45EzDruusdoLVfAZCK+14c0pDfDv3AqgdBq9fr
	 5LySDJULzTdhP3K4zS6WbVpJ8TH3d983TLjLOjewSBtiKJ12JowGnpmdTpBP1F71HA
	 rGOhTfGpP8FCnOmU4ENJGuX+kLJ+TZPK3vUL/5j9HGuOhA1gRdxqDXGoWEPAl9HOVk
	 xDjFA7ZFSmMGPPyYIAYEeDeu8IvWRSLtgS6Kj3h+aGfTtZezhBYT+pTth3Z4YKZMXe
	 6OEZnMJM/tG/qklHcNqPiFhXpq57IFPAq3g3rLCI4cQl3MSZDOe9dzioM+IilKOQtt
	 ChL2VvR/X5DTA==
Subject: Re: [PATCH net-next v10 1/4] net: xdp: add __xdp_build_skb_from_buff() helper
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, Jose.Abreu@synopsys.com, boon.leong.ong@intel.com,
 horms@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org, nb@tipi-net.de
Date: Mon, 16 Nov 2026 17:20:14 +0000
Message-ID: <179484961485.3136.18371294575845722948@kernel.org>
In-Reply-To: <20261112-stmmac-rx-mb-v10-1-d3d04b65c6bc@oss.qualcomm.com>
References: <20261112-stmmac-rx-mb-v10-1-d3d04b65c6bc@oss.qualcomm.com>
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

- [Low] The kerneldoc for the newly exported __xdp_build_skb_from_buff()
  (net/core/xdp.c:622-633) says only "Protocol parsing is left to the…

--

net: xdp: add __xdp_build_skb_from_buff() helper

This patch splits xdp_build_skb_from_buff() in two. The new exported
__xdp_build_skb_from_buff() builds the skb without calling
eth_type_trans(). A static inline wrapper in include/net/xdp.h keeps the
old behaviour and still calls eth_type_trans(). The goal is to let stmmac
process the L2 header (software VLAN) before protocol parsing.

> diff --git a/net/core/xdp.c b/net/core/xdp.c
> index 1d679e8fd6493..470bf90d93ef2 100644
> --- a/net/core/xdp.c
> +++ b/net/core/xdp.c
> @@ -620,17 +620,18 @@ void xdp_warn(const char *msg, const char *func, const int line)
>  EXPORT_SYMBOL_GPL(xdp_warn);
>  
>  /**
> - * xdp_build_skb_from_buff - create an skb from &xdp_buff
> + * __xdp_build_skb_from_buff - create an skb from &xdp_buff
>   * @xdp: &xdp_buff to convert to an skb
>   *
>   * Perform common operations to create a new skb to pass up the stack from
>   * &xdp_buff: allocate an skb head from the NAPI percpu cache, initialize
>   * skb data pointers and offsets, set the recycle bit if the buff is
> - * PP-backed, Rx queue index, protocol and update frags info.
> + * PP-backed, record the Rx queue index and update frags info. Protocol
> + * parsing is left to the caller.

[Severity: Low]
Does "Protocol parsing is left to the caller" fully describe what the
caller now has to do?

Moving eth_type_trans() out of __xdp_build_skb_from_buff() also moves out
the other work it does:

net/ethernet/eth.c:eth_type_trans() {
	skb->dev = dev;
	skb_reset_mac_header(skb);

	eth = eth_skb_pull_mac(skb);
	eth_skb_pkt_type(skb, dev);
    ...
}

So the skb returned by __xdp_build_skb_from_buff() has skb->dev == NULL
and no mac header, and protocol and pkt_type are not set. This is true
even though rxq->dev is available inside the helper.

The peer helper __xdp_build_skb_from_frame() still sets these:

	/* Essential SKB info: protocol and skb->dev */
	skb->protocol = eth_type_trans(skb, dev);

As a result, the two __xdp_build_skb_* helpers now return different
minimal skb state.

Nothing breaks today. The only in-tree user of the underscore variant
later in the series is stmmac_rx(), and it calls
eth_type_trans(skb, priv->dev) before napi_gro_receive(). A future caller
that does its own L2 handling and reads "protocol parsing" as just
skb->protocol could pass an skb with no dev to napi_gro_receive() or
netif_receive_skb().

Could the kerneldoc say that the caller must also set skb->dev and reset
the mac header, for example by calling eth_type_trans()?

A smaller point: the public xdp_build_skb_from_buff() wrapper in
include/net/xdp.h no longer has any kerneldoc. The kerneldoc for
xdp_build_skb_from_zc() still refers readers to it:

 * Similar to xdp_build_skb_from_buff(), but for XSk frames. Allocate an skb

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-stmmac-rx-mb-v10-0-d3d04b65c6bc%40oss.qualcomm.com

