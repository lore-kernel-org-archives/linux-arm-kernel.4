Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nFcayo4+;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=mzt/r6uZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=; b=nFcayo4+WntRBA
	1tX4Rwz4H5tAT6Il/75F22faFYaKxD958/PFinZw65fV2CzAtgt14fdgKLN7Grv4h2EGXNg/3rM0m
	xgeA3TzLggIIIlDtD+VxL8COUy/ta+vlvdEkO+vsq7HDe0nylVcI7G6f4ekTYRS7tV7o0TtZCAy4e
	5QjRm2x3oSlrIBcGOWANjeqnIjSelLPJ7OfnEPhpwlWALA/9v5J2I0upniyFGtPmEvwiyaLpezWsM
	BtljmYSA0C0v7tlnWP2jdu7yJjVyHNVtTbz38vF6Ho975lwylfQxB+i/MHR7JJpAXK29U/dAgK+KJ
	jIfG2Uce331t2HZNKHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShO7-00000000TNk-0Fjg;
	Sun, 15 Nov 2026 21:03:47 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShO4-00000000TMx-0sfo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:03:46 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-67db763cec7so267822d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776623; cv=none;
        d=google.com; s=arc-20260327;
        b=PLT7rtzq03CEo31v4oWt6qdqdYboavGKybtSzZYSjXPpJ9uEwQXzCE/RQNON0J4uoU
         ISCD7UbmW04CIXi7BD9SZLIlFHC3xZ7OaeO670EcHSdQ9VLTZsWeeeZ/0PMhRZH7tVuQ
         BL6QZgsHQPntB+NNto1xO5wGEt0qJJK+a+cAJ0kdAM16dKDQvvHZrVzJQfWjrx8XF9p0
         XOl6ADOQKd9T/Uf6Ii1h5RFvV/yjuBQPSwCbTk5+YH3ETAj9ELr1caifg9Yp44O2jf4y
         Bapyg1YTAeDA9RhWn6yMDMAbL24IVq6670/fOiknj5JwlgvTKlk/7v+4TPVxaxYPyJQR
         HPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        fh=mepZvW6y8H0r+ZENRCXtkvcAmzdkHsVbQncmajM26OU=;
        b=Wtk3aO9e3nwUxD+d8tUKUcn4UqjTe9slu6+aYmG5NqlTo9huhhnuWE9h1WMK+k/lHT
         YiKBQKQX2/ofVES1jwlHekFWaiQew7PhKUFsfOCmbCx0/b1UAZmHHafn8VglOsCZcSQn
         QI4etXxgSEwZuAHMNetuuvM0ng5ijpAb6wradpnX7hMiG6EcF9ZbHJB3q0Z45f6pe8rV
         GMlit9SEW/pCHKFa+U6Qqc1N6Kn5h+Zu9iqmP05z1FS/syLUKSeU8IO5553jBcSyhpmT
         pDkZ+ecP4ROr5WnK9VhxQZOuHYMv2npdSSGMzHASjcy5Uop9DC72jVU/OSGmHL9pFkhV
         8H9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776623; x=1795381423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=mzt/r6uZDuyE0z4dyoDIAWvytOk3fuGhp4Q4iFZwEaUC3OMhW+Xq47xicroR/Vui5B
         HvvAR84SvndXRurvLRnayzAFXpTUbEVg07LyflmlO0lLFMX8c3YUAK+RomQVnO4U8y+O
         1X9bmO3xgEV6yulQuh7saNc40i9b6NXbJQIBTrUeLzN1x6fQRy3StCH8aQUeXkBiiLp8
         xO34lYLMSh7Ud2wgCVeYaSdE+VJGsrHWbhm17NATSzdq4CaJy9v/6Q72f3TkDrNagpRz
         EJTAubJkSAXGyU+Oh5GovHCcD4Jx/RGFBzab/iVzOrQpnEV7jLp2bcpX9BbPe6Rjp/32
         XzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776623; x=1795381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=UcU8tZe8d9X7EwyQ56AI1q87qnpXC8llTGBm5r0aGhLEd0b8jIKyy4uhhBK+qY4wWp
         nXfaehw4jqh1Q7gzj4/ddcZCN7iwNMg3Scsx1CdlJS/sLlYsJVPctdVwJuu1Okt31Orq
         Jhd8goa0szuNv6foQeMYp1u2k86qrVWcFeZHQoPY/KId74tWJ08f7/G3XZiIKRvr3YQd
         RMl/C64BdUS3n61QOiFPV/oFnA3XJZqXwJ00/TDxy5uC9yZQ97i+g3HU8Do+GaupQ8AD
         F6eMtCtm7ufcQqh36IgUHybLkJZhaUhdRTvAMfmaH4REX14q/kB6HlY+8Nx9WxxyJneb
         7QLw==
X-Forwarded-Encrypted: i=1; AL+hErGP8NvGuwr00SKIDOl2cGF2+yOEfSBFO+sPWmnAX8rXIwKLLYC++Bcu0d9vP1CPuc5CaRHigwXbuvsloFrZL91b@lists.infradead.org
X-Gm-Message-State: APuU4Z+j06ysQfjIAUC+NS5psZJfi88GNiRzCjISBekkV1GDqQn3trvc
	wrN9Go/YFOUQmzx3dHZjhqYVSaNQu/9N1ROyJA8+aFJNNzkhr5Cyc+r1QFfUzIwPIJlCypMW/3V
	WQHVGjkiilJfCOsj/+wgDh7hitGy4bPo=
X-Gm-Gg: AYBFou3JsPp+5Eq4eYdRdsw43hZOPNhSODP76+kwO4RCqx0WwP7qiAxijY8nLYOFWUT
	rmDaeojrmbRL+i8O4C3sMYSHe6lsA9U7j8zZKL4tjL794Z5OrJDReHPj3e4SP+uPOudvnQU9ps5
	Zr7uxBySz7+oszTVpfRcFwCYFi+aj+k0flJKcKu351+pDrKfWpKhGvWyaO9YkncIIrkODleXVq+
	7tiCMnab4JUHEKp3HrmnhwJ906seykT6WfWXmXRDPX0a7JdyBlTFyZY5spDp3BWLh+Ef87VBNDx
	JPOVM2sv6umhv1gUDVaGDOT2RLI0Or6cpuOw/3ELcI1KSoy42EAb5N9x6X6+wCcj/DC6osDyxQc
	tm2YBZuqXe0KLACuXJmVGVgf3am+cUV0HwT5tdYEiech0KCcja2p8qjxFgsvSrEVRyNFUMtw=
X-Received: by 2002:a05:690e:134b:b0:67d:a747:37cb with SMTP id
 956f58d0204a3-67da7473984mr1788570d50.80.1794776622877; Sun, 15 Nov 2026
 13:03:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:03:32 +0100
X-Gm-Features: AclHuK8RZRddO7WOnvwxzgFddHhyLeT9NtqQThzXqpKNCFZiOf6pqJWI8MgY6vE
Message-ID: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>
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
X-CRM114-CacheID: sfid-20261115_130344_282543_65A13E1A 
X-CRM114-Status: GOOD (  24.14  )
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
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Valerio,

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
>
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audi=
n"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.y=
aml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> new file mode 100644
> index 000000000000..4df4796623ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXBB AUDIN audio input controller
> +
> +maintainers:
> +  - Valerio Setti <vsetti@baylibre.com>
> +
> +description:
> +  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It suppor=
ts
> +  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs t=
hat
> +  transfer captured samples to memory. The sound-dai cell selects the FI=
FO.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,gxbb-audin
> +      - items:
> +          - const: amlogic,gxl-audin
> +          - const: amlogic,gxbb-audin
From what I can tell it's even amlogic,meson8-audin compatible.
Although I didn't have the time to test in on hardware yet.

[...]
> +    audio-controller@a000 {
> +      compatible =3D "amlogic,gxbb-audin";
> +      reg =3D <0xa000 0x148>;
I believe the audin registers are 0x300 wide.
Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
that the register area is 0x100 wide.
The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
=3D 0xb8. The datasheet [0] (page 395) lists register numbers divided by
4, so to get the actual address in the memory map we need to multiply
it by 4, which gives 0x2e0.
The 32-bit SoC vendor kernel [2] has a header that states: #define
AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
by 4).

I'm bringing this up because dt-bindings are supposed to be complete.
So even if the driver doesn't use a resource yet we're supposed to
still describe it.
I don't see any additional resources that we'd need to describe and
#sound-dai-cells allows adding the additional SPDIF input later.
From what I saw in the registers there's also the possibility to send
the input signal to AUDIN but I couldn't find any additional resources
we'd need to describe in the dt-bindings for this.



[0] https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
[1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
[2] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274

