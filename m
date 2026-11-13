Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC34D606A895
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U3RHCkdB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=; b=U3RHCkdBlqinH8SswhqaQJUcTU
	dWMClSWZV8ORAlMRNWjVbDjrpDDpkQd4Njy+fRQzMhhYXC1V6lDhBn3Cb1VEzR/oaZSAV0tVu1q2H
	lu4Wf+Wq9320D5nBo9KeC8iH0tgIduqe1kvv4C1obtUeRXDv+czaKbTUIlTjzFIQOmZ+bBlDdUAAM
	sbr0Gr++CMmIWP+142tMLzAm6Rj2CX81M+mM3aBP9z6N3An8nHAqz2r+AdqXXaLLgxIJn5ntMDQI4
	ONwm38tlLSOgYdkAid61q3S/bih6NNzc4RqAKCVtN3cAjMj0y91WC6MhA1CEZNEYBEznh5kNGeG+q
	zsWYkOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq4o-0000000CepT-1GpK;
	Fri, 13 Nov 2026 12:08:18 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq4e-0000000Celx-1PZv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:08:09 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b349d21fd1so5667717b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571687; x=1795176487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akznn5x8/2l1e49bpMLHpotxCwIi2QP3ICBwS80oL8w=;
        b=uMvaxsF9B7qMBaVoXSTBj1eNV6a7KkfZ/hBSO/DKwcmZh0+OJA63UhlasiTcxb/Q3x
         3/xE9ihe0xAXAkMf3Zah6/y01ShVw2+lohSd6ea+Baz3YvuGZCn/zEAeaWwV1ZCY+9JX
         DAQWJWV0iKXBbsgNWA0EtJfXnKh2ts9tfygmWvYGQO1OwLooBSHMB0lVGJiUK30Vju3Z
         eyg89EKttoDXBGdW+9zrcnCOHW+MrnbM8It80E6/cc7bRot0WFMVU7gxcW9yxEnJifUc
         lnQgnbgTdlW2lxtspDa4d/HS/XY/4wM2/siT/0ibNP7lUelfGFJd/D8mrQrajr8dliw5
         Gmjw==
X-Forwarded-Encrypted: i=1; AL+hErFy2wI10jsCBzbNBocCAylIaUmXWkJuYvUjQnRMJWl0LL6MiX2gomYUi478CZNaaC+Qx09bYTGtoK7FJzSBPhRU@lists.infradead.org
X-Gm-Message-State: APuU4Z8iYt5w/TywPI36RK3QilyyyZEhoENt+WsDKqTdre4e9Mhnozap
	pjYoItKuF5bZ/vMs9WcU6NjUn0bjhwVBvPqQvSxg4/FD3MVA0hCuCPehh2vn95PL
X-Gm-Gg: AYBFou2aWMfZqvmPbAsVcgauN0APQeho8fIDFHkLvzjpcoSvZRpwld8jnD84FGJ+FYg
	kGwiHVq0ppEf8TGjGgb3Oe3up6BW0uJoKZ1KeSYSKHlwofxlxXok4ePENfRy6Omc/jKb4a24s4a
	yWiyBUcb8EHJQ4Ef8U2ppxQ3yxWzvasGN8JvcmgBPkNWb1nNWi3agUy/C4e9GDYEMV7b2Yr5WRS
	o3o92C4JJIS7YIy8Xbz1OsKo0yKl53KZWupY/dr5BK2hcgbKNYcuNIzyYloQshmmmpc4g6X30eN
	yyzmoE5ncbCXsuPWSvGgwmqM1jLeEkVfJTtUNrQqwLQaAm08DAU24y/woPfIaBeI+1Og/fI0TYT
	85wWLULIBPQFhwVv5VGuFle/aSBR8yEqPC37vpYzPOK29aQ5kQLBFkpxZaawqXcDpMECbzRm9Nc
	LcagkFf0zEZhaBd/Zc9MLnT6a5VNAwuogHHQj6PdLPMsJjaQyUMXL0E3Opq6chU5V1mMlGtX00p
	MusaCIgx0KbGQGR4y2d/7Borqr+no7mkaD2wAWy7UUzIZdfE8N8Ie+AZgumnyFWQDoONVZIN2IT
	t6Yq+r1mf4Kw1zoEZEDAOI/CxRC2DKYHVnyzQINQP4ncKed5j0PY8D++JDmkpmXQxao=
X-Received: by 2002:a05:690c:e64f:b0:8b3:2eb4:1426 with SMTP id 00721157ae682-8b4aa396c4bmr7805397b3.99.1794571687123;
        Fri, 13 Nov 2026 04:08:07 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm1823203d50.10.2026.11.13.04.08.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:08:07 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b3402105b9so7150967b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:08:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEaL57I8MegGizlxCjSPvjABgIQwmsSez3Lx5nh5mAv6/JihbloTkmb9vF6Nx7uxNyM9qk+ss99O+3HxeUy1Zso@lists.infradead.org
X-Received: by 2002:a05:690c:9413:b0:8b3:b06d:68de with SMTP id
 00721157ae682-8b4aa3b2d79mr10574347b3.106.1794571686768; Fri, 13 Nov 2026
 04:08:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105100322.37816-1-tanure@linux.com> <20261105100322.37816-3-tanure@linux.com>
 <20261110175451.GA833369-robh@kernel.org>
In-Reply-To: <20261110175451.GA833369-robh@kernel.org>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 12:07:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
X-Gm-Features: AclHuK8ofQ5KQ8mwVSBPN6RHiYMAZFp4eZUj5gb-QcBMy0mlvdZGEaaXPcOEhAQ
Message-ID: <CAJX_Q+2WoawiGT9zF2W+LCUhVn2QV3F9rUDBHiGtR6pddKAkNA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Rob Herring <robh@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_040808_646404_0184E806 
X-CRM114-Status: GOOD (  32.55  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 5:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Nov 05, 2026 at 10:03:17AM +0000, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A but needs two clocks of
> > its own. The controller reaches memory through a pipeline stage with
> > its own gate; nothing else claims it, so it is switched off as unused
> > and transfers never finish. The glue registers sit in a block clocked
> > together with the MDIO multiplexer, which probes after the controller
> > has programmed them: the writes are lost and the port keeps the
> > bootloader's delays.
> >
> > So the T7 gets its own clock list, without the timing adjustment clock
> > it never uses. Its delays follow ethernet-controller.yaml: the PHY adds
> > the 2ns, and only the receive delay line offers fine tuning, so only
> > rx-internal-delay-ps is valid here.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
>
> I tend to agree with the sashiko comment, but am fine either way. Once
> the if/then schemas are longer than the main schema, it's a sign to
> split.

In V7 I will split as I think it will be easier to review.

>
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index e769c9bb70d8..ff5e50f65114 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -84,6 +85,49 @@ allOf:
> >          rx-internal-delay-ps:
> >            default: 0
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
> > +            - description:
> > +                clock of the register block holding PRG_ETH0 and PRG_E=
TH1.
> > +                Without it, the block reads as zero and ignores writes=
.
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +            - const: pclk
> > +
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
>
> Sounds like constraints:
>
> maximum: 2000
> multipleOf: 200

Yes, with maximum: 3000: the field is four bits, 0 to 15 steps of
200ps.
>
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
>
> Move this to tx-internal-delay-ps. You can (kind of ackwardly) do:
>
> tx-internal-delay-ps:
>   description: ...
>   not: {}

dt_binding_check does not accept "not" on a property under
properties: or in an allOf entry: cell.yaml allows only description,
deprecated, const, enum, minimum, maximum, multipleOf, default, $ref
and oneOf there. It passes only inside if/then, and the new file has
no if/then. So the property stays false, with the explanation as a
comment above it.

>
> (or "not: true")
>
> > +        rx-internal-delay-ps:
> > +          default: 0
> > +
> > +        tx-internal-delay-ps: false
> > +
> > +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> > +        # properties instead.
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -106,6 +150,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -142,6 +187,10 @@ properties:
> >        - items:
> >            - const: amlogic,meson6-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
>
> I would drop either both or at least 'snps,dwmac'. They provide no value
> because there is nothing to use them. IOW, there's not s/w that works
> which only understands the last 2 and not amlogic,t7-dwmac. Correct me
> if I'm wrong. Maybe a bootloader with simple needs.
>
> Rob

Right, nothing uses them: the generic driver cannot enable the
pipeline clock, and no bootloader drives this port from the device
tree. v7 keeps "snps,dwmac-5.10a" for the core version and drops
"snps,dwmac".

Thanks,
Lucas

