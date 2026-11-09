Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF7A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KqXljGOY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=; b=KqXljGOYS8AVx2N2jfR+1PJlGX
	m1jBBgqwyySbqUBIDKjWc4eQHouNcBKeybYhR01OkFbRuytT58r+V9Pok2FI4N80wypqNCPCp4ajk
	3h/7fkOBy+KMkMCGnSdyBbK/ITa9IEUYHU/EuA1L31l0lWI6djxYic/1EUWmUU0vvllv/K572n0cK
	KrCyDckigoYXxdRGK+QSHNAJMq2YdXWEoK4EH44mgHDfjlT1B/MOEYpn9wh6NkQU1zZzFTbBLezIN
	EXII4y4Elm5FJWsEx+BfXUUi3T4Y58qGihWLV7rOTg4l17K4x64Q25MPXrfBb6VoEBkZ5cQIZPfg9
	zjDhEIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRdr-0000000157x-27ub;
	Mon, 09 Nov 2026 15:50:43 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRdo-00000001579-44lM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:50:42 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99071945aa7so495263241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239439; x=1794844239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG4pMlSywf90fG++ZmuGwd6o+rUWkZppXqxcs9JhM2Y=;
        b=yh+ZwMr55MX245AjiazSAHEhvc5ncQzOuifmyDq+y/Zeou3hRoIYAQp/FMJACBwHfv
         0NmvnOb1hu+7PntJnBker7aok6acxdLbsguI0oJaqI1KWymkQa+6w3PZ71DVte0+bbCH
         IjU2SawjYj9qheV3ltpf+ofASf2MijSIQklT4bDSb9pAU21ZyM/jQXejByAZGj32dNkm
         4pQbmJcz8Pj0O92HeJko+lKbyCSyu+TTUP6iyxSRekFhRf8ZGtit3DPijx9UXsR4xyZU
         O6NrfBjDYJRsYyvRdhc5yzjX5lbbqR+WiCQB+2cCnpePN37mdh9A6KU2JBLNXTr6DegL
         eH3Q==
X-Forwarded-Encrypted: i=1; AL+hErEbBNwHyatQpgPZzS4NqD6RXJzJEzfnsJvoLau7Y8Sk6z+CPOlHfjNkZrp9x7Cf5TXI40O1ZZ+tayZVcccRicOx@lists.infradead.org
X-Gm-Message-State: APuU4Z9txxlLAHnvWSkKGGhom4ag0RlBqj+Gh8CuGNDpCg1vC95wzEfr
	NKqkLkS3BsUOFrFuYXZ5SnN8wshpVBjMqCh48iLz56UCopaYzhT8ggOKNrGzIdYlH3Q=
X-Gm-Gg: AYBFou3BvukBxU7oYjRqx2vRtxgIzI5L7mGr4ddXi0t9WAyTAvvtv3IGQJvfFwaUr+u
	G1CGr+jRCOWdreyvMFIEqXhby73gsIjWsJQ9E07OaTY3LpdepS+DXCC82cAreZf2MXzpKpcwc4/
	ash4TRpZqi5JEgX355K42decDhtT/GgQlq4pTgeeunzr9ULsD5Je35SREzzSDycqxJ/qSqtsmSb
	cMLknG/PHvZTP3S3zDKOoBYIKWYTsX8Npofvi8X/uXOVvuKybx3N4CP5Nb3uvMICdKdFYGEh5gc
	OCaUNetA4PMw831ld3m5/o8hxu/BNQoVAVNF0dh+yEZXIvk6e3jQiZj6yfsDxBRfS4hXwf1Z26x
	3vrWFTt31aPF3bfGFLy16bapc9371dF817mzXM5QSP5mwrp5xtKw+vE9Pxy9kmiG51GtHxS2PA/
	51brQ0SQuegh3eYhyW2MhiZqcRaA51RbrcvxeG8xz8tepCcJ9VLK81G+OM8SE/qwwbmARwd3cZC
	Z0vO9CyAGNubotz7VPQGXMUMIPvf/XMuR4RVCKFfzRf4TeKKSZlfds5H70ZnrRrprfEk3QvBLlo
	utgS7KfAYiF1KjWF9dFnfJY32/5XLs0y5NmLeG5ZZ17mw1/4AmOTualYS2naM7/tTUtO6CRYlKv
	w8OYQaAU1eR21oFmzg4Npx4zs2RxOQiOt1OdxXfU3p/P5M0v/dN3hah7XxU/k3+GstkDu9mAe+g
	==
X-Received: by 2002:a05:6102:9d7:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d2db1cbccdmr1488659137.18.1794239439332;
        Mon, 09 Nov 2026 07:50:39 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db2a8045sm4551009137.1.2026.11.09.07.50.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:50:39 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99911ead46dso510266241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHEB3Xj6Yt3vqSmaBqb3fA26T6zMzDrUnwT1klq3eLsCC2lbNcUzf3pCiyLqAga/3rbS4yLVDHlDHK3xO7xvnlN@lists.infradead.org
X-Received: by 2002:a05:690c:c4e6:b0:8ae:8d28:77be with SMTP id
 00721157ae682-8b36c8542c6mr28200577b3.1.1794238943160; Mon, 09 Nov 2026
 07:42:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
In-Reply-To: <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 9 Nov 2026 15:42:11 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
X-Gm-Features: AclHuK81wJVzU4rFeRI7sUHF0-2FEAkn5jMEtF1UQ-EscSMzMfyyODCM_UAkaVg
Message-ID: <CAJX_Q+1OMHo_VWD2+0RUfF6EUNbLLNZafDuHxCBzU_qALBa2hQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
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
X-CRM114-CacheID: sfid-20261109_075041_024377_7852BE0D 
X-CRM114-Status: GOOD (  23.95  )
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

On Thu, Nov 5, 2026 at 11:57=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >
> > Assisted-by: LLM
>
> Drop this one.
>
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index e769c9bb70d8..6de013e3e8f6 100644
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
> > @@ -57,6 +58,59 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
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
>
> This sounds like you take clock from other block. That's wrong, that
> device should take its own clock.

It is this device's clock, the description is misleading. PRG_ETH0 and
PRG_ETH1 are the glue registers of this controller, the second reg
entry of the node. The gate is named after the PHY block at
0xfe028000, which the mdio multiplexer node lists too, but it also
feeds these registers: with it off they read as zero and ignore
writes, and no other gate brings them back. The stmmac core enables
"pclk" before touching them. v7 will say:

            - description:
                APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
                Without it, they read as zero and ignore writes.

Thanks,
Lucas

>
>
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
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> > +        tx-internal-delay-ps: false
> > +
> > +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> > +        # properties instead.
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
> > +
> > +  # Delay definitions for Meson8b and newer
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +160,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -142,6 +197,10 @@ properties:
> >        - items:
> >            - const: amlogic,meson6-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
>
> I see no such hunk in the code, so not sure how to review this.
>
> Best regards,
> Krzysztof
>

