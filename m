Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC03606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q5MoV9YX;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=B8F4Skwn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FEdI9V/yoQOW10FCJ74NuO1V0ayU3vrNQof9cU67IpU=; b=Q5MoV9YXOjvVqp
	uTXyIc93yU5N+yVKTHUJIU1G44R8DA9JxwBGyEvKagpiRx+rzNmD554oltq990zCXuOW0vVq3PFRm
	2EnmvUggiV8CYgM4jNSXzTJ+sMG8xsie+MaBC3YY71BMywmrhWfGaADWKnWkIeQI960gZGoUq42Lf
	j5f5IONmHgAgrwDp+qR/iJum5rZibEXF2112jtNEanhUy7ocb14kxx/fhlJ2WfO1m945cf4taO49+
	Yw6jgRAMjXU3c0Q8cYv1nZxMJ6in8rqPSkH5nLIBMDI9cUBgbi/2p5rl9XqTALO7R0956bVOMux4u
	lU4pWqzABy9Y9525bHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWybF-0000000H1Jp-0IHL;
	Fri, 27 Nov 2026 16:15:01 +0000
Received: from mail-106120.protonmail.ch ([79.135.106.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWybB-0000000H1Is-2Azg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795796081; x=1796055281;
	bh=FEdI9V/yoQOW10FCJ74NuO1V0ayU3vrNQof9cU67IpU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B8F4SkwngNpJBbClQHWmc+rF3O97uOB++PzO6parsGiba6RaLURy87PfdkvMFX+b8
	 aSLZTIT7jrK/nPSUSxMTkP7IFP7e++J2HGRgDgrO3X6n8K/39fMdHoSVOoG/OUkanA
	 hFWaOFpA0h4g/qP9rSaq7B3A76qO8DFXx6/6jZuFX87hEsAJc/mie2rsHmMj3GYYah
	 saH/50e0H97kAtzjqEp+b1+Ak0u6AvnvQQh0VVFbDxs2Xqg2mfN1lUWEQwQmXfTfnD
	 qwobchlyJNUILAzebZw4zYJyvAFHvXiRTH8iGW5oQ6xUUgLqXaT7/aM98FGxiryw+F
	 CTR3Piee2teHQ==
Date: Fri, 27 Nov 2026 16:14:30 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 30faa459dffd9b54a9225b7bf2b8ef2cec020c68
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_081458_979858_C614D078 
X-CRM114-Status: UNSURE (   8.58  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Enzo,

Tested v6 patches 1-3 on a Radxa Cubie A7S. Same kernel as for v5
(sunxi/for-next 2ba07dfcd45b plus the dependencies; pinctrl at v3,
whose code is the same as v4), same own firmware and the same 2 MiB
bad-DRAM reservation. dtbs_check with W=3D1 and W=3D2 is clean.

Results are the same as with v5:

- PMIC: all bounded rails are within their bounds, and the registers
  read the same as before (DCDC7 1080 mV, DCDC9 1240 mV, ELDO1
  1075 mV). The new vcc5v0-sys -> ps-output -> ldo2v5-input chain
  probes, and eldo-input now reports its fixed 1.24 V.
- PMU: counting and overflow interrupts work on all 8 CPUs.
- MMC0: High Speed, 50 MHz, 3.3 V. Repeated reads and a 64 MiB
  write/readback matched, no mmc errors.
- EEPROM reads the same contents as before. Warm reboot and power-off
  (0 W at the plug) work. No warnings in dmesg.

On the bot's IO bias concern: with the pinctrl dependency applied,
GPIO_POW_MOD_SEL reads 0x05555555 (all auto) and SGPIO_POW_MOD_SEL
0x00055555, PF stays on 3.3 V, and GPIO_POW_VAL reads the same as
U-Boot leaves it (PC/PE/PK 1.8 V, the other banks 3.3 V).

There is still no watchdog node, so I stopped our U-Boot's 16 s
watchdog at 0x7021000 by hand again.

The cover lists CPU/cache topology as untested: all eight CPUs are in
one cluster, as described. Patch 2/5 mentions the shared L3, but the
DTSI has no cache nodes, so the kernel falls back to reporting L2 as
shared by all eight CPUs as well (index2 shared_cpu_list 0-7).

The EEPROM probes as writable. It holds Radxa's factory data, and
our own DT reads the MAC address from it at 0x9e, so read-only might be
worth considering.

Card hotplug, listed as untested in the cover, works with Vinicius'
"do not switch the mux to read IRQ lines" fix (a256b8c8083e) on top:
pulling the card gives "card removed" and reinserting it gives "new
high speed SDXC card". Without that fix the PF6 level follows the card,
but the card detect interrupt never fires, so the A7S needs it for
hotplug.

Not tested: the power key, as the AXP318W driver has no power key
support yet. Otherwise the same gaps as for v5.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Built and measured by AI agents (Claude) on my board.

Thanks,
Norman

