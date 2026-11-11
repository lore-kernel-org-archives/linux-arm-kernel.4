Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TtzMDiUU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=FMEwYNIu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Xc10+7RwQyckt9OcmRiolWc/n8l2uHi554tCZyrtaaA=; b=TtzMDiUUpbr6Yd
	FLXc4qAIvb3Ci6v7wGArnX4j7bZhLImPQtL2KeWOsmio9sTMJkNuuu0mgl5YB3auvmHULfRUVpNg6
	vbhlAsq5+P0z94ydWpUYYs7Mt9Eyli/3+lS9GVRFMN5Smwk2bdhNJWZAlMAs9RsBTdRB746P83VDq
	lL+86Tx16/3KSVuHeuGapbXCxD4sJ4vNQzAtjTQTf+W+an7ePgPe/OKcYPu6c+s63i4ldaluQrfda
	144b/9KxApBRta4/cons8xxf6a8Oxcqf2OVFXIk0V0gxp6KHNrl+TwPDUjMVyQX+7/p1PqPX2hin8
	mrFq7eQOxzXGRHv27Jgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8AG-00000006n5R-2tzU;
	Wed, 11 Nov 2026 13:15:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8AE-00000006n4e-0QNl;
	Wed, 11 Nov 2026 13:14:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794402893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JiuYMiq8RBihKialjLq+csYOnvm3N2aGmzrVaPUdaxvEAGDkPBxmVCOfFs6FTNdvs8DMSwCszTFIdhdlyLUUjeS26WRTtCiigVfvezJ7wMJznjlUe7a8t6wr1kPUUs015VeOrMosw9xKCVyMwUCPpIjkGCXqL2Ot9fUlRjdgWVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794402893; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xc10+7RwQyckt9OcmRiolWc/n8l2uHi554tCZyrtaaA=; 
	b=WRC+mpP8UxmcLQ1/dFMf2anla6V/WKnVGXjxsW26lk3jCxzb2C2+RqLA9gctpu47GQRLxQLQx64tr2k7UMhLCDw9aylRuEcnuS5Xf4H1hsxe+ZxFTlpdVleg5//DbNRHXvPbN8PU8vt2EmyC2bcrIKl+W2RHLBh209w0PAZE5kM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=FMEwYNIu/lXOWYXTUwtQ/tATog2J9nKcRKlIZJh9KEmvFKR2PTUyfW8pVrU6YcesQub3HJNv2LjrsIdGY69Xe230rVICykok7XU6GTYZlbnteedow490LMElkus7ZqD+P2Z4yAeFoUvm1KBK2XQEncus9AyCZTTzjp030n1C6X0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Xc10+7RwQyckt9OcmRiolWc/n8l2uHi554tCZyrtaaA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179440289194724.462775649189325;
	Wed, 11 Nov 2026 05:14:51 -0800 (PST)
Message-ID: <6fbe6fed-3ed4-4f87-a92b-dbd01e1674d3@collabora.com>
Date: Wed, 11 Nov 2026 14:14:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-5-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_051458_201192_69CE7B1D 
X-CRM114-Status: GOOD (  19.09  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

Thanks for the patch!

On 11/10/26 09:18, Jason Yang wrote:
> The APB reset and the BIAS references have to be treated as block-level
> [1]: both the transmitter and the receiver need them, and they only have
> to be programmed once. They are programmed from the transmitter's
> power-on path today.
> 
> A later change registers one struct phy for each of them, and a second
> consumer coming up would then reset the block underneath a PHY that is
> already running.
> 
> Program them from runtime resume instead, where whichever of the two
> comes up first brings the block up and a second one no longer resets it.
> 
> This puts the BIAS writes ahead of the per-PHY reset assert, where the
> TRM's worked example has them after [1]. That is safe: neither M_RESETN
> nor S_RESETN covers the BIAS registers, and the values written are those
> registers' reset defaults.
> 
> [1] RK3588 TRM: sections 22.4.1 (address map), 22.4.2 (reset values),
>     22.6.1.2 (reset) and 22.6.4.1 (D-PHY transmitter start-up)
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7a009d87a665..d6acc3e2d448 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1346,7 +1346,6 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  
>  	reset_control_assert(samsung->m_phy_rst);
>  
> -	samsung_mipi_dcphy_bias_block_enable(samsung);
>  	samsung_mipi_dcphy_pll_configure(samsung);
>  	samsung_mipi_dphy_clk_lane_timing_init(samsung);
>  	samsung_mipi_dphy_data_lane_timing_init(samsung);
> @@ -1373,10 +1372,6 @@ static int samsung_mipi_dcphy_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> -	reset_control_assert(samsung->apb_rst);
> -	udelay(1);
> -	reset_control_deassert(samsung->apb_rst);
> -
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_power_on(samsung);
> @@ -1667,6 +1662,12 @@ static __maybe_unused int samsung_mipi_dcphy_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	reset_control_assert(samsung->apb_rst);
> +	udelay(1);
> +	reset_control_deassert(samsung->apb_rst);
> +
> +	samsung_mipi_dcphy_bias_block_enable(samsung);
> +
>  	return 0;
>  }
>  
> 


