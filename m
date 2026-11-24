Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC35C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Na5psNDh;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1CAJSnG1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=c1HOxMuYKuoArDY4hj9EKVaYu4WN3Ht8vy7fCi0dpLY=; b=Na5psNDhV9lV94
	d6WFYsnrFdo54fE2UE7HWlV9ECHLyx/P8oCE8JCmJSsQaTq8gLLLyL4s2f7HrG4xALFLNpXrvIE+t
	Ju15ghpM+gnUWK+kTv8bsZ59TdWkF0iEh+3iAZgfXLSfxcR1rdrH0f6e1WLKHR+LKPwoORWtpdVV6
	Mcp13tvx2ttSCZ04k0JLxwDw0T8CFh50ZAzDh8pemJNUavAQxc9yVnk9CSmDNfDFAXUE0LiM+Aprc
	JH5tabnpFXotr2LA4ZKu1RKAmhjIK1COJzQSaBaad+r5aCyUelKPYeLIyc//zHVjdrVGl9lBInWwd
	WSTiPv2eFjp/i9pSfn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtwH-00000007FoF-452n;
	Tue, 24 Nov 2026 17:04:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtwF-00000007Fnt-3rH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:04:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB5EE4E41760;
	Tue, 24 Nov 2026 17:04:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97204601E1;
	Tue, 24 Nov 2026 17:04:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF96611E69AA1;
	Tue, 24 Nov 2026 18:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=c1HOxMuYKuoArDY4hj9EKVaYu4WN3Ht8vy7fCi0dpLY=;
	b=1CAJSnG1PbsB6IH51R2E8isIa0FWlUatgjcLmzqB3rrZJuInxCWjyuqoIP+vbipsVvjL9y
	Myh5tOCC3d8LiYptOqAkh/NtGAJ6IzNGWdFf5EByfpA3FrqnCKvXWmBT7J3XO44NLQq4yn
	4RyRsMyARRYfFC7nVlGmOVM2sMe07oHLBwmAjm5wywTSbVLtwAmwXwMaxXNFdb9n7akzbY
	6sJHrA+0GVBzd37/XFmEmaXGT4kSO4mFOW90HUO2RDem85ZJNNf6fOgZaQKxHcc431s7p0
	DSiFDl9T3/rT+S5x6fTNO4PpEWgR0BbIPRYh6lTaqhIBDDYJB0L5UXQvjCyeAA==
Message-ID: <7ff51c46-7c56-49a7-b51b-468c1df82755@bootlin.com>
Date: Tue, 24 Nov 2026 18:04:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>, Yao Zi <me@ziyao.cc>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
 <20261120102754.778283-3-magnusleatti@kernelriot.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120102754.778283-3-magnusleatti@kernelriot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090416_132388_6B339F49 
X-CRM114-Status: GOOD (  29.01  )
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



On 11/20/26 11:27, Magnus Leatti wrote:
> "wol g" is accepted, but the chip sleeps right through magic packets
> in S5: motorcomm_init() turns OOB WoL off and nothing turns it back on
> at power-off.
> 
> Turns out the chip can just arm itself. Hit it with a reset, OOB WoL
> comes right back on, and about 2-3 s later it has the PHY up, receiver
> running, the eFuse address loaded into the first MAC filter, and PMT
> ready for magic packets. Timed that from userspace without a driver
> bound.
> 
> So on a power-off with "wol g": remove, reset, set WOL_CTRL_PKT_EN
> again because the reset clears it, enable PME, D3hot.
> 
> Notes:
> 
>  - It wakes on the eFuse address, not the software one. Same as r8169.
>  - Magic packets only. "wol u", reboot, kexec and interface down stop
>    at the remove.
>  - Hibernation that powers off through .shutdown arms too, and resume
>    copes without a reset. Tried twice: woke on the packet, link back.
>  - After a power loss (cable out and back in, BIOS set to stay off) it
>    won't wake until the next clean shutdown. The vendor driver does
>    the same, so that's the hardware.
> 
> With this the box wakes on a magic packet to the eFuse address, 5 of
> 5. Without it, 0 of 3.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>

My PCI-fu isn't that great, but LGTM. I would have liked to test, but
my motorcomm PCIe card let out the magic smoke yesterday :(

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 63ce2301a0f6..34abbdb645ec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -12,6 +12,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/rtnetlink.h>
>  #include <linux/slab.h>
>  #include <linux/stmmac.h>
>  
> @@ -27,6 +28,9 @@
>  #define EPHY_CTRL				0x1004
>  /* Clearing this bit asserts resets for internal MDIO bus and PHY */
>  #define  EPHY_MDIO_PHY_RESET			BIT(0)
> +#define WOL_CTRL				0x100c
> +/* Magic and remote wake-up packet enable */
> +#define  WOL_CTRL_PKT_EN			BIT(1)
>  #define OOB_WOL_CTRL				0x1010
>  #define  OOB_WOL_CTRL_DIS			BIT(0)
>  #define MGMT_INT_CTRL0				0x1100
> @@ -363,6 +367,38 @@ static void motorcomm_remove(struct pci_dev *pdev)
>  	stmmac_dvr_remove(&pdev->dev);
>  }
>  
> +static void motorcomm_shutdown(struct pci_dev *pdev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
> +	struct stmmac_priv *spriv = netdev_priv(ndev);
> +	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
> +	bool wake;
> +	u32 reg;
> +
> +	/* Userspace is still running and may close the interface */
> +	rtnl_lock();
> +	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
> +	       (spriv->wolopts & WAKE_MAGIC) && device_may_wakeup(&pdev->dev);
> +	rtnl_unlock();
> +
> +	/* The netdev is unregistered after this. priv and its mapping stay. */
> +	stmmac_dvr_remove(&pdev->dev);
> +
> +	if (!wake)
> +		return;
> +
> +	/* Reset re-enables OOB WoL; left alone, chip arms itself (eFuse MAC) */
> +	motorcomm_reset(priv);
> +
> +	/* The reset has cleared it. Without it the chip does not wake. */
> +	reg = readl(priv->base + WOL_CTRL);
> +	reg |= WOL_CTRL_PKT_EN;
> +	writel(reg, priv->base + WOL_CTRL);
> +
> +	pci_wake_from_d3(pdev, true);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +}
> +
>  static const struct pci_device_id dwmac_motorcomm_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MOTORCOMM, 0x6801) },
>  	{ },
> @@ -374,7 +410,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
>  	.id_table = dwmac_motorcomm_pci_id_table,
>  	.probe = motorcomm_probe,
>  	.remove = motorcomm_remove,
> -	.shutdown = motorcomm_remove,
> +	.shutdown = motorcomm_shutdown,
>  	.driver = {
>  		.pm = &stmmac_simple_pm_ops,
>  	},


