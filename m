Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C059606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 07:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IBBl/bIx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EZOl1dB/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Gz9IBeSccjjCHOtf0va00995nWsD5fHKwWB7RAq70w=; b=IBBl/bIx2mAN49pGvPHw1dlQpL
	CbUKg0ITk/Ur+61c21Ovpy2/AgaTnbqfH6h8fFoKod9k3TRN8MWFegwCqywdREtzjXBX+zGWFmzNM
	4uRWmehtJjehjikiwNv2i7Kdj5WfzmHvY/OvVYUjzV7cvDgnS1VZHnNqjruOFuPl2UUp70745I0A9
	zyExFa0xlz7TN6HQbB+jwh8tXCvlZB+L07xKeyrWVJZrz7veHnz/9iFKgEpZDhbDhj3K5qxLsFMbs
	vod7RaL6HGqcJesT7WYshFYmKuFF7uYdvQ9ku29e1DkhsWsX7ui8mUmP7M5ibO689YUKbandGOZkI
	wDrIQLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaRd-0000000841j-21TX;
	Wed, 18 Nov 2026 07:51:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaRd-0000000841T-0PQj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 07:51:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EB1561F70;
	Wed, 18 Nov 2026 07:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017641F000CA;
	Wed, 18 Nov 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794988263;
	bh=9Gz9IBeSccjjCHOtf0va00995nWsD5fHKwWB7RAq70w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EZOl1dB/r549l0Cjg4hv5vm3frN1mJhwKzcv8N+U0AfAdGRph2GCf+cfu9tPRWU9a
	 +iCkKFQvCFAKu4hmxbhrZ1HBbCOvZn7HvTKwXBL6rJINM1HKL5Lpj1P+5AmplPMrit
	 ndP3VQ6rNSZPsZzMnnGQHEeuQ+wKq26psutOxsBQSkJW4fcb8OeKdBBdUgcYSrDR40
	 rcrTsLIIO9bzklbHVpRok+xnIID2lDMGcagJVlnxq5brnkZPK8NAYnbnaSWx7IIPv7
	 YyXivQtxkN2o03cJUEz5It4N0IMH7IYyAVPbddcS0pHGBvIO6HEqxd6Zt2zEr+X9Ve
	 66RS8xK5egR3g==
Subject: Re: [PATCH v2] net: stmmac: Disable checksum insertion for XDP frame TX
From: netdev-bot+sashiko@kernel.org
To: jszhang@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Date: Wed, 18 Nov 2026 07:51:02 +0000
Message-ID: <179498826255.3136.11066531883770287407@kernel.org>
In-Reply-To: <20261116134848.4793-1-jszhang@kernel.org>
References: <20261116134848.4793-1-jszhang@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch hard-codes csum=false in stmmac_xdp_xmit_xdpf()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c).

--

net: stmmac: Disable checksum insertion for XDP frame TX

This commit stops stmmac from requesting hardware checksum insertion for
frames sent through XDP_TX and ndo_xdp_xmit. It does this by passing false
as the csum argument to stmmac_prepare_tx_desc() in stmmac_xdp_xmit_xdpf().
The bugged_jumbo special case is removed because it is no longer needed.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9f..aa73801119be8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5284,7 +5284,6 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  {
>  	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
>  	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
> -	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;

[ ... ]

> @@ -5353,7 +5344,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  		stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, len,
>  					dma_map && frag);
>  		stmmac_set_desc_addr(priv, desc, dma_addr);
> -		stmmac_prepare_tx_desc(priv, desc, !i, len, csum,
> +		stmmac_prepare_tx_desc(priv, desc, !i, len, false,
>  				       priv->descriptor_mode, !!i, last_frame,
>  				       xdp_get_frame_len(xdpf));

[Severity: Medium]
Could this break existing XDP setups that rely on the MAC to fix up
checksums?

Since be8b38a722e6 and 8b278a5b69a2, stmmac_xdp_xmit_xdpf() has asked for
hardware checksum insertion on every XDP_TX and redirected frame. At first
it passed true, and since b1eded580ab2 it has passed:

    !priv->plat->tx_queues_cfg[queue].coe_unsupported

Some XDP programs rewrite L3/L4 headers without updating the checksums,
for example NAT, L4 load balancers that rewrite addresses or ports, and
encapsulation. On COE-capable dwmac queues these have worked because the
hardware recomputed the checksums. With csum hard-coded to false, it looks
like those frames would go out with stale checksums and receivers would
drop them.

The code change itself seems reasonable, given the stmmac_has_ip_ethertype()
limitation and the lack of checksum metadata on XDP frames. The concern is
how the change is labelled.

The commit carries two Fixes: tags pointing at 2021 commits and has no
stable annotation, so it is likely to be picked up for stable backports.
The commit message says the packet is sent "with its checksum fields
unchanged", but it doesn't mention that this changes on-wire behaviour for
existing users.

For comparison, the earlier commit ecf5985006dd ("net: stmmac: Disable
unsolicited checksum insertion for AF_XDP TX") made the same kind of change
on the AF_XDP zero-copy path. That commit included:

    Cc: stable+noautosel@kernel.org # high regression risk

and the note "Applications must supply complete checksums".

Would it make sense to add a similar noautosel annotation here? Should the
commit message also say that XDP programs must now supply complete
checksums?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116134848.4793-1-jszhang%40kernel.org

