Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55BF606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XRCIJen4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5DqkLCO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6vlpmEXN4SupBIvviqVSLO43c+8YDnUBrUBvhVqcCAY=; b=XRCIJen4z3871F
	Ot5jbUS++ihUnHWSUsNuodEwb+ZWPZXu4hE51Zdk7uXToWXYaYK0PA49A6LIxSzu30vmzw8pCElsL
	GOarHxd/ox3Jqt8XFgYxkPszM8sIOZekuiy7EkEBqly/E/U3UE3RuUZQC0ATVStet4P+NAdJIdssg
	sZ45/Og4H16BcLbafRdErrzWsVUJuBZ3EE31gcAcBnvrJ/P2MVFGomgSZHueRyTvz+MzeAH8BXXXj
	xeuzlODvJSNZ7O0GzImBimkRQnY2HMYiymbz41zb5sJFMKIQ0mmvxsODg8MO/XAXt3PM35YawNiqY
	r+bGINWHKcJyiCjYkTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAxK-00000009Yep-2WGZ;
	Wed, 25 Nov 2026 11:14:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAxJ-00000009Ye2-2lBh;
	Wed, 25 Nov 2026 11:14:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCCB540464;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F021F000CF;
	Wed, 25 Nov 2026 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605268;
	bh=6vlpmEXN4SupBIvviqVSLO43c+8YDnUBrUBvhVqcCAY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=T5DqkLCOyfSlrv44SO4DIE6ySLO2afEJJ34f1lXt/V59ckTjsMBstO6qNUEXexsah
	 YiC7L8F68AbF6uhNxR2p71S7+0sVlSqRzw5DMIgGL87+qgt6LmhGRoCk0SkU3//dCR
	 1QVELYaeuFIMwmwMZYoMdTEcoknHLvuxl8XCkmmWXte6OeFSbJYi/AvnR2EUDXtAo/
	 v+7blb7NOLvfyFk8EPjTRrPXSjwnzGK1xnMKMJTAYP3yzaJUtTBthveOzkH/BtAaTj
	 r2+He7E9JbaNJIR+DM6QN/3hYUhzXgtDv98nCdmuerYBPcT3aWUZNzVzBBKP4tXQMn
	 u76O5F2f6QPoQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261123092244.1792040-4-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-4-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526391.84329.5543546580524948144.b4-review@b4>
X-Mailer: b4 0.17-dev
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

> The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
> USB3 SuperSpeed, but all known devices using it only have USB2 and the
> vendor driver has USB3 function stubbed out, so we'll only support USB2.
> 
> Apart from this mysterius USB3 capability, it's the closest to Exynos850
> out of those supported. Unlike other SoCs though, this one doesn't set
> the reference clock by default, so we have to set it manually.
> For this, create a set_ref_clk_rate property in drvdata that can be set
> to a predefined value to set the clockrate to.
> 
> Co-developed-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>  - Use unsigned long for set_ref_clk_rate
>  - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
>    error.
>  - Add Umer Uddin's Co-developed-by: tag for his improvement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

