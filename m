Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF695606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hnCXntNu;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TszemNo5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Tq0ifLki8+R9Z04IQ4T3mpI+vFaFEsTYZ5lfIwIDl9U=; b=hnCXntNupNs7vx
	BnBCNZdwGH2FPjKYc1dBpwSo3oISYXBhSiFvcYMwyK+ZvNzlGpnkjmWi9uuARvilPuPA8NH6gwxYD
	LzcFTb/0andA6PXeOLHYMQ0oJe5ZbqURQYB5c/sP7FLRhxRhXSnSCNdjjYGa6vVP6YnEFia6KGEVF
	DsLekLBxpiThyPVYw/eeCEJQcgMPecDsFVxcDw1LO2p4wts/K8T8UtH4DaRZgq648u7DcSeMpxpQ0
	Bkvz4hEQwbCR5LMYqd6oT8By7ixPnGRTu95rNpPxUt2qVu0NOXvd6/oa/n3IV7h6vtipgE9+EbzOO
	OeL8CDzMOYiIvGLUpVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu5Z-0000000FnFt-3dPV;
	Fri, 27 Nov 2026 11:26:01 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWu5R-0000000FnCU-0W7g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:25:54 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 8ED284C98E;
	Fri, 27 Nov 2026 22:25:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tq0ifLki8+R9Z04IQ4T3mpI+vFaFEsTYZ5lfIwIDl9U=;
	b=TszemNo5XRM/GENxcM2oStN3IQMo3fkK4X7MEOuK8S/96WQbTf63x6MDAHsEEGU3YFQjEI
	vEtvWmzcE96yh1AMhoQZlSxpNcg2DoEltjgwROEBS3SrB09naNS5hauF7ZUX6PS/MQ528k
	vik839UckYv2qKm2zp7OMuuOyjAuPdNhnSi9oaxIX2jiPHL8rjgpLF9dtVYudOOUcmbb+c
	qZ0kSGyLDeHg0TJKAnRvf0Vy0Bxf92GUHrxoog8l8oIx3AQB2d+C1ilWOy5z1nVL99+/qL
	1sH3fIU2tXZoZpupmaI6X7Vfhl/Tb3KtM9ANEYlgCqbrTPJtRUUGQuJDl/4sOA==
From: Alastair D'Silva <alastair@d-silva.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH RESEND v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Fri, 27 Nov 2026 22:25:48 +1100
Message-ID: <20261127112548.2584246-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-4-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com> <20261124215048.42074-4-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_032553_346018_AD7DD16C 
X-CRM114-Status: GOOD (  12.13  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 21:50:48 +0000, Pablo Mazzini <pmazzini@gmail.com> wrote:
> The PA IRQ bank is not implemented, and the driver now numbers the IRQ
> banks from PB. Drop its interrupt.
>
> This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
> missing GPIO interrupt").
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 85ef492ffeae..fc4d714a96ea 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -129,8 +129,7 @@ gpu: gpu@1800000 {
>  		pio: pinctrl@2000000 {
>  			compatible = "allwinner,sun55i-a523-pinctrl";
>  			reg = <0x2000000 0x800>;
> -			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.52.1
>

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

