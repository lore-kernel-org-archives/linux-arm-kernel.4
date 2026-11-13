Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qhh8HIs8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l1+NgW92VziZf9PgBdzApbIe2BkR1TvVvXtYjUT220A=; b=qhh8HIs8so+zzObKirfXuVSM6h
	2f98i/I3dPq0nURMMr0HDbKIPhsm8GjLZwNXL5ci6+UHzdWOpS8ZRr/mcwQSRoTANyCdrGo2fvFj+
	QICz8fuy0aJtxO8aPc2SQNRTJEriUlGAtqEmtl5unq6hCXrz50g+zr1xot9IUYfJuXipytn8fi4eh
	3LAwisO5R43AxrB4YmUsjqYkrDyYKwbci23rSPjh7k2N326pFzh9lIoF1940UIdNNL7i+pnyXSy9q
	AMxXjI02ecyzQd/7V9cqYcG0LSa3gkI2rpSFpph884SocTzjPZd9agbtWEYER3p7kNt51w6+9Xany
	qnI2NwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpdz-0000000CYmo-3RqR;
	Fri, 13 Nov 2026 11:40:35 +0000
Received: from mail-yx1-f52.google.com ([74.125.224.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpdv-0000000CYl4-2xx2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:40:34 +0000
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so914066d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570030; x=1795174830;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1+NgW92VziZf9PgBdzApbIe2BkR1TvVvXtYjUT220A=;
        b=J51B5Nao9jS6qASY2TRZ8XmvkOtYsBULIMqx55tGHSLwL+2FwZq+eq+3Q65pvQ8LY3
         FWmpHovJBEEJ1MnAY4QQzh98hR2zVxkOAy/m4XuYRteiWCbcALKZgvPMgvPrfyLyOkBn
         Vnh7mtewi/iLBZIDJG9kn05Yocnzfy+bqK3eCbvxiqrOgmuhtTsriLXVp3x/QTZbTdfO
         3q4OqAd+XVZigHlQe1z5uYIver2SAcMzrW8NjsqueTm7zUOONHlTeYcOXubySqGjv/wS
         2/4T9zz7Osa+sHsahyUAkE6auCDFW+VF0VGefaE4UgWtGh+haVboPZN8Cu8HjVLETCL0
         TD4w==
X-Forwarded-Encrypted: i=1; AL+hErHJoE58GeBGAIo5KjcVY19jzXOCvzpixQZUGib/c3+ICTpxnabEGCi/x95SWDEHZMtF9BSUcyO4pSNU3KYd6ZPY@lists.infradead.org
X-Gm-Message-State: APuU4Z8sHUCPPeVofOHFI5bS5g8m5k5SAK9kF7DVQG5EOkZuVFXA/Z7E
	0mefK947Evh+r+woQTKsBOYBo9ruooa2wN2QpZ/aJUCOuuZF/G++kkkytPbK8KuzwTw=
X-Gm-Gg: AYBFou0oiXO+kyLQrEdIWthQ7cMlDMapOX3h1HQ8/jnSgKeokGa9gG+lTdwB+3GZ6Cy
	I4CUABudTL9uv97dNGmKqcR0QSYyOkaIvamnpUxAAUg4OitXWjOuwemwFkA2pHJZHtI/kEDgvz+
	DsoohV5J1nL8wJ2F/LOe6T4tu9b3EiPgybJuIG6QsrFAHNoySxmUtdOs/k3vQRHRoc5Lk1ujphR
	nheCUQdUXq7w3R07YzgXUGu1+KRANXRsUf3zRFj5XhyAMx7pHVtMcUVnsHj9xjqPuaSXeMD/Rby
	yLTGpBiYD1zqlwsA/0RK7wdedUXqBpakGNL49cZ92v6fcmuBlss/DekoByeU3TwFhzqQJvOme/A
	pbQWah0VQaGhDeFH9RLSD9UcjjIa01Xbn1gG3naov6+9eh+gIXeew28t5iqze/9DIjRzGAu1N0P
	kKsSnJCAoAv2qO+mtLC6Uu7MrzD/2W2ncHgUC2CCzlfcq08j8H3Y/EfQu6ExD4UjnkBZBWPrQW/
	nQS2j5eaNyPD72nxJuzz7brmPQcz/hnSytnjWQNUxKvaeJ26HOl01oaO5rEF1FVOkZSZb3HnDQS
	/QsF2lggcs+5woGoXKkUMe/XkwIc2dw99DB37CEM/NOO7lgoEamHGMFPAlXmVZ9ZIqcowJELhn7
	mpNOL3wiSb33bWnAs4XnIIeRuhQk4miBMZxuSy5IELYY7T8DXivtoLA==
X-Received: by 2002:a05:690e:400b:b0:67c:55a7:c5f3 with SMTP id 956f58d0204a3-67d8965c15fmr1351254d50.43.1794570030436;
        Fri, 13 Nov 2026 03:40:30 -0800 (PST)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com. [74.125.224.52])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5a4bb4sm1774655d50.11.2026.11.13.03.40.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 03:40:29 -0800 (PST)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso847053d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:40:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHAKFav+HQFrFwvUkiHQIWz1sU1LdWhhanRlQFIdtuE5WzTG2/9hL3ASVI5kglcW7+78T6aEhUTxj66osUD64l/@lists.infradead.org
X-Received: by 2002:a05:690c:f85:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b4aa350595mr13731467b3.83.1794570029115; Fri, 13 Nov 2026
 03:40:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103163715.385394-1-tanure@linux.com> <20261103163715.385394-3-tanure@linux.com>
 <20261105-stoic-cricket-of-tolerance-cb3014@quoll> <35dc1ebf-5194-4ec8-adfb-dcc8ea717750@amlogic.com>
 <CAJX_Q+0QqBHGv-4nfmY8N_xr=KQgUFtwPQTVZBxTK1LHV0jGOQ@mail.gmail.com> <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
In-Reply-To: <bbe0dedf-4b02-4cc6-97be-accfc06baa10@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 13 Nov 2026 11:40:16 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
X-Gm-Features: AclHuK9I2BMo6FvBmijHWWypkJRsPu48XUE9NXvVmMxUtTJAFVoacoB_pnoFyzs
Message-ID: <CAJX_Q+0seFwDvd6zksLnJjWYJJY1QcLc1gAjr=FN1p+aTdumpw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261113_034031_761970_348B6F25 
X-CRM114-Status: GOOD (  34.94  )
X-Spam-Score: 0.6 (/)
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

On Tue, Nov 10, 2026 at 11:43=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> =
wrote:
>
> Hi Lucas,
>
> On 11/9/2026 11:43 PM, Lucas Tanure wrote:
> > [ EXTERNAL EMAIL ]
> >
> > On Fri, Nov 6, 2026 at 3:16=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com=
> wrote:
> >>
> >> Hi Krzysztof, Lucas,
> >>
> >> On 11/5/2026 7:57 PM, Krzysztof Kozlowski wrote:
> >>> [ EXTERNAL EMAIL ]
> >>>
> >>> On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> >>>>
> >>>> Assisted-by: LLM
> >>>
> >>> Drop this one.
> >>>
> >>>> Signed-off-by: Lucas Tanure <tanure@linux.com>
> >>>> ---
> >>>>    .../bindings/net/amlogic,meson-dwmac.yaml     | 59 ++++++++++++++=
+++++
> >>>>    1 file changed, 59 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwm=
ac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >>>> index e769c9bb70d8..6de013e3e8f6 100644
> >>>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >>>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> >>>> @@ -23,6 +23,7 @@ select:
> >>>>              - amlogic,meson-gxbb-dwmac
> >>>>              - amlogic,meson-axg-dwmac
> >>>>              - amlogic,meson-g12a-dwmac
> >>>> +          - amlogic,t7-dwmac
> >>>>      required:
> >>>>        - compatible
> >>>>
> >>>> @@ -57,6 +58,59 @@ allOf:
> >>>>                - const: clkin1
> >>>>                - const: timing-adjustment
> >>>>
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            const: amlogic,t7-dwmac
> >>>> +    then:
> >>>> +      properties:
> >>>> +        clocks:
> >>>> +          items:
> >>>> +            - description: GMAC main clock
> >>>> +            - description: First parent clock of the internal mux
> >>>> +            - description: Second parent clock of the internal mux
> >>>> +            - description:
> >>>> +                clock of the pipeline stage inserted in the bus pat=
h between
> >>>> +                the controller and the DRAM. Without it, the contro=
ller cannot
> >>>> +                complete DMA transfers.
> >>>> +            - description:
> >>>> +                clock of the register block holding PRG_ETH0 and PR=
G_ETH1.
> >>>> +                Without it, the block reads as zero and ignores wri=
tes.
> >>>
> >>> This sounds like you take clock from other block. That's wrong, that
> >>> device should take its own clock.
> >>
> >> I see that the clock in the dts patch corresponds to <&clkc_periphs
> >> CLKID_SYS_ETHPHY>. This clock provides the working clock for the APB B=
us
> >> of the ETH PHY controller, and this clock will affect the register
> >> reading and writing of the ETH PHY (including the ETH_PLL). See sectio=
n
> >> 15.3.4.2 RegisterDescription in A311D2 Datasheet for details.
> >
> > Thanks. That section is the PHY block at 0xfe028000, the region of the
> > mdio multiplexer node. The registers in this description are PRG_ETH0
> > and PRG_ETH1 in eth_top at 0xfe024000. On the VIM4 the same gate feeds
> > them too: with it off they read as zero and ignore writes. My datasheet
> > revisions do not say which clock feeds eth_top. Can you confirm it is
> > this one?
>
> The information I can confirm is:
>    - The base address of eth_phy is 0xfe028000, and its corresponding
> APB clock is <&clkc_periphs CLKID_SYS_ETHPHY>.
>    - The base address of eth_top is 0xfe024000, and the base address of
> eth_mac is 0xfdc00000; their corresponding APB clock is <&clkc_periphs
> CLKID_SYS_ETH>.

That is not what the VIM4 does. The stmmac core enables
CLKID_SYS_ETH before any glue code runs. With that clock on and
CLKID_SYS_ETHPHY off, PRG_ETH0 and PRG_ETH1 read as zero and the
driver's writes are lost: U-Boot's 0xa0000 was still in PRG_ETH1
after the driver had written 0. Enabling CLKID_SYS_ETHPHY right
before the write makes it land. That was the v3 bug, every frame a
CRC error. I repeated it today on the running kernel, toggling only
bit 4 of CLKCTRL_SYS_CLK_EN0_REG0 from user space, every other gate
left on:

  both gates on        EN0=3Dffffffff EN1=3Dffffffff PRG_ETH0=3D00001601
  ethphy off, eth on   EN0=3Dffffffef EN1=3Dffffffff PRG_ETH0=3D00000000
  ethphy restored      EN0=3Dffffffff EN1=3Dffffffff PRG_ETH0=3D00001601

So on this chip CLKID_SYS_ETH alone does not give access to eth_top.
Could the register interface of eth_top sit behind the eth_phy APB
slave? Either way the MAC node has to enable CLKID_SYS_ETHPHY, and
the binding will describe it as the clock of the glue registers.

>
> The CPU reads and writes the registers of these peripheral controllers
> (or Processing Units) via the APB. Consequently, the registers of these
> controllers cannot be read and written properly if the corresponding APB
> clock (sys_clk/clk81) is not enabled.
>
> >
> > Thanks,
> > Lucas
> >
> >>
> >>>
> >>>
> >>>> +
> >>>> +        clock-names:
> >>>> +          items:
> >>>> +            - const: stmmaceth
> >>>> +            - const: clkin0
> >>>> +            - const: clkin1
> >>>> +            - const: pipeline
> >>>> +            - const: pclk
> >>>> +
> >>>> +        # The PHY adds the 2ns RGMII delays, see ethernet-controlle=
r.yaml.
> >>>> +        # The RX delay line of this glue is fine tuning in 200ps st=
eps,
> >>>> +        # added on top of what phy-mode describes. The TX side has =
no fine
> >>>> +        # tuning: its only step is a quarter of the clock period, t=
he full
> >>>> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> >>>> +        tx-internal-delay-ps: false
> >>>> +
> >>>> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> >>>> +        # properties instead.
> >>>> +        amlogic,tx-delay-ns: false
> >>>> +        amlogic,rx-delay-ns: false
> >>>> +
> >>>> +  # Delay definitions for Meson8b and newer
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - amlogic,meson8b-dwmac
> >>>> +              - amlogic,meson8m2-dwmac
> >>>> +              - amlogic,meson-gxbb-dwmac
> >>>> +              - amlogic,meson-axg-dwmac
> >>>> +              - amlogic,meson-g12a-dwmac
> >>>> +    then:
> >>>> +      properties:
> >>>>            amlogic,tx-delay-ns:
> >>>>              enum: [0, 2, 4, 6]
> >>>>              default: 2
> >>>> @@ -106,6 +160,7 @@ allOf:
> >>>>              contains:
> >>>>                enum:
> >>>>                  - amlogic,meson-g12a-dwmac
> >>>> +              - amlogic,t7-dwmac
> >>>>        then:
> >>>>          properties:
> >>>>            rx-internal-delay-ps:
> >>>> @@ -142,6 +197,10 @@ properties:
> >>>>          - items:
> >>>>              - const: amlogic,meson6-dwmac
> >>>>              - const: snps,dwmac
> >>>> +      - items:
> >>>> +          - const: amlogic,t7-dwmac
> >>>> +          - const: snps,dwmac-5.10a
> >>>> +          - const: snps,dwmac
> >>>
> >>> I see no such hunk in the code, so not sure how to review this.
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>>
> >>> _______________________________________________
> >>> linux-amlogic mailing list
> >>> linux-amlogic@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >>
> >> --
> >> Best regards,
> >> Chuan
> >>
>
> --
> Best regards,
> Chuan
>
Thanks,
Lucas

