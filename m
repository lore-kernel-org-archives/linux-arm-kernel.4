Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F68606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=meqGZeW7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACWgmqId
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uRvs7fQAGdtCGvkJ3snStvEqLH0FK7lvdttUmANxyQ8=; b=meqGZeW7bTbfEnEiWtJP2Iqkla
	nc8wIeb6LgkEsxiMOCHaRE8hfwJCFLQBeVsCuaRAr3cXo5V4ONpYZveAdyxwFXDwcQoyRz0AIAEb4
	RlgK/B4JNOwpPUV7AbNfAcbiI9znu2XyJW7U2h9of0FH8ZVDzVVIjVgY94XI4zpg4F3FZMakUHB0U
	7Sz49Gkx1U16AI1yNXdm6jWAR0lvOQSIW1yAJ4I1F5HqzlXC/Vk3BJM16866uBlCvanY6W4aAL9WX
	Hz2cm9E60aTg96a15LEgOgEKitjFdKUTLFQJA94g59LPaJQoE997h/gTFxn++YL8UbiWw8o4m4Wlk
	wvsWWwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRHh-00000002wrn-2o0C;
	Mon, 23 Nov 2026 10:28:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRHg-00000002wql-0elF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:28:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99961448C5;
	Mon, 23 Nov 2026 10:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6047D1F000C0;
	Mon, 23 Nov 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429707;
	bh=uRvs7fQAGdtCGvkJ3snStvEqLH0FK7lvdttUmANxyQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ACWgmqIdTvAKP9biy9TxqwCZQymZWl9GphAWGqbq09erfJOwKW93tRNNzWDZlp/rJ
	 mXFxCKpQb0Nc//PHmLY/d/m0vfzJtXGVgtHM33YP1+mdOhV95VTEjJ+f1M1H/n4Lxm
	 qTXbvlTFLdMzTpDBGU/PXahPjcdgDuZ0k6hMYa0IzxWI+NhUUKsnlb4lpjrft5guGR
	 RpL1b+pB2mlrQ52ptuvMdxY3KhBzt3LH0kv4kRMECa5rkcVWAHGJhfM7/R8mwiMxYJ
	 IP82yI4Ydm97onHXwqlh47Sjb2SVsZaHXL8o5xIRsxtbaNVjkk0rfWq9XwF78N3hdf
	 2GKusOBw6NhHA==
Date: Mon, 23 Nov 2026 11:28:23 +0100
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
Subject: Re: [PATCH v2 05/13] dt-bindings: soc: synaptics: add SL2610 system
 controllers
Message-ID: <20261123-bold-neat-albatross-e92a2b@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-6-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-6-jszhang@kernel.org>
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

On Sun, Nov 15, 2026 at 06:23:44PM +0800, Jisheng Zhang wrote:
> Describe the SoC, MCU, AVIO and CPU system control blocks, including their
> clock inputs, clock and reset providers, and pin configuration subnodes.
> The clock and reset providers share each register block node.
> 
> Add the clock and reset identifiers used by consumers of these blocks.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++++++++++++++++
>  MAINTAINERS                                   |   3 +
>  include/dt-bindings/clock/syna,sl2610.h       | 131 +++++++++++++
>  include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++++++++
>  4 files changed, 392 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
>  create mode 100644 include/dt-bindings/clock/syna,sl2610.h
>  create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> new file mode 100644
> index 000000000000..cdf947cb3e0f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/synaptics/syna,sl2610-soc-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics SL2610 system control registers
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description: |
> +  The SL2610 family has separate SoC, MCU, AVIO, and CPU system control
> +  register blocks. The SoC and MCU blocks provide clocks, resets, and pin
> +  control. The CPU block provides clocks. The AVIO block contains audio PLLs.
> +
> +  Clock and reset specifiers refer directly to the system control node.
> +  Pin group configurations are direct children of the SoC or MCU node.
> +  There are no separate clock, reset, or pin controller child nodes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - syna,sl2610-soc-syscon
> +          - syna,sl2610-mcu-syscon
> +          - syna,sl2610-avio-syscon
> +          - syna,sl2610-cpu-syscon
> +      - const: syscon

Split the binding file, you combined multiple different devices.

Also, bindings should be placed in respective directories, not soc.

Best regards,
Krzysztof


