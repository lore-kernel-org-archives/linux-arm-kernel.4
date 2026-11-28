Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711B8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYJ37Z+S;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DixK9Tgb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HWejl6zJpWtGF041tCBPfR2Vw3JgFlWVRWMLwc48CVs=; b=bYJ37Z+SxFzLj4
	Veb4kwkoJ/ST6Bw9V5p6qgjRwoP7QWZqZmMV5BwzSkZPpgmIisK5JBklBrBJXTDt8RMudqGYPhe0o
	ZDU/XqSpuLPO5eTeBLtzhvfiQFhn9KL+tyMAP9HkD6lPlSJxW8L804Gaz3kTkXplBa50AFQTurISB
	bI9HbAqiwlLKHjcBr6tKpLEeRV5zwLKyfHjPRJtiFT95BppqNsaPIn9L+HrWE/nEGRLWY2V/g+xI7
	97mmhPDY+nE6ROlkz/e67FefhszmG+/0cPz91GNGZ9yfkzFu11GlEK/qTySrjQPw4pnvHHZ6aH/6O
	nJNmD0Ol5hZuyMumqORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHES-00000000jh7-0Iki;
	Sat, 28 Nov 2026 12:08:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHEN-00000000jgg-189u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 12:08:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C5904E417E0;
	Sat, 28 Nov 2026 12:08:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EF7C604C0;
	Sat, 28 Nov 2026 12:08:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0943811E9010B;
	Sat, 28 Nov 2026 13:08:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795867711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HWejl6zJpWtGF041tCBPfR2Vw3JgFlWVRWMLwc48CVs=;
	b=DixK9TgbU8go4vs4W5Pd3SFRUWNhXb74ginYNAi4hau0r97KDK7wpXLVLGfP8WYpuSkgeU
	0sTX95JC+tzXTPY8JHteP121zFH4qu8XhHrWJyrGU9otcvGZhK7VFbAuXLnwgJowQyAdq0
	YY4xQ65HkNP0pxPmLD6Ya0Opn7nY/VO1u+3Qkm3Jn33VW7OU5VfBQZ7kPBN6RIhm6xh0TK
	XF4VwafG6/u0ajbd1kbMMUlB3TP93lnS5Fz5X/XFqxAo8dGq4D6/wk7vkY9ox606CEjkz6
	Gg5qc+XJc+MTxNLkXzPBTfVdOqg+sAIiphXY/f0HHMTgy476ZGh5ahI0t8Zqcg==
Message-ID: <464270f3-6054-4de7-ac77-97a07f6a52d0@bootlin.com>
Date: Sat, 28 Nov 2026 13:08:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 2/5] net: stmmac: remove software VLAN tag
 stripping
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Simon Horman <horms@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org, Peilin He <he.peilin@zte.com.cn>
References: <20261125-stmmac-rx-mb-v13-0-0f6bac53e8d5@oss.qualcomm.com>
 <20261125-stmmac-rx-mb-v13-2-0f6bac53e8d5@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261125-stmmac-rx-mb-v13-2-0f6bac53e8d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_040839_743960_2B58B9EF 
X-CRM114-Status: GOOD (  37.14  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/26 15:48, Lorenzo Bianconi wrote:
> The software VLAN stripping logic in stmmac_rx_vlan() was originally
> introduced in 2014 by commit b93819854d6e ("stmmac: Add vlan rx for
> better GRO performance.") as a workaround to improve GRO performance,
> since at that time GRO could not handle frames with VLAN tags. However,
> this limitation was resolved in 2015 by commit 66e5133f19e9 ("vlan: Add
> GRO support for non hardware accelerated vlan"), which added GRO support
> for non-hardware-accelerated VLAN frames. Keeping a software fallback
> path for VLAN stripping is no longer necessary and only adds complexity.
> 
> After removing it, VLAN tags remain in the packet, so
> stmmac_has_ip_ethertype() has to keep recognising IPv4/IPv6 behind a
> single in-payload VLAN tag. On RX the helper runs after eth_type_trans(),
> which has already pulled the Ethernet header, so walk the tag chain with
> skb_mac_offset() instead of __vlan_get_protocol(), which assumes the MAC
> header still sits at skb->data. On TX the helper still runs before the
> header is pulled.
> 
> Make the tolerated L2 depth explicit:
> - on RX allow a single in-payload C-tag while the MAC is not stripping
>   tags (VLAN_ETH_HLEN); when HW stripping is active the payload must be
>   tag-free, so keep the ETH_HLEN limit and reject any tag that is still
>   there;
> - in-payload S-tags are always rejected, as only an S-tag that the
>   hardware stripped (and whose type is reported through
>   get_rx_vlan_proto) is known to have been parsed by the checksum engine;
> - on TX keep the old ETH_HLEN limit, so DSA-tagged frames that the
>   checksum engine ignores (see commit c2945c435c99 ("net: stmmac:
>   Prevent DSA tags from breaking COE")) remain excluded from hardware
>   checksum and TSO.
> 
> This intentionally changes the advertised features:
> - dwmac100/dwmac1000 no longer advertise NETIF_F_HW_VLAN_CTAG_RX;
>   they have no hardware VLAN stripping.
> - On xmac cores NETIF_F_HW_VLAN_CTAG_RX is advertised only when the
>   VLAN ops provide .set_hw_vlan_mode and .rx_hw_vlan, so DWXLGMAC no
>   longer falsely advertises RX VLAN offload.
> - NETIF_F_HW_VLAN_STAG_RX is advertised only on cores that provide
>   hardware RX VLAN offload and whose descriptor ops report the stripped
>   tag protocol (get_rx_vlan_proto), i.e. DWXGMAC. DWXLGMAC loses it
>   because it has no RX VLAN offload, while cores without
>   get_rx_vlan_proto report stripped S-tags as C-tags.
> 
> The DWXLGMAC mis-advertisement was introduced when the RX VLAN offload
> gate was widened to all xmac cores, so tag the fix accordingly.
> 
> With NETIF_F_VLAN_FEATURES possibly empty, EEE RX clock stop may be
> enabled on some platforms; the preceding selftests patch blocks RX
> clock stop while the ethtool selftests run.
> 
> This depends on the preceding selftests fix.
> 
> Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping")
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Co-developed-by: Peilin He <he.peilin@zte.com.cn>
> Signed-off-by: Peilin He <he.peilin@zte.com.cn>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Thanks for taking care of that,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 12 +++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 89 ++++++++---------------
>  2 files changed, 44 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index fcc395321816..fa9ef4212982 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -478,4 +478,16 @@ static inline int stmmac_selftest_get_count(struct stmmac_priv *priv)
>  }
>  #endif /* CONFIG_STMMAC_SELFTESTS */
>  
> +static inline bool stmmac_rx_8021q_offload(struct stmmac_priv *priv)
> +{
> +	return priv->hw->vlan && priv->hw->vlan->set_hw_vlan_mode &&
> +	       priv->hw->vlan->rx_hw_vlan;
> +}
> +
> +static inline bool stmmac_rx_8021ad_offload(struct stmmac_priv *priv)
> +{
> +	return stmmac_rx_8021q_offload(priv) &&
> +	       priv->hw->desc->get_rx_vlan_proto;
> +}
> +
>  #endif /* __STMMAC_H__ */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca4c7fb11b73..7896364c43e9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4879,7 +4879,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  
>  /**
>   * stmmac_has_ip_ethertype() - Check if packet has IP ethertype
> + * @priv: driver private structure
>   * @skb: socket buffer to check
> + * @xmit: transmit path
>   *
>   * Check if a packet has an ethertype that will trigger the IP header checks
>   * and IP/TCP checksum engine of the stmmac core.
> @@ -4887,16 +4889,25 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>   * Return: true if the ethertype can trigger the checksum engine, false
>   * otherwise
>   */
> -static bool stmmac_has_ip_ethertype(struct sk_buff *skb)
> +static bool stmmac_has_ip_ethertype(struct stmmac_priv *priv,
> +				    struct sk_buff *skb, bool xmit)
>  {
> -	int depth = 0;
> -	__be16 proto;
> +	__be16 proto, h_proto = eth_header_parse_protocol(skb);
> +	int max_l2_hlen, depth = 0;
> +
> +	/* An S-tag still in the payload may not have been parsed by the
> +	 * checksum engine; only trust it when the hardware stripped it, in
> +	 * which case h_proto is no longer ETH_P_8021AD.
> +	 */
> +	if (h_proto == htons(ETH_P_8021AD))
> +		return false;
>  
> -	proto = __vlan_get_protocol(skb, eth_header_parse_protocol(skb),
> -				    &depth);
> +	proto = vlan_get_protocol_offset_inline(skb, h_proto,
> +						skb_mac_offset(skb), &depth);
>  
> -	return (depth <= ETH_HLEN) &&
> -		(proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
> +	max_l2_hlen = xmit || priv->hw->hw_vlan_en ? ETH_HLEN : VLAN_ETH_HLEN;
> +	return depth <= max_l2_hlen &&
> +	       (proto == htons(ETH_P_IP) || proto == htons(ETH_P_IPV6));
>  }
>  
>  /**
> @@ -5153,7 +5164,7 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
>  	 * harmonize_features() in net/core/dev.c
>  	 */
>  	if (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
> -	    !stmmac_has_ip_ethertype(skb))
> +	    !stmmac_has_ip_ethertype(priv, skb, true))
>  		features &= ~(NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM);
>  
>  	if (skb_is_gso(skb)) {
> @@ -5175,37 +5186,6 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
>  	return vlan_features_check(skb, features);
>  }
>  
> -static int stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
> -{
> -	struct vlan_ethhdr *veth;
> -
> -	if (!pskb_may_pull(skb, ETH_HLEN))
> -		return -EINVAL;
> -
> -	veth = skb_vlan_eth_hdr(skb);
> -	if ((veth->h_vlan_proto == htons(ETH_P_8021Q) &&
> -	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
> -	    (veth->h_vlan_proto == htons(ETH_P_8021AD) &&
> -	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
> -		__be16 vlan_proto = veth->h_vlan_proto;
> -		u8 meta_len = skb_metadata_len(skb);
> -		u16 vlanid;
> -
> -		/* pop the vlan tag */
> -		if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
> -			return -EINVAL;
> -
> -		veth = skb_vlan_eth_hdr(skb);
> -		vlanid = ntohs(veth->h_vlan_TCI);
> -		memmove(skb->data - meta_len + VLAN_HLEN,
> -			skb->data - meta_len, meta_len + ETH_ALEN * 2);
> -		skb_pull(skb, VLAN_HLEN);
> -		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
> -	}
> -
> -	return 0;
> -}
> -
>  static bool stmmac_rx_need_ic(struct stmmac_priv *priv,
>  			      struct stmmac_rx_queue *rx_q, u32 queue)
>  {
> @@ -5626,15 +5606,11 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
>  	if (priv->hw->hw_vlan_en) {
>  		/* MAC level stripping. */
>  		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> -	} else if (stmmac_rx_vlan(priv->dev, skb)) {
> -		dev_kfree_skb_any(skb);
> -		priv->xstats.rx_dropped++;
> -		return;
>  	}
>  
>  	skb->protocol = eth_type_trans(skb, priv->dev);
>  
> -	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
> +	if (unlikely(!coe) || !stmmac_has_ip_ethertype(priv, skb, false) ||
>  	    (status & csum_none))
>  		skb_checksum_none_assert(skb);
>  	else
> @@ -6142,15 +6118,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		if (priv->hw->hw_vlan_en) {
>  			/* MAC level stripping. */
>  			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
> -		} else if (stmmac_rx_vlan(priv->dev, skb)) {
> -			dev_kfree_skb_any(skb);
> -			rx_dropped++;
> -			goto next;
>  		}
>  
>  		skb->protocol = eth_type_trans(skb, priv->dev);
>  
> -		if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
> +		if (unlikely(!coe) ||
> +		    !stmmac_has_ip_ethertype(priv, skb, false) ||
>  		    (status & csum_none))
>  			skb_checksum_none_assert(skb);
>  		else
> @@ -6429,7 +6402,7 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> -	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
> +	if (stmmac_rx_8021ad_offload(priv)) {
>  		if (features & NETIF_F_HW_VLAN_CTAG_RX)
>  			features |= NETIF_F_HW_VLAN_STAG_RX;
>  		else
> @@ -6462,7 +6435,7 @@ static int stmmac_set_features(struct net_device *netdev,
>  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  	}
>  
> -	if (features & NETIF_F_HW_VLAN_CTAG_RX)
> +	if (features & (NETIF_F_HW_VLAN_CTAG_RX | NETIF_F_HW_VLAN_STAG_RX))
>  		priv->hw->hw_vlan_en = true;
>  	else
>  		priv->hw->hw_vlan_en = false;
> @@ -8275,15 +8248,17 @@ static int __stmmac_dvr_probe(struct device *device,
>  	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
>  	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
>  #ifdef STMMAC_VLAN_TAG_USED
> -	/* Both mac100 and gmac support receive VLAN tag detection */
> -	ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
> -	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> -		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> -
> -	if (dwmac_is_xmac(priv->plat->core_type)) {
> +	if (stmmac_rx_8021q_offload(priv)) {
> +		ndev->features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
>  		priv->hw->hw_vlan_en = true;
>  	}
> +
> +	if (stmmac_rx_8021ad_offload(priv)) {
> +		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> +		ndev->hw_features |= NETIF_F_HW_VLAN_STAG_RX;
> +	}
> +
>  	if (priv->dma_cap.vlhash) {
>  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>  		if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> 


