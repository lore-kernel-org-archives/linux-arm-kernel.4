Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aXhfjOAk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gES4NWom
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=; b=aXhfjOAkCUSfCg
	TwbJrI0Wdic6hLrFU2WMWGZIALwp7htddY0w4bkSzWsLUhwLgOgHZ6KUcnmHeA7uGk1ShLB/I49Y4
	cz5beGXLxImg9RGKE4hKlOBRaB5+agDP8cQe5e8orKydIiTkMMB1WsMdCeonvF9Amxa6IiWfylw2H
	uhHorRxq+uaTre8zMEnWMUnU4WsGsUmRkgJ8JbZxbIzI9nAaIr3ncxtJdkmDWyZs5QFXrX6hF2AC2
	wGQSmye/OWP6LI+JP2/ZsW9MLg00ba5ETK02IF5x3+vwap1/5FRUn/5WQyELD6NXXBS6Ofck3xGK1
	8rorRlJeuzxSXvrQrinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSvW-00000003ItD-3zv2;
	Mon, 23 Nov 2026 12:13:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSvT-00000003Is0-3YYo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:13:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso4377764a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436018; x=1796040818; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=gES4NWom3VfCLG7D7o3WR6XNB8K0XA1DHHy+iUfX0447YVjMAMLWTJFl9BvdnLLrna
         7MhJ0nlu7PSR57IF/tiYIbFZR9IcbRNgKFYDTD+bDCVlPSb7t7UcEiHflUlv5ZKiXkK4
         qJsXf5Xi7cFydyn7SngZlWk+DKJzN5GyTnjgxqJszPqt6s2QwRo0xqT6W2JjYQXgDGaT
         w1tUoO02iQqAF5UlMhTmh/mjrVTT1m5LzAzfvOsSsthm9+7d62JJP9y2DHqUgHQF0/cg
         En1t6izmKQ1m967cI1pYn0mKLMG6vDxhZFLqhUgHrXLB73raic6zh3ac2y/XNpJT2fnm
         PGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436018; x=1796040818;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=1mwddnW3WiFPNS6qmu08Sg003FEkIp/QkMc5Q4E3ci6+S0lMoNx8YKq9Fvojn/Cm0U
         76Try5aSgdohT/YSXmHKpVmgnt3AX011fRAvWnm7snFcN9js0x+pGJWXYtU6f0QeT4h8
         gyDEBd0A4AHya7jrTvyrhUXE7vx9a0r7CrynmdOxhBXBmvm6RdSDzTCDIl6wywNzH47E
         KlFnY8xMnR+y/2JGnMjHIkbOlH+xBHuDACgihhdDQjmL0AQ6lwPKkCYCQdt5LoGmkJm2
         j92xAysDZDplYCOVSVwOWQBdfD6x0Qw6NTpz6/cY1QTYhkhzf03uB2/HpuhspbO2mxSa
         Nq+w==
X-Forwarded-Encrypted: i=1; AL+hErGUWDleL57fodONaLZ+QDvO7BSQbF5BCp2ifw5DwDaDGMoIAMIKGmFNopHzR5ao3QeseicUV+RoyxbBxGXG08Hr@lists.infradead.org
X-Gm-Message-State: APuU4Z8Wce1JwooS05lf/ZVcfbrR/GSyEgecR3V+wooMagsnf2T1/9mH
	i5C1dwenyuoquXH1UrQ+dQ1vspaBn+MXg7t/8qVAQj1IkVcAXoKCaYga
X-Gm-Gg: AZFdTZf5HGGqyObBzvVHpHTtTJChV9P4SwqtYEMHBB4EEUxtUyH0B31qPhkwx0Mf/R6
	7ZXWZq02XRov3c2XVjD1Dxc+35ayudH0FOIXQ673y+CwZmSGN3VX3sZdFbhtQ2G3XTFX1VpPGqz
	FnA9P8gejucXW2MqDoun+OrPUPsqmOGGVe02Oq1Nxmdy7z3Rw7JgCXqqr7LR3OGXa8ATfLFrhtw
	Bsk5+5ECegJ+n0snuavzF7laPkj/2lMcTduafYF5G1R/VXnmhs+T44b8cQGJbH7WUYxVbC+arXe
	gJ3c6jze075Jw+u3Rl5akVL+nVOdELKs4dGqQaq1SWtM1fMLOIjCBTjbBnwk6rRXpZQV+HPnP81
	lt/c1QZsU5o9Dbsm0puKqKkMfFgBdEu/ynIqlyRKaeS7TivVm2gjozowHXaJilutxy0g3MHogLW
	Zz9tc5y5Xnc90pTHgl3/MR5MaRrRpNQNKrSw/sAHkxj799DJmExHsxAC3fHHDuvCVJo6aS3o2ER
	6mh36BcBo9RUjMHPmEDQynmiY2PW9Zd5hcb+7ZTlQHq/sGq2bNTuiJI0a8Ry56GC6IMVMGCfrCN
	f0PHXNxagG79gp38ks7dnBareddb8+YSC8UJPcW6ih32DNnqhF5qBgfB
X-Received: by 2002:a05:6402:3207:b0:6ba:9cea:5bdf with SMTP id 4fb4d7f45d1cf-6ba9cea5dbfmr2715988a12.8.1795436017691;
        Mon, 23 Nov 2026 04:13:37 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fe162sm5443990a12.26.2026.11.23.04.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:13:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:13:32 +0300
Message-Id: <DN2KY5MGERWB.3DN1SFL7JZDLO@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
 <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
In-Reply-To: <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_041339_917190_3F82ABBA 
X-CRM114-Status: GOOD (  20.05  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 23, 2026 at 3:00 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:20 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
>> Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
>> console on UART0 and the volume down key on the SoC keypad. The power
>> and volume up keys are connected to the MT6363 PMIC, which isn't
>> supported yet.
>>=20
>> The DT only describes the memory that Linux itself uses, which is the
>> ramoops region. The bootloader updates the /memory node and adds the
>> firmware carveouts to /reserved-memory, so their addresses are not
>> hardcoded here. This DT must not be booted with a bootloader that does
>> not do this, as Linux would then use memory owned by the firmware.
>>=20
>> The ramoops zone sizes place the console zone at the offset where the
>> bootloader expects to find it.
>>=20
>> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>>  .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 +++++++++++++++=
+++++++
>>  2 files changed, 88 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts=
/mediatek/Makefile
>> index a86fb313b1a9..d73489149ab5 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-sony-xperia-m5.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6895-xiaomi-xaga.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-cudy-wr3000-v1.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/=
arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> new file mode 100644
>> index 000000000000..7bfe0d438803
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +
>> +#include "mt6895.dtsi"
>> +
>> +/ {
>> +	model =3D "Xiaomi Poco X4 GT";
>> +	compatible =3D "xiaomi,xaga", "mediatek,mt6895";
>> +	chassis-type =3D "handset";
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:921600n8";
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type =3D "memory";
>> +		/* The size will be filled in by the bootloader */
>> +		reg =3D <0x0 0x40000000 0 0>;
>> +	};
>> +
>> +	reserved-memory {
>> +		ranges;
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +
>> +		/* The firmware carveouts are added by the bootloader. */
>> +
>> +		ramoops@48090000 {
>> +			compatible =3D "ramoops";
>> +			reg =3D <0 0x48090000 0 0xe0000>;
>> +			no-map;
>> +			console-size =3D <0x40000>;
>> +			ftrace-size =3D <0x10000>;
>> +			pmsg-size =3D <0x10000>;
>> +			record-size =3D <0x10000>;
>> +		};
>> +	};
>> +};
>> +
>> +&keypad {
>> +	debounce-delay-ms =3D <32>;
>> +	keypad,num-columns =3D <1>;
>> +	keypad,num-rows =3D <1>;
>> +	linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
>> +	pinctrl-0 =3D <&keypad_pins>;
>> +	pinctrl-names =3D "default";
>> +
>> +	status =3D "okay";
>> +};
>
> Nit: vendor,property should go after pinctrl.
>
> debounce-delay-ms
> pinctrl-0
> pinctrl-names
> keypad,*
> linux,keymap
>
> status
>
> P.S. scripts/dtc/dt-check-style --mode stricter can be handy.
>
> Best regards,
> Roman

Thanks, I followed the ordering Angelo suggested in v2, so I missed
this.

Best regards,
Alexander

