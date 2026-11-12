Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01012606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eaNTfmh6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGZEOUbc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S3veBLBno/qaKONVSMDnquULTZHPngC+n6B05xna35c=; b=eaNTfmh6/tHy4V
	byUVjcrhXW8AdbWcpiJZh+m09/+rf4necS1T1gGJqjznLAKilvvuOnRWDB9XnPElMXm2ZSPyU3u90
	EbPbQrE/eJYqRiU6Vz07Yn4czvmZxs3sZYDfym8vaVI+XPldyNqbQraEU8ldaLhvZrFXct/2n7RpI
	YqQGX+56aHEmNlScngIIoXhTZeWk/FY/srnbKcKECCbU7XJTDqhoVw5m4tdTvt3QWzqxXaqioduhf
	ewVUoUYHwmYpLoOLlnwyAaPtJrsCR2eVut5ow6IAmTRAh1GSoWkgZwuSAHgoawHls31+09/CNzyrM
	Y5ds4r2RXa7xQCen7s7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYP9-0000000AjTo-0uan;
	Thu, 12 Nov 2026 17:16:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYOJ-0000000AjG2-29xD;
	Thu, 12 Nov 2026 17:15:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47E9C4246F;
	Thu, 12 Nov 2026 17:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F8A1F000CA;
	Thu, 12 Nov 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503715;
	bh=S3veBLBno/qaKONVSMDnquULTZHPngC+n6B05xna35c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WGZEOUbc6oHSdheS4iS6DOmilz2vYDUqMY+bX6bKaf53qAAFSzSfB5u2UaXQggNWK
	 zj/Ya32X8G2QFSgIqKhWqQmy2RAyC+0n8c3rWudYrSj0m7gar1FCtTZxpCZzF/9U1B
	 pQQw6OVK6kfvVsXQtLD8iQMEeTXj9L6sIFH0OXSNeqCgRPCSm3LDMB54oh/WEyuINl
	 S1Uw3SiexcndgKKexnSGMX8d/dwTYMSlG5ZYhs6yAUTDJSF1OPnt/eA/fyzsEVVF/g
	 yLtWfY1gf+QXj5fxTlnaPNRRD/dYBn7ycF7BXmNqxkK/d26ls4RdZLxRbaNYcb7ax6
	 WvwCN8oZpeFIg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v16 7/9] clk: realtek: Add RTD1625-CRT clock controller
 driver
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112052544.555563-8-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-8-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369605.1227210.17543763091331889668.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=QsgdZRhFndjUtDKfDm9gVMN3ANGxsGLTgcQaeMyrApg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+fhH7cr/O62pDNFeyzpXTPJVtVQGnD91pu/K8NUbR6
 nGUrrdORykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOp+sjwT731xFntJlsN5gl1
 Z3g0X/mbrZ8p73FVpffxBgf5D9uSjjL8j9aa9E9sYuOXn/fVVLdcE5JectX1zP0nPss0b06ONFS
 tZAcA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add support for the CRT (Clock, Reset, and Test) domain clock controller
> on the Realtek RTD1625 SoC. This driver provides essential clock sources
> (including PLLs), gating, and multiplexing functionalities for the
> platform's peripherals.
> 
> Because the reset controller shares the same register space with this
> CRT clock controller, this driver also acts as the parent device and
> registers the reset controller as an auxiliary device on the auxiliary
> bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v16:
> - Remove Brian's reviewed-by tag.
> - Replace 'const char *' parent arrays with 'struct clk_hw *' arrays.
> - Switch all gate, mux, and fixed-factor clock initializations to use '_HW' macros.
> - Use 'CLK_HW_INIT_FW_NAME' for regmap_pll initialization when referencing external
>   clocks, and add 'expected_parent_rate' to ensure a safe input rate.
> - Refactor eMMC PLL initialization (decoupling phases and appending rate tables).
> ---
> +static int rtd1625_crt_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc = device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);
> +}
> +
> +static const struct of_device_id rtd1625_crt_match[] = {
> +	{ .compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc, },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> +
> +static struct platform_driver rtd1625_crt_driver = {
> +	.probe  = rtd1625_crt_probe,
> +	.driver = {
> +		.name = "rtk-rtd1625-crt-clk",
> +		.of_match_table = rtd1625_crt_match,
> +	},

Should .suppress_bind_attrs = true similar to what you have in patch 8?

Brian

-- 
Brian Masney <masneyb@kernel.org>

