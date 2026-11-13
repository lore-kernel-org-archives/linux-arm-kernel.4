Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897C606A891
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rz+uNijy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4LUgG+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oTXRYCpqjj1rl3vyHjx8W2/mRwY/DkjlcdCqq9U+cmg=; b=Rz+uNijyK7nZC/Bzz1po94GoZA
	s8NAVQ05LPj3S7IlFtcC7N7bDt4qmkbd9bV57uG1Gg3D75loRGidLcCvRzYSRG3cUWZI01yP1SNak
	0G1Jh8UWxjJEvO5sTG++BPu0qNFIwcyozoGAMCUjoAmXlV2j6GQtMGeW4UPRru/O9Hn8oMTNwe50t
	ESpvVk9ugAbJC4HnNpxcuCaDjsX+2Rzc0dwckAWNc4AFao6xpS/7Q2NZzLF18tKKzcmFACZEMPGCK
	67047aR746gGiuFiP7DhTpIEJS3K8GD9gclfswPCZBvTesnDFI/jud7TzqUY9e+Dt2r8RcoIetMJc
	g1oA7b7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsBi-0000000D8T1-1o6w;
	Fri, 13 Nov 2026 14:23:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsBg-0000000D8SM-3Y4E;
	Fri, 13 Nov 2026 14:23:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E91A6021D;
	Fri, 13 Nov 2026 14:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A091F000C4;
	Fri, 13 Nov 2026 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794579811;
	bh=oTXRYCpqjj1rl3vyHjx8W2/mRwY/DkjlcdCqq9U+cmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m4LUgG+4O9wOw5PECmOhmjElyPGjEyauwluxzttah1Qm4rZn1lH+6EbmtsEpGYM6Z
	 1pOjj1lnIQwn/m/JWEoRkZbJp+d0lVyDYNA3aUerzZYvYb2Hl5QMjLXUDo4h2ejIWl
	 XGyy1GonO7vjji4FZq1Xis8QL0A8zIookpUN2PAtMFxp7XIAj6hLJ20J+rrb1lhd2r
	 DQVzM1pjJojQBDknpYKRMXhcMwpyHhWyI36ByZmJgve+Yz5xs2tpekHiqAfcoLk3dk
	 uywxWeLFQChUcwlrTeFypKz7KeFdE1+upscnEjlIGCQtTFBjgQpacVUcNyOB9JjWVt
	 W08xaPWirg4cw==
Date: Fri, 13 Nov 2026 08:23:29 -0600
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <20261113142329.GA593855-robh@kernel.org>
References: <20261105100322.37816-1-tanure@linux.com>
 <20261105100322.37816-3-tanure@linux.com>
 <20261110175451.GA833369-robh@kernel.org>
 <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
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

On Fri, Nov 13, 2026 at 12:07:55PM +0000, Lucas Tanure wrote:
> On Tue, Nov 10, 2026 at 5:54 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Nov 05, 2026 at 10:03:17AM +0000, Lucas Tanure wrote:
> > > The T7 has the same ethernet glue as the G12A but needs two clocks of
> > > its own. The controller reaches memory through a pipeline stage with
> > > its own gate; nothing else claims it, so it is switched off as unused
> > > and transfers never finish. The glue registers sit in a block clocked
> > > together with the MDIO multiplexer, which probes after the controller
> > > has programmed them: the writes are lost and the port keeps the
> > > bootloader's delays.
> > >
> > > So the T7 gets its own clock list, without the timing adjustment clock
> > > it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
> > > the 2ns, and only the receive delay line offers fine tuning, so only
> > > rx-internal-delay-ps is valid here.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > > ---
> > >  .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> >
> > I tend to agree with the sashiko comment, but am fine either way. Once
> > the if/then schemas are longer than the main schema, it's a sign to
> > split.
> 
> In V7 I will split as I think it will be easier to review.
> 
> >
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > > index e769c9bb70d8..ff5e50f65114 100644
> > > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > > @@ -23,6 +23,7 @@ select:
> > >            - amlogic,meson-gxbb-dwmac
> > >            - amlogic,meson-axg-dwmac
> > >            - amlogic,meson-g12a-dwmac
> > > +          - amlogic,t7-dwmac
> > >    required:
> > >      - compatible
> > >
> > > @@ -84,6 +85,49 @@ allOf:
> > >          rx-internal-delay-ps:
> > >            default: 0
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: amlogic,t7-dwmac
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: GMAC main clock
> > > +            - description: First parent clock of the internal mux
> > > +            - description: Second parent clock of the internal mux
> > > +            - description:
> > > +                clock of the pipeline stage inserted in the bus path between
> > > +                the controller and the DRAM. Without it, the controller cannot
> > > +                complete DMA transfers.
> > > +            - description:
> > > +                clock of the register block holding PRG_ETH0 and PRG_ETH1.
> > > +                Without it, the block reads as zero and ignores writes.
> > > +
> > > +        clock-names:
> > > +          items:
> > > +            - const: stmmaceth
> > > +            - const: clkin0
> > > +            - const: clkin1
> > > +            - const: pipeline
> > > +            - const: pclk
> > > +
> > > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
> > > +        # The RX delay line of this glue is fine tuning in 200ps steps,
> >
> > Sounds like constraints:
> >
> > maximum: 2000
> > multipleOf: 200
> 
> Yes, with maximum: 3000: the field is four bits, 0 to 15 steps of
> 200ps.
> >
> > > +        # added on top of what phy-mode describes. The TX side has no fine
> > > +        # tuning: its only step is a quarter of the clock period, the full
> > > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> >
> > Move this to tx-internal-delay-ps. You can (kind of ackwardly) do:
> >
> > tx-internal-delay-ps:
> >   description: ...
> >   not: {}
> 
> dt_binding_check does not accept "not" on a property under
> properties: or in an allOf entry: cell.yaml allows only description,
> deprecated, const, enum, minimum, maximum, multipleOf, default, $ref
> and oneOf there. It passes only inside if/then, and the new file has
> no if/then. So the property stays false, with the explanation as a
> comment above it.

Okay, but we should fix that.

Rob

