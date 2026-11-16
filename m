Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD09D606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l838CNAq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ve9qBpbY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hkHTBxGxfzhbitUYWOK7qbxGcu2InRcFJvyZHNP1Rrw=; b=l838CNAqtlJYxIVAiTg1ci7k1N
	aMQawwq8l/DmsU3OTJ9akTxkJ/v+P/GhOLOdFM840Z/kTiIR0122i7PyOlXsBzDcoRlaN1+lhai+P
	TPhkT4jVtoGHvl1h6qd30hLjWkJ2DX6NILLPg7W0oxS5NHBIW0Xt64MMksauiQkyR8AMc+RBnsune
	rRPKDyXBDBTn7gnG6j8kgwKKK0Rj0DmKhzYFYaLrx5YZUsoxXG5+YMVB33Xn2G0g5Eid69LXMqs24
	y2qjWo1sTcdxsNqUvcufbqRsmDl7PkO0cChsxkDb0T79XbApWMPBV+loOYY5/F4dOk3RCYkEbO4rS
	mBEUvF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw5t-00000002SUE-2Q2B;
	Mon, 16 Nov 2026 12:45:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSw5r-00000002STu-3Rvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:45:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DD22629DB;
	Mon, 16 Nov 2026 12:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9751C1F000C4;
	Mon, 16 Nov 2026 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833154;
	bh=hkHTBxGxfzhbitUYWOK7qbxGcu2InRcFJvyZHNP1Rrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ve9qBpbYY4aKJRCPDX6bNSiuVuKciMkX7xzMK6WsXycEZIYl1Eh6tY+HsfPjE6qMR
	 +xYRhppQaFOurWLKmaPxCUM3za+NLhUCRq/HxPg0ZIUen4pYpBJu/Jd6x1X+zEgbw8
	 M/wpP6pqyehFSLHOO+6j0MQ18FF3Taz/0ytqm5YOjW7dJRzHNc77srqt812zqwLnn0
	 vFQ5ciNfdLdg+xrpJAiI0jERfAPa8C2BTg/JmlVBT5hFFGAkcfQ9NOGS2o4UPUylHz
	 ZEp09EGd96CkEXbzNUjeW9D02lTfr9kSIcMf2mKCQEsLZE26WNJrSSupifzDkBB1T8
	 Mh6x3bYga0lbw==
Date: Mon, 16 Nov 2026 13:45:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: sun6i: Allow Dual SPI and Quad
 SPI for the H616
Message-ID: <20261116-jackrabbit-of-strongest-exercise-d330d6@quoll>
References: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
 <20261116-spi-sun6i-h616-dual-read-v2-1-e0c66eb71e20@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-spi-sun6i-h616-dual-read-v2-1-e0c66eb71e20@gmail.com>
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

On Mon, Nov 16, 2026 at 05:55:25AM +0000, Arun Iyengar wrote:
> The H616 SPI controllers support dual and quad transfers (H616 user
> manual, SPI_BCC DRM and Quad_EN bits; only SPI0 has the WP/HOLD pins
> for quad). Allow them, as commit 743956bb9990 ("spi: dt-bindings:
> sun6i: Allow Dual SPI and Quad SPI for newer SoCs") did for the R329

Referencing other commit is here redundant. You document new hardware,
so why does it matter that some other commit did something for other
hardware?

You were already arguing you do not need a compatible. See writing
bindings first.


> and A523. The H616 keeps the H3 fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


