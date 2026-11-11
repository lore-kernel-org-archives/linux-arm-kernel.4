Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B049606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yXPM7Qiu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=UrZMGIBQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y/MlMaKErObWTkJAP1O/f3fHFrVRzBGbOZAvu7H6yRc=; b=yXPM7Qiu1PaCuy
	Ndq79WLFlIxOnmRwBCeimgRg+TAVPPNeZrgekHJt1lPUh34WLzipqnwybXZaOipthLjaLJw3Ssv9J
	E7uOQrLhX8ep3+I7Tpg6WU6pHB/dAA6sJbjloolIQm7lisstq7UCmgLlW958UTpkphz1QdCSdX+Mf
	WiLmL4Y+3ospU1z3yOED5rHqGDfPvu/C9/I8BnrmFA0LS57yhko1Dp8Z6RB0jefG/kMAmWP9QTVx9
	hEIOfTVzJEsRPbV7iMbV/2ATGw1hSPrA6cyJmZA3lEoU9OxQIkTwbVt/l+MDwUk/TFpTXy5qZlld2
	ujngLyZMqhFZhT0PwddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAA1-000000074lf-233S;
	Wed, 11 Nov 2026 15:22:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA9z-000000074ku-0PSB;
	Wed, 11 Nov 2026 15:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794410565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gBXb74t8VyXcyhF2U34LZjd/IUJj3d2VeYmcQwcVmhDgqYdt0aA7l4BF2EycZCovx+aXjoATAiB02Y/M51ryalVmhjkrhC4vlttiGVF6uMyV5tqaNzNd0tQYBIbnVGCct+sk5t0+BYv4Wnj3bz9feMny92y9aE9Cjs8Trt1RtI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794410565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y/MlMaKErObWTkJAP1O/f3fHFrVRzBGbOZAvu7H6yRc=; 
	b=IPm3G8lZ0a0lC8SsV24HWlwwDfBP6W4rz4bY9DdjLaVpvnm8m/7sexyzQTTeVTLl3dqrCafCGvkxYiXnpi/i+XLIupHGqmIkzXY233oo6gQ5qkLZcbriw9xmfTnppHHlPHGaBhr3GyL+7fnAzYhhoAjhAb5ejKFlfWyg2GiFdp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=UrZMGIBQEwNvdRSMeyfv8q9k6o61Ee2F1LiS1C2mRPoIalF2xvjnL21zkDzXGaEOv/z9paE0HJsU5voIWxvZllirKR4WSYdPG7hxv0PyK2iAhqxeg0897VsJnDLW6rSGNsEMQulXjuEamsOW+NPiqeARAiAy0qaYuXAKO14jK4U=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Y/MlMaKErObWTkJAP1O/f3fHFrVRzBGbOZAvu7H6yRc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794410563762127.88540542025612;
	Wed, 11 Nov 2026 07:22:43 -0800 (PST)
Message-ID: <fd9615e5-bc5a-4ce0-a43b-081f3e9c14c2@collabora.com>
Date: Wed, 11 Nov 2026 16:22:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] phy: rockchip-samsung-dcphy: Add MIPI D-PHY
 receiver support
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
 <20261110-dcphy-rx-v1-v6-8-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-8-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_072251_213438_54DF83BB 
X-CRM114-Status: GOOD (  10.45  )
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
> [...]
> +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *samsung)
> +{
> +	struct samsung_mipi_phy *rx = &samsung->rx;
> +	int ret;
> +
> +	if (!rx->hs_clk_rate || !rx->lanes)
> +		return -EINVAL;
> +
> +	reset_control_assert(samsung->s_phy_rst);
> +
> +	samsung_mipi_dphy_rx_config_common(samsung);
> +	samsung_mipi_dphy_rx_config_settle(samsung);
> +
> +	ret = samsung_mipi_dphy_rx_lane_enable(samsung);
> +
> +	reset_control_deassert(samsung->s_phy_rst);
> +
> +	return ret;
> +}
> +
> +static int samsung_mipi_dphy_rx_power_off(struct samsung_mipi_dcphy *samsung)
> +{
> +	reset_control_assert(samsung->s_phy_rst);

I wonder whether this is really a D-PHY specific thing. You can keep it
as is for now, I'll try to bring up the C-PHY part on top of your
series, and then we'll see.

> [...]
>  static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.configure = samsung_mipi_dcphy_tx_configure,
>  	.power_on  = samsung_mipi_dcphy_tx_power_on,
> @@ -1535,6 +1905,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.owner	   = THIS_MODULE,
>  };
>  
> +static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
> +	.configure = samsung_mipi_dcphy_rx_configure,
> +	.power_on  = samsung_mipi_dcphy_rx_power_on,
> +	.power_off = samsung_mipi_dcphy_rx_power_off,
> +	.init = samsung_mipi_dcphy_init,
> +	.exit = samsung_mipi_dcphy_exit,
> +	.owner	   = THIS_MODULE,

Nit: either align all = or just use a single space (personally I would
prefer the latter).

> [...]
Looks all good to me!

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


