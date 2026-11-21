Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A29606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b77JKxNJ;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=MEiP69zJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t3R4tnJIY9kB5WytDi15OEl7ThCTHknTfMjZvEx+X/M=; b=b77JKxNJTWXBGiBjn8alCLPFsj
	HPkfwtoFyvLfud8XK9SjIvoUxRxOUXiMgE200Bv5bJGyN4iNyO4KmiCh19yusSuTsVNURXM2TdxX2
	ldfpC4oHfbFawbb18ug4hwyjT/9luxwaC3LKE0e5NkEwtQaVLlTZu6dcroM+ZTrbtA2TSeOkk7BzO
	1n+evuQeQ7av4xXmUat1id637gLfJMubfvfycgBlUXo4PK6gVb6GMR5lgv3BQ65p3yb77FpDKkfyS
	ufZpyryddQdIF3bpIb7F3H2iCgottqNVouXEnpNT2A4heooPEbv0oCVwLiR2n/P06uHzqTQopvqZF
	EKM3ao/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUl7j-0000000HHJA-0W4W;
	Sat, 21 Nov 2026 13:27:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUl7g-0000000HHIg-1dwG;
	Sat, 21 Nov 2026 13:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=t3R4tnJIY9kB5WytDi15OEl7ThCTHknTfMjZvEx+X/M=; b=MEiP69zJ/0eWym4qb78XUFm2+V
	QobfvUmO/6Hi80IUXhbcfqbaHCz/4xVaFFtjVDqoP/3UZ1vR+oN8QV+mI7E68mSGIl+mSpwaKGE+H
	GLGCCrWrXgvaMGxp5Kbwd1pmb7OtfVmdZNSfLCm69bUw2lU/Ak0yT6ZkOY4ctj0a6+sfxUIHPyqUp
	1hG1QklSBSV/V41i0soQzfkXY9Yv0mbJa2ratzSorI1mhJNNCkRuqwxOr4VCJljnHcukUOSZhVRU6
	qgU/B558J447mBOrrS/HWCs95l0AE/k5MaE5Sspac89SO+fUB0H5sbGz3dPWe01xAMkSeY2dEUiec
	FaBIsYeg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: ZhuXiangyu <1194781887@qq.com>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: rockchip: add clk-out
Date: Sat, 21 Nov 2026 14:27:08 +0100
Message-ID: <dggrSgDiRmusIaCk6T6L4Q@sntech.de>
In-Reply-To: <f98c3f68-82d7-41e3-bb58-d3737b73c7b5@kernel.org>
References: <tencent_8104629BEBAEF41637AAF1CC7D95BC7DCC09@qq.com>
 <f98c3f68-82d7-41e3-bb58-d3737b73c7b5@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_052720_451241_17BF9044 
X-CRM114-Status: GOOD (  20.80  )
X-Spam-Score: -2.1 (--)
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

Am Samstag, 21. November 2026, 12:02:37 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Krzysztof Kozlowski:
> On 21/11/2026 11:58, ZhuXiangyu wrote:
> > Document the Rockchip clock output/input switch, a single GRF-
> > controlled gate used for signals such as the SAI MCLK output.
> >=20
> > Signed-off-by: ZhuXiangyu <1194781887@qq.com>
> > ---
> >  .../bindings/clock/rockchip,clk-out.yaml      | 81 +++++++++++++++++++
>=20
> Please follow carefully submitting patches document, including how to
> sign your work and how to send it correctly threaded. There are numerous
> guides already, so just follow them.
>=20
>=20
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,cl=
k-out.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-out.y=
aml b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> > new file mode 100644
> > index 00000000..bf2a9b8a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/rockchip,clk-out.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip Clock Output/Input Switch
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko@sntech.de>
> > +
> > +description: |
> > +  Some Rockchip SoCs route a clock between an internal clock and a pin
> > +  through a GRF bit, for example the SAI MCLK input/output switch. This
> > +  driver exposes that single bit as a gate clock.
> > +
> > +properties:
> > +  compatible:
> > +    const: rockchip,clk-out
>=20
> Generic compatibles are not allowed. Do NOT send us downstream code,
> it's not acceptable.
>=20
> Not doing detailed review as it does not follow basic rules. Please go
> through for example DTS101 slides.

this whole implementation is bogous, but it seems the submitter found
the correct way to do this in [0] .

But of course the submitter still fails to follow basic styles there.
Broken threading and especially not stating that the new one superseded
this one.

And of course yet another patch bomb in the span of minutes accross so
many different subsystems - which I guess is not a human doing it.

@ZhuXiangyu: even if you're an LLM and new to the process, don't flood
the lists - especially not before you get the process right.


[0] https://lore.kernel.org/linux-rockchip/tencent_9138CD6157C88BC2D52FE639=
4AF83E560208@qq.com



