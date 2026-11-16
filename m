Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB0606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ef7fTyLO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=T04CbP61
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FCGOa3XrFIfDpttYvQ7K/eFdh+Q44Gu+ztj0XVelAZ0=; b=ef7fTyLOGalAEJ2YRlrAH9DEgT
	J1ASNnZyBarD23LuHL5wvVwnvs7xQJTAQr12VCdKQ/AL0s9f6UNhJDuzLULZ7J98j+w3bVsr+nYxy
	zBb+Rz1Ygza/pF7LBuZwA7Qf668qsNo2hz6BHCpLe99f5qNmEHP39qzO/3BSP51+2eTxAbf0WkLFX
	5Jxy5NakhF+g+ptCgfPaBm8hq/TFRl202Nw9ng/7Sm/LZd2mdDhR8QNvZjqJ2oB7wenvUcEHKFunY
	p1xiiT+cjGIbXAGLXld6r4EPUYCkIMYZgSSZo/Mr9JDvLgxkU3AOc9ubg7HTJhA7pKUE+HS+ut6Wg
	MbHIprlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxBN-00000002j1K-19wz;
	Mon, 16 Nov 2026 13:55:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxBF-00000002iuO-033Y;
	Mon, 16 Nov 2026 13:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FCGOa3XrFIfDpttYvQ7K/eFdh+Q44Gu+ztj0XVelAZ0=; b=T04CbP61TFnnA7S4qsYADasFM9
	gEmppjaUC5umGuiwAsjETT43An/mWPSNQGyuJHmwBONwj5hGPHtiHI+Bd/cBelT2bYRZeSC5SK7di
	61uhuxeFxUiWWX0nxwVaN6ELnqkLUoAfK2a8k9pPTZNLx410AYtPgsHJ62T0VVKRO6yA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSxAx-00Gvgu-M1; Mon, 16 Nov 2026 14:55:15 +0100
Date: Mon, 16 Nov 2026 14:55:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: 1579567540@qq.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
Message-ID: <f8d4b637-1818-419c-ac51-fb2ded1f9b3e@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055533_087464_94FFA953 
X-CRM114-Status: GOOD (  10.19  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static void rk3572_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int tx_delay, int rx_delay)
> +{
> +	u32 val = GRF_FIELD(14, 8, rx_delay) | GRF_FIELD(6, 0, tx_delay) |
> +		  GRF_FIELD(15, 15, !!rx_delay) | GRF_FIELD(7, 7, !!tx_delay);
> +
> +	if (bsp_priv->id == 1) {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO0_3_VO_IOC_CON1, val);
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO5_6_IOC_MISC0, val);
> +	} else {
> +		regmap_write(bsp_priv->php_grf, RK3572_VCCIO1_2_4_VI_IOC_CON1, val);
> +	}
> +}
> +
> +static const struct rk_gmac_ops rk3572_ops = {
> +	.init = rk3572_init,
> +	.set_to_rgmii = rk3572_set_to_rgmii,
> +	.gmac_phy_intf_sel_mask = GENMASK_U16(11, 9),
> +	.gmac_rmii_mode_mask = BIT_U16(3),
> +	.clock.io_clksel_io_mask = BIT_U16(7),
> +	.clock.gmii_clk_sel_mask = GENMASK_U16(6, 5),
> +	.clock.rmii_clk_sel_mask = BIT_U16(5),
> +	.clock.rmii_gate_en_mask = BIT_U16(4),
> +	.supports_rmii = true,
> +	.php_grf_required = true,
> +	.regs_valid = true,
> +	.regs = { 0x29d20000, 0x2a040000, 0 },
> +};

Just looking at this, it is not obvious that rx_delay and tx_delay are
actually not used.

	 Andrew

