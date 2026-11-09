Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF1606EE80
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aX8RvAOk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=; b=aX8RvAOk3UmiFOgPl5GYcIgWji
	FYIhJro6PkL787Qi7+2i74h+u9H5WfHZfXd8/I7qmXR+FPF+ePe8gmgLcyaDlpqTNHItpH1BX4Ds7
	oPzkXhCaipLgnqjj4YXjZGGFTIc/KBeR9m97/5efcSGk9j2QYbdoMtGKDa1uEyjyYZwXtBcjkZBod
	q/nAVu8sLloQaNtaed24GLHJ1SdfDS0hnw4bmaCOgSSYFtqpmpxvAxDus6jzjiy0UpFrAN1IeTTUj
	FySOufD8pnsRePhdVKWyY3RI1Xtj7JAeiWRbcWuRU0vDFxJeZj4A56hrM2nzAhQLt3F4WXdvEVXVF
	jQjXHrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRdW-0000000152P-0rQx;
	Mon, 09 Nov 2026 15:50:22 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRdB-00000001502-2ZNn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:50:18 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2da166818so495856137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239400; x=1794844200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQ4LVrS7TAycIWuwYP6nLPokX8EbBu04NF8VpAWRnUc=;
        b=2gAKcyPM/pG/cKHRTZujeAzhbd3rXiXp/2EfHuQxZ1gR+99fqsnmE7WVx2wQ8aWefx
         AMvMvO51JoNr4V0UUrXGsqXzqREw86Yzi4Bk7iDMczmxRoo5kAQQO5wtUqMX3n1sgv0n
         SIjcGQE1kf3clVaYD7yQnjVxOzV7+JigJnQ/1W5yWYlkOPj08KjapFTOkgZC8DGYJFtD
         JsokOc71w2dVgajsXGdtB1YCqdR+pNsWWtcNqIOaRHr0L8Fpd2xN714b/tIyQ9ABDFSx
         6oviVPdpppZsunrsGxVTLiGAlALHbLKUpCTNlkeiosd/nV6I/cOmBwwgzGChbxpNHXwj
         aodg==
X-Forwarded-Encrypted: i=1; AL+hErGb6sLpFI+swqrXts7pScyLNvgVcrM/lf+4JtuLE38Pkthf4P7MZ5M5xA1vSBgUkNvUe4nL/dKmZouJv9HXLH1B@lists.infradead.org
X-Gm-Message-State: APuU4Z/yJe+JRYKH582qFXtKxv7hQgAtP9lGmRnkKI8i/Bkzy9mSSFaz
	3kgO0AKxcgrWn1ZPdPl2Ed+gd6lre3xFwkjOBibHlopwsFCLNVJFbIOUYR90Vna8Zlk=
X-Gm-Gg: AYBFou3TGZ0Fw4dReUD8s4qrotVCY0RwovlnGWvWQmsPpHgTGu7LxNvDLFuONUvf8gt
	UNcHgxHY2pw1FHxN7wOHV4t5sJytBDc4IDDJ5O2jccwlhwYo+IO28ymAeG12tbjBVYiimkxyVXN
	vgjhL+7POj6f/LNx9eSYRIzfJZ77XmDGyFL/1bkuYRCHepWWHIo4Q0Fp4n1nZDsvngBO0Rn9QyP
	wwUezZxRm/HdBbKed47oPYjvDb4B6tv7e/bLFKQ02e/jCrE+PufSb68IX4k3l9yOUby6mjc2MEF
	lI31d5zNLrQvqFTG4PqmM7xkM4Vf6+EwYw5XMy7l70neT807lAtuiquamf8Hh52huRVOsnoBim7
	+G/3wkaNkAMTMbLdZcOewwwJ5Gp6Pyw/ZYO7b0mFHoEzsj2JBdJScdMcM55omp93kDNR3X8wSLX
	fC7XhF44JMDZD13Hvn2o9dwFjYW3ILqOmE8Rfnv6OD6eG49p5hUbtbZ377IKfIftwHsT2xk1bfm
	iTMZBli+kDvj8rNmUty7oO05o7T3r+VuEu0aYvKNLjgz7DmhAOl+QqR/1zfCbX2S8Azu4G8e3M9
	ppl8ly2ODyr786f6ZZST//v0e3MrSW9rhHXdKj5NZbb/F8k8smuoBY9qhC1z7+cA7AD4eW9nudw
	7Ok+OUaGoxneW6N+alqAcFt7NSOSbMSfnfVE7pexgj3H+qbBNi1ja
X-Received: by 2002:a05:6102:2b9c:b0:7d0:57e3:d480 with SMTP id ada2fe7eead31-7d2db13bdd9mr1584443137.11.1794239400046;
        Mon, 09 Nov 2026 07:50:00 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c0285fc61sm3884195241.2.2026.11.09.07.49.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:49:59 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-980c4258105so528402241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:49:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEVYCueFz1Xau3mM9X0aKVuGzKeU/dED6eMxPZobY36y8dzYK49a8QITVdnXmWyuuzjZ+udjJ6bc7CsF0CgtN/g@lists.infradead.org
X-Received: by 2002:a05:690c:e3ce:b0:8b3:56f0:38d1 with SMTP id
 00721157ae682-8b36c854704mr28695777b3.3.1794239004423; Mon, 09 Nov 2026
 07:43:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll> <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
In-Reply-To: <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:43:13 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
X-Gm-Features: AclHuK8i80yCCEWCPsmXh9g28kddZ8mRpDlp24I5tNty5i0jlojD6mTpEXhkklk
Message-ID: <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, xianwei.zhao@amlogic.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20261109_075017_287064_B3CD203A 
X-CRM114-Status: GOOD (  29.68  )
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

On Fri, Nov 6, 2026 at 3:16=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> wr=
ote:
>
> Hi Krzysztof, Lucas,
>
> On 11/5/2026 7:57 PM, Krzysztof Kozlowski wrote:
> > [ EXTERNAL EMAIL ]
> >
> > On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >>
> >> Assisted-by: LLM
> >
> > Drop this one.
> >
> >> Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> ---
> >>   .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++=
++
> >>   1 file changed, 59 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac=
.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> index e769c9bb70d8..6de013e3e8f6 100644
> >> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >> @@ -23,6 +23,7 @@ select:
> >>             - amlogic,meson-gxbb-dwmac
> >>             - amlogic,meson-axg-dwmac
> >>             - amlogic,meson-g12a-dwmac
> >> +          - amlogic,t7-dwmac
> >>     required:
> >>       - compatible
> >>
> >> @@ -57,6 +58,59 @@ allOf:
> >>               - const: clkin1
> >>               - const: timing-adjustment
> >>
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: amlogic,t7-dwmac
> >> +    then:
> >> +      properties:
> >> +        clocks:
> >> +          items:
> >> +            - description: GMAC main clock
> >> +            - description: First parent clock of the internal mux
> >> +            - description: Second parent clock of the internal mux
> >> +            - description:
> >> +                clock of the pipeline stage inserted in the bus path =
between
> >> +                the controller and the DRAM. Without it, the controll=
er cannot
> >> +                complete DMA transfers.
> >> +            - description:
> >> +                clock of the register block holding PRG_ETH0 and PRG_=
ETH1.
> >> +                Without it, the block reads as zero and ignores write=
s.
> >
> > This sounds like you take clock from other block. That's wrong, that
> > device should take its own clock.
>
> I see that the clock in the dts patch corresponds to <&clkc_periphs
> CLKID_SYS_ETHPHY>. This clock provides the working clock for the APB Bus
> of the ETH PHY controller, and this clock will affect the register
> reading and writing of the ETH PHY (including the ETH_PLL). See section
> 15.3.4.2 RegisterDescription in A311D2 Datasheet for details.

Thanks. That section is the PHY block at 0xfe028000, the region of the
mdio multiplexer node. The registers in this description are PRG_ETH0
and PRG_ETH1 in eth_top at 0xfe024000. On the VIM4 the same gate feeds
them too: with it off they read as zero and ignore writes. My datasheet
revisions do not say which clock feeds eth_top. Can you confirm it is
this one?

Thanks,
Lucas

>
> >
> >
> >> +
> >> +        clock-names:
> >> +          items:
> >> +            - const: stmmaceth
> >> +            - const: clkin0
> >> +            - const: clkin1
> >> +            - const: pipeline
> >> +            - const: pclk
> >> +
> >> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.=
yaml.
> >> +        # The RX delay line of this glue is fine tuning in 200ps step=
s,
> >> +        # added on top of what phy-mode describes. The TX side has no=
 fine
> >> +        # tuning: its only step is a quarter of the clock period, the=
 full
> >> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> >> +        tx-internal-delay-ps: false
> >> +
> >> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> >> +        # properties instead.
> >> +        amlogic,tx-delay-ns: false
> >> +        amlogic,rx-delay-ns: false
> >> +
> >> +  # Delay definitions for Meson8b and newer
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            enum:
> >> +              - amlogic,meson8b-dwmac
> >> +              - amlogic,meson8m2-dwmac
> >> +              - amlogic,meson-gxbb-dwmac
> >> +              - amlogic,meson-axg-dwmac
> >> +              - amlogic,meson-g12a-dwmac
> >> +    then:
> >> +      properties:
> >>           amlogic,tx-delay-ns:
> >>             enum: [0, 2, 4, 6]
> >>             default: 2
> >> @@ -106,6 +160,7 @@ allOf:
> >>             contains:
> >>               enum:
> >>                 - amlogic,meson-g12a-dwmac
> >> +              - amlogic,t7-dwmac
> >>       then:
> >>         properties:
> >>           rx-internal-delay-ps:
> >> @@ -142,6 +197,10 @@ properties:
> >>         - items:
> >>             - const: amlogic,meson6-dwmac
> >>             - const: snps,dwmac
> >> +      - items:
> >> +          - const: amlogic,t7-dwmac
> >> +          - const: snps,dwmac-5.10a
> >> +          - const: snps,dwmac
> >
> > I see no such hunk in the code, so not sure how to review this.
> >
> > Best regards,
> > Krzysztof
> >
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
> --
> Best regards,
> Chuan
>

