Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+F90f4U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cX9M1DZ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mxCY5jULcq806FBpmKvlAyB+AipmXS+vIOXKWN7ePTI=; b=N+F90f4UEezXuh
	B33rbq0JdRUVht9SIYJvcFQo3GH/gGJFsoosaZhI8K+RppVEBeK2OaFY28djsqb5zAAeUznm9v5eh
	NACXb7vyEJNDPc2a+dx1I7adSYp6I4AZIiwrCUYq75Fj64WhdtkJXeGrZOxueZNqvkBTbjfSCxLXZ
	XTjIPT5vCWDkVwVpsFBdc4Wk7yhJqT3Lcg7pshLXQ7auq8x6kiSnaNx0U9w0TYmzWxJ77MuZoDLa0
	TvVDW8FWWStmL4O3bjGxoox7QTBfIZH3LpAVHkohsrWdMt2c0hxnMuoDSy64nSp5IWk+cM2HQXJwW
	OrLIgFNzneWWFZrEZE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsBJ-00000004xlJ-0bzb;
	Tue, 10 Nov 2026 20:11:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsBI-00000004xlD-0vmu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:11:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0121443869;
	Tue, 10 Nov 2026 20:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722CD1F0089F;
	Tue, 10 Nov 2026 20:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794341459;
	bh=mxCY5jULcq806FBpmKvlAyB+AipmXS+vIOXKWN7ePTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cX9M1DZ2BGcFZLBnamilKY4u+2efJAWrbvTX/hT6MurtCtEXejtOAkDI+QDTAxp5v
	 wfC4vnzSUtCcOITfo+S2dlIwRyOdoUgJLNLlXPr8ydwFuT2slNUdD3A3MHBVOLwRZF
	 ZhtWbAVZecXgrxErI6EBFpSt9dtgS4WWlViighh7PK0If+F083++h4eh+eLn9Loh5c
	 w45qwmZKjdrxg4f4IxbNkOtm/o46k++xFIdmRNBZwNGxgUaVH9N0ecTXKEHy04dYQY
	 DA1ZxgYxk+9wwKGCGYTdce+mc6MV7PbrUKGa5G69eSXSbaxYefR7jjmlVYqIOaH8+7
	 HzP46Th6KiUyA==
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rohan.g.thomas@altera.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] net: stmmac: fpe: Enforce pmac_enabled in set_mm and keep it on at init
Date: Tue, 10 Nov 2026 12:10:58 -0800
Message-ID: <20261110201058.2193402-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104081234.10153-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20261104081234.10153-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: fpe: Enforce pmac_enabled in set_mm and keep it on at init

This patch sets the FPE pMAC state to enabled in stmmac_fpe_init() when
FPE is supported. It also makes stmmac_set_mm() reject requests that try
to disable the pMAC, and adds an fpesel capability check to
stmmac_set_mm().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index c616a1c95e5dd..0dfb312d72f15 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1066,6 +1066,13 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> +	if (!priv->dma_cap.fpesel)
> +		return -EOPNOTSUPP;
> +

[Severity: Low]

The commit message says:

  Also add a missing fpesel capability check in stmmac_set_mm() to return
  -EOPNOTSUPP early on hardware without FPE support.

Can this check ever be reached? The only caller of ->set_mm() is
ethnl_set_mm(). It calls ->get_mm() first and returns if that fails:

net/ethtool/mm.c:ethnl_set_mm() {
    ...
	ret = dev->ethtool_ops->get_mm(dev, &state);
	if (ret)
		return ret;
    ...
	ret = dev->ethtool_ops->set_mm(dev, &cfg, extack);
    ...
}

stmmac_get_mm() already rejects this case with a stricter test:

drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:stmmac_get_mm() {
    ...
	if (!stmmac_fpe_supported(priv))
		return -EOPNOTSUPP;
    ...
}

stmmac_fpe_supported() checks fpesel && fpe_cfg.reg &&
fpe_map_preemption_class. So stmmac_set_mm() is never called when fpesel
is clear.

The new test is also weaker than stmmac_fpe_supported(), which this same
patch uses in stmmac_fpe_init(). Suppose fpesel is set but the driver has
no FPE register map. Even if this check could run, it would not stop
stmmac_fpe_set_add_frag_size() from dereferencing a NULL fpe_cfg.reg.

Should this check be dropped or changed to use stmmac_fpe_supported(),
with the commit message updated to match?

> +	/* DWMAC always have preemptible MAC enabled */
> +	if (!cfg->pmac_enabled)
> +		return -EINVAL;

[Severity: Medium]

Does this change the ethtool MM uAPI behaviour in a way that breaks
existing users?

Before this patch, pmac-enabled off had a real effect on stmmac.
ethtool_mmsv_event_handle() does not send Respond mPackets while the pMAC
is disabled:

net/ethtool/mm.c:ethtool_mmsv_event_handle() {
    ...
	if (!mmsv->pmac_enabled)
		goto unlock;
    ...
}

stmmac_fpe_configure_pmac(false) also masks the FPE interrupt. Now
stmmac_fpe_init() sets pmac_enabled to true and nothing can clear it. On
every link-up the FPE IRQ is unmasked, and the device answers any link
partner's Verify mPacket.

The rejection also happens before ethtool_mmsv_set_mm() runs, so the
whole request is dropped. ethnl_set_mm() only rejects tx_enabled combined
with !pmac_enabled, so a request like this one reaches stmmac_set_mm():

  ethtool --set-mm $dev pmac-enabled off tx-enabled off verify-enabled off

It gets -EINVAL, and tx_enabled and verify_enabled stay unchanged.

h1_destroy() and h2_destroy() in
tools/testing/selftests/drivers/net/hw/ethtool_mm.sh use exactly this
request. The lldp test has lldpad enable MM TX, and afterwards the cleanup
cannot clear tx-enabled or verify-enabled on stmmac.

manual_failed_verification() in the same script relies on this command to
make the peer's verification fail:

  ethtool --set-mm $rx pmac-enabled off

The script does not check its exit code, so the rx side keeps
pmac_enabled set. If the DWMAC still sends a Respond mPacket in that
state, verification succeeds and check_fail fires. Whether the hardware
does that could not be confirmed from the code.

The other set_mm implementations in drivers/net (enetc, ocelot,
am65-cpsw) accept pmac_enabled=false. Would it be better to keep
accepting it here as well?

[Severity: Low]

This isn't a bug, but stmmac_set_mm() is passed an extack and this new
-EINVAL leaves it empty. The other rejections on the ETHTOOL_MSG_MM_SET
path all set a message. For example, in ethnl_set_mm():

	if (cfg.tx_enabled && !cfg.pmac_enabled) {
		NL_SET_ERR_MSG(extack, "TX enabled requires pMAC enabled");
		return -EINVAL;
	}

ethtool_mm_frag_size_min_to_add(), called a few lines earlier in
stmmac_set_mm(), fills in extack too.

Userspace gets a plain "Invalid argument" for a bool that the uAPI
documents as settable. Could something like
NL_SET_ERR_MSG_MOD(extack, "pMAC cannot be disabled on DWMAC") be added
here?

> +
>  	stmmac_fpe_set_add_frag_size(priv, frag_size);
>  	ethtool_mmsv_set_mm(&priv->fpe_cfg.mmsv, cfg);

[ ... ]
-- 
pw-bot: cr

