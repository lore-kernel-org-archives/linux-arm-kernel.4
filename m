Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF6F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FuPJNsTH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ea3iqC5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tlK6hSec1f9jWqEAlhwK9sJn2gZXx81wvvOTkXnIgdE=; b=FuPJNsTHszO7QT
	GyYOcb1MQqfEbXYKFQQebO7d+ZlXJDwqha8eaALKw0DIZrNyAno/Ybp2ze4KrSbgB3Xz6aSRwOYhX
	gXlEyGUHSNGY03cOaBxhN2aEi4O6FWbOtfKGQ2r3gj3rLT6NYwD/5IsSUo6uTz6K7864OkK9T0sFa
	dB0mjzqCWetNtIRHfmUs2HHCV9Q6yrhMQIww0wgal27kN8unUl6Xu7wOofa6y+wAQ3ibHq1EiRN3N
	Sl58g2rUUKlNJhx9mDbnd/ACmOWIgofz4gXWfieV2TcWPKRQuFoyvXKdAchOFxoZexE7+NI1+AOGf
	9GQ9GUa6tqiu+RdvpEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7yX-00000006lUh-1jJb;
	Wed, 11 Nov 2026 13:02:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7yU-00000006lTk-1kd2;
	Wed, 11 Nov 2026 13:02:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794402160; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L8HEZ71KUMccAPwJPXHHfOiZLN3J2ti/R/h1ctJEI8xur9B1I2tKzj/DyOELXhWMG8sSrwmUNgsx4vxgYidSf5RHVHThWMsK5nVd+8DhzbD7iZQsR+gDrRit8Cc3UwRKWsiWPIwBZzNNtOgeBpaMib7dSu4XPZXlxp0ewDcPjWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794402160; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tlK6hSec1f9jWqEAlhwK9sJn2gZXx81wvvOTkXnIgdE=; 
	b=nYscZxxZwaOIgkFrYT/t1cicREyBpMxN2YbK7eCAxl3ITUPWeyGhpEKqe8oWc1Mspra1MXRazUh+EJ0NthCk5563oxUxPDvlVim3BXXZoOsuoSUXDOAvmeGCrFYj2tfvz8utypbs8NKq4CiL1wDn7pH4HhsIK8gMTuBE3HVJOKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Ea3iqC5SA+kLnbCPnCuvTHVE11jFgWxos297PfeM3irdB1DhWWQIjI5xV1fRw+U4Zb72FgD+kLBkV0J2x7OoDeTfVXMamuprjb8KH3vVNWnRrEOvB52B3UxGl99jiFFiMXnAJtPB/2xqMwWVYlTYyP1Oo9o98GBnyown9maOc8A=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=tlK6hSec1f9jWqEAlhwK9sJn2gZXx81wvvOTkXnIgdE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794402159144738.3650032077535;
	Wed, 11 Nov 2026 05:02:39 -0800 (PST)
Message-ID: <3ab93996-7e37-4143-aa4c-b4b4b0e025d8@collabora.com>
Date: Wed, 11 Nov 2026 14:02:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
 <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-3-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_050250_514615_F8793DFC 
X-CRM114-Status: GOOD (  20.32  )
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

On 11/10/26 09:18, Jason Yang wrote:
> samsung_mipi_dphy_power_on() returns on a PLL lock timeout with PLL_EN
> set and m_phy_rst still asserted, and the PHY core does not call
> power_off after a failed power_on.
> 
> Today the APB reset at the start of the next power_on cleans this up.
> 
> A later change moves that reset to runtime resume, so the leftover
> PLL_EN would stay set, and regmap_update_bits() would not even write
> it again.
> 
> Unwind the power-on before returning the error.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-174059@kernel.org/
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 7382043e1f31..ce1bc62497c5 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -1343,8 +1343,11 @@ static int samsung_mipi_dphy_power_on(struct samsung_mipi_dcphy *samsung)
>  	samsung_mipi_dphy_clk_lane_timing_init(samsung);
>  	samsung_mipi_dphy_data_lane_timing_init(samsung);
>  	ret = samsung_mipi_dcphy_pll_enable(samsung);

I wonder whether this should be here in the first place. Only judging by
the name, samsung_mipi_dcphy_pll_enable is something that affects the
complete logic block and probably should be kept in runtime resume to
begin with.

However, since _dphy_rx_power_on does not call this funcion, it seems to
be something related only to the TX side of the logic block, but for
D-PHY and C-PHY. In this case, it probably should go into
samsung_mipi_dcphy_tx_power_on.

On the off chance that this is actually for the D-PHY TX operation, the
function should be renamed "*_dcphy_pll_*" -> "*_dphy_pll_*" or
"*_dphy_tx_pll_*".

What do you think?

Best regards,
Michael


> -	if (ret < 0)
> +	if (ret < 0) {
> +		samsung_mipi_dcphy_pll_disable(samsung);
> +		reset_control_deassert(samsung->m_phy_rst);
>  		return ret;
> +	}
>  
>  	samsung_mipi_dphy_lane_enable(samsung);
>  
> 


