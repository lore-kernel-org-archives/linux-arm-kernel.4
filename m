Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97D606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fEWdDxCL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DyW/n0qa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CwOsftxfNPZqsPWmATYl8H3Jcuwt3wJErixQ5+qMlpE=; b=fEWdDxCL2c+kZl+yY0we2rGLSZ
	wCPy8tYJimMHEigc6icFArFdJHAUWzoPHQSKj9hGoSC/gjS6pYxLpKrEClAEjeLDeHe5AjO3CihWp
	9Wgg3i3ZqTFiOUE27sBNz6qkUYrm2nLk1stF2X3iu5gkrQndezlGGlec8vL9CaqCyz932fsspI8Zm
	jcIyOI4WBmkY8WvAJR2Piff8aG2VWX3JPnzRjssf5pb5W/TLpwNItZQlkuFc2jS9DCQ9MVroP2NX0
	VnMzz47Dt1Hc2VZyKezki329LA8eiFsvzHFHBK/H9g+iRO4vm6zPXH/FpRd/Citfeo6ppawwRk8CI
	MXByAplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfL-00000009caU-3vxb;
	Thu, 12 Nov 2026 11:08:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSfL-00000009ca0-0Toz;
	Thu, 12 Nov 2026 11:08:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D8F26122C;
	Thu, 12 Nov 2026 11:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1711F00A05;
	Thu, 12 Nov 2026 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481706;
	bh=CwOsftxfNPZqsPWmATYl8H3Jcuwt3wJErixQ5+qMlpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DyW/n0qa91KOXYIdySgHj3eIEbcxiNLeNpFJQeJIhuco7rqZhcUrZWt85zW2HvkZ9
	 2wHcJEktysymXTF6HagokqiVhCbjwDWD8yix6rDxMSGsopa8pZHnoxnrvLe/8Hz+2u
	 /Oeg3+Wul0MlRp1g521fXX3TFW07X/L5HX5Qvh0aSubdGVt08DH7GwnuO2LSJ2KXau
	 RPAXXyI2D8ChNftplFJpDpNSn2iMeD5JkQihuDtFyl16gS3OoJJvQR25xqK55OoY+3
	 gzGIr1nwOPmi+95UfGmefDWE5eByHd4cmfi1D0Ti6MIdqFXLTfEYjZ7WsHvUTpW7GR
	 EzmSUwBmBxA8g==
Date: Thu, 12 Nov 2026 16:38:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: aidenisik@member.fsf.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the Exynos5515
 usbdrd phy
Message-ID: <avWeJqbpbLcWgq_R@parshuram>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22-10-26, 17:46, Aiden Isik via B4 Relay wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> The Exynos5515 USBDRD PHY is a USB PHY which supports USB Super-Speed
> and High-Speed. Add support for High-Speed (UTMI+) operation.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 43 ++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index f10cf7b6e0aa..8718e8f01e46 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -2075,6 +2075,46 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>  	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>  };
>  
> +static const struct exynos5_usbdrd_phy_tuning exynos5515_tunes_utmi_postinit[] = {
> +	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
> +			     (HSPPARACON_TXVREF | HSPPARACON_TXRISE |
> +			      HSPPARACON_TXRES |
> +			      HSPPARACON_TXPREEMPPULSE |
> +			      HSPPARACON_TXPREEMPAMP |
> +			      HSPPARACON_TXHSXV | HSPPARACON_TXFSLS |
> +			      HSPPARACON_SQRX | HSPPARACON_OTG |
> +			      HSPPARACON_COMPDIS),
> +			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 15) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXRISE, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXRES, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPPULSE, 0) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXHSXV, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_TXFSLS, 3) |
> +			      FIELD_PREP_CONST(HSPPARACON_SQRX, 7) |
> +			      FIELD_PREP_CONST(HSPPARACON_OTG, 2) |
> +			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
> +	PHY_TUNING_ENTRY_LAST
> +};
> +
> +static const struct exynos5_usbdrd_phy_tuning *exynos5515_tunes[PTS_MAX] = {
> +	[PTS_UTMI_POSTINIT] = exynos5515_tunes_utmi_postinit,
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynos5515_usbdrd_phy = {
> +	.phy_cfg		= phy_cfg_exynos850,
> +	.n_phy_cfg		= ARRAY_SIZE(phy_cfg_exynos850),

.n_phy_cfg does not exist.. Please fix this

-- 
~Vinod

