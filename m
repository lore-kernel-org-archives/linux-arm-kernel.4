Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6560A261C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MF0CHSHV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g16WEPmL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m4qjcb8gdZJwkaxEoXzAOBIqfyt8ugrUmG3Eiv5qTnQ=; b=MF0CHSHV1AWBfBfe+qOvmUL93Y
	ioSs9cEwojiSlgtlj1WFPjBlU4A9MiIhwvQgCWr0DQpSGCzS12LbmSGO3LQZfoudDtDPlijDA5Dk6
	k3z9GDqgXWlWZmb89YSyj4NH+U88WJ3WvfaHQPJfq/N120WBTQOzX9U16IvE4fuy7mgnA9nkrkneo
	wvZFFF2EYzL7weurOMtnqpVMle6EpeM4TGosTwtIL40OuYfu1KOlT0gD9bRG6lKRi0Yx7wQC8zCxz
	07o11GZguyuMl7/ZQlhli++VDba5GeRheDhabXbb6Y8xAj3+H5ks0cF1ZQ/tX7/0YxygeRrVyauiy
	lscW/5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVP7-0000000AAt7-363S;
	Thu, 12 Nov 2026 14:03:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVP4-0000000AAsP-2VP5;
	Thu, 12 Nov 2026 14:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5B9665811;
	Thu, 12 Nov 2026 14:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495D01F00A05;
	Thu, 12 Nov 2026 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492229;
	bh=m4qjcb8gdZJwkaxEoXzAOBIqfyt8ugrUmG3Eiv5qTnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g16WEPmLJh2qfr1y0FgQLLw3UDj+I8Xs57kLoCCMeud5BUl5MzWwBLwMzXZO3Dtrt
	 Kp5UWBp/duCls8fuuCh011u2HBXX6esYppxVKEt45L9eStIrRL7Rf0kpHTZeGEy/iS
	 SEy/JvO10r/qLQ6VvxOVNHjIpPMj2ttl+zR1zpykqEVjD0fo43ybVmC7fkRT/aS1pY
	 Au9dRXTw4Fexd+5rBiWz4zo7cHPOIqACnpdMVOYCeoZDxThBgHobl2L+9BbT1xNqgd
	 ZFaM/tUt6BBetfGfopq1EOkI9MPfHfLeUeWn3lXZsGwBkc0NyM0j+fVAyItEUiL4Qg
	 UOT4O6qRePA4A==
Date: Thu, 12 Nov 2026 19:33:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Neil Armstrong <neil.armstrong@linaro.org>,
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
Message-ID: <avXHP-GPIRXqFkEv@parshuram>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
 <avWeJqbpbLcWgq_R@parshuram>
 <Dhrinh2IqyBByHLyFp_SHX9igTjQgKk4G62C1vp6tHdO8QkM4kiFDLaExxnZeljVMXJ8YksFrLRDRT9voAj6LiJYqPvrUg3nFVNFzi7C9Bc=@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Dhrinh2IqyBByHLyFp_SHX9igTjQgKk4G62C1vp6tHdO8QkM4kiFDLaExxnZeljVMXJ8YksFrLRDRT9voAj6LiJYqPvrUg3nFVNFzi7C9Bc=@protonmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12-11-26, 12:53, Aiden Isik wrote:
> Hi Vinod,
> 
> > .n_phy_cfg does not exist.. Please fix this
> 
> As stated in the cover letter, this is introduced by dependency [1]:
> 
> > This patchset also depends on [1], due to using an
> > exynos5_usbdrd_phy_drvdata member > (.n_phy_cfg) which was introduced to fix
> > an out-of-bounds access bug.
> 
> > [1] - https://lore.kernel.org/all/20261020063559.3530901-1-selvarasu.g@samsung.com/
> 
> Which has since been merged by yourself. I assume you just
> looked at these patches in a different order so saw mine first?

Yep, picked now

-- 
~Vinod

