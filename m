Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD691606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E36nYVAm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0d3y919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Or4wrQKnsP3R5qoKnKe6WrWsdLuS3fNNUOgd09GX0wo=; b=E36nYVAmAh79GfnXHtBKe4NueB
	bYZ1VH0X4bGTQ8lpjSZ7wSQnj5Ik0ltgMh3QX2NCK4UwOSfp1zvKnNWjUfY+oLgqvrh1L8t2a930b
	Hn35fD0V9fB+Chjoq1qvzMOeKxFae7RxE3b0AoXOaPQPoEXhDGs60c+qEIR66HTUqNGFO0tH0Wxd5
	CdoMhXiEuimaUm6D4Z67TPb98NECBfa2zmG0Q7k85mUG15MXJemsJOFmNqe7eWruoISQSe86+z6AT
	9OuoDfC3uj7a/3ckOGJUsxjnOysZwklogh1AlFgxrphELNtZukXHKa/46SJa5vV7knkrYlj/I86Tc
	c8dcwKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVToj-00000003XE2-2xke;
	Mon, 23 Nov 2026 13:10:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVToi-00000003XDp-1yk8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:10:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03A28440E5;
	Mon, 23 Nov 2026 13:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72D91F000CF;
	Mon, 23 Nov 2026 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439443;
	bh=Or4wrQKnsP3R5qoKnKe6WrWsdLuS3fNNUOgd09GX0wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o0d3y91906Nl6/5zGUdpL0VRf92NQHUgE+88lr2/bPbIDhqlli/PkzXhYtCyXo6sB
	 qwRegDFNn8kkHS2vGp8yZPWfeKYCykyUBgci9q0kuIXYs2ltyW0iptbu0ZTJOXYvb5
	 YTmYmt0RwoJdvbthMvsCvkc/Y8kg0a7loCNMQJ+krK37buSANbR3BKLoFuJ4EgY0um
	 UbxbPgZU4HeJf9F95aEN7h+T0keMo7kficKw0XbIaRDGi8x8ms9XY1VZJ8kyw8PM+8
	 iRCrYnJrOVbIBenuw0Vy8wKi+n/5cBu8CubAisC1SUprfsjmTvdMxZ2EgjhHeqSOK6
	 A91dCaH8Fz9Nw==
Date: Mon, 23 Nov 2026 20:50:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 05/13] dt-bindings: soc: synaptics: add SL2610 system
 controllers
Message-ID: <awQ2ipCw1mEx-wxu@xhacker>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-6-jszhang@kernel.org>
 <20261123-bold-neat-albatross-e92a2b@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123-bold-neat-albatross-e92a2b@quoll>
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

On Mon, Nov 23, 2026 at 11:28:23AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 06:23:44PM +0800, Jisheng Zhang wrote:
> > Describe the SoC, MCU, AVIO and CPU system control blocks, including their
> > clock inputs, clock and reset providers, and pin configuration subnodes.
> > The clock and reset providers share each register block node.
> > 
> > Add the clock and reset identifiers used by consumers of these blocks.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../soc/synaptics/syna,sl2610-soc-syscon.yaml | 178 ++++++++++++++++++
> >  MAINTAINERS                                   |   3 +
> >  include/dt-bindings/clock/syna,sl2610.h       | 131 +++++++++++++
> >  include/dt-bindings/reset/syna,sl2610-reset.h |  80 ++++++++
> >  4 files changed, 392 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> >  create mode 100644 include/dt-bindings/clock/syna,sl2610.h
> >  create mode 100644 include/dt-bindings/reset/syna,sl2610-reset.h
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> > new file mode 100644
> > index 000000000000..cdf947cb3e0f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/synaptics/syna,sl2610-soc-syscon.yaml
> > @@ -0,0 +1,178 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/synaptics/syna,sl2610-soc-syscon.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synaptics SL2610 system control registers
> > +
> > +maintainers:
> > +  - Jisheng Zhang <jszhang@kernel.org>
> > +
> > +description: |
> > +  The SL2610 family has separate SoC, MCU, AVIO, and CPU system control
> > +  register blocks. The SoC and MCU blocks provide clocks, resets, and pin
> > +  control. The CPU block provides clocks. The AVIO block contains audio PLLs.
> > +
> > +  Clock and reset specifiers refer directly to the system control node.
> > +  Pin group configurations are direct children of the SoC or MCU node.
> > +  There are no separate clock, reset, or pin controller child nodes.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - syna,sl2610-soc-syscon
> > +          - syna,sl2610-mcu-syscon
> > +          - syna,sl2610-avio-syscon
> > +          - syna,sl2610-cpu-syscon
> > +      - const: syscon
> 
> Split the binding file, you combined multiple different devices.

sure, will do in next version

> 
> Also, bindings should be placed in respective directories, not soc.

I try to follow existing examples:
Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
and so on.

Especially, the 2nd and the last one also document the bindings of a mfd
for clk. It seems upstream accepts both soc and mfd. TBH, I have no
preference, but these are recent examples, so I follow their style. So if
you still prefer putting the bindings in mfd directory, kindly comment.

Thanks

