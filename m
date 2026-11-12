Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD129606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rcSm8pnb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpZr7Xb2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=beVVKqXDvt9rWFg1f2XfXUSimrRxV8SQAsJgMPdb5a8=; b=rcSm8pnbRo3kmlVjIAfLX2ciwI
	VpJ1nZ2lg4tFx6nSnQ4OvWPFLQy/HRPgAAFEZrWrKoafTI5062bc81Qpdsh5E2WcKdFL6nLDZwMgC
	puRn5aw6cW0OCQDSrVhptKYaiuvJwBqnpnREY4M24xKSekEEzT0jdthBQ/lhTqX2mJbX3Zk2l93Be
	QtS5qyTuClfWYvOa4rxeSr4t5+BXEtNUQ2Bv7X3RvfiFsSHZDisjnWDgxcKiKiY3F0Qwrlucj9KI9
	Vk9Etp/1wtIVCJLVhLCr8Fwfo3IuReg2LPWaDi0Bq4dH1e1hceqKm5ME4XTQMWzb2Ce8FH/6pIMov
	eztXpGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSEu-00000009YfX-0FQ0;
	Thu, 12 Nov 2026 10:41:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSEr-00000009YfP-0atA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:41:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BE6E4354A;
	Thu, 12 Nov 2026 10:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B501F00A08;
	Thu, 12 Nov 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480064;
	bh=beVVKqXDvt9rWFg1f2XfXUSimrRxV8SQAsJgMPdb5a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SpZr7Xb2tehhmv+ltC8yM6qJnTFiElZ9jCp61z+4I4Ic/TZ69iyuTHpHRYjexgsul
	 cU6sYVfpaZE5SdyxZuwvNKuSkm6X7H9EmaY26ezrJbfJ3+N9+TkCgNXGdCq09xHaWS
	 cagU+IljbAMiwZtqfAJq/wKJdbW9Vx9eJAgI9k813kxw+39APTUmtAIubhY024I9h3
	 WNVBc61ImVlLTD6XegDtoWkEXE5Ci9FIPqpDH/vHODmc9MZY2FvqCdgwY6qABUFrhW
	 Xoq/Ic+hNQMs4d/aSXr/zMiNYzDkL4/eQ7X+Tgz3UiLp0mS3Cn1uZtf9ltpwESgU3c
	 7qjM7lIsqwXsQ==
Date: Thu, 12 Nov 2026 11:41:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Forsch <alexander.forsch@bytesatwork.ch>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add
 Youritech et050fw01-kt
Message-ID: <20261112-gorgeous-favorite-gaur-b92df8@quoll>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
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

On Wed, Nov 11, 2026 at 02:31:15PM +0100, Frank Obergfell wrote:
> Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
> compatible string for the Youritech et050fw01-kt panel.
> 
> The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
> physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
> display controller.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


