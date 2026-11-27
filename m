Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E65606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZANejecK;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7zhuwiohx5cyjemmgpyv5v53uu.protonmail2 header.b=eDSlzccN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gqmpaC4EUz+q95HvmLKRF+xoM4Pr8ZBA71cC5oMY0vk=; b=ZANejecKL/96mU
	CTBQq45U5I0kKhPMrUoI7ZXhwsp0LzPbo4DOSQbIbs9ZWcC2+Auxm4ar4Pmu6A/kkt4BINOaSqc3w
	aOqqdMEbDGyIxizmBL0balkj7pjiOG7EIGTmazcbkNNN5YqGfGT2Ub0vEjOJnsLTPGeXTlKP2mGha
	WjTe1gh1zHrX091P0UjoEXUxAWS8gkceStu7aGkHKMeH0Yh4QhSwdWSo8KgaN5Z/0xc2l37dkT+jk
	B2cNp6l3mcgjvPxB1o1WMHaivizbs3r037Ms5WUJPsJpkHbTdD1TaZDXqerkIuIdfiZ7P1GJs3yLE
	JgsUuXcKS2xMlu5djjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyxf-0000000H6yb-23EV;
	Fri, 27 Nov 2026 16:38:11 +0000
Received: from mail-244123.protonmail.ch ([109.224.244.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyxV-0000000H6wM-1AfT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7zhuwiohx5cyjemmgpyv5v53uu.protonmail2; t=1795797468;
	x=1796056668; bh=gqmpaC4EUz+q95HvmLKRF+xoM4Pr8ZBA71cC5oMY0vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eDSlzccNYIAYp+647rmUKFukjdnvnWZ9/IT8hNCeyVhANm1/5RXCdZqGAefPxsHtr
	 lrOov7pMR3NAa/prrPcqbXlEsQCwBwD1PTHtCIDEtVvqPZEr0uZtxd4kYckNj7ikmG
	 3MzaHeQ8Rq07oQvVmnxvhMmvAAAGlNGS8h8F17TQVk/pfiQhSGqrMSfOW4P6IFa9TJ
	 2DbpglbqTdazDQB9yR2SLv9CY5GiJkkbbakKPgpPgUrxU8UJgQ6VDIZNqQRF+Uimok
	 0G43uZ26I06hf4jbjIFfAEYjr93j1efER4K65c5WbdAQKk+YIhn8re1KoWxQ0MUcZr
	 uxdXXMPECgj6w==
Date: Fri, 27 Nov 2026 16:37:44 +0000
To: Jerome Brunet <jbrunet@baylibre.com>
From: Norman Herms <dockseed@proton.me>
Cc: =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Message-ID: <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me>
In-Reply-To: <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 87fbfe36e01c8768225a4b0044555248b653f3dd
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_083801_941021_006451D9 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,

On the PF voltage selector: we have been running UHS-I on the Cubie
A7S for a while in our own trees (6.18 and mainline based). Here is
what we ran into, in case it helps whoever models it.

- The switch: on this board bank PF takes its supply from VCC-IO
  (3.3 V) or from CLDO5 (1.8 V), selected by GPIO_POW_VAL_SET_CTL
  bit 0 (1 =3D 3.3 V). There is no external regulator to switch, so
  vqmmc does not fit, and sunxi-mmc without vqmmc returns -EINVAL for
  1.8 V. We use two pinctrl states, "sdmmc-3v3" and "sdmmc-1v8" as on
  Tegra, whose pin groups carry power-source.

- The withstand mode: with PF in the adaptive mode of
  GPIO_POW_MOD_SEL (01, which is what the pinctrl automatic voltage
  detection patch sets), the pads follow the SoC's own supply
  detector, and on our board that detector now and then reports
  3.3 V while PF runs at 1.8 V. With one card, 14 of 40 SD rebinds at
  SDR104 failed: the CMD6 status read gets a data CRC error and the
  card falls back to high speed; once the card was lost ("error -5
  whilst initialising SD card"). Setting the PF mode by hand together
  with the switch gave 0 of 40: 10 (3.3 V) before switching to 3.3 V,
  and 11 (1.8 V) after switching to 1.8 V, once GPIO_POW_VAL reports
  PF at 1.8 V. Our final patch does that and also gave 0 of 40.
  Oddly, the fault also goes away while the USB3 combo PHY runs; on
  this board CLDO5 supplies its analog part too. Another card passed
  40 of 40 even in the adaptive mode.

- The eMMC on bank PC needs no switching, CLDO5 is fixed at 1.8 V.
  But if the boot chain leaves the PC field at its reset value 10 (the
  register resets to 0x022aaaa0), HS400 enhanced strobe fails with
  "mmc_select_hs400es failed, error -110". So on PC, 10 behaves as the
  3.3 V mode, as in the register table, not as the adaptive mode the
  text of 18.14.4.6 gives for C/E/K. 01 and the fixed 1.8 V mode (11)
  both work.

We can test patches for this on the A7S, SD and eMMC.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman

