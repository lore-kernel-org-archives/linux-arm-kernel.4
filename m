Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75659606A881
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4BwGP7cx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSCYH15R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dyqwQBwZ3SD4vMEgEKYtXA6f1/do37C7TEOPdZ8eRqk=; b=4BwGP7cxJ6X/Gg3Qo8xTGDRAOV
	gbo61UX6fLzcaXE+OgM034zT9SxuD/aGzE9Bqz+zqwPZzsxfI57qEGfNSGvOK076H4NNPDqn+J5fh
	CCM98HoGAnPcxcIXXftPTAk/8sKlYGz1nVQEUW2/AXAQ23R86fFwVbI9COnJBoc/8/vGkBolnGk6w
	hiwKu66nJWaQjjbR83kQXFVeOOD65lehmTVO4hdSJ5OFbzaYZ0Ar1xLj+0BvBcAABR8OezOjSR7uW
	neXD4bhDmc6WZcngu+PhqKGpxprdtiVAvOyp2kzt7uMn3a6+Dvll9Rwk5pSWII+U+vlCV4VSFZC5P
	XeaeUgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTboH-00000008KQK-1owH;
	Wed, 18 Nov 2026 09:18:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTboG-00000008KPz-1vB4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C52A740290;
	Wed, 18 Nov 2026 09:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF021F000C4;
	Wed, 18 Nov 2026 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993511;
	bh=dyqwQBwZ3SD4vMEgEKYtXA6f1/do37C7TEOPdZ8eRqk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PSCYH15R55+wFO6np0puKmRUuRkA4qM6nfhSnhaWgsm+sPd4EQKmY9mVvyvjZudT9
	 sAH0IeCiXA66KvfJYMPGc2KuppaY4yYTEBdXaFD/0Ya/tHLCkJCH4qWtfFoQPcfa+1
	 eFfmnQTyZU7fP/h0MTdbigG9Th0Srb1OW8fig1t2VsPjaXQsWMQftyaT6xs0c6bGsl
	 t7dUgFIdcV5JWwMlJRvxBHOvoxFFTHdbHahxIYh3sH3CTMXfd3NLQCsOT3XaWX9JzL
	 1+5c/IxgjK7CbJJQyv3EcdizuJY3z2G8G1aGUDm8wTv6Np9ahJDOCz5m+kefzlQZtx
	 lT0wafRw1GsYw==
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-motorcomm: quiesce the
 device at shutdown
From: netdev-bot+sashiko@kernel.org
To: magnusleatti@kernelriot.com
Cc: me@ziyao.cc, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 g.nespolino@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 09:18:30 +0000
Message-ID: <179499351041.3136.14889707783816630750@kernel.org>
In-Reply-To: <20261116091757.1656602-2-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-2-magnusleatti@kernelriot.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] motorcomm_shutdown() (drivers/net/ethernet/stmicro/stmmac/dwmac-
  motorcomm.c) tries to stop stmmac_suspend() from running a second time…
- [Medium] motorcomm_shutdown() calls stmmac_suspend() from the PCI
  .shutdown hook without holding rtnl_lock.

--

net: stmmac: dwmac-motorcomm: quiesce the device at shutdown

This adds a PCI .shutdown hook to the Motorcomm dwmac glue. The hook calls
stmmac_suspend() to stop the DMA, MAC and PHY before reboot, kexec or
power-off, then turns PME back off with pci_wake_from_d3(). It skips all
of this when the netdev is not present, so that stmmac_suspend() does not
run twice after a failed resume.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 42f0b11a7b606..1e142ad39e33a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -204,6 +204,27 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
>  	return 0;
>  }
>  
> +static void motorcomm_shutdown(struct pci_dev *pdev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
> +
> +	/*
> +	 * A failed resume leaves the netdev detached with NAPI disabled, and
> +	 * stmmac_suspend() must not run on it a second time.
> +	 */
> +	if (!netif_device_present(ndev))
> +		return;

[Severity: High]
Does this check catch a failed resume when the interface was down at
suspend time?

stmmac_suspend() only detaches the netdev on the netif_running() path:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_suspend() {
	if (!ndev || !netif_running(ndev))
		goto suspend_bsp;
	...
	netif_device_detach(ndev);
	...
suspend_bsp:
	if (priv->plat->suspend)
		return priv->plat->suspend(dev, priv->plat->bsp_priv);
	...
}

With the interface down, system suspend goes straight to
stmmac_pci_plat_suspend(). That calls pci_disable_device() and drops
enable_cnt from 1 to 0, and the netdev stays present.

Resume can then fail in motorcomm_resume()->stmmac_pci_plat_resume() if
pci_enable_device() returns an error. In that case
pci_enable_device_flags() decrements enable_cnt back to 0 and the device
stays disabled. stmmac_resume() returns the error and leaves the detach
state alone.

At reboot the guard above does not fire, and the sequence is:

motorcomm_shutdown()
  stmmac_suspend()
    /* !netif_running(), goto suspend_bsp */
    stmmac_pci_plat_suspend()
      pci_disable_device()
        dev_WARN_ONCE(..., "disabling already-disabled device")
        atomic_dec_return(&dev->enable_cnt)   /* enable_cnt is now -1 */

Isn't this the case the commit message describes as "Skip the hook in
that state: stmmac_suspend() must not run a second time."? With
panic_on_warn set, this would panic instead of rebooting.

Being detached is not the same as having a failed resume. Would a
different state check fit better here, such as pci_is_enabled(pdev) or a
driver-owned flag set when resume fails?

The follow-up commit "net: stmmac: dwmac-motorcomm: support Wake-on-LAN
from S5" does not change this guard.

> +
> +	/* Stop the device before reboot, kexec or power-off */
> +	stmmac_suspend(&pdev->dev);

[Severity: Medium]
Can this race with dev_close() and hang the reboot?

device_shutdown() runs without the freezer, so userspace and priv->wq
are still active. stmmac_suspend() checks netif_running() without rtnl.
It disables NAPI under priv->lock only and takes rtnl afterwards:

	mutex_lock(&priv->lock);

	netif_device_detach(ndev);

	stmmac_disable_all_queues(priv);
	...
	mutex_unlock(&priv->lock);

	rtnl_lock();
	phylink_suspend(priv->phylink, !!priv->wolopts);

The ndo_stop path, stmmac_release()->__stmmac_release(), runs under rtnl
only. It does not take priv->lock or check netif_device_present(), so it
calls stmmac_disable_all_queues() a second time.

napi_disable_locked() loops in usleep_range() while NAPIF_STATE_SCHED is
set. A disabled NAPI keeps that bit set, so the second napi_disable()
never returns.

One possible interleaving:

CPU0                                  CPU1
motorcomm_shutdown()
  stmmac_suspend()
    stmmac_disable_all_queues()
                                      ip link set down, or
                                      stmmac_reset_subtask()
                                        rtnl_lock()
                                        dev_close()
                                          __stmmac_release()
                                            stmmac_disable_all_queues()
                                              napi_disable() spins
    rtnl_lock() blocks forever

After the hook returns, the netdev is still IFF_UP, detached, with NAPI
disabled. Any dev_close() before the machine halts would spin while
holding rtnl. Any later .shutdown hook that takes rtnl, such as
rtl_shutdown() in r8169, would then hang.

Other drivers serialize shutdown with rtnl, as rtl_shutdown() does:

	rtnl_lock();
	rtl8169_net_suspend(tp);
	rtnl_unlock();

Others make ndo_stop a no-op on a detached device, as igb_close() does by
checking netif_device_present(). Is something along those lines needed
here?

The follow-up commit "net: stmmac: dwmac-motorcomm: support Wake-on-LAN
from S5" does not change this either.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116091757.1656602-1-magnusleatti%40kernelriot.com

