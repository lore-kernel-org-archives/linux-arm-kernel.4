Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F73606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=on91Tucu;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SF3dONSk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OoKBRcmrTDIDRIbLA9s0zXdXJ1T41upq0j5GITw3Se4=; b=on91TucuVWCaKP
	1EZAwgq62wxfpqTjIxp5VEXTnW2yA5q8I2xcpgHAhGa587FTu550DXM2jGwtvIZ1BMP4QpQBPs2OA
	dAtPJX++yGfsGJUqMwK0JkMBANysxctlRvcCs5iZe8Si9rEpqLYbb9oOSIarxRkY1+1zcIROnTbK4
	QYNvJnBh2CLxa+PahfTyoabj1ysxc4SWnblpOlBl1DlgtdowDyALVlSpbz/6dyu5kBoljpxSEyx+k
	ILaC4wVPsn3YXK2cfD6JNqJzGdQfxLyNpXMNHefcqzTghkTX9uKqvn1rUrZSPwGtTjkBM8EdaoTQs
	d4otCmLeiwe7xLcFMdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAbe-00000001NE2-0Bnm;
	Sun, 22 Nov 2026 16:39:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAbb-00000001NDi-0oI5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:39:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E3A81A1786;
	Sun, 22 Nov 2026 16:39:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39EC060512;
	Sun, 22 Nov 2026 16:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1BB111E624BF;
	Sun, 22 Nov 2026 17:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795365592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OoKBRcmrTDIDRIbLA9s0zXdXJ1T41upq0j5GITw3Se4=;
	b=SF3dONSkTk5Y0vNM5gm5TfPWc+ZbCt79W+USBvAJ/dr8O9klVo8/nVANu7b5aKENGSa1zc
	ETwJu+KtLet8uAatVZ1erSu371CpbWEeuRY8i9Q2b5VL3k1LKytC2MK6uH1LmGU/g7TbOO
	QN2tW15nb1pcEZFSaKDHHKmCiMvsDcMuludPaXVnKP5YIOCE4bP3LjvTcvVGoSymalLgeE
	cAgSK42KPCgOsUdoMVMg+uLfYs4UTfHGrNFml7Iq6iZg3kUjSLSWqOerzRL4pVT5Y8ohqJ
	VZmy9aWrGexT+6C1PUj7mQyrKxVQxbvpdYO7jZXwDswLlMnQ4FjcA6b/4EhTcw==
Message-ID: <b5b6953e-6b17-4de3-b3b7-789a415e03ef@bootlin.com>
Date: Sun, 22 Nov 2026 17:39:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: eic7700: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_083955_397541_98122A7D 
X-CRM114-Status: GOOD (  17.14  )
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

On 11/21/26 18:07, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors of missing individual
> syscon arguments, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.  OTOH,
> syscon_regmap_lookup_by_phandle_args() already handles error case if the
> number of arguments is too low, thus switch is safe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you,

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index c229275b11b3..287f717ab3ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct eic7700_qos_priv *dwc_priv;
> +	unsigned int hsp_args[3];
>  	u32 delay_ps, val;
>  	int i, ret;
>  
> @@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  	}
>  
>  	dwc_priv->eic7700_hsp_regmap =
> -			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -							"eswin,hsp-sp-csr");
> +		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						     "eswin,hsp-sp-csr",
> +						     ARRAY_SIZE(hsp_args),
> +						     hsp_args);
>  	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
>  		return dev_err_probe(&pdev->dev,
>  				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
>  				"Failed to get hsp-sp-csr regmap\n");
>  
> -	ret = of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 1, &dwc_priv->eth_phy_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_phy_ctrl_offset\n");
> -
> -	ret = of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_axi_lp_ctrl_offset\n");
> -
> -	ret = of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 3, &dwc_priv->eth_clk_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_clk_offset\n");
> +	dwc_priv->eth_phy_ctrl_offset = hsp_args[0];
> +	dwc_priv->eth_axi_lp_ctrl_offset = hsp_args[1];
> +	dwc_priv->eth_clk_offset = hsp_args[2];
>  
>  	ret = of_property_read_u32_index(pdev->dev.of_node,
>  					 "eswin,hsp-sp-csr",


