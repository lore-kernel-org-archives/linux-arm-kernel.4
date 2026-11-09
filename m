Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14570606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xC/qhPAE;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Tk78qJ90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=; b=xC/qhPAE7TL0wveepiAHxBNe+v
	PYY1bl7GTr9hgRghIPww/ZwG7vlo7Hu4y8lYeM43n1BEiYdbWpz59j3kqTue+A5C2LNJFl3p9kKG5
	cVcpf8ohWlgU9b3XbSqtUcY98fJjUABJl1PHN8m167lgy2A47/l2w4N5ja+Ok2qJM/ppWiD5U+F/P
	qKQdVHbXAH8czo+O07egiFmie5gjKlU/nPp2x2HqWOTpVWL7FV8aN4ebV44xMT2MN/iSvNphzEI9n
	BO9VMn9oxlzippGVtCho9mGTNb3gT3G/IfrGOhHKqHKOdo8ndjDv4c5moltxuOcUaquX0XutRrT2v
	j/jC7fHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKsF-000000005hM-22LX;
	Mon, 09 Nov 2026 08:37:07 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKsC-000000005gF-18Gt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:37:06 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-491971ac844so545934f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794213422; x=1794818222; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=Tk78qJ90Pngz1wSyRQxR2XMVBJtrsJqlub74t3kJrPTVegOWpOOUjxY7srP5sQhp8x
         JGaSZQpx4Hf/k/a8TAg9JNfT5cgMkL7z0lhoJJmLs0ZsCP6VNpPSpwy80MefB//BQyXs
         7YgpOPaD5ICV06V7xBZ15G7KAlbRrIOcA6IkooooMr8VAURQxz5JptmMCWQTl14RinRp
         8bTsDtvFP0qNW3FbpjEdfxEABXPbu1r0xiphN3c/HvdvtWrID8HRAtlkLvMN8lSo5lv9
         YDXAssvK0rPgYdUFIuBe3qyjnFlUhViyyUJeDkHPVx6n0xuXD3xxETttVPufaVMMo9g7
         j0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213422; x=1794818222;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlWVeqxOFKnS07Xt1FTBX6BAWK3NjkCNWJ9S2mRfn1c=;
        b=hBsV1mFEUzguMhemtqkVB27Rq5sjc0WncM0X6TZWT8bcsZi1loOtklPc3iLQgJSmln
         +wHD3mX2KLQDc/RO9X8RJk6AddmN83gPJJeo+yfecu4KeYABK+bWB6K9357cW2wPwc+O
         YxOFK3/jFuAhxwx1JadXxwG4RRfGQqcKFjgjJLvK99y0cIyXpYSAOTojoi5VJD/T9aCc
         SDtW38rCIn8dDM3Mf9Czl1Fvj63DTr55EtVelTis5IDSPaABvhJvQ6I0vT39IiVix2vV
         sA4lec2A79wSuHikEyrT/q4MzIhwWiP/yH0qpyRT+vCNqR5FqJaWt88trppklFvvLboV
         /k4A==
X-Forwarded-Encrypted: i=1; AL+hErH3RdvGWPGxN2mg34Y2vsR2ajf3ftnzcEwI2LooOKEqkNgFkQIrVXx94Jt2PIYoC+sj3t89A+Upyt+tgqmmWTp1@lists.infradead.org
X-Gm-Message-State: APuU4Z/REBECO8N+hQviikaSR3aCoW0+uIHc2sU7NADNP0GvjBfKNmaq
	ttUahZ+8s/+ra7+6a7lrPpVsXZeCMvfkkox2qvLVqpoZMaDEJYx+7iRBfJIx60pzN28=
X-Gm-Gg: AYBFou3RTLLobsgUk5Mu5KpFC3jCOsQ9SXy6be+6biwWQGvmZQC0IPj183NLOgHY4Lc
	n00XDglQrzw0JXs/1hX4hNcBIKVui3AmNk3Dn4oEsKHcS9vyF0R3k8mTOOq9DF+jyUyg5JT2dm8
	zgfypHhcO4gaV0AOdp4uXqj5U2/6J5HVw/3pv09LcjK8M4y38RepSV7C+zg127/1zhhrA+7M414
	bckZVA+kGPjEwgDPJvoT4WaFUvZUV57Hu0dD/Y1ipS8avI+Xq4Fi10+Qbp348HQnjjri0HYUcBh
	7QXJC4I5Uldile/9LtuWunwaREUbOKShup4CpKA+VRtz7dOwYcaM1yzKYhdCXmbt31YN7V3onxI
	hImaq1lEYxfWYykFoyfa/j0BguVVkycaVB3ldEG+13FN+1+jM85rquJJuKb05YMqJBtUP8G7Jo+
	VgwRY51vJSD2AfR3Kywqw58muIwl+wKXGL6O2HUB33BMrubhtFkoYFRZqDgBmVqNAgvm4oYwGXc
	MDrRBwagKez8gKA8wphCFRC5FD5dSSYDQLLY19EtgFVD+uug04Z9Vb85bnL0j8QF4F3xmvFWns0
	GWYpOI58pDhmSJMqQPh/pR3/MrzbP6vq2q6WCDSjHU3vMZ8M
X-Received: by 2002:a05:6000:383:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49585bae5b9mr5896344f8f.49.1794213422144;
        Mon, 09 Nov 2026 00:37:02 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm8320547f8f.7.2026.11.09.00.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:37:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jian Hu <jian.hu@amlogic.com>, Chuan
 Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
In-Reply-To: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
Date: Mon, 09 Nov 2026 09:37:00 +0100
Message-ID: <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003704_558813_76437746 
X-CRM114-Status: GOOD (  19.86  )
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

On dim. 08 nov. 2026 at 23:21, Conor Dooley <conor@kernel.org> wrote:

> On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
>> The S7 firmware exposes clocks through SCMI, including sources needed
>> by the other clock controllers.
>> 
>> Define their identifiers so devicetree can reference these
>> firmware-provided clocks.
>
> Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
> vary here between versions of the firmware?
> They're also not a "made up" set of indexes, like traditional clocks
> are, they're real numbers that come from some document akin to
> interrupts that we do not have bindings for and no driver is likely to
> reference these definitions either right?

There is no such document available unfortunately. I'm not sure one
exist to be honest. Those IDs have been stable ... so far, but sure,
a FW change could change them.

The IDs are totally made up, in the very same way the other
amlogic clock driver IDs are. Providers and consumer just need a common
reference to desginate clocks, this is it.

>
> Is something like this not more suitable for being included as a header
> in the amlogic dts directory?

If you think it is more appropriate to have them there, it is fine
by me.

Carlo if you have to respin with this particular change on the DT side,
feel free to add

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>> 
>> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> new file mode 100644
>> index 000000000000..10d7caa5d1e2
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2026 BayLibre, SAS.
>> + */
>> +
>> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
>> +#define __AMLOGIC_S7_SCMI_CLKC_H
>> +
>> +#define CLKID_DDR_PHY_OSC			0
>> +#define CLKID_USB1_PLL_OSC			1
>> +#define CLKID_TOP_PLL_OSC			2
>> +#define CLKID_HDMI_PLL_OSC			3
>> +#define CLKID_USB0_PHY_PLL_OSC			4
>> +#define CLKID_USB1_PHY_PLL_OSC			5
>> +#define CLKID_USB0_PLL_OSC			6
>> +#define CLKID_ETH_PLL_OSC			7
>> +#define CLKID_ADC_PLL_OSC			8
>> +#define CLKID_CPU_CLK				9
>> +#define CLKID_DSU_CLK				10
>> +#define CLKID_GP1_PLL				11
>> +#define CLKID_ACLKM				12
>> +#define CLKID_PWM_G				13
>> +#define CLKID_PWM_H				14
>> +#define CLKID_PWM_I				15
>> +#define CLKID_PWM_J				16
>> +
>> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>> 
>> -- 
>> 2.56.0
>> 

-- 
Jerome

