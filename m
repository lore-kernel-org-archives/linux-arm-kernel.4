Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7D606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AUc3ndRT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQHfnawW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GvYCDEkwGbOkGGg0zHPjL4BohH+d4nYyJ0W4Hnr09Sw=; b=AUc3ndRTKDtz/BWSK6BCDHhDwt
	y1lBi9mDcgGBAo4YfYCuahjCSlk7+F/J6BFsy+qBnBXtJ4B8J3OwW3wlKy+GBfKXGptJCbV3utcKR
	98Pkkw+n1BCgmMq/uWD4LIii8VX10gsmfc0H9QWuoHooSHHs++4IisVd9NYQ6hNWAI/hQFJFHWNHW
	QeXtiqOjm3Qqo3W3YNje1lfTkugkv6tsix66GbfP08CdBqI/Uazh8nR4iqsnjqKKR962wQ9w9g4GX
	dSdWKoy+PDr/PB9bpbNW7yf71aFMx7Ag04d0ImYFHvlawlICghe2eUraAok8BnqUZ/9q4USUGgK/Y
	jAmWhTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURG9-0000000FX5w-3HsD;
	Fri, 20 Nov 2026 16:14:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURG7-0000000FX5W-3YaP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:14:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 502D84362E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2828A1F000D3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191283;
	bh=GvYCDEkwGbOkGGg0zHPjL4BohH+d4nYyJ0W4Hnr09Sw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=VQHfnawWjbsVjDcrOHdKsTzNvVyGA2s1vjqh9c6P/gGSqgO2JKm0sAhW5owbcCE1A
	 gGemTeFO9QbxRVC0cJADzBUoTL/bUkmFLso/QrkFvPTXFqVNVd+88g2kudNr8ooX3n
	 MT6d+gEAMKjWgKDjBYKFx/8YuSoqj4MP8f4JqG1OduKNciPX82LtQeXAxvcLAlAcWz
	 RnBxinOYNnwyqONwbr4ku0gV5BUUCV1mLEfwsUJWMmYEP3eck15T2ASw5Lmexwg8A+
	 KSb/9Cvp6VRqNZwvn/FZjNFAtbTJ/BXBHO4zm/UN4+0HCb464JWNBeHQG1cXE2PW0E
	 /zCeJ8xXTBjZQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so9116141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:14:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGpJN9R2MCIFTMUlUMKGexkoDYi04Le/Sxgbl0/3X2evB7nJAckluRkzp8jwqf9quqovadtJGjot3bQIpQaJcf6@lists.infradead.org
X-Gm-Message-State: APuU4Z/Nnmylnu/GdDWrBqHAM+5dvOQ/H/uGLDWYoZSZKx8QK9bYxePN
	W+Otp8oS+j8Ww8oqR09EtM5nMmQ+Qk8T6si1T1kdObICi8ln/ADPcRNasZ/gyfghQPFlgn+VmrK
	s38OOsesJz67dgLlfIDQ5jKMDwUrQkig=
X-Received: by 2002:a05:651c:54f:b0:3a9:9a2e:27fd with SMTP id
 38308e7fff4ca-3ae7f7cfce8mr12445241fa.0.1795191281589; Fri, 20 Nov 2026
 08:14:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 21 Nov 2026 00:14:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
X-Gm-Features: Aa3M54qKCun4hmKn_uEzeiCoNcJXuK8nohmeg7erANAuWhgR2_nHJkd26qyMXiE
Message-ID: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 9:49=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:
>
> Add a board DT for the Radxa Cubie A7Z (Allwinner A733), based on Enzo's
> A733 SoC description and Cubie A7S DT [1].
>
> The A7Z differs from the A7S in its PG supply (BLDO5), the SY8089
> regulator feeding the PMIC's BLDO and CLDO inputs, and the microSD
> card-detect line, which has an external pull-up. The series enables
> UART0, the AXP318W PMIC, MMC0, RTC, bank supplies and the green user LED.

There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
there no differences as far as the OS is concerned?


ChenYu

> Tested on a Cubie A7Z with v7.4-rc1 and the posted A733 prerequisites.
> Eight CPUs, R-I2C0/PMIC, MMC0 read/write at 3.3 V, RTC, LED, PSCI
> reboot/power-off and CPU hotplug worked.
>
> MMC0 card-detect hotplug needs the separate A733 EINT-mux fix [8]. The
> tested DTB also had a local 16 MiB no-map reservation for my boot
> firmware, which is not part of this series.
>
> Dependencies:
> [1] https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmai=
l.com
> [2] https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmora=
l.tech
> [3] https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d=
@baylibre.com
> [4] https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
> [5] https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedro=
sa@gmail.com
> [6] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
> [7] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
> [8] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pe=
drosa@gmail.com
>
> Vinicius Pedrosa (3):
>   dt-bindings: arm: sunxi: document Radxa Cubie A7Z
>   arm64: dts: allwinner: add Radxa Cubie A7Z board
>   arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED
>
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 298 ++++++++++++++++++
>  3 files changed, 304 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.d=
ts
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
> prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
> prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
> prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
> prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
> prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
> prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
> prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
> prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
> prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
> prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
> prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
> prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
> prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
> prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
> prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
> prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
> prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
> prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
> prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
> prerequisite-patch-id: 4cdaae8c384016491ce01e6e328acbb347debd62
> prerequisite-patch-id: cb253a02b7d81079cc1ea4f75def94564468c80c
> prerequisite-patch-id: 1f869e65014f3cd678bab7f235cbcb14c60a1608
> prerequisite-patch-id: 184825f979a16a0b6900c58ba342899747da11b4
> --
> 2.43.0
>

