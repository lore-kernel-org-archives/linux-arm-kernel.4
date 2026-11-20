Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD67606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DY15bs9s;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nz/5t0En
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aMjxQu5DvNMxMD2QmUMgnuSCNhoUFHlBMLUHHCISx7E=; b=DY15bs9sNN93PxGiwsX5AOuKsX
	oYTcR8Rx8jfXsac4dZlZ0A5ZP8U5DcT+lEsFhpAAJJCjp+B1PCrSXe92x9aF/A2i7SFIEhxkMtaJl
	DZApa0xMygvNrUv9IQG2NwjpK44LpV0jczeRBHPhSkzBLfZwrBwmF45Z4hJCFkR4kFrLv40wKSK/j
	aUSp4s3alvo3BcCzCHaRvxsmWMKEPAu27l/FIx6/pi9miM7LQLhvclIALQFIExHUK/T3doDc6j+KI
	OQL3W1+awXCwyqrBPdc+f3ZtH4NNifc5ABjUw3tyhoLUhfGBszXgo/aIvMNDDBbXExiox1QGk3nnn
	A++Won/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUN4F-0000000ErJK-0HL1;
	Fri, 20 Nov 2026 11:46:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUN4A-0000000ErHN-2pwJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:46:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22966629A9;
	Fri, 20 Nov 2026 11:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD381F000E6;
	Fri, 20 Nov 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175165;
	bh=aMjxQu5DvNMxMD2QmUMgnuSCNhoUFHlBMLUHHCISx7E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nz/5t0EnMiLvCX7mt5E8GkcAaL4HeiOZ6kfivXi+TxRxH6eQHwq0Hx7OLaQm466sZ
	 jn1bLwHjiIjTjeO+0u2lQ6BUW2PyqCSRDXb143ZmYFKHLoUph3GsGwkto1DgiLyewv
	 hJ1hQZWqoWow1iH8xyRpyo/gBKKdwuzHZpa5TLoAorkG7hLXkwAFNsU6mcy3gBKYhD
	 e0+3VPxIslhdgWAOU86+QjIw07qDV1kS0LvPIgRUgsMPQzrQ84g/UNauKhI48r1/Db
	 wNgXwl6WORT91gljOAPbUm8elfw73+1XAigzU5bvsFDFS0CRi0mfjWoxQVL1ox064k
	 Xb51+OwHzoUSw==
Subject: Re: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 20 Nov 2026 11:46:03 +0000
Message-ID: <179517516381.3136.1746646208763714610@kernel.org>
In-Reply-To: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c,
  ethqos_set_clk_tx_rate() decides whether to double the RGMII link…
- [Medium] In drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c,
  the new qcs615_data descriptor has no .rgmii_por/.num_rgmii_por,…
- [Medium] net: stmmac: qcom-ethqos: missing delay check in
  ethqos_set_clk_tx_rate()

--

net: stmmac: qcom-ethqos: add QCS615 EMAC support

This adds a qcom,qcs615-ethqos match entry and a qcs615_data descriptor
with phy_managed_delays enabled, so rgmii-id on QCS615 uses the
DLL-bypass configuration. Before this patch, QCS615 nodes bound to the
QCS404 descriptor through the qcom,qcs404-ethqos fallback compatible.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a7fdba73da2ba..790159ae1be7a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
>  	.setup = ethqos_hlos_setup,
>  };
>  
> +static const struct ethqos_emac_driver_data qcs615_data = {
> +	.rgmii_config_loopback_en = true,
> +	.phy_managed_delays = true,

[Severity: Medium]
This flag is meant to confine the new behaviour to tested hardware,
but does the link clock rate follow it as well?
ethqos_set_clk_tx_rate() decides whether to double the rate from
phy_mode alone:

	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
	    speed == SPEED_1000)
		rate *= 2;

ethqos_fix_mac_speed_rgmii(), by contrast, only takes the DLL-bypass
path when ethqos->data->phy_managed_delays is also set:

	if (ethqos->data->phy_managed_delays &&
	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
		ethqos_configure_rgmii_id(ethqos, speed);
		return;
	}

Take a descriptor without the flag (qcs404, sm8150, sc8280xp, sa8775p)
and phy-mode = "rgmii-id". The IO macro is still programmed through
ethqos_rgmii_macro_init() for the MAC-delay path, with
RGMII_CONFIG_DDR_MODE set and RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL
cleared. That path wants 50/5 MHz at 100M/10M, but the link clock is
asked for 25/2.5 MHz instead.

As far as I can see this is also hit at probe, where
ethqos_hlos_setup() requests the SPEED_10 rate before any link comes
up.

This commit message says the QCS404 RGMII clock source cannot provide
those rates. ftbl_emac_clk_src in drivers/clk/qcom/gcc-qcs404.c only
lists 5, 50, 125 and 250 MHz. On SM8150, link_clk would end up at half
the rate the non-bypass configuration expects.

Shouldn't the doubling be skipped only under the same condition that
ethqos_fix_mac_speed_rgmii() uses, i.e. phy_managed_delays set and
phy_mode == PHY_INTERFACE_MODE_RGMII_ID? Or is there a reason the
earlier DLL-bypass patch in this series made the rate depend on
phy_mode only?

[Severity: High]
The v4 note says phy-managed delays should only affect tested hardware
(Shikra and QCS615). Does that also hold for the link clock rate?

ethqos_set_clk_tx_rate() chooses the bypass rate from phy_mode alone. It
never checks phy_managed_delays:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_set_clk_tx_rate() {
    ...
	/* Clock Rate Requirements:
	 * MAC added delay: 250/50/5 MHz for 1G/100M/10M
	 * No MAC delay (DLL bypass): 250/25/2.5 MHz for 1G/100M/10M
	 */
	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
	    speed == SPEED_1000)
		rate *= 2;
    ...
}

ethqos_fix_mac_speed_rgmii() takes the bypass only when the flag is set:

	if (ethqos->data->phy_managed_delays &&
	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
		ethqos_configure_rgmii_id(ethqos, speed);
		return;
	}

Take a descriptor without the flag (emac_v2_3_0_data, emac_v2_1_0_data,
emac_v3_0_0_data, emac_v4_0_0_data) and phy-mode = "rgmii-id". At 100M
and 10M, the IO macro is programmed for the DLL/MAC-delay path. The link
clock, though, is set to 25/2.5 MHz, not the 50/5 MHz that the comment
says this path needs.

This commit's message also says the QCS404 RGMII clock source does not
support 25 MHz and 2.5 MHz.

The unconditional halving came from the earlier commit in this series,
"net: stmmac: qcom-ethqos: add DLL-bypass for PHY-managed RGMII delays".
That commit said "No change intended on existing platforms". Before it,
clk_set_rate(link_clk, rate * 2) was always used.

Could the rate check also be gated on ethqos->data->phy_managed_delays,
using the same condition as ethqos_fix_mac_speed_rgmii()?

> +	.has_emac_ge_3 = false,
> +	.setup = ethqos_hlos_setup,
> +};

[Severity: Medium]
Should qcs615_data also carry the POR table from emac_v2_3_0_data?

static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
	.rgmii_por = emac_v2_3_0_por,
	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
	...

The binding requires QCS615 nodes to use "qcom,qcs615-ethqos",
"qcom,qcs404-ethqos". Until now they matched emac_v2_3_0_data through the
fallback. The new, more specific qcom_ethqos_match entry now binds them
to qcs615_data, where num_rgmii_por == 0.

Only phy-mode = "rgmii-id" takes the bypass early return. For "rgmii",
"rgmii-txid" and "rgmii-rxid", ethqos_fix_mac_speed_rgmii() still runs
the full DLL/MAC-delay sequence, but this loop now does nothing:

	/* Reset to POR values and enable clk */
	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
			     ethqos->data->rgmii_por[i].offset);

That leaves RGMII_IO_MACRO_CONFIG, SDCC_HC_REG_DLL_CONFIG,
SDCC_HC_REG_DDR_CONFIG, SDCC_HC_REG_DLL_CONFIG2, SDCC_USR_CTL and
RGMII_IO_MACRO_CONFIG2 to be read-modify-written on top of whatever the
bootloader or the previous link-up left in them.

The rest of the sequence sets bits for one speed and does not clear the
other speed's bits:

- ethqos_rgmii_macro_init() sets SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN at
  10/100 and SDCC_DDR_CONFIG_PRG_DLY_EN at 1G.
- The 1G path also sets DLL_EN and CK_OUT_EN in DLL_CONFIG, bit 26 of
  USR_CTL, and DDR_CAL_EN, MCLK_FREQ_CALC and TRAFFIC_INIT in
  DLL_CONFIG2.

Only the POR write clears these bits.

After a renegotiation from 1G to 100M (or from 100M to 1G), wouldn't both
RX delay enables stay set, along with the 1G DLL settings?

The commit message says:

    The existing compatible binding and qcom,qcs404-ethqos fallback
    remain unchanged.

But the descriptor those DTs bind to does change, and only the rgmii-id
bypass path was tested.

Would adding the following to qcs615_data keep the previous behaviour for
the non-bypass modes?

	.rgmii_por = emac_v2_3_0_por,
	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-shikra_ethernet-v4-0-c41902e5f2fa%40oss.qualcomm.com

