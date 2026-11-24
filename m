Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3TGvqb2U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMDa9B3s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MInfQnrnLXxM8M2N5OHhWzB2hL0u2EMS41BZ8oPo2/Y=; b=3TGvqb2UMeAugtSE5hAvqumDMf
	d8KNp25SSQtHQNOzEDbA5HIBCk9uAs9KJOirvaJkQuMZNQe8e3QB9nTtht1K+LazTalDK6ztrbB1f
	LK7tNXEzjEJ9BvuDJAnaZO9/BKw1CtIDakqCuiilu3x74+PQJxiUWE1I/fyqiu4IO3fYms6qKxamo
	mypkbJPoJV+PPnCsrx8nDcKakpL+Jp/dgM45wyKK1cd5jAG9rxXy78JgSfNwABDTitu9AGsKqdwiF
	slP6hRFOgfMtXqEubFbgbbFPrhEjJd4pecnMw4r1fsFlKK3nR9W1J4yVp+wRX5ZOaCP37ir9nZiIz
	RtMU5uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoDf-00000006HOW-0fa7;
	Tue, 24 Nov 2026 10:57:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoDd-00000006HNy-1JSM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:57:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6271040E04;
	Tue, 24 Nov 2026 10:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA7D1F01562;
	Tue, 24 Nov 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517866;
	bh=MInfQnrnLXxM8M2N5OHhWzB2hL0u2EMS41BZ8oPo2/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oMDa9B3sGTcUgHEJJmlixx80WLqwiNntaDgF48tg4noGc5i7pnBozS6ojTTYyrkdm
	 eFfzL/2LFY4e9W6Ophv4iomm5Gt45h+QJiGf6mx97XCXFAR1uSxQ7TKzqpKzM4glkZ
	 oTB0RVrJmijUoba4Itra4SE6agp75LEbSZPTCkUPciTpSS4MhMWkLEpXygwn/qH7nR
	 n+IUJ9PDdnX75jm/n2O2qTpQiJCoudf1eRCihUeFJy0v7HIv8dvO1go/LUS3lENjjR
	 i2nbIH9d8/UG5HpQATlzlZ1nCM+YhNXQ4TJexuaoufkIXUzTVljbBeb0ESv0PnWg2o
	 ll1DiJxgNzQag==
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the
 device at shutdown
From: netdev-bot+sashiko@kernel.org
To: magnusleatti@kernelriot.com
Cc: me@ziyao.cc, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 g.nespolino@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 10:57:44 +0000
Message-ID: <179551786477.3135.6652175828683602957@kernel.org>
In-Reply-To: <20261120102754.778283-2-magnusleatti@kernelriot.com>
References: <20261120102754.778283-2-magnusleatti@kernelriot.com>
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

- [Medium] The patch wires `.shutdown` to the full driver teardown:
  `motorcomm_remove()`, which calls `stmmac_dvr_remove()`.
- [Low] The commit message describes a defect: without .shutdown, reboot,
  kexec and power-off leave the MAC and DMA running.

--

net: stmmac: dwmac-motorcomm: remove the device at shutdown

This commit sets the .shutdown callback of the Motorcomm YT6801 PCI glue
driver to motorcomm_remove(). As a result, stmmac_dvr_remove() runs on
reboot, kexec and power-off, so the interface is closed and the DMA and
MAC are stopped before the next kernel or power state.

> No .shutdown here, so reboot, kexec and power-off leave the MAC and
> DMA running. This chip keeps its registers through S5 too.

[Severity: Low]
Should this carry a Fixes: tag?

The problem described here is real for kexec. motorcomm_probe() calls
pci_set_master() before motorcomm_reset(), and pci_device_shutdown()
only clears bus mastering without resetting the DMA engine.

The dwmac_motorcomm_pci_driver struct without a .shutdown callback
came in with:

Fixes: 02ff155ea281 ("net: stmmac: Add glue driver for Motorcomm YT6801 ethernet controller")

Without the tag, stable trees that carry this driver won't pick up
the change. A backport of this patch as written would also bring in
the double teardown described below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 42f0b11a7b606..63ce2301a0f69 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -374,6 +374,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
>  	.id_table = dwmac_motorcomm_pci_id_table,
>  	.probe = motorcomm_probe,
>  	.remove = motorcomm_remove,
> +	.shutdown = motorcomm_remove,

[Severity: Medium]
With this change, can stmmac_dvr_remove() run twice on the same
binding?

device_shutdown()->pci_device_shutdown() only calls drv->shutdown().
It does not unbind the driver. device_lock(dev) is released as soon
as the callback returns, and drvdata still points to the
devm-allocated net_device.

The device is still bound, so a later .remove can still happen.
Examples are a sysfs unbind, rmmod, or a pciehp/Thunderbolt surprise
removal handled by the parent port. The parent port is shut down
after its children, because device_shutdown() walks the device list
backwards. Any of these goes through:

pci_device_remove()
  motorcomm_remove()
    stmmac_dvr_remove()
      unregister_netdev(ndev)

stmmac_dvr_remove() is not safe to call twice:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_dvr_remove() {
    ...
	unregister_netdev(ndev);
    ...
	phylink_destroy(priv->phylink);
    ...
	destroy_workqueue(priv->wq);
	mutex_destroy(&priv->lock);
	mutex_destroy(&priv->est_lock);
	bitmap_free(priv->af_xdp_zc_qps);
    ...
}

It clears none of these pointers and sets no flag to record that
teardown has already happened. On the second call,
unregister_netdevice_many_notify() would hit this with rtnl_mutex
held:

	BUG_ON(dev->reg_state != NETREG_REGISTERED);

With CONFIG_BUG=n, the second call would instead lead to:

  - a use-after-free and double free of the phylink in
    phylink_destroy()
  - a use-after-free in destroy_workqueue()
  - a double bitmap_free()

The follow-up patch "net: stmmac: dwmac-motorcomm: support Wake-on-LAN
from S5" still calls stmmac_dvr_remove() unconditionally from
motorcomm_shutdown(). The problem is therefore still present at the
end of the series.

For comparison, the shutdown hook in dwmac-sun8i only quiesces the
hardware. Could this driver use a shutdown that only quiesces the
device instead? That would mean detaching and closing the interface
under rtnl, stopping DMA and MAC, and powering down or arming the
PHY. Another option would be to make the remove path safe to call
twice.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120102754.778283-1-magnusleatti%40kernelriot.com

