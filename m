Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KxF7UnY5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=lWP+oOsk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HgCEM27S7IbNhqq3jM19SR/jbOHjwjqAZf0wVe5KS5o=; b=KxF7UnY546V9e1
	2SgA68NnhHVhQfQIoLd0fyy/bMb0qX7ykYOyjCyV/+KoTgi8HEdjRUuo4h2E4qH/UgBjgNgndelgL
	pthbJRRl2qptK8iGK6P23dvwsH8jQ0KmjxaFYqvBa3hXSLqgxV5cbXpWsja1T+12C8EKUEX3UVi15
	tYHeFD6aDEQMzJr500smOauhOpuanYTZ7Pmv+lNP5OYQDiWwrlD9xfVkW8zCAgDNClqLTjzSYmCR6
	3uJiI1arS/sFDwUGezUWbR4UaDYv478szZomwCrDYIVxShl3Gp6xd3KgRz6yAh8PerrAACOztGZQ7
	JW50IhQxY/41hC3wToUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8RV-00000006p7E-0uGB;
	Wed, 11 Nov 2026 13:32:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8RT-00000006p6d-1WKu;
	Wed, 11 Nov 2026 13:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794403961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mPlMZ4QBfCYhqRipVGIeZsOMwEbcb63/j0o01IhSP7fWxRYSo8DD/waCAOmx0issHPqj0W3ADT/2nVhLM/lhAjyDv8DiO8Q2R69I2QS/aKeWCI5JXJgLZqRK6IqDq71PXGyY/GZR75GiUJLYWjD9SbZF1HNQ03yi1a0ZhlPwsS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794403961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HgCEM27S7IbNhqq3jM19SR/jbOHjwjqAZf0wVe5KS5o=; 
	b=I+/M9noVCAvGbkX6B4zoaMWUBvlGqe5lOu089fhVLuQZ6GsLbydsiJ/4TSp63wugMYmAd5HlVvvQIqg4D+tk6oRwF8DZG/FQLxqvleQS8ho9oIPMer8kc42Q8lXxed7ZGPwEmn2T+ysaATAHzMb4wEa/fKxifExLmuzFvScmm+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=lWP+oOskxefOGnze70OdGE2pkyOkOegIGhKXhiqLmhkEQ3mQVw5WxA3fq+sOuxJWCySeZvGid/i8QV2wxJalmYcbuonWWmc016tW6S0bMNIyuRluHPCNJ71xNVXJFf34AhQ6GOMhvKwvLY+RcWJ67LZBuY9qn6bOrkZV4SqdZg0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=HgCEM27S7IbNhqq3jM19SR/jbOHjwjqAZf0wVe5KS5o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794403959576103.49384226317557;
	Wed, 11 Nov 2026 05:32:39 -0800 (PST)
Message-ID: <a11909bf-01f4-4905-81d9-e5c295feb595@collabora.com>
Date: Wed, 11 Nov 2026 14:32:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
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
 <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053247_466817_553DC9D1 
X-CRM114-Status: GOOD (  21.02  )
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
> The binding now selects the PHY with the cell and the mode of the block
> with the phy-type property of the provider. Read phy-type in probe,
> D-PHY by default.
> 
> of_xlate() returns the transmitter for PHY_DIRECTION_TX. The deprecated
> PHY_TYPE_DPHY and PHY_TYPE_CPHY select the transmitter as today, so
> existing DTs are unaffected.
> 
> A phy-type other than D-PHY or C-PHY fails probe. A deprecated cell
> value that does not match phy-type gets a warning, and the transmitter
> then refuses to power on, as in C-PHY mode today.
> 
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index c40c84791eca..e8e229fc4856 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -297,6 +297,7 @@ struct samsung_mipi_dcphy {
>  	struct reset_control *grf_apb_rst;
>  	struct samsung_mipi_phy tx;
>  	u8 type;
> +	bool legacy_mismatch;
>  
>  	const struct samsung_mipi_dcphy_plat_data *pdata;
>  	struct {
> @@ -1376,6 +1377,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
>  {
>  	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
>  
> +	if (samsung->legacy_mismatch)
> +		return -EOPNOTSUPP;
> +
>  	switch (samsung->type) {
>  	case PHY_TYPE_DPHY:
>  		return samsung_mipi_dphy_tx_power_on(samsung);
> @@ -1549,13 +1553,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
> -		dev_warn(dev, "phy type select %d overwriting type %d\n",
> -			 args->args[0], samsung->type);
> -
> -	samsung->type = args->args[0];
> -
> -	return samsung->tx.phy;
> +	switch (args->args[0]) {
> +	case PHY_DIRECTION_TX:
> +		return samsung->tx.phy;
> +	case PHY_TYPE_DPHY:
> +	case PHY_TYPE_CPHY:
> +		if (args->args[0] != samsung->type) {
> +			dev_warn(dev, "unsupported phy cell %u with phy-type %u\n",
> +				 args->args[0], samsung->type);
> +			samsung->legacy_mismatch = true;
> +		}
> +		return samsung->tx.phy;
> +	default:
> +		dev_err(dev, "invalid phy cell %u\n", args->args[0]);
> +		return ERR_PTR(-EINVAL);
> +	}
>  }
>  
>  static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
> @@ -1566,6 +1578,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct resource *res;
>  	void __iomem *regs;
> +	u32 type = PHY_TYPE_DPHY;
>  	int ret;
>  
>  	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
> @@ -1620,6 +1633,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
>  				     "Failed to get system grf_apb_rst control\n");
>  
> +	of_property_read_u32(np, "phy-type", &type);
> +	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY)
> +		return dev_err_probe(dev, -EINVAL, "unsupported phy-type %u\n", type);
> +	samsung->type = type;
> +
>  	ret = devm_pm_runtime_enable(dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> 


