Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4FC606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rWm4J25r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8n0JTrx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HERWT3R7sQc4IpReBoiiAir63QoWdA7u/aZTx6j4nHA=; b=rWm4J25rN1OTZ33Ms8qjYGA0RG
	DfN8UJJC73WpBZIC6fsxRrpuSn6aGmu9dHRC/HFhAUJ06G03vjchrwP5aRyNqZIvnjUY9MOnw5F6Y
	gbqDRaI1XV+pgN/mELQfcHWkApaZbZOrQl6hy0XmAwMCjHx1tWvNj1wYpd3ibWc1sEMmA1glo8EIb
	PsyKI41I+6VS8k5H5KNqEVc1c6EVSqVI3Sc37O44E9HLRAtJCUn1lGVEsvC+Hv+C/ICiIt6PbleYE
	+difiMegsBAksLx56A2ko5Y3rbd2qJh5hiGN4xk0S0KPLGUZGbeXJdmG8NAfD6bBVWhjV7Tya8rOO
	IuRhhDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPmQ-0000000FHPn-2IIC;
	Fri, 20 Nov 2026 14:39:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPmN-0000000FHP2-426o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 14:39:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D60E627EA;
	Fri, 20 Nov 2026 14:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897B91F00A3D;
	Fri, 20 Nov 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185594;
	bh=HERWT3R7sQc4IpReBoiiAir63QoWdA7u/aZTx6j4nHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8n0JTrxgkutQ1NYeg/2mAqD9dggsgrVoyS5hBasWwKQD/+oBJypDhg0nAExQ9/gn
	 KruMn40VWj9RlFq1PHzQsPf5XtY/7co3wuQTPwtpmXbWFP24UgoNKQDNj1Ll8cjyMm
	 MNgqeqsH+W85QHKMOWHyi4mMQm4dEuCL6uxrqSWDDOn5Hq3qjc0nzxyDeqJlh6obqm
	 1sdU6vuwgfYFiKrz/OGy6o0Za5RCtrfrprdomNxMEu85OpVl9mXyuPcQvuC1mFbKV4
	 Ftic3aqDMqemZdRhOnaSMG7UVy10s0BdF+HBuquh0TKYvIrvwNtJHM1ZRg8jz4iOpd
	 3ykGvdQB7nvyg==
Date: Fri, 20 Nov 2026 15:39:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Benjamin Hahn <b.hahn@phytec.de>, 
	Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
Message-ID: <20261120-intelligent-victorious-jackrabbit-4caf35@quoll>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
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

On Mon, Nov 16, 2026 at 11:54:44AM +0100, Yannic Moog wrote:
> binding has no consumer anymore. It describes prototype product only due
> to renaming of the product. Remove it.
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 2d21a1949d949..ae823a7670b02 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1227,11 +1227,6 @@ properties:
>  
>        - description: PHYTEC i.MX8MP FPSC based boards
>          oneOf:
> -          - items:
> -            - enum:
> -                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK

You just changed this line in earlier patch.


Best regards,
Krzysztof


