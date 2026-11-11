Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wAIec9Xn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9TAa6sh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GnuTaDcgxhuKNoNjz0bLXEXDkPUqZAVG2LRpEVxqJxk=; b=wAIec9XnhZz7ewYiw8Gz+ePTsG
	C4qM6q5qQf8fwHKnitMQOssWEoyFqfh/J+VEXUBivX6mK81SuSXspQYH8RZUWirqHfZTXmmjvWZ6N
	mSmV9XManL3VCcH0hhxqTtzpMcb8e5bitrBJ4P1PIMUlhEjS4t+W0qUnljQmw9mtUjW/PFVs0WXWN
	QtZLNAm10bvhZ1DNq3wmYIcJnXDb1sL0Iwm5I2zjA9wam5Q1GyOMkNCS8h0Ie3i2TjrkJ5yqZ1azU
	OOaHOOr5suR91EbEsrQ+tT515TFEz4Mjbp6AhhvvecCZsgkDApR/j9RzmEvDA2EifOnOOuT4dgZ3y
	xTzWDm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7mA-00000006ifA-3plR;
	Wed, 11 Nov 2026 12:50:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7m9-00000006idj-1Zon;
	Wed, 11 Nov 2026 12:50:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCE7B6303A;
	Wed, 11 Nov 2026 12:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9EC1F00A06;
	Wed, 11 Nov 2026 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401404;
	bh=GnuTaDcgxhuKNoNjz0bLXEXDkPUqZAVG2LRpEVxqJxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9TAa6shkN0tp7T68kqEMjjdQ4BVnf1cj5XNy0OfdBGYvw26bbB10SrQ6hkevNpPv
	 Z3MQ7LUf/dpMLS83mqk/IFuSj8MaYLqAQErQIPM2P9JKjwTa2WUKvAaRQ1k1JXvAwn
	 mi0vkIINq4uQOIbmu08d9HcZtpbwbMjnP+FBhF2r5jK/LDhj7KPSVAtaZMynWJH5sw
	 uZh1wFqJ4iSyUuPZISwxExvmmYqS2O2kmJftsIwIXixEVm9A0PYneSjL1UJM22Xsz8
	 ZnFmRDziYJ607pGRLPiaz3MABwNheKA/5BZb7GcPv7FdSEO4cQMf5F5LFcmSPCUCO9
	 g05dO/TcCmfrw==
Date: Wed, 11 Nov 2026 13:50:01 +0100
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
Subject: Re: [PATCH 2/5] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip MCP2562
Message-ID: <20261111-inquisitive-banana-shark-3d1a6c@quoll>
References: <20261106230746.21954-1-wahrenst@gmx.net>
 <20261106230746.21954-3-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106230746.21954-3-wahrenst@gmx.net>
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

On Sat, Nov 07, 2026 at 12:07:42AM +0100, Stefan Wahren wrote:
> The Microchip MCP2562 High-speed CAN transceiver with Sleep mode is
> pin-compatible to the Microchip MCP2542.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


