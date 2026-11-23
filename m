Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8177606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A069wGp5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJDj6yV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KVAwAmpRSmknIyClKub1M0gfNyqLqu3C1IfFJjeNKqg=; b=A069wGp5N9gsZvvJO8NFF00K7B
	Pu61sqIXqROesAqsgNS/Atci9IpLS4yo1Uz5/QngWrL4ruVcZAy6vN7rIlUDicwFCV9FpbPTW/9cl
	5NJoIpHHXGIdV+dM6pEN3ZYLiuUO06O7lxIYmPJ4pPPctdB/E1ZxuKv9ToE7mW8nyQFSmaB2/ajTb
	3HhPxr6M+i7/JnKdDP6Ab1+5Ipv6eaM7NNW1+zHJ9SYP1qn/5UcqsGAfexiWKoVJrclDBDE+jLxVa
	FMLFIzkxfeSpidhWoxB5TQZnbNUyEExTLY5PADtQ8qVa7u8udhlC0HnXPlmGW8AzES8gM+ALhjnnz
	WHfsJrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRPN-00000002ya8-3EBT;
	Mon, 23 Nov 2026 10:36:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRPG-00000002yX6-1Qvn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:36:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A488B60D34;
	Mon, 23 Nov 2026 10:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CCF1F000CF;
	Mon, 23 Nov 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430176;
	bh=KVAwAmpRSmknIyClKub1M0gfNyqLqu3C1IfFJjeNKqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NJDj6yV5Kqnr0nqj5198k/VbhCfX8/6rBbAUmZDNrc6V1L7pCIsUncqFhtGiUS62T
	 BO4D9BcDIlgbOF5gPfuC4FShYUISn70oRGgoOVnpdZki7NP6hhcwTu6LogDo+o+/l8
	 WxLFN2UzSVyYnmsdqaFuM5sHsjxZw4tcQlIV5IJJdjkSg1aWcNpJ5wED7hpnLytwYt
	 CJvM8LnzKGny2rIjM/pF2Ayt/Zi/nGIUXsaVqU2UjIUXJY4A3TGfdks7cOCKFCOIVc
	 j9cXvtcjhm7/bkBdej6DHDo6HO5rU8+tXFo5nHg0FZ5koRsaEifAUsOov36Fu2A8e2
	 qPCm//Z8BABDA==
Date: Mon, 23 Nov 2026 11:36:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK
 boards
Message-ID: <20261123-vivid-godlike-hoatzin-3a818d@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-14-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-14-jszhang@kernel.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 06:23:52PM +0800, Jisheng Zhang wrote:
> +/ {
> +	aliases {
> +		serial0 = &sm_uart0;
> +		serial1 = &sm_uart1;
> +		serial2 = &sm_uart2;
> +		serial3 = &sm_uart3;
> +		serial4 = &soc_uart0;
> +		serial5 = &soc_uart1;
> +		serial6 = &soc_uart2;
> +		serial7 = &soc_uart3;
> +		i2c0 = &sm_i2c0;
> +		i2c1 = &sm_i2c1;
> +		i2c2 = &soc_i2c0;
> +		i2c3 = &soc_i2c1;
> +		spi1 = &sm_spi1;
> +		spi2 = &soc_spi0;
> +		spi3 = &soc_spi1;
> +		spi4 = &soc_spi2;
> +		spi5 = &soc_spi3;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&vcore>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";

Drop bootargs, that's only for debugging.

> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	soc_i2c0_pmux: soc_i2c0-pmux {

Underscores should not be in node names. Please follow DTS coding style.

> +		groups = "GPIO23", "GPIO24";
> +		function = "tw2";
> +		drive-strength = <7>;
> +	};
> +};

Best regards,
Krzysztof


