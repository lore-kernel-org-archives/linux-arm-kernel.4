Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F44B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxNd0vDP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LslcekGx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ux+kRKXXPI8nIz9tVs7F7c1iyRd71QPMq85RyBOC8hs=; b=oxNd0vDPGSxeu2GQ/m1Xbk3PXJ
	JLp3rjDiqoxtzCYb6kCevQYDa95wOcYXNmjPVrbN56q4rS3/A74CHIGQHJ7FM4txF1BuXPtknUXc8
	li/+Zn5gPP25QOc73NtC9cced0aaSqrxUz2QyogfN4ykOYkIV+unzOH6LpHX6nXatjRcF6nCe+hrI
	ecRRU3BrirHf7qsbi6XlQE9DkcvpAgxz6OHvyj8uOEblKpNsC7YjYvEEh2rGoeTXK1ZlE3xvt+5vW
	vj8uIBcAphkumD+ITmTg0jSASsM2K71ykg6FnUndo2r1Ghaeo+RhtlcMsi2FlsUe9afVjxaMQSK6I
	smc5POJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOsX-00000000kdc-2cit;
	Mon, 09 Nov 2026 12:53:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOsW-00000000kd8-0XJa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D4FB6124B;
	Mon,  9 Nov 2026 12:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E751F0089F;
	Mon,  9 Nov 2026 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228819;
	bh=Ux+kRKXXPI8nIz9tVs7F7c1iyRd71QPMq85RyBOC8hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LslcekGxXHGx640hxCX1qU4y3Ga4SG1UR8Prf0X8VgVs1GLzCg5bCzJw7B6pO32OU
	 mKE8Dk3709O1waviv0YC2ar9tj4kPP0W92IwaElOgyxliKvC/kLXaQvXl4V78Uh5Bv
	 GEkPYWqRewIIWHjIODWTtSMgOG/Yxhml0mXxm+h+3Si3ha23p3V79Nucsxd2xFYK9N
	 1AhHI+FgW+xMTowP399WLCuO9yTJv6bdpy3Dp2DmJhxT1hwwq1Rk+u3gBg8jzo2L1J
	 /9GFrZ7CPEw012u6tph2ZiGmWrODeXW8JikeNqTDzb24v2YsdhmfYTuvemRn864i06
	 k6iNs29nDkH1w==
Date: Mon, 9 Nov 2026 13:53:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Michael Reeves <michael.reeves077@gmail.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: PCI: apple,pcie: Add M3 generation
 compatibles
Message-ID: <20261109-athletic-shaggy-cougar-88b8bf@quoll>
References: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
 <20261108-apple-m3-pcie-v2-2-0e5ffec71da4@jannau.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-apple-m3-pcie-v2-2-0e5ffec71da4@jannau.net>
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

On Sun, Nov 08, 2026 at 03:22:36PM +0100, Janne Grunau wrote:
> The PCIe controller on Apple M3, M3 Pro, Max and Ultra SoCs are
> compatible with the one on M2 Pro and Max. Add their per SoC compatibles
> "apple,t8122-pcie" (M3), "apple,t6030-pcie" (M3 Pro) and
> "apple,t6031-pcie" (M3 Max/Ultra) to the bindings.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---
> Changes in v2:
> - modified subject line
> ---
>  Documentation/devicetree/bindings/pci/apple,pcie.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


