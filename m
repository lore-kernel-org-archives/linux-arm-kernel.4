Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE014606A885
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2bL9Lr1g;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ybcb8Dfv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O4AXPfiKbyDpre+CB6uNRY4elkcJBCP9G8bvuRhJYmw=; b=2bL9Lr1gYco8Md
	jViWjffnOcvezym9tSEc6zNfuUAGxoendkAOz+R2f8N+1mcDORVhrG9aU3v1yUVe4BiSF2VaBhiSu
	DNGVne8zkparqce7h7bnQIz9XUEbAF2/6US0WKXI+sDutdzHvmE5rM1z4iGvN0hdyMId5wfcXdxMx
	oKYTexfTwW+/9VxXPfV9E//WlMI1wfj64KsxLpO9/AElPzgF9JY/kHt+rBptgEIjjMO+80eHl4Bt4
	2p29hSDabFgcYNh6X9hUfKye84HmWGDDS2s7YGf73+d32AGPsCIf4xSPWqcaUVHrqoDBAC4hQUSbK
	3nftcl5MUkiz53hQd1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxh-00000009hh6-0Rsi;
	Thu, 12 Nov 2026 11:27:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxM-00000009hIR-0g9J;
	Thu, 12 Nov 2026 11:27:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B11F6061E;
	Thu, 12 Nov 2026 11:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F951F00A05;
	Thu, 12 Nov 2026 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482823;
	bh=O4AXPfiKbyDpre+CB6uNRY4elkcJBCP9G8bvuRhJYmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ybcb8DfvJJta43gpnhAApzXPdEbGDIo6BxvlEiV3cgQi+hMbTguU8+tzxFY970n8H
	 lAf0aUSMrjjvueWzhwLzG6mzZKi1ac+ij1FlV70wuRR5ENj6eVsvPW97/aZ4JFDl9P
	 SItvqxet/FaHTHTzOGOQ8X46vnSiZhtIqp/d45EAvfiRzPqQ9lddb9AxQllWdN6taf
	 PueIJHjQIdLyGkXJSDlJ6OZjXr6Ii+w6sH4Sht/6omTTRlRL3Z9FM4Mi0E+9GpHbpw
	 vuNphCR0M9x69chCkgI4+VW8ChioDcN9xpBRgREkpqLRjhMuLpd49bcMFxfoV2WSiH
	 vO4Hfn6M5Wqnw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, mani@kernel.org, krzk@kernel.org, 
 peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com, 
 andre.draszik@linaro.org, kernel@lvkasz.us, pengpeng@iscas.ac.cn, 
 kishon@kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, 
 akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com, 
 shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com, 
 stable@vger.kernel.org
In-Reply-To: <20261020063559.3530901-1-selvarasu.g@samsung.com>
References: <CGME20261020063617epcas5p4ba00854fcd38bf211c573629ee062621@epcas5p4.samsung.com>
 <20261020063559.3530901-1-selvarasu.g@samsung.com>
Subject: Re: [PATCH v3] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
Message-Id: <179448281584.507383.1286765834477602323.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:56:55 +0530
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


On Tue, 20 Oct 2026 12:05:59 +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
> 
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
> 
> [...]

Applied, thanks!

[1/1] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent OOB access
      commit: ba6618a1e7c02f384069f7817133ff8cb5c793b8

Best regards,
-- 
~Vinod



