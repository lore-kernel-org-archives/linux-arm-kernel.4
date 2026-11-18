Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66EB606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KO/fY6Ce;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDVW2E6o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OcVCj+OjH0fCxqPKSIEjyCgO56WOkscvnJIcyF1o2iQ=; b=KO/fY6Cei3bUevebsZOZlqrvp7
	In8BFYrer5SsqP5j0DiDe5ovU0pHgNeAxKb8moeh2RMsaKZKW7M9ntw9tYLhbSEXwK3Y68s1z5bAX
	TWpSgSSEvpemzAROMN6XfPWxedGp1ak+ZCPOsCM55kVDoA7YyyvBPvMuTBir6SgQHzajTKLnlOPuJ
	+SUckXV5JvBBgarl8Hrb+cfD+OCgaf970rxjkuSrjhh0tvKKGp7TMMml6hPTwWEwXAXmwvy7ZJDT3
	KHS3ROaCxkheesXLeZguo4oPe9ATUH7A2D9AAmqq/G07jp3Dov3selsm8UNsBYey9HEvjYlXCz38F
	EbseiBNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTboQ-00000008KT2-3EHa;
	Wed, 18 Nov 2026 09:18:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTboH-00000008KQJ-1t3f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:18:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 384DF40412;
	Wed, 18 Nov 2026 09:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB0C1F000C4;
	Wed, 18 Nov 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993513;
	bh=OcVCj+OjH0fCxqPKSIEjyCgO56WOkscvnJIcyF1o2iQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GDVW2E6oSsqegKL01nKGZowgo72vhemv4d23XN6kiUB26KYVBuXdfzeJCNBwiPIZk
	 8aYXebN9RhbAHtck33rRzvM2GetFWv7CGUiyuktSz/i/0uDtS7ZMuvc+amRychRGDh
	 ID2iIataHc09C8AFb2rZMzjZGNj2LZtLlTL6eqaAprl6cuyL66rKJ3gq8dkQVR32oT
	 osodKfnv+E2loYw3R6z9ekhbuUgvc0p8+WGTnXByFjBAH0nWQh++PnxroUCrnm3D0h
	 kvZP4hKbq5zs0QRcsBZv7M4JJGOuFr2jYuaLmOf2J4O7rb1UJLwo2lB2zrTXlWF2Pe
	 n37n8qPKjrr4w==
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
From: netdev-bot+sashiko@kernel.org
To: magnusleatti@kernelriot.com
Cc: me@ziyao.cc, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 g.nespolino@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 09:18:31 +0000
Message-ID: <179499351186.3136.1370230751729152458@kernel.org>
In-Reply-To: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Hibernation in shutdown mode arms OOB WoL, but the restore
  path has no way to disarm it.
- [Low] motorcomm_shutdown() computes `wake` with no lock held, from
  netif_running(ndev), spriv->wolopts and device_may_wakeup(&pdev->dev).

--

net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5

This patch arms the YT6801 to wake the system from S5. It does this in
motorcomm_shutdown() when powering off with Wake-on-LAN set, the
interface up and device wakeup enabled. After stmmac_suspend() it
enables OOB WoL, waits 2 ms, rewrites MAC address filter 0 and sets the
packet wake bit in WOL_CTRL, leaving the function in D0 with PME
enabled.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 1e142ad39e33a..034547ad1e98e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c

[ ... ]

> @@ -204,9 +207,51 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
>  	return 0;
>  }
>  
> +/*
> + * Arm the chip to wake the system from S5. stmmac_suspend() has already
> + * programmed the PMT register of the GMAC. The rest lives in the wrapper.
> + */
> +static void motorcomm_arm_s5_wake(struct net_device *ndev)
> +{
> +	struct stmmac_priv *spriv = netdev_priv(ndev);
> +	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
> +	u32 reg;
> +
> +	/*
> +	 * motorcomm_init() disables OOB WoL right after the chip reset, as
> +	 * normal operation requires. With it disabled the chip ignores wake
> +	 * packets once the system is off. Once it has been enabled, only a
> +	 * chip reset disables it again, so enable it only when powering off.
> +	 */
> +	reg = readl(priv->base + OOB_WOL_CTRL);
> +	reg &= ~OOB_WOL_CTRL_DIS;
> +	writel(reg, priv->base + OOB_WOL_CTRL);

[Severity: Medium]
What happens when the system resumes from a hibernation that powered off
through this path?

The commit message says "Hibernation that powers off through the
shutdown path arms the chip the same way". For HIBERNATION_SHUTDOWN, and
for the platform-mode fallthrough, power_down() in kernel/power/hibernate.c
calls kernel_power_off():

    case HIBERNATION_SHUTDOWN:
            if (kernel_can_power_off()) {
                    entering_platform_hibernation = true;
                    kernel_power_off();

That reaches device_shutdown() with system_state == SYSTEM_POWER_OFF.
motorcomm_shutdown() then computes wake as true and OOB WoL gets enabled
here.

The commit message relies on "the next probe resets the chip", but a
hibernation restore does not probe. The .restore callback in
stmmac_simple_pm_ops runs stmmac_resume() -> motorcomm_resume():

motorcomm_resume() {
    ...
	motorcomm_deassert_mdio_phy_reset(priv);
	motorcomm_init(priv);
    ...
}

Neither of these calls motorcomm_reset(). Only motorcomm_probe() calls
it. The device was left in D0 at shutdown, so restore is not a
D3hot->D0 transition either. The only attempt to disarm OOB WoL is the
plain write in motorcomm_init():

	/*
	 * OOB WOL must be disabled during normal operation, or DMA interrupts
	 * cannot be delivered to the host.
	 */
	writel(OOB_WOL_CTRL_DIS, priv->base + OOB_WOL_CTRL);

The new comment says this write cannot undo OOB WoL once it has been
enabled. Nothing in the driver clears WOL_CTRL_PKT_EN either.

Suppose the boot kernel did not bind dwmac-motorcomm and reset the chip,
for example because the module is not in the initramfs. Could the
restored kernel then run with OOB WoL still enabled and get no DMA
interrupts?

The new comment also says motorcomm_init() runs "right after the chip
reset", but motorcomm_resume() calls it without a reset.

If "only a chip reset disables it again" is accurate, should the restore
path reset the chip, or should arming be skipped for hibernation? If it
is not accurate, should the comment and the commit message be corrected?

[ ... ]

> @@ -215,14 +260,31 @@ static void motorcomm_shutdown(struct pci_dev *pdev)
>  	if (!netif_device_present(ndev))
>  		return;
>  
> -	/* Stop the device before reboot, kexec or power-off */
> +	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
> +	       spriv->wolopts && device_may_wakeup(&pdev->dev);

[Severity: Low]
Can wake become stale before stmmac_suspend() reads the same state and
acts on it?

It is sampled with neither priv->lock nor rtnl held. Two paths can still
run until netif_device_detach() inside stmmac_suspend():

- stmmac_mac_wol_set(), from ethtool set_wol under rtnl
- dev_close() -> stmmac_release()

kernel_shutdown_prepare() does not freeze userspace before
device_shutdown().

In the first case, "ethtool -s ethX wol d" completes after wake was
sampled as true. stmmac_suspend() then calls stmmac_mac_set(false) and
phylink_suspend(false). motorcomm_shutdown() still skips
pci_wake_from_d3(pdev, false) and runs motorcomm_arm_s5_wake(). PME is
probably not enabled, since pci_enable_wake() refuses when
device_may_wakeup() is false. Even so, the chip is armed against the
last WoL setting.

In the second case, dev_close() runs after wake was sampled.
stmmac_suspend() sees the interface down and jumps straight to the bsp
hook:

	if (!ndev || !netif_running(ndev))
		goto suspend_bsp;

There stmmac_pci_plat_suspend() enables PME, because wakeup is still
enabled. Since wake is stale, PME stays on, and OOB WoL is armed on a
closed interface whose PMT was never programmed. Doesn't that conflict
with "If the interface is down at power-off, the system does not wake"?

Would it be more robust to base the arming decision on what
stmmac_suspend() actually did? One option is to check priv->irq_wake
after it returns. It is set only when PMT was armed, and the detach
blocks ethtool by then. Another option is to sample the state under the
same locks.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116091757.1656602-1-magnusleatti%40kernelriot.com

