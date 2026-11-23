Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F3D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIq+rjt3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fbe9rZ1M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N1Kph1Jnk+DxQD2xwzYoq4HTvoREjcNCOFAcKHlvXLQ=; b=HIq+rjt33Ij4BP
	HnrD3uQ/DEg9/bygQEuYNYPJ19oAWhTQopEP0Sb6FFlwSKDH0PreN1hsiMTg84yEgL//TdXYzmph9
	l2iCyfAOGI2/yoFG9WJ01qOdz02uiIlLtAAJPIwcdLknxjyA5pf1jq2vBXedFr343Ns1sRxJs52h/
	toshgJpQbIQRCW2B+Ggpef/Xwi96pUY/9yPiX8dUyQ64XhwTBO8+xpDH7RAXim69u/uvZj9pidVBM
	9QCZ55v/FNESh24FHok994vE3GtrIoV3p0RgxUsnKrSWnj0LW42rlWA7X7VeFHtcO1GeMEjQJ/CIn
	kclQgaZncXpv2NMeB0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWUd-000000047IA-2FYh;
	Mon, 23 Nov 2026 16:02:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWUb-000000047Hf-3zw5;
	Mon, 23 Nov 2026 16:02:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 55502622FA;
	Mon, 23 Nov 2026 16:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E901F000D2;
	Mon, 23 Nov 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449728;
	bh=N1Kph1Jnk+DxQD2xwzYoq4HTvoREjcNCOFAcKHlvXLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fbe9rZ1Mv1u8RJWaAxnCXG49oerJ+CjiUI0zg42zlZTlVgKSbRM7B7/pXkEAdbaNj
	 IWTlVDP4ABD5HLR/QmfRjs/cj4KIbOQ0B2chPcGTfz5qxNl8H9JbcnD9GX1BVVZyrW
	 is0BxM+OAQDFWELHwPJhABcimE7uC9rnYVpv2/mLvzaIx5rtlV65/do/WKiemXp6rq
	 WMTrLCHChMnIUJq+Cx9HaT9SgIyuvlNkbvLX7iugA1rxo75MXLAhdVgYcyMMV1uVpe
	 xm4OrfE2pmRC8bn+D4fMl6jFugDJckS3YsXafVR7kACdUJ/uL7vVNDwXqIFvjWeU8X
	 tqb3wafxFup/Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261110-9f141e6bc8-phy-rockchip@mail.sdu.edu.cn>
References: <20261110-9f141e6bc8-phy-rockchip@mail.sdu.edu.cn>
Subject: Re: [PATCH] phy: rockchip: inno-hdmi: Fix potential stale clock
 provider
Message-Id: <179544972583.261285.10042942204136038609.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:32:05 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 10 Nov 2026 22:32:25 +0800, Guangshuo Li wrote:
> The clock provider remains registered if PHY provider registration fails.
> Device-managed cleanup then frees the clock hardware and PHY private
> data still referenced by the provider.
> 
> Use a device-managed clock provider so both probe failure and removal
> unregister it before the clock hardware is released.
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: inno-hdmi: Fix potential stale clock provider
      commit: e7d2f93a4426ea6b33dbca1ce585a9876e3a7344

Best regards,
-- 
~Vinod



