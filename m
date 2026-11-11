Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TUqAm0l3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GpVHGQep
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lJCONQ2S1BJF/RtWm2O9HQRSTMfiKMyOOMP/z54HIUI=; b=TUqAm0l3zdmxO13GhzwGXzpb3l
	LCxFIwpZhC5Rrwfr9IK8nOG65bAoY1x7apXDFXJ5Sn5xpMwxHPMJvmywiQfy/qbJFt9xFUFDUQ7eq
	5gqB0luHh/ACHWbh1QXgmAXkmwFBv+hb4XlNjz+D7ymV45cYZrvBtRDXBaFViwulgXd0We5ti0H+O
	EsNXMgXG/NJJ/TUSN2FEsdYOX3/zROIc5DrXOityTNoA00G8lYJXhD+Y5WHHoO+MzRvyx3/upyA6w
	GxyUrCejRnQ+K5oMJ5Gp7pgHCtVY34nOmmFn0YlJI3cNS7XXl0CgdI9z3lAbjJVZTbdAKoSR7OLOv
	KQmZ9ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7mm-00000006itn-0T81;
	Wed, 11 Nov 2026 12:50:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7mk-00000006itA-0vTi;
	Wed, 11 Nov 2026 12:50:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A76EB63048;
	Wed, 11 Nov 2026 12:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937001F00A05;
	Wed, 11 Nov 2026 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401441;
	bh=lJCONQ2S1BJF/RtWm2O9HQRSTMfiKMyOOMP/z54HIUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GpVHGQepxVL+7vb6Rzs0Oim9lI9wvWBp0a/JcViTCYcHZhYt02+9dxv3Za+oyW9ch
	 CLQBZsb+Q3iIJSru2CXqzVrp1NtYKn3kZwXBRldYyhIROU+kYsJQTIYeLdHDOO6s3v
	 CqlWnoCKK9WOlrhDF79EGlZ37Mm5SqNaMt0uWUjTNL+DYBV/gFANh8Wvsyf5UC0J0t
	 WZy45TJTfCprK6+EAYrLD4u7Bx1tkSzJ/pdl0hlpKjfvp+xWqYP8Xv+GswrsC2oy9N
	 5oX/kXVy3rt7CzVokZ0nuufYx5pGX78l13y1kYw7RyMAXZGq7M9fLOvLwAm8DCP/zq
	 oBIQVU+gAIYcA==
Date: Wed, 11 Nov 2026 13:50:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vincent Mailhol <mailhol@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-can@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: gpio: mxs: Allow gpio-line-names to be
 set
Message-ID: <20261111-active-brilliant-muskox-dd4cdb@quoll>
References: <20261106230746.21954-1-wahrenst@gmx.net>
 <20261106230746.21954-4-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106230746.21954-4-wahrenst@gmx.net>
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

On Sat, Nov 07, 2026 at 12:07:43AM +0100, Stefan Wahren wrote:
> Describe common "gpio-line-names" property to allow DTs to
> specify names for GPIO lines.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


