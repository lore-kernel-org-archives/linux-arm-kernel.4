Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA21606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dUDMItcw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hKos+bSh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=muxY4t+JASM5puVdEtPnoVoZ9a0aIbs760H+tQNuqfA=; b=dUDMItcwN3hjy1zKzH4ZGiuxW0
	qRbCZL9lSs1+lWIftTFb6M3Sz0XzVOWj6fJFFjEg12mocnOtqWAJui9E0C6pR8+dOfg5kh55cFnEX
	BvkDH+FFBukK9dWgg38QaT3HNJh02Qd6pHG1qS8b2PuZrU3TJeMf9XVPCz7f3/PVhRZeyP36Zf4dI
	upXOCo+quF+bgsgu54JQnOe779UzxGfXosQ/zreVvWFIRmzwNLWqCiSTnSbyuXDmN6w6WJpnCmX0g
	P+xmVKIs/fJ2dmc+b8JjYMGAFRh7BN+T5VEEdPGRCZwe3BMVAmbDi3rW6G1tTrFbr58FuwgnOsR3f
	aFyRil8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoVt-00000006JJd-0jhM;
	Tue, 24 Nov 2026 11:16:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoVZ-00000006JGo-3XTL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:16:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B75B625C0;
	Tue, 24 Nov 2026 11:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2A71F000CF;
	Tue, 24 Nov 2026 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518980;
	bh=muxY4t+JASM5puVdEtPnoVoZ9a0aIbs760H+tQNuqfA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hKos+bShwfIe7Dgym62Fg+t4JI0I36+nzK/h0qFQk4b7Z6URMMBHY1zt+E13ieAdb
	 o4p7TxQrRW9leNas20xjn5LKANfaw0i9iRzoUDtF7Edi/L1nkm6UvJyMRspiXKB4dc
	 tjw17G9ue+Pj1TCRWQ1iEL2fKWHF+cM1HvxKZkRY0H1EWUyIp6vy7fNpJEBg/49Fsy
	 9+LBSi3aDFraQq/k6cW6MBBbpOmzoin1FaiXo2KDTP+vrkHg5PRGJmzhUeuGZ7MKeN
	 s4nKZE9z+U2ptz5w4hznAmFo59w5k7S8AMA0of6tPxeIYzCDzq+YA8O0NwzLUnhqTK
	 +ADOQQYAfHNLQ==
Subject: Re: [PATCH net-next v4 3/5] net: stmmac: Balance runtime PM when the
 probe fails
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, p.zabel@pengutronix.de,
 linux@armlinux.org.uk, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:16:19 +0000
Message-ID: <179551897911.3135.10060956110819643456@kernel.org>
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
References: <20261120-sun8i-emac-mux-uaf-v4-3-57eba8915f25@gmail.com>
X-sashiko-severity: High
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In __stmmac_dvr_probe()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c), the patch adds an…
- [Low] The patch fixes a real, user-visible runtime-PM bug in
  __stmmac_dvr_probe() but has no Fixes: tag.

Pre-existing issues:
- [Medium] Before stmmac_hw_init(), __stmmac_dvr_probe() asserts and then
  deasserts priv->plat->stmmac_rst, and deasserts the shared…

--

net: stmmac: Balance runtime PM when the probe fails

This adds pm_runtime_disable() and pm_runtime_put_noidle() at the
error_mdio_register label in __stmmac_dvr_probe(). A failed or deferred
probe then undoes the runtime PM enable and the usage count taken before
stmmac_mdio_register(), the same way stmmac_dvr_remove() does.

> Undo both, as stmmac_dvr_remove() does.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

[Severity: Low]
Should this have a Fixes: tag?

Commit 5ec55823438e ("net: stmmac: add clocks management for gmac
driver") added the pm_runtime_get_noresume(), pm_runtime_set_active()
and pm_runtime_enable() sequence to __stmmac_dvr_probe(). The only
matching pm_runtime_put() is on the success path, and the error labels
were never updated.

Something like:

Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")

would let stable tell which kernels need this. It would usually be
targeted at the net tree as well.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..4ebf4b6253743 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8407,6 +8407,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_disable(device);
> +	pm_runtime_put_noidle(device);

[Severity: High]
Is this pm_runtime_disable() balanced on PCI based stmmac devices?

The probe path only enables runtime PM when it is not already enabled:

	pm_runtime_get_noresume(device);
	pm_runtime_set_active(device);
	if (!pm_runtime_enabled(device))
		pm_runtime_enable(device);

Commit d90d0c175cf2 ("net: stmmac: Fix "Unbalanced pm_runtime_enable!"
warning") made that check conditional. The PCI core has already enabled
runtime PM before any driver binds:

drivers/pci/bus.c:pci_bus_add_device() {
    ...
	pm_runtime_enable(&dev->dev);
    ...
}

So for the PCI glue drivers (stmmac_pci.c, dwmac-intel.c,
dwmac-loongson.c, dwmac-motorcomm.c), probe skips the enable. This
error path still disables, though. That removes the PCI core's enable
and leaves disable_depth at 1.

Every failure from stmmac_mdio_register() onward ends up here. That
includes -EPROBE_DEFER, and also failures from stmmac_pcs_setup(),
stmmac_phylink_setup(), stmmac_register_devlink() and
register_netdev(). After that:

local_pci_probe()
    pm_runtime_put_sync(dev);      <- no effect, runtime PM disabled
really_probe()
    device_unbind_cleanup()
        pm_runtime_reinit()
            pm_runtime_set_suspended(dev);

pm_runtime_reinit() finds runtime PM disabled and the status
RPM_ACTIVE. The function is still in D0, but it is recorded as
RPM_SUSPENDED, and the parent bridge's child_count is decremented.

When stmmac itself retries a deferred probe, it re-enables runtime PM.
If the failure is permanent, or a different driver binds next (for
example vfio-pci through driver_override), runtime PM stays disabled
and the device still never runtime-suspends. The PCI callers'
error paths, such as intel_eth_pci_probe(), do not restore it.

Isn't that the same symptom the commit message says this fixes?

Could a local bool record whether this probe actually called
pm_runtime_enable(), so pm_runtime_disable() is only called in that
case?

stmmac_dvr_remove(), which the commit message names as the model,
already has the same unconditional pm_runtime_disable(). It looks like
it has the same mismatch on PCI. Later patches in the series do not
appear to change this error path.

>  	stmmac_napi_del(ndev);
>  error_hw_init:
>  	destroy_workqueue(priv->wq);

[Severity: Medium]
This issue is pre-existing and was not introduced by this patch, and it
is separate from the runtime PM problem. Since this error path is being
matched against stmmac_dvr_remove(), should it also put the resets
back?

Before stmmac_hw_init(), __stmmac_dvr_probe() does:

	if (priv->plat->stmmac_rst) {
		ret = reset_control_assert(priv->plat->stmmac_rst);
		reset_control_deassert(priv->plat->stmmac_rst);
		...
	}

	ret = reset_control_deassert(priv->plat->stmmac_ahb_rst);

stmmac_dvr_remove() asserts both again:

	if (priv->plat->stmmac_rst)
		reset_control_assert(priv->plat->stmmac_rst);
	reset_control_assert(priv->plat->stmmac_ahb_rst);

None of the probe error labels do this. After a failed or deferred
probe, the MAC is left out of reset.

stmmac_ahb_rst comes from devm_reset_control_get_optional_shared() in
stmmac_probe_config_dt(), and devres releases the handle without
asserting it. Could that leave the shared deassert_count raised? If
so, another consumer sharing the AHB reset could no longer really
assert it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25%40gmail.com

