Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AC606A68B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Py8Og4pf;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Zi31FqE9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=; b=Py8Og4pfz3EjGJ
	aEXWr7qyiSFZfiZG1qMa9lvfni5D8s/da5ntWyl3WUnLjAkxwWF15c7wGULUastL55s+sTLCzlBbz
	VDsCTsob1veA/dJAooK2cAmRrL6wydAkyTMm6W0eBRCVv4nSf3H/3n/tKJvq8Q7HHENYj5nsvkbPS
	6zC24URAE4aGOpK49qHXVGQAeHNJb9Css71oxzx00KssshNlp9ANpi8GwPWKkBw/7U2G01V6FqAiO
	UcPfXUh6dJagA/MX2CwZA565DpdSsSyS84YgqBpYDkMnYU8OrD3iXD0gECBN2RKtxfw3f97f/Oje1
	8odi8TdkqmndiEf0oP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxqn-00000007pTv-0hiu;
	Tue, 24 Nov 2026 21:14:53 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxqk-00000007pS7-3tJm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:14:52 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67bee1f693bso4037178d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554889; cv=none;
        d=google.com; s=arc-20260327;
        b=s43cs/N/nTjuRdMEZVeEz8GmBs2hVsidmQzgyVcpK12Rvsd6d1AKDvUpnYLemWIKFt
         1pM3888apnC7aMONNOiomsW3AkX0Dt1E024Eyru165UqPXlzP8l6Ikp9qGHwVkFBLS4m
         N+X2UxSuWN0R/b/6iywEPh463f8gXTdmWf3SgBDPx8LVHnz7JIYsVirUL+6NUe3MiDss
         sY0XD0tsb2q0kwbGHvczuzsgVcwfWhCXIcAuYO3pwpIWIfipvWJN+ujAn4JIEqDsYLO5
         Pnj8G0SwOMwDABPTEqk0DHeP5NmxZ8L8RQwAfPwmRD25WzfV9d77S/8kKcX3i+WdYqDA
         ByTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        fh=wHZE6URHjPpRQq8Q6+XwN0Bdjz12zqNbz9FWIxw27rI=;
        b=c6XDccGZhSfKAMGW7+l3mY+etHRK1kMcXGL2aCSNsncljdh6Sa6o0GH8y4TicHsusb
         tZmySFPvIi4O6VyRFmBbPu6bFj9ZyM/aTU7gYQgnKlF9b3/F6BEA/an3fmMnX2O12Fop
         V/TsrORzHq2+MZ7UbGSyzu/6D8RVIr74A0m4+k5cATOtTABO4yzWL0StCdZweCV7DpcL
         sNPyGQg2ekkcYvggVTZGXVqBtoy1JxgwpJsjmW2MFcquc6A3I97hK00psnFGIPtaTjCO
         VKUrZ2DPeJHiq9nU8R+exRShyTpEG7q7+NQymJ+1uH+iUP2rd0BOUvyqpotxOUEb5iWs
         e/yQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795554889; x=1796159689; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=Zi31FqE9OEctwkEU7K4UImOdirAGjTjm1+RM8pw9gLrWa78hKJ87TI9v3Ai10++Cct
         zsFGVUUqFJmACeqw9X36X2/oGKes3W8kS2KnvumpjbiGxG+1+HO9hkJQanJUBatv3hEb
         SF3tj6dK0eRHsLhrv7TsZQCkA8IJ0UL9Rz/k3esW17sAbutb9MbCiHpKACcGh0d91m09
         g1bIg4bYR+Ze7jwrFH73PE3Rh5Wpo1XKZmScQ8+iCwocEYBkhNIk3b24N2pFQwtxcwhe
         eQc0tcE68os/kZ0BRFJtTXDG214UFF9pfsn3vJYlKchqscIGx/dZHLuRj4BwEw0IH4JO
         Xlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554889; x=1796159689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=QmODjuyrsCYc9mMpymd6OdRV93eifLfFqouJAGAOjSl/qs19JcdUDLvIrYmIZPujTV
         oQMGpOPixLf/DFqdI4vUp77JHNwDlwP1tMsCv7kLcYJQ1tBX/F3YsJp5cBX1idFitvTk
         pBhtOor9NYLvpZdt4RsGi8tVthhibZiImUHvRzjSS3cXILnCSqjDpl4HfLVno87o1iKW
         lu4Fy1ATZJCM3phX/IT3SS323amWl+ZAh7xk83Y+G2OalCy7qNvBowKDdxP+OieTJEjc
         GIxZhdFvDpxXJWtiKv6EQyLPnhoNWoaxW+2gPXUbrdr5zSkMpkyZkvjMVSTkocB1Qxlt
         xTFw==
X-Forwarded-Encrypted: i=1; AL+hErFdcc5lc3Rev7zpTaMVRzi2ZAMDkFcaCz6hgQGY1mwT5x02PZYXBRuPUk6mRiFXgBPEtq8ka6gAaS1V8/adL14F@lists.infradead.org
X-Gm-Message-State: APuU4Z/nby+ICiHffd6SoHBBHYGyGbeV15hIqwjbjr24ixzZungI+m34
	tQK4yg/LgwY0oduU0hdNEPteGpCz/XI41th+jdiRd1OyKq3nQp973KetD6vKp8BIfRnkXuD0P0z
	ppuIR96vtlKJrSkhfESxFAZLYWBlSJ+w=
X-Gm-Gg: AZFdTZcpVerLQq39lC7JLnUPsWt4NSAqh3iKch/iR0o/AczbZEEBesCIYQk8sQC7z5V
	WtkAjQfeNMJL5sUR6hmB9789dYap4MGFEZfcjmWDAO4WPyW3//OZWH9k1XnRV9Pg8+4Y6bAwwE6
	LJbn4kDcDmcS7KMAbAxBYoqqIN/LtADjsDvzwztsP/rHz3XSpzmg/wm+aHEEfII0dSHjQUeiqeq
	TAKE1vY7CiqS2g8IbgZjxMT6Jsic/lFwd3LxZkuVc1Q7HJIv/if6f5eOH1JEeQWRzk4YX+6IjJi
	Np+nUnFjj74XYxOTEuo2MCrfNDJs9+q66af14hMzL6yd8UT5eERZ7T7Tg35K+DUWG2X8JQt/DOc
	dniGySYnfnMYaNr864X0+/O0zjIslBdahuXYL1JwXoc/GfHqvmqT8AgCQB4J83J61jZxzeQ==
X-Received: by 2002:a05:690e:4090:b0:67d:a5bf:ac89 with SMTP id
 956f58d0204a3-67df42b4d7dmr8236792d50.10.1795554889394; Tue, 24 Nov 2026
 13:14:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com> <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
 <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
In-Reply-To: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:14:38 +0100
X-Gm-Features: Aa3M54rEVwCpdz6_8gjaGQEhKA7ZqL-_05evb2pOjFxPbafFazCrzB2je-Od50w
Message-ID: <CAFBinCCd==1Vf7jMCHP0VuWTNa7A5FvRfPYdk2zUaZ8eR54Z+A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>, xianwei.zhao@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131451_002802_7069A6D0 
X-CRM114-Status: GOOD (  38.07  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Valerio,

+Cc Xianwei Zhao, I would appreciate it if you could take some time to
help us clarify the questions below (or refer us to a colleague).

On Mon, Nov 16, 2026 at 11:24=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Hi Martin
>
>  >> +properties:
>  >> +  compatible:
>  >> +    oneOf:
>  >> +      - const: amlogic,gxbb-audin
>  >> +      - items:
>  >> +          - const: amlogic,gxl-audin
>  >> +          - const: amlogic,gxbb-audin
>  >  From what I can tell it's even amlogic,meson8-audin compatible.
>  > Although I didn't have the time to test in on hardware yet.
>  >
>
> Thanks for catching it!
> Any testing is more than welcome. I don't have that board at home and,
> based on my quick search, it seems not super easy to find one these days.
>
>  > [...]
>  >> +    audio-controller@a000 {
>  >> +      compatible =3D "amlogic,gxbb-audin";
>  >> +      reg =3D <0xa000 0x148>;
>  > I believe the audin registers are 0x300 wide.
>  > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
>  > that the register area is 0x100 wide.
>  > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
>  > =3D 0xb8. The datasheet [0] (page 395) lists register numbers divided =
by
>  > 4, so to get the actual address in the memory map we need to multiply
>  > it by 4, which gives 0x2e0.
>  > The 32-bit SoC vendor kernel [2] has a header that states: #define
>  > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
>  > by 4).
>
> I know that the register layout in these SoC is a bit messy, so let me
> explain how I got to the 0x148 that I wrote above.
>
> When working at this driver I used the S095 and S905X manuals that I
> found online, but based on the link you shared for the S912, I would say
> it's the same when it comes to AUDIN.
>
> Using [0] as reference, the highest register being mentioned in the
> AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 *
> 4). However I noticed that before that there are a lot of registers
> whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_,
> PCMIN_.
> The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is
> 0x148 (=3D 0x52 * 4). The other AUDIN_ block you mentioned is between
> AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).
Your approach is logical. And I have no way of proving my theory.
So the question for someone with access to better documentation or the
actual hardware description is:
- how big is the AUDIN IP block register space?
- what inputs are routed to the AUDIN IP block that neither Valerio
nor I identified so far (one reset line, one clock input, one
interrupt)?

>  > I'm bringing this up because dt-bindings are supposed to be complete.
>  > So even if the driver doesn't use a resource yet we're supposed to
>  > still describe it.
>
> I perfectly agree with this, but at the same time I thought that
> including registers which potentially do not belong to AUDIN was
> dangerous in the other direction, i.e. we cover a too large area that
> will be hard to use in the future if/when we want to use it and we
> realize it's really not part of AUDIN.
My concern is actually that the AUDIN hardware block spans 0x300 (or
close to it) and we'll find out later that there's a bit that we need
to toggle which is outside of the 0x148 area covered already.
Even worse: what if we put another register area after AUDIN and then
find out that this theoretical bit sits in the second register area.


Best regards,
Martin

