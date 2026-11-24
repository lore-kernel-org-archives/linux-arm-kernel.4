Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ffna9aV+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lYRtUeJj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CD1+BsfXviNOBTgjoME+T6ZfemLBj36tB/SHsRAzkTg=; b=Ffna9aV+nYbJg25jRrWFBoBvPl
	y16GDXTYNp+okaiIwojXczMBg5/m07/2dRjeUjnATpndRtaxpCFyOykEqoACM3u6VOYjayKmO83SJ
	CMkPOZARRt3juhYAg+p1g96CwSTOwuOluPmvahcBUHQuFzuXokyGPPwHrPKN2Y93EdlciQ/5CmF3L
	nRbjK5lht6nqpaPJNx3FNht0O6/+29x3w68BWy79pVIemOfPqeumY4zDlPvgEB4Xq6CrrbWhuURaj
	+ASskwx/e3eS5+/Yi3O2VcM5tOyjEEYjdvNQvZP97oHsJ2qEbiYp9d5R9kk/dTC9PV8/maKXsvLnc
	hOcBCBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoDf-00000006HOg-10IL;
	Tue, 24 Nov 2026 10:57:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoDd-00000006HNz-33u6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:57:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 778BE43D62;
	Tue, 24 Nov 2026 10:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A6C1F01570;
	Tue, 24 Nov 2026 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517868;
	bh=CD1+BsfXviNOBTgjoME+T6ZfemLBj36tB/SHsRAzkTg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lYRtUeJj7MdN89+2/w7nlvHajXR8f0kw6Vuz7SLCW+utbIqoNTx9k2r0F/dO5/UKN
	 lQqjhsXXgPxkG3vDSj18705imI3JOR4/wA1bMHC7fAE2VCaA+OQ1NZsb5dcsrKXi2K
	 yulNE/vd7P/aYRAAhPUG26Tj9M8EUoo4rhmFtZMsQcr3QvqExdLOjtxMx8GH0bypkV
	 O0g/J12wS5KvkIO8HeHWDsIx3fEXyA8USJKlwRaa6FWPQtkOysxKabgZxvU843ZrmJ
	 f5xYxamrVnLVnI4dO6p/lyndVrehHYheWNVxrf6varNujVu3y+9p1fM++XswpnOCi2
	 YXmQXTvbYVvRw==
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
From: netdev-bot+sashiko@kernel.org
To: magnusleatti@kernelriot.com
Cc: me@ziyao.cc, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 g.nespolino@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 10:57:46 +0000
Message-ID: <179551786682.3135.159994678754691253@kernel.org>
In-Reply-To: <20261120102754.778283-3-magnusleatti@kernelriot.com>
References: <20261120102754.778283-3-magnusleatti@kernelriot.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c,
  motorcomm_shutdown() arms S5 Wake-on-LAN even when the eFuse holds no…
- [Medium] motorcomm_shutdown() makes its wake decision under rtnl (lines
  379-382), then drops rtnl before stmmac_dvr_remove() ->…
- [Low] motorcomm_shutdown() calls motorcomm_reset() (line 391) and then
  immediately reads, modifies and writes WOL_CTRL (lines 394-396), with…

--

net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5

This adds a dedicated .shutdown callback to the Motorcomm YT6801 glue
driver. On power-off with magic packet WoL enabled, it removes the stmmac
device, then resets the chip so that it re-arms OOB WoL from its eFuse MAC.
After that it sets WOL_CTRL_PKT_EN, enables PME and puts the device into
D3hot.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 63ce2301a0f69..34abbdb645ecb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c

[ ... ]

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

[Severity: Medium]
Can wake become stale between rtnl_unlock() and stmmac_dvr_remove()?

The comment above says userspace is still running, and device_shutdown()
does not freeze tasks. Once rtnl is dropped, another CPU can take it and
run "ip link set down" (dev_close()) or "ethtool -s ethX wol d":

phylink_ethtool_set_wol()
  stmmac_mac_wol_set()
    device_set_wakeup_enable(priv->device, !!wolopts);
    ...
    priv->wolopts = wolopts;

Writes to the power/wakeup sysfs attribute don't take rtnl at all.

In each of these cases wake still holds the earlier value of true. The code
below would then still reset the chip, set WOL_CTRL_PKT_EN and call
pci_wake_from_d3(pdev, true).

Could the machine then power on from a magic packet after WoL was turned
off or the interface was taken down? That seems to go against this part of
the commit message:

  - Magic packets only. "wol u", reboot, kexec and interface down stop
    at the remove.

Would it help to call netif_device_detach() under rtnl before unlocking, or
to check the wakeup settings again after the netdev is unregistered?

> +
> +	if (!wake)
> +		return;
> +
> +	/* Reset re-enables OOB WoL; left alone, chip arms itself (eFuse MAC) */
> +	motorcomm_reset(priv);

[Severity: Medium]
What happens here on boards whose eFuse holds no MAC address?

motorcomm_probe() already handles that case by falling back to a random
address:

drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c:motorcomm_probe() {
    ...
	ret = motorcomm_efuse_read_mac(&pdev->dev, priv, res.mac);
	if (ret == -ENOENT) {
		dev_warn(&pdev->dev, "eFuse contains no valid MAC address\n");
		dev_warn(&pdev->dev, "fallback to random MAC address\n");

		eth_random_addr(res.mac);
    ...
}

That result isn't stored anywhere, and the wake decision in
motorcomm_shutdown() doesn't check for it.

The commit message says that after this reset the chip loads the eFuse
address into the first MAC filter and wakes only on that address. With an
empty eFuse there is no address to load.

Wake is still armed, and ethtool still reports "Wake-on: g". A magic packet
sent to the netdev's address can't match, because that address is random
and changes on every boot. The user gets no warning.

Should the shutdown path skip arming, or at least warn, when probe fell
back to a random MAC?

The commit message also says:

  - It wakes on the eFuse address, not the software one. Same as r8169.

That is only true when the eFuse is programmed. rtl_shutdown() writes the
reported permanent address back into the receive filter before arming:

drivers/net/ethernet/realtek/r8169_main.c:rtl_shutdown() {
    ...
	/* Restore original MAC address */
	rtl_rar_set(tp, tp->dev->perm_addr);

	if (system_state == SYSTEM_POWER_OFF && !tp->dash_enabled)
		pci_prepare_to_sleep(pdev);
}

So r8169 always wakes on the address it reports as permanent, including a
random fallback. Could the r8169 comparison be qualified?

> +
> +	/* The reset has cleared it. Without it the chip does not wake. */
> +	reg = readl(priv->base + WOL_CTRL);
> +	reg |= WOL_CTRL_PKT_EN;
> +	writel(reg, priv->base + WOL_CTRL);

[Severity: Low]
Is it safe to change WOL_CTRL immediately after motorcomm_reset(), with no
delay?

motorcomm_probe() does the same reset and then waits:

	motorcomm_reset(priv);

	/*
	 * After system reset, the eFuse controller needs time to load
	 * its internal data. Without this delay, eFuse reads return
	 * all zeros, causing MAC address detection to fail.
	 */
	usleep_range(2000, 5000);

The commit message also says the chip keeps changing its own state for
about 2-3 s after the reset.

On some boards that post-reset load might write WOL_CTRL, for example
through an eFuse patch entry. Could it then overwrite WOL_CTRL_PKT_EN, so
the device powers off with packet wake disabled?

The 5 of 5 result shows this works on the board that was tested. Even so,
should this path use the same post-reset delay as probe, or read the
register back after writing it?

> +
> +	pci_wake_from_d3(pdev, true);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120102754.778283-1-magnusleatti%40kernelriot.com

