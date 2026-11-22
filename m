Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C6606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MnnMyvzA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qf0VW35p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=40ClnSdafu9GjCIqCxo5bRhBPDPdsGWMGd+K027J65g=; b=MnnMyvzALUyhmLDxf7MEKi9git
	Crt572lN5TEZeQNJ2S6AnkkvjVCPoEPHDuU3i9NEMSKt0ARIyowdlVuAGQJyYwTnMRlGzu4C8smzX
	gGhLN0xiN7DzlbPx/7TRpj8J3EJAO4CvqfuMHywew+873FSHgIo5RTaf6NtemA5UmAQs0GIpvNKPd
	TwIJL0lEXTMxYjw80fVT5I8M4x3ZgZml9rgCu3qRaknwi3e9GAa61MDvSV0hbAFhbmvbvZNzNPMMB
	pQh4AaAbF/9BcQzPTVu5QMBv3kg1xjUjD17cPLzhhyeyiqJHIE6kOzsvVlizoew6hpe4PbYrFCnxr
	lpD+f8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAQZ-00000001M9v-1JGh;
	Sun, 22 Nov 2026 16:28:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAQX-00000001M9a-2oz7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:28:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 241D34417F;
	Sun, 22 Nov 2026 16:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582851F000C4;
	Sun, 22 Nov 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364909;
	bh=40ClnSdafu9GjCIqCxo5bRhBPDPdsGWMGd+K027J65g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qf0VW35pxlfhSwIUl8Yu6FaYKS7Um63Qojtwl1KmeEktxADjPWlimxyXka8Y4227b
	 ps4DU+7B6Jvy0Nqkth7EcJGi2eoDaAiLV8uUY9lkWs1dRd25UTNbp0nMJY6D7WnYsa
	 Ppf4w5Ulo4e/Jro+R7zqLR/ZL23oexQYN4Q7bzJmGrzpfaGXjcxaSm6MOlyyH+DL3b
	 maJJzPtTs4jQZ9OVfhnQp9xG7DDUFHQVuMtYAXhkpYcufV3s2hJBhyleZby4x2+717
	 MoY1v1bJv3836fh/fujc67YsrBTbBZ18dAIjhjlnbpj10nWFRfKPV2J4idGbyDJdq/
	 WMbqUrzBGtWyg==
Date: Sun, 22 Nov 2026 17:28:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, patrick.delaunay@foss.st.com, yannick.fertre@foss.st.com, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: stm32: Add clock inputs to
 STM32MP2 SYSCFG
Message-ID: <20261122-benevolent-industrious-deer-0c8bbe@quoll>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
 <20261118-ups_mp25_clk_syscfg-v3-1-935de791a4ce@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-1-935de791a4ce@foss.st.com>
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

On Wed, Nov 18, 2026 at 12:59:06PM +0100, Gabriel Fernandez wrote:
> The SYSCFG of the STM32MP23x and STM32MP25x SoCs is the provider of the
> LTDC pixel clock, which it selects in its DISPLAYCLKCR register among
> the LTDC kernel clock, the LVDS PHY pixel clock and the DSI PHY byte
> lane clock.
> 
> Describe these inputs with the clocks and clock-names properties. The
> LVDS and the DSI don't exist on STM32MP231/233 and STM32MP251/253, which
> use the same SYSCFG compatibles as STM32MP235 and STM32MP255. So the
> inputs are listed in the "ltdc", "lvds", "dsi" order, and the missing
> ones are omitted at the end of the list.
> 
> The inputs are required, the LTDC kernel clock being always an input of
> the mux. This doesn't break the users of existing devicetrees: no driver
> registered the SYSCFG clock so far, and the clock driver doesn't need
> these properties to probe.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


