Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bhoM914+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ns32XsVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BhUc+loYeQeFAucZRhpK+U371nZnwy4R6sM3xX+qyWo=; b=bhoM914+1QpTwKlQJaXSXpfXks
	DItAGsBoi1p43T9RK2LC4Lr5dh9/iWxYLE48uZ8SAlk3ww23n4Hxe/tuyGo893/mD9g2ATI6DuFId
	sZsO3uJAxoaQZrUjZV0ZeybFb/TAsRh2yg/8JEbNx6+3f8+rSOXhwlCCP9ixcea6YC8qgHkmdOo/D
	T12jBDv3xzv2wKk6oqXoyemTqhwCLxEOk1z+JUE0HuBLMa8FUmrryu5SEAA1tUCfb6gG0AvE21pal
	ud92vZ9dFJhOzGLFztdk91/7jP4brseDlns44sClGa8oeQgguaI59mnh0CntF6yZsjqU3rENf3UkH
	PLhK6eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpJ9-0000000CWDm-44Zb;
	Fri, 13 Nov 2026 11:19:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpJ8-0000000CWDH-38ha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:19:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6986440B56;
	Fri, 13 Nov 2026 11:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529FE1F000C4;
	Fri, 13 Nov 2026 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568741;
	bh=BhUc+loYeQeFAucZRhpK+U371nZnwy4R6sM3xX+qyWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ns32XsVFdTP4pqhFzMv60fkFABb2IBWhKARd9fB0cMTO8dsEZdJZFgV1tWNB/NZdl
	 Vy/M42B5HSuuuZkMuAGWCAlSHIr5WHZ7/pYCjhdrYx7/S4A7t/BqyGEtCVDbA5WhQS
	 jpawoN7Idu7GJn477/uuWl0alf9XyaxNtEXFuU5KOgU6pHgSlxA9GN2ZJPVuXzUdd5
	 iEbBVwokokDUo144Jns2TMmkVHCYgx1NzaZiU61ak+nWfrRLK5Ewy6r9UBo8RNLBkQ
	 FHLahLWoRADi5IPvngUmyXr1dkQI9X/hgU/fLBm4A07857MUW0xJqSFu/VYWjwb4Hb
	 8V115NwoObfTQ==
Date: Fri, 13 Nov 2026 12:18:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus
 board
Message-ID: <20261113-elastic-sarcastic-trogon-dc2eb5@quoll>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
 <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
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

On Thu, Nov 12, 2026 at 11:37:33AM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add the Lotus Carrier Board mated with the Toradex Aquila iMX95.
> 
> Link: https://www.toradex.com/products/carrier-board/lotus
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


