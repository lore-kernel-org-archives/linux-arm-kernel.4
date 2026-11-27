Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF68606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nNhP3ou8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hg96CwIc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6WjEXdGX+qjILlZxVo6duXdHYPvzCKMM0taT62MYjyw=; b=nNhP3ou8iOfkPSAk9TqMd6aiaq
	lDRE1+GeM1lvac1NkS8Pyt6h/DKREEJcIFO2Bg84c9+rRTpACmzhrNPnUvBsRPxh7OCjmyIZo9p2K
	jWciQESvX5tTh2K2MdUSJp8FtNx/1PAh7+TIbun38wwaWG6jmEYjpbCZOsGsnPQpUboxASSwXg6Es
	Y9XFuvp6GeWi1O2jNOcErVrJezEvgPOfZogsK1Ju7Pu2QTDGCYtHg9iua4vqkvkdTnb/FZapfJ0BA
	Q7KbHxjrAvNBOjluNCkg1vL1A5s5esltX9AsXzetDEab9J3Fsse+GgJHhXbg0g4p9szYXzgZvhkQE
	6sh58oCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmRQ-0000000EqJi-1l1w;
	Fri, 27 Nov 2026 03:16:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmRP-0000000EqJc-2NH0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 03:16:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F129041ADF;
	Fri, 27 Nov 2026 03:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0D81F000C1;
	Fri, 27 Nov 2026 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749362;
	bh=6WjEXdGX+qjILlZxVo6duXdHYPvzCKMM0taT62MYjyw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hg96CwIcZKMCeqwHVRepwWhFMMmTTRlKU22L8N38I7aRsjfV/qog6oD2RcD6o3na8
	 Ln3B/Ncd2GnjLAM6TSda93m2IKQ2hRbHgGHx00gJo2XKdCgdoAly8qFmk0LVoo4bHE
	 sIv5XJBiqgL34ss016uQHl8+ko3ovTAOELq/1zIIJPWVGIhyFhsn8zzvfvYvLJP121
	 fBlpi3sGOQDjICM02pKFwAJxwPzp11o5mbUhKd+/yPcBh3Yr+20guI0fAz5HhInGMy
	 PjaRfzZQTtE5HerkBb56FHQjnNZk531fVi5p3QPu+6AvX0ZrCjN+kxQqNPjqw06kKJ
	 Tt048c8IEeQdw==
Subject: Re: [PATCH net] net: stmmac: dwmac-socfpga: disable split header on Agilex 5
From: netdev-bot+sashiko@kernel.org
To: jjc@jclark.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rohan.g.thomas@altera.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alex.cramt@gmail.com
Date: Fri, 27 Nov 2026 03:16:01 +0000
Message-ID: <179574936116.3135.3699981290049268393@kernel.org>
In-Reply-To: <20261126031300.211248-1-jjc@jclark.com>
References: <20261126031300.211248-1-jjc@jclark.com>
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

- [Medium] The patch fixes IPv4 fragment corruption with a quirk flag for
  Agilex 5 only, but the root cause it gives does not come from XGMAC…

--

net: stmmac: dwmac-socfpga: disable split header on Agilex 5

This patch sets STMMAC_FLAG_SPH_DISABLE in
socfpga_agilex5_setup_plat_dat(). The aim is to stop IPv4 fragment
corruption that shows up when RX checksum offload, and therefore split
header, is enabled on the Agilex 5 XGMAC core. The commit message
points to commit 47f753c1108e for the Intel platforms, which made the
same change based on the DesignWare Ethernet QoS datasheet.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 3a89c4da2af57..28ffa5ad12d7a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -578,6 +578,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
>  	/* Enable TSO */
>  	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
>  
> +	/* Disable split header */
> +	plat_dat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +

[Severity: Medium]
Is the root cause specific to Agilex 5, or does it affect all XGMAC
users?

The commit message says:

    Agilex 5 has an XGMAC core, and stmmac turns split header on whenever
    RX checksum offload is on.

The only evidence it cites is the QoS (GMAC4) datasheet, by way of
commit 47f753c1108e. Nothing in the patch shows that the problem is
limited to Agilex 5.

If this is a general XGMAC hardware limitation, other XGMAC platforms
would still have split header enabled. tegra_mgbe_probe() in
dwmac-tegra.c sets core_type to DWMAC_CORE_XGMAC and sets
STMMAC_FLAG_TSO_EN, but it does not set STMMAC_FLAG_SPH_DISABLE. The
generic "snps,dwxgmac" path in stmmac_probe_config_dt() doesn't set it
either. stmmac_dvr_probe() turns split header on for any core that
reports sphen unless the platform opts out:

    if (priv->dma_cap.sphen &&
        !(priv->plat->flags & STMMAC_FLAG_SPH_DISABLE)) {

Would fragmented IPv4 traffic, for example ping -s 2000, still be
corrupted on those platforms?

There is also a possible driver-side cause in the shared XGMAC receive
path. dwxgmac2_get_rx_header_len() reads HL only when L34T is set:

    if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
        *len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;

dwmac4_get_rx_header_len() reads RDES2_HL unconditionally.

Commit 96147375d49f9b added the L34T check. Its message says "Split
Header length is only available when L34T == 0", but the code reads HL
only when L34T != 0.

Suppose the hardware splits a fragmented IPv4 frame but reports L34T
as 0. The header length then stays 0. stmmac_rx_buf1_len() would treat
buf1 as holding the whole frame. stmmac_rx_buf2_len() would return 0
for the last descriptor. The skb could then contain the split header
plus stale buf1 contents, and the payload in buf2 would be lost.

stmmac_rx_buf2_len() also assumes that buf2 is fully filled on
non-last descriptors for every core except GMAC4 with split header
active:

    if ((priv->plat->core_type != DWMAC_CORE_GMAC4 || !priv->sph_active) &&
        (status & rx_not_ls))
        return priv->dma_conf.dma_buf_sz;

The GMAC4 comment just above that check says this assumption does not
always hold when split header is enabled.

If the corruption actually comes from this shared dwxgmac2 header
length handling, would it be better to fix it in the core instead of
adding a per-platform flag? That would also let Agilex 5 keep split
header enabled.

>  	/* Enable TBS */
>  	switch (plat_dat->tx_queues_to_use) {
>  	case 8:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126031300.211248-1-jjc%40jclark.com

