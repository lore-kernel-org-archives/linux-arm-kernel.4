Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E08606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V/Kbn/62;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WByc7++y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hK+8Q2rxW3+mXQi4LiySks8WPSozUnGzSojRtXKXJ6k=; b=V/Kbn/62Sb6N/plLno+efKy0TW
	wXUds1vNS9i2Y3et6R+le31tSnSoH88PSdugq57lGbslBt1OgU7BNEIXC47t60OFKveWvX76aBkz9
	B4jgoj5lNcG0PS5/LT1JMM/ubIG+7hbRrIMISrw2TlDG6zVUmPlwUPTK7EAJX1o6/1JAXm8jZtKKT
	PUm/bDLHYLh0tU1Zw0WsCsn2EL+DztT2+WlG8otupLujFps6Z3PqFGjQTJBszw6rVWu+cnfUzEmBY
	Bj6yFZnxRjgrviy9sZHt9/sbR9o4cphHPmpzySnRwr3iFRPP5xB73iTyZVHs7g6LQpFZUslNJ9QJy
	hrzGOoiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPTz-00000002ZrM-00d1;
	Mon, 23 Nov 2026 08:33:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPTs-00000002Zr5-2S5o;
	Mon, 23 Nov 2026 08:32:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0E23611ED;
	Mon, 23 Nov 2026 08:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BA11F000CA;
	Mon, 23 Nov 2026 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422775;
	bh=hK+8Q2rxW3+mXQi4LiySks8WPSozUnGzSojRtXKXJ6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WByc7++ygvLRkDheW+2yLC+5gjdqpspTl98UBYEJeKQcwwr1WDtHL67TbgEKJJouy
	 x4uMtXza5ipbnq3OEq1egoS9+ZypPMyEGGdGD4s4anBUAkMc10VPUotmky/lc9DvJX
	 tS8+m31iQrZMcT07FtdgOQlg6/8gCVwBhFftrUyF7H3rR5G4wABafD5OmqQ9mXHNWq
	 ThbSRO75lWHL5sxPbnCNyKniyin1NnX78Wc8h+tHBWJt2DbmJVryhHTQ1H+HNyI1jO
	 lCtIcG6Xz9lg2N/g3EWSBkQPFjc9XcQglRQ2sTDxJYapGVDbVlKhu96urptr8gDu39
	 dmJyzEwTQ98/g==
Date: Mon, 23 Nov 2026 09:32:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/19] dt-bindings: rtc: sun6i: add the Allwinner V861 RTC
Message-ID: <20261123-agile-energetic-mouflon-dba749@quoll>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-8-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261114-v861-v1-8-eb71ec3ee523@iscas.ac.cn>
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

On Sat, Nov 14, 2026 at 06:33:34AM +0800, Han Gao wrote:
> The V861 RTC is compatible with the R329 one. Add a compatible with the
> R329 one as fallback.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


