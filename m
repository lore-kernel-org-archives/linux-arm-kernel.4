Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GqDr2ZUg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlelLrL8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KllBJ9+aHKHmevvfZXj4eWwtwcZanwxTddFWb4nlWzA=; b=GqDr2ZUg/Xp7WV9E7X/Pzdva2p
	mO3TpiEvJCGW8gUR7UUGrz+/LQ1myCnIiH4fVmkYOwOB9BCZsZshqV0zrZ6SHHhOP8NacbN11q6eS
	XOEhuh2RvbXXYSWT6EbKi7CWhMlNX5T5EIrzCpaLc37vfQRi/9fd6zHE/mLkBPtLuxlLJhNhKSLAN
	T4TDHUj3dpNt/7AWh5IsTqeYXml0VNSpQMhK6xqJIdK7I2gsHs6/bUoWRCwGuy+5mHBrh4+bGAJex
	T2C0B8iGJZRQqJp5bn1Cyr7ByaUx3EDvOMSrnIP3D75nrDvcaydBkN6fkATThuMnvEC3xz3ooOLw6
	j7Oah/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7zp-0000000DEIY-1yIY;
	Thu, 19 Nov 2026 19:40:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7zo-0000000DEIF-0qUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:40:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB8744381E;
	Thu, 19 Nov 2026 19:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74781F000C6;
	Thu, 19 Nov 2026 19:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117235;
	bh=KllBJ9+aHKHmevvfZXj4eWwtwcZanwxTddFWb4nlWzA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HlelLrL8Ng2+24StS3Zy59pXifhMcFRrzQWdbgwGFcZ2c4cc/o+TSmXcJh9cWftJx
	 FVpLNcPskOkukVpMzAs/fLn54scLX7G9I/yIYilndZ9iIGE+z62R9C3SYni6ci0D7N
	 ZNFhvxR65Rz+Heqrr/DEcJKd0uEk3Mnn82zSbL1OgpbX76AiQsuDRSAXROU3KZMCcA
	 YPjZABiuphx9bpwVNQ998Z81J/mEoutyOKFMLPt32mDvVkie2Ur9EO0YkVtf+PhyLk
	 kj6IclTiME1nNEpEcJkIjl2ARa/EcWr7CafGojxa6KsOx37GY8/CyIig410KAyqt6q
	 TXeVoW0xZ7iyw==
Subject: Re: [PATCH net v2] net: stmmac: preserve RX checksum capability when
 offload is disabled
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 19:40:34 +0000
Message-ID: <179511723446.3136.5381192433185500992@kernel.org>
In-Reply-To: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
References: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] After this patch, stmmac_hw_setup()
  (drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3725-3729) checks…
- [Low] The struct stmmac_ops comment for rx_ipc
  (drivers/net/ethernet/stmicro/stmmac/hwif.h:322) still says "Enable…

Pre-existing issues:
- [Low] This problem wasn't introduced by this patch, but
  sun8i_dwmac_rx_ipc_enable()…

--

net: stmmac: preserve RX checksum capability when offload is disabled

This patch changes stmmac_hw_setup() so that a zero return from
stmmac_rx_ipc() clears plat->rx_coe only when RX checksum offload was
requested, meaning hw->rx_csum is non-zero. Before this, the RX COE
capability was lost when the interface was reopened after RX checksum
offload had been turned off with ethtool.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9f..e162976be2e6d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
>  	stmmac_safety_feat_configuration(priv);
>  
>  	ret = stmmac_rx_ipc(priv, priv->hw);
> -	if (!ret) {
> +	if (priv->hw->rx_csum && !ret) {

[Severity: Medium]
Can plat->rx_coe now stay unverified when RX checksum offload is off at
every stmmac_hw_setup() since probe?

For example, if "ethtool -K ethX rx off" runs before the first
"ip link set up", the readback is never checked. plat->rx_coe then keeps
whatever value the HW feature register or platform data reported.

If RX checksum is later enabled while the interface is up,
stmmac_fix_features() keeps NETIF_F_RXCSUM because rx_coe is not
STMMAC_RX_COE_NONE. stmmac_set_features() then ignores the rx_ipc result:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_features() {
	if (features & NETIF_F_RXCSUM)
		priv->hw->rx_csum = priv->plat->rx_coe;
	else
		priv->hw->rx_csum = 0;
	/* No check needed because rx_coe has been set before and it will be
	 * fixed in case of issue.
	 */
	stmmac_rx_ipc(priv, priv->hw);
	...
}

That comment assumes the stmmac_hw_setup() check has already run, and
after this patch that is not guaranteed. Before this patch, any open
with a zero readback cleared rx_coe. So once the interface had been
opened, offload could not be enabled at runtime without a check.

Some hardware may advertise RX COE while its IPC bit does not latch. On
such hardware, hw->rx_csum would be non-zero while the MAC is not
validating checksums. stmmac_rx() and stmmac_construct_skb_zc() would
then mark IP frames CHECKSUM_UNNECESSARY based on hw->rx_csum:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_construct_skb_zc() {
	...
	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
		skb_checksum_none_assert(skb);
	else
		skb->ip_summed = CHECKSUM_UNNECESSARY;
	...
}

The zero-copy path does not look at descriptor status at all. Split
header is also enabled from rx_csum > 0.

This would last until the next stmmac_hw_setup() with a non-zero
rx_csum, for example after down/up, resume or an MTU change.

I could not find a specific part where the IPC bit fails to latch, so
this depends on the hardware case that the stmmac_hw_setup() check
exists for.

Would it make sense to check the stmmac_rx_ipc() return in
stmmac_set_features() when offload is enabled? Another option is to
verify the capability once, whatever state was requested.

[Severity: Low]
This isn't a bug, but should the rx_ipc comment in struct stmmac_ops be
updated to match the contract this check now depends on?

drivers/net/ethernet/stmicro/stmmac/hwif.h:
	/* Enable and verify that the IPC module is supported */
	int (*rx_ipc)(struct mac_device_info *hw);

The commit message says the callbacks program the state requested in
hw->rx_csum and return whether IPC is enabled afterwards.
dwmac1000_rx_ipc_enable(), dwmac4_rx_ipc_enable() and dwxgmac2_rx_ipc()
behave that way. The hwif.h comment still reads as if a zero return
means the IPC module is unsupported.

sun8i_dwmac_rx_ipc_enable() already uses the other reading ("caution
this function must return non 0 to work") and ignores hw->rx_csum.

>  		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
>  		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
>  		priv->hw->rx_csum = 0;

[Severity: Low]
This is a pre-existing issue, not one introduced by this patch, but the
commit message says:

  Keep calling rx_ipc when offload is disabled so that the hardware
  is still programmed with the requested state.

Does that hold for the sun8i EMAC used on H616? The commit message
limits this claim to the GMAC, GMAC4 and XGMAC callbacks.
sun8i_dwmac_rx_ipc_enable() ignores hw->rx_csum and never clears
EMAC_RX_DO_CRC:

drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:sun8i_dwmac_rx_ipc_enable() {
	...
	v = readl(ioaddr + EMAC_RX_CTL0);
	v |= EMAC_RX_DO_CRC;
	writel(v, ioaddr + EMAC_RX_CTL0);

	return 1;
}

So on sun8i, "ethtool -K ethX rx off" leaves the EMAC checksum engine
on.

stmmac_rx() still treats these frames as CHECKSUM_NONE because coe is
0, so I could not find any frames being marked with the wrong checksum
state. The problem is that the register state does not match the
requested state.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386%40gmail.com

