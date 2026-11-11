Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF2606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HjG0Cdla;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abnqDfH0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L03Xks0F4JS44tFcmr8wV8P5pEKbbPBkcDezNiRJeVU=; b=HjG0CdlaQfmRLDa0OJiSVaeysF
	AEDD2NetkxvHYhxIBn4MGDm2IcmjGJb7RVzZCl1+ShicpXgQK5q7pEZLc9VCzCtBOAP0TX6JX+BxA
	xKnDSy9s5LxeevFyHpLgXHk4ALO5WLIyGbUudQibNDYS3aF8o+roXTfvaEch9HJSVPGdewOxw3w0X
	eJ7Rmgo1vYRY+W6sak38PPmlJx1YrYPLbbkFtLwn0ZU/jMchNeWMoUholtsqRlllZK+nKnglqdk/K
	3XKnloEdUQJRk6CiNV4o7XPwUUmlBh4oOHNbl2eobARkTfgmsOizRqbdn7iASPNgtG11JiaCD2Yhw
	4utNlsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR40H-0000000652g-3opv;
	Wed, 11 Nov 2026 08:48:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR40G-0000000652G-2tuE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 08:48:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1260241AE0;
	Wed, 11 Nov 2026 08:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CFD1F00A06;
	Wed, 11 Nov 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386904;
	bh=L03Xks0F4JS44tFcmr8wV8P5pEKbbPBkcDezNiRJeVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=abnqDfH0odENuQHiaCZy7paRwa0bh3EZqXIfvDlZdaqqf6DaMa3EyZMeRYHi/E0M9
	 KzVY164E6utc/FuZf/GxmEI4+qmIfzV2Yj5RDd/mD4082LUqbi8s4DjsGqiFmAIkqT
	 Cilk+iwvNuAnFlsEj+I+kZ/BFfIuYGsAnUGB1yQV5FvR7d64ldlEsfPSbPsfxDXUKr
	 ncQ58hUMKSE1n1ei56aoNzRbf4GsNWEqfc3S00syujMM6S4X1AP6jS4rLLZEHyVJlC
	 Td+RY8rsJUpNA/YZ5NAYeUqELvuddCA7jgMOQVvFvlGLPCIulexQL7XVjScGyGyc7B
	 1EmRAmFPSXCNA==
Date: Wed, 11 Nov 2026 09:48:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Message-ID: <20261111-fictional-vigilant-serval-eea5bd@quoll>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
 <20261106101210.1059256-2-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106101210.1059256-2-hongliang.yang@cixtech.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 06:12:09PM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller.
> Each instance wraps one of the two USB3 Type-A DRD controllers of the
> SoC and owns a register range in the USB30 Type-A DRD RCSU block at
> 0x091c0000:
> 
>   offset  register       contents                       controller
>   0x0300  STRAP_PIN0     stream ID (SID/SSID)           USB4
>   0x0304  STRAP_PIN1     stream ID (SID/SSID)           USB5
>   0x030c  STRAP_PIN3     clock enables, ctrl and PHYs   USB4, USB5
>   0x0314  STRAP_PIN5     awcache[3:0], arcache[7:4]     USB4
>   0x0324  STRAP_PIN9     awcache[3:0], arcache[7:4]     USB5
>   0x0328  STRAP_PIN10    USB2 PLL controls              USB4
>   0x0400  STRAP_STATUS0  AXI clock enable/valid/req     USB4
>   0x0410  STRAP_STATUS4  AXI clock enable/valid/req     USB5
> 
> Controller 0 of the block is used by USB4, controller 1 is used by
> USB5. The range of each instance starts at its own AXI cache attribute
> strap register and ends after its own AXI clock status register, so the
> two ranges overlap: the strap and status registers of the two
> controllers are interleaved in the block.
> 
> The Cadence USBSSP core itself is described by a child node at its own
> address. Mode strap controls are programmed through the Sky1 S5 system
> controller referenced by the cix,usb-syscon phandle, whose arguments
> give the register offset and the bit position of the strap field.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---

Unanswered comments from Sashiko, dropping from DT Patchwork.

Best regards,
Krzysztof


