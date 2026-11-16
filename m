Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD53606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hARhU9xn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yqt/tYi5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ihPcbJ+Vb6nHbO8tsEJQxsCuMD2idQvF3dKfV9eNT3k=; b=hARhU9xnZ1uD39LKfurCAYxR2V
	VXYBLbqlZdZhbMdYHaPHGzqSQhdcxAcQkxPYxEJF1T5vvp7xzGDkAw7lXn+xF7XdLMVLprN/xmFvU
	1fzgRycXDXt6rEDch6ihVgBpA/Stk07YqO2ED4BYbeMe5rV6UyN8YGZy7RMBBBn/y//fJBxG5Gt3G
	M6nFQ413BOvyFfcW5fiF3xjLYxB4wgoc2CbIKcNJP4to2HiT1Hd8e80+mwvpax8dadAJEeFUVJUrR
	was6OxAJSex+0GL9kGvswOT6jyvchVwzzJjpMTHHL659Cd24FbWG5OAVpBPeFixy305hAgl46cjZe
	EChb2KkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT011-00000003LBd-3FA6;
	Mon, 16 Nov 2026 16:57:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT00z-00000003LBB-3Z1v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:57:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 526CC43578
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 16:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4C41F000D4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848229;
	bh=ihPcbJ+Vb6nHbO8tsEJQxsCuMD2idQvF3dKfV9eNT3k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Yqt/tYi5+ZGwIQFMIV16w9kVWjuuv8MPq2gLuQQHHz864LGcDoIK5AnvfxWMjI1a3
	 AIZmsae9+ORpJ6HXG/NF/pI6pZTpqaKqyJnkwCcWmRhoifXFzHDQcBz+tJB9jFPDB3
	 S6VzaZtLFYnY2b5cVZTOeYK9Uj9QBUpxivUnW+S+OCYG1iJAkHL4NuMcP9eiS5UWG0
	 53YFJk2W+922LiKMEfWkvd8yQBj8w4b2HKEyzBONpFiz4MwQIxD3JGwnEO41NLHSsx
	 ae9RiOUadY8rIXNciX2tpx6qgr6N4dZvIZqlnl+7hVyvOyH+lWMYqqy3gcxXZhfisw
	 1XyI1A0ZYESiQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so32351981fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:57:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHWNISTN7pICh55GZOEjP9VWE/ONJKY+GqGEGvWERdR99MWbAFxx4IUr2pY3MxV8/jA0YOX5Iol4rusg4nfdIOu@lists.infradead.org
X-Gm-Message-State: APuU4Z+WcBy0Yyqy/FouqsfccmZfdy/nA13GV+gaEXBfMSojLB60vTRY
	veHK+77ZNQd5a0hYvUZ3qvnrkfth94vDA7DUMjbP8UivQ46y7hRHWFaxd8Y2MO7K2PCzWLVFe0M
	F2IEoao5iTIV0FsULCkpVy7K2QBDBGsM=
X-Received: by 2002:a2e:ac0b:0:b0:3a9:abd6:1acd with SMTP id
 38308e7fff4ca-3ae2b4b5d4bmr33782431fa.6.1794848227241; Mon, 16 Nov 2026
 08:57:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
 <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com>
 <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com> <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
In-Reply-To: <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Nov 2026 00:56:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65VY0OFaUuE9qX2JGRcGjEMGCKMjUUvurx7UBxDm+81rw@mail.gmail.com>
X-Gm-Features: AclHuK9eCzsnkZ4gGUBVKhOaPUkWgSy2T84SmEfd_eoJadqeR2ggIDq1fX6dZNU
Message-ID: <CAGb2v65VY0OFaUuE9qX2JGRcGjEMGCKMjUUvurx7UBxDm+81rw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: Cristian Filipescu <filipescu.cristian@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 12:44=E2=80=AFAM Cristian Filipescu
<filipescu.cristian@gmail.com> wrote:
>
> On Mon, Nov 16, 2026 at 7:38=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> >
> > On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
> > <filipescu.cristian@gmail.com> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org=
> wrote:
> > > >
> > > > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 R=
elay
> > > > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > > > >
> > > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > >
> > > > > Add the board description for the Allwinner H6-based Orange Pi 3 =
LTS,
> > > > > including its regulators, storage, Ethernet PHY, LEDs and USB por=
ts.
> > > > >
> > > > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetect=
ion,
> > > > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > > > registration and keep reset outside interface detach so its confi=
gured
> > > > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > > > >
> > > > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V e=
MMC
> > > > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz=
.
> > > > >
> > > > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-=
jernej.skrabec@gmail.com/
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > > > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++=
++++++++++++++
> > > > >  2 files changed, 380 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/=
boot/dts/allwinner/Makefile
> > > > > index aa21f58a4..7ea136380 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangep=
i-zero-plus.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-l=
ts.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > > new file mode 100644
> > > > > index 000000000..e2ca41b94
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > > @@ -0,0 +1,379 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > > >
> > > > We now have a common sun50i-h6-orangepi.dtsi file. You really shoul=
d
> > > > rewrite this patch to just use that as a base.  It is mostly the sa=
me
> > > > across all the OrangePi H6 boards.
> > >
> > > v4 now uses that include and keeps the LTS-specific additions
> > > and overrides. I compared the resolved DTBs to check the inherited
> > > properties and preserved the LTS electrical settings, except for the
> > > review changes described below. Common naming cleanups are deferred.
> >
> > [...]
> >
> > > > Set the supply on all cores.
> > >
> > > Done. All four running CPU nodes reference DCDCA, and all four CPUs a=
re
> > > online with the shared cpufreq policy.
> >
> > I should've mentioned that since this is already enabled at the .dtsi
> > level, you shouldn't add it anymore. If anything, it's the .dtsi file
> > that should have all cores referencing the regulator.
>
> Understood on the CPU supply. I have rebased onto sunxi/dt-for-7.5 at
> 098728144545 and removed the board-local CPU0-CPU3 supply declarations
> and CPU/GPU OPP includes. These are now inherited from the common
> Orange Pi H6 description. I also removed the redundant ramp-delay and
> CPU maximum-voltage overrides, keeping the existing LTS 800 mV minimum.
> Any all-core supply cleanup belongs in the common include.
>
> >
> > [...]
> >
> > > > > +&mmc1 {
> > > > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > > > +       vqmmc-supply =3D <&reg_bldo3>;
> > > >
> > > > Something is fishy here. The schematic also shows vcc-wifi-io (on t=
he aw859
> > > > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at l=
east
> > > > checking with a multimeter to confirm what the voltage is on the VD=
DIO
> > > > pin of the module.
> > > >
> > >
> > > Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> > > VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> > > 1.8 V at an RW1 pad relative to board ground. This supports keeping t=
he
> > > existing BLDO3 vqmmc assignment; I have left it unchanged.
> >
> > You traced it on the board or on the schematic?
> >
> > Can you test at U60? The schematic has two options for I/O voltage from
> > the LDOs, and then another from VCC-WIFI, hence I would like to be
> > certain. I imagine the SMT components aren't labeled on the board, so
> > it would be somewhat hard / eye-hurting to trace the board directly.
> >
>
> The Wi-Fi connection trace was from the schematic. Initially I was worrie=
d I
> would short some pin, but I see pin 22 is at the edge. I have now measure=
d
> 1.8 V directly at U60/AW859A pin 22 (VDDIO), relative to board ground aft=
er
> the kernel boots.

Cool! Thanks for confirming.


ChenYu

> > [...]
> >
> > > > > +&usb2otg {
> > > > > +       dr_mode =3D "host";
> > > > > +       status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usb2phy {
> > > > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC=
15 */
> > > >
> > > > This isn't connected to anything but a pull-up. And you already spe=
cified
> > > > host mode only above.
> > >
> > > Removed usb0_id_det-gpios with /delete-property/ so the common includ=
e's
> > > PC6 setting is removed too. USB0 remains fixed to host mode. The runn=
ing
> > > DT confirms the ID GPIO property is absent and dr_mode is host.
> >
> > Thanks!
> > ChenYu
>
>
> Regards,
> Cristian Filipescu
> ------------------------------------

