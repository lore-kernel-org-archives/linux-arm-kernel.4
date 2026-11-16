Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564BA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WxDll49W;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=br5WMNLG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=; b=WxDll49W/+56c9
	At9bsABMW1eiKvieSKuYQlk9w1q2wcGajsiU1HrPcyvk46CXs3sLeZUWZuBJJPj6Gk2uBe6q0Is2s
	/JeC6X/Io++vU3A92WfawFOevnJTauICb5CNwcPptGzskhR3ct+xp2WJSqGZGenpD5fBZGfW+zAV1
	nfB9KGvSHEm7zFwEf359x7QmCzCAEcUfc7aonM2rBiKwkc22UZ3J44KSTPvI8sLS7ntRLGx9OCJWi
	+YgCe4jzrD3dLl06cBpyqfkYJzwfLnsBSt1/bFMxWRe/alHSjr/Um0tenPMvisR7Q19/KfRELYXUj
	Jv0eIxBnKqiNXcI2nk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzoZ-00000003IBs-0YPb;
	Mon, 16 Nov 2026 16:44:19 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzoW-00000003IB7-20Te
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:44:18 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-5ed2f163a2fso1022863e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847455; cv=none;
        d=google.com; s=arc-20260327;
        b=kfHGDlavU0yUCDetNS/aEUiiYuZIuj/WY8euvaTrobu/mh2GJqW4gl3oMeN/hdxQGF
         c62P95vJEEjKMeQOIbzJRAg8HRtO0AB3o0Dk+c/mixUoSUAs80YSs99vIukFGwOPIucW
         MRb6TD+/tFi6gN1q1CHANMizW51aKb/9uGRQfjkNugGKuZKJUAmJjVr+DxjiErOsQFT2
         RLck5eVe7Lh3qE/4wzFvsRWguPYsyqUlXmtA6vVhifLjNzXxXEAmnswnwqjqPVovCmYu
         SdKYfUxMJXds3M5Yx3iKddBdCHdWVmsRQJZdLBOXX1SKSBfqFIdpOJ72pQzSwMIr7asy
         EF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        fh=q0gLS3EnuZs7AtIm92lkpt77U4l4y2iC6XadmcEFbNY=;
        b=GFmpIoRM49EDxd/sN1sECWdOElx/rzH0dgXi2iIqwwJPjivsqfOdzKx0qKtywnDujJ
         WHfbcjs/XIIsw/6l9ccWa8kB6LVy/yNsHEadoaZTU0ni9BnkOnpQUIQxph08Lc8jNeWb
         6eaBDiZAHHkF0CWl/7O1daPd2EtRPgWFCdyTSJItCWc/1AjtXg/9s5D6BnLwyVmYScbh
         fdzUitPmdloQI5733HZZ9r9UyCE4aJEv7h2I4/ipPuu4Q+GXsVrTjSC1fkUQ8GZ5Jq6l
         dqqb1PUMKkSIF+Lhx/ygc94rZ0pn+FOJrtuVp5RhUhbdt9N1He/jlwNAXanCJRf3zN5O
         nIaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847455; x=1795452255; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=br5WMNLGHP+54gNr6tAGi+U/EAg1cvkCdHFZh7avDNvdj2psinqGycJLeq+dLbtpuC
         eGNk2tjuidtT9N0NSDtyEDkYj0P5iMuA9kJqmMlE2/0vBdu3YFxTjuwd4ZIdAPT8krvw
         QjaxHbnpYy9E7aGKaI+oOxbMTnecPiyariqb//HVTRk6nZgpJpzb1ezfrDif1kdPZTmV
         5PweZlocpin/B4CGaPWN+Q6V1Ji8Zjr6IXS8doSt7m5FX6ZQlhV3Ay9GkdRe5HgzCteD
         Im7L1jEKdymHYKo4t+EPzGn79Q4UwidewHySZdaJ8oqF/4upNNzY2LGInZYr5m+1htl4
         HJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847455; x=1795452255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=rDMP2iqjmPqvtAF0sWlLq4aUGfARxJusilNY5zYBNGn8tsJUqgAToCMGOdG31xQ8lU
         mp7zRiNxKi7D1udUde7EYZ6LwJJVyxkKem+p48X6SYizoHjJRtHLuheIM3FtXt1KZsg1
         ZcNJUCS5M1O9FCwvfevugEsOE8rleamC5hSp9Sc/nXFg+b+3wENub5K6JbisaKJMv51n
         6LX1/vqEYuoNVNoRHK/AeBan2B7/WqGY/E4SDGFadKYSt3Gq8XwruTda40Hyu1tDAuHr
         69rwmFnejskIutdATX25qikYBBElYR+DLETkA+Iq78OKIEkF53O2jtQb6IkvspfwBg5S
         7PVw==
X-Forwarded-Encrypted: i=1; AL+hErGm12hcrGrjJNf5fU4KOfKxEPalcoGJ1Jm4HGustUnqRE4D/48Y43xHtw+EIOyAHgj17IAji+iOxNVjrJ8RZUi+@lists.infradead.org
X-Gm-Message-State: APuU4Z9upI+zrQnyrN2RYpaDAu/6aHB7m/U4SBz53fVEmq99GUA6GBO0
	/TFchnIjfRj7lliYkkW7lrxsol0kd9Sn0Em1iY8viqcgxR6vzfnRBNzdZtDV0vt0l8lpxHZmPBJ
	xrgROtY954bTSVRxdJDXLRUGn7LnPGcI=
X-Gm-Gg: AYBFou25bNDP0GwH/jQw9Opzd+N1Hn2NaF0CY37Y7o3RPPXYfRE2P7qViGCn3K71Nak
	oLjFBTsg5Cv/AXArRXCGfian1hwxH2Pdra3X1qOY7Z+Cl5gOfRDGoIEoFuDTgPKZxMtSyjv8cpw
	1mDxWqOAO+RHqdc1t22Bj2eTmOaWAOiEe/VdaleX+yWtu+SFioM0M5MPtSHxyUBfsrQaIVU6oEj
	aEuldGig+ZV0v4juIMTvKaYtu/gzF7sLWKxx3LLurbQSbevk632xi1t8qw2BicXpfK9gzcHPKxI
	S5EHhVtp61K783AgRpJN8FMfg7MNOaE85VuS23WhiiWOtXhaNThrpKzmLGNuqyzOM0smlQTc9GF
	kxAa62jzY8FhjFw0RiCejkaVw9kp+UxwVXC2+LQUQ9tZTKzaTiYkv0d2xv660Np2E0+8q6w==
X-Received: by 2002:a05:6122:1d15:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee3465027cmr4058583e0c.2.1794847455049; Mon, 16 Nov 2026
 08:44:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
 <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com> <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
In-Reply-To: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 09:44:04 -0700
X-Gm-Features: AclHuK8dnGWqOScVe0Mt4jfgEl7XJ4HJYdFbZQ9_mRCIbIF03B9UBE-gzV7FCFI
Message-ID: <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084416_556685_8C00A44E 
X-CRM114-Status: GOOD (  39.14  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 7:38=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
> <filipescu.cristian@gmail.com> wrote:
> >
> > Hi Chen-Yu,
> >
> > On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > >
> > > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Rel=
ay
> > > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Add the board description for the Allwinner H6-based Orange Pi 3 LT=
S,
> > > > including its regulators, storage, Ethernet PHY, LEDs and USB ports=
.
> > > >
> > > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetectio=
n,
> > > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > > registration and keep reset outside interface detach so its configu=
red
> > > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > > >
> > > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMM=
C
> > > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> > > >
> > > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-je=
rnej.skrabec@gmail.com/
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++=
++++++++++++
> > > >  2 files changed, 380 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/bo=
ot/dts/allwinner/Makefile
> > > > index aa21f58a4..7ea136380 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-=
zero-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > new file mode 100644
> > > > index 000000000..e2ca41b94
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > @@ -0,0 +1,379 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > >
> > > We now have a common sun50i-h6-orangepi.dtsi file. You really should
> > > rewrite this patch to just use that as a base.  It is mostly the same
> > > across all the OrangePi H6 boards.
> >
> > v4 now uses that include and keeps the LTS-specific additions
> > and overrides. I compared the resolved DTBs to check the inherited
> > properties and preserved the LTS electrical settings, except for the
> > review changes described below. Common naming cleanups are deferred.
>
> [...]
>
> > > Set the supply on all cores.
> >
> > Done. All four running CPU nodes reference DCDCA, and all four CPUs are
> > online with the shared cpufreq policy.
>
> I should've mentioned that since this is already enabled at the .dtsi
> level, you shouldn't add it anymore. If anything, it's the .dtsi file
> that should have all cores referencing the regulator.

Understood on the CPU supply. I have rebased onto sunxi/dt-for-7.5 at
098728144545 and removed the board-local CPU0-CPU3 supply declarations
and CPU/GPU OPP includes. These are now inherited from the common
Orange Pi H6 description. I also removed the redundant ramp-delay and
CPU maximum-voltage overrides, keeping the existing LTS 800 mV minimum.
Any all-core supply cleanup belongs in the common include.

>
> [...]
>
> > > > +&mmc1 {
> > > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > > +       vqmmc-supply =3D <&reg_bldo3>;
> > >
> > > Something is fishy here. The schematic also shows vcc-wifi-io (on the=
 aw859
> > > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at lea=
st
> > > checking with a multimeter to confirm what the voltage is on the VDDI=
O
> > > pin of the module.
> > >
> >
> > Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> > VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> > 1.8 V at an RW1 pad relative to board ground. This supports keeping the
> > existing BLDO3 vqmmc assignment; I have left it unchanged.
>
> You traced it on the board or on the schematic?
>
> Can you test at U60? The schematic has two options for I/O voltage from
> the LDOs, and then another from VCC-WIFI, hence I would like to be
> certain. I imagine the SMT components aren't labeled on the board, so
> it would be somewhat hard / eye-hurting to trace the board directly.
>

The Wi-Fi connection trace was from the schematic. Initially I was worried =
I
would short some pin, but I see pin 22 is at the edge. I have now measured
1.8 V directly at U60/AW859A pin 22 (VDDIO), relative to board ground after
the kernel boots.

> [...]
>
> > > > +&usb2otg {
> > > > +       dr_mode =3D "host";
> > > > +       status =3D "okay";
> > > > +};
> > > > +
> > > > +&usb2phy {
> > > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15=
 */
> > >
> > > This isn't connected to anything but a pull-up. And you already speci=
fied
> > > host mode only above.
> >
> > Removed usb0_id_det-gpios with /delete-property/ so the common include'=
s
> > PC6 setting is removed too. USB0 remains fixed to host mode. The runnin=
g
> > DT confirms the ID GPIO property is absent and dr_mode is host.
>
> Thanks!
> ChenYu


Regards,
Cristian Filipescu
------------------------------------

