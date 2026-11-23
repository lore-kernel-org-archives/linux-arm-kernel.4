Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24140606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3oLaKBSK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01N6z/rz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HH0N/fL/H1cdlXVfbRCf3zvBDKyd3qa4jIZxCvneNig=; b=3oLaKBSKutCrga
	Y4WycVgmUn5V89czoVNlRK3QkXO+7u3eb18wr6FkMAyTaaBXGjMGbk8WSCd4EbyM7lT0zd829YUMq
	gRzFUh8LDVJBo9pI/d5UfBRnTizDLavIuUV/GU1J99/BiHrZ3kSTHsgilBZLwFWsSgxiZI0EVQRte
	/ha+bC/nHArP/XndhNnkQi1RMjCSouHzsCcQXYBfVdGkzjCQ3l+/s5koEDSN7n/art8qs1PeDXyDQ
	z98m6PR+G1d5yfgJtFBZM/cDrMj3dZMU1b2lgm+y/K4ZVsN5X9/nVfQnIZdV8XNQUe2gPdvGmFj1b
	gF1Mq7sXTph1NmbbHn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY5g-00000004PcB-22Sd;
	Mon, 23 Nov 2026 17:44:32 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY4d-00000004PJq-3pEK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:43:40 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-862df509d48so2886043a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455807; x=1796060607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HH0N/fL/H1cdlXVfbRCf3zvBDKyd3qa4jIZxCvneNig=;
        b=01N6z/rzPfVAYu+mdXnrWaOLHgLI3qnBh7CTXQxi7dwoYOpGMdlMNnjdkj4n5vZwd8
         fxM9VuuVm1jvdVocGx1esVOKWinO9rDAfIZf8U8WrVAqIrb4Gf6qtKLB7qnA/4uHxCxu
         68Bp+ZlHvw3ucQ+Jdw+KQYM2/p2w0SGEwDw7oxt7Jyyt88I7WipE8Di6Qu2mj9axCTqd
         KU2XA3xjPYvK2L9p5x8XFwHE6TjPV93RYZv0JXfASFzVUD7QxqPkDSU59Y6xGW+GkI1B
         F7BwzEFuoVDsXnRPN82NQff4dIGXonNIH7DZpa/1A4o6YXoh0qWCev4eW2QjZa9LU2vg
         YK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455807; x=1796060607;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HH0N/fL/H1cdlXVfbRCf3zvBDKyd3qa4jIZxCvneNig=;
        b=kW3VrMgAkvz6CS2/LH8xRZuBD4ZktadgOxniMpwFTPorcHIH1ppTQ7f+0SVIZycbYd
         0XY1OQJOvguqSrZmtSim2P+n7BUzV/dYReH9H/OqDjQhtKTpzJDpuxs0e1/MLrYSoCEj
         VccfVKBQEw7C5RsxL9qUita2FzbaizgA+/knCRgOs9QsSBVlb3ZxEEb8q2xler4+Aezx
         sGBLxTfkr19pTqFHgG70AAHq99QRBQvgjs2lX75sksEqScDfvgb99GMwDZTBJaZxkUEB
         JS5K1yd+1aKVH34wgn3ZZ/ecGEOR+dHXbvIgTwExoj3skuGYmF0Wz8Wo6BnxQnsACLSd
         JHqw==
X-Forwarded-Encrypted: i=1; AL+hErFSQxgFd56uo6ICo+mgIRRJE/o3C/WtteItZbG53JQ/HDtmqCjn8zj38XlMwaGGgZRPaCfETzk3VWp9UaObYwN6@lists.infradead.org
X-Gm-Message-State: APuU4Z/f2DMyiYLvco2wPU2yN+0y9yiGeQuPr487r6HHH2aZVjgGTYqp
	fZpzYT6FP8AobnS4yFdbqe2FcoBpJcH63EmdHWYDvDE/18HlVnGXlrYA
X-Gm-Gg: AZFdTZc6D6bpe9KRoAjfWw8aVTiHzh3o/jtivj+0UZ7FY4wTaHB4K/2pBWVxNNpNMax
	t42b+hhDqlPwAZH5ZItyPNksZAtpvCLbzSRrQtlpmiAJ1Z+93wqi5bxjznplD2X8JxbVHyqfguq
	ukx+gN4xGRohHzlZ82+NBA4Y92b8jU0OqFdroLsKgCn5lr/9Dqw3DT4ISqFqXhXReTkcfHfZFi2
	0s+BLFdCZ91OkvsUQ11OGUnlacKpHyP7J2WjNUa138RvNUy7+WgWw9L9Kp5HeExeZqxaNPc422/
	ZWD9BiL+5KYXQsRrS0eF691RMqfeRSiG9RIl4mUAHo3HI7rInDpD/dVfS/WgTTC529BFWM1P+To
	JMgvwrEb9xH42P2rFqHDP3FDmy0+4JGiuRDQAmoOe3eq0SWGLD5MW7G2dsH3N9PqIm9Nu8pJn1C
	b4YInYMPuKeBj6Z71oOh+DlZV/eqcAGnRJcK/N98zuxhV6q2oig6nQpTnTXBfxQnv6TkBqk+O0O
	TDDMFfdQhNyDeJkSW9BF4gEmC/zA5eWfKUEmbUEm31dIGyUO9Ys9oAMgQFWdiUvFe6LN/dZ42HL
	rA4jaZsFCsk+qmI7zWPJoIQyQDwVhPTC3gW2VDdwFW+/sPY0MSHtmv7TMsNebclSOPrTZG6dbaB
	uPMYB
X-Received: by 2002:a05:6830:44a6:b0:843:a64b:6e3b with SMTP id 46e09a7af769-863092bc6dcmr9078109a34.32.1795455806834;
        Mon, 23 Nov 2026 09:43:26 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863169105c2sm9566614a34.21.2026.11.23.09.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:43:26 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Mon, 23 Nov 2026 12:43:24 -0500
Message-ID: <20261121-a733-dt-v4-3-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122003932.568c099c@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <448e7551a6f560d8b8ede245ccfbc74101c76ef4.1795034153.git.enzo.adriano.code@gmail.com> <20261122003932.568c099c@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094332_254566_57608376 
X-CRM114-Status: GOOD (  31.37  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Where does this limit come from? As it stands right now, at 3.3V you
> won't get faster anyway, so it's moot. Please remove if you agree.

I set it to match the nominal SD High Speed clock for the initial
3.3 V-only configuration. I dropped it in v5. SD High Speed still
requests 50 MHz (drivers/mmc/core/sd.c); sunxi-mmc's default ceiling
is 52 MHz, which an MMC High Speed card can use.

> Just leave that out (for now), the default is to revert to vmmc-supply,
> if vqmmc is not given anyway.

Dropped. The MMC core acquires vmmc and vqmmc separately. Without
vqmmc, sunxi_mmc_voltage_switch() assumes fixed 3.0/3.3 V
signalling and accepts MMC_SIGNAL_VOLTAGE_330. SWOUT2 still
supplies the card through vmmc (schematic sheets 4 and 13).

> Same here, comment about this being VCC-IO, at least for now.

I switched vcc-pf-supply to SWOUT2. Schematic v1.10 sheets 4 and 7
show VCC-IO feeding PB and the 3.3 V PF path, with CLDO5 feeding the
separate 1.8 V PF input. The v4 U-Boot preflight on a Cubie A7S
showed PF on the 3.3 V path. v5 relies on that firmware selection.

> We should have a voltage or a range for every regulator. Here it should
> be 0.8V.

On a Cubie A7S running Radxa's 5.15.147 BSP kernel, regulator sysfs
reports 0.800 V for DCDC2. I set it to 0.800 V in v5.

> Do we have some OPPs for the cores? The range should reflect the
> min/max used voltages in there.

Yes. The live BSP DT has separate A55 and A76 OPP tables.
The nonzero bins span 0.800-1.050 V on both DCDC5 and DCDC3.
BSP regulator sysfs reads 0.800 V on both, and v5 uses the
0.800-1.050 V range for both. The source is
configs/linux-5.15/sun60iw2p1-cpu-vf.dtsi in Radxa's allwinner-bsp,
with the supplies on sheet 4.

> Why is this always on? If I see this correctly, that's just supplying
> the GPU, which will have its own supply property.
> Voltages should be in the same range as for the CPUs.

I removed always-on for DCDC4. Sheet 4 shows VDD-GPU on that
output. BSP regulator sysfs reads 0.800 V. v5 uses 0.800-0.960 V,
the range of GPU OPPs in the live BSP DT.

> 0.6/0.5V I guess.

BSP regulator sysfs reads 0.560 V on DCDC6. I used 0.500-0.600 V,
covering the 0.500 V LPDDR5 and 0.600 V LPDDR4X VDDQ options on
sheet 5. Sheet 4 shows DCDC6 feeding the DRAM PHY and that VDDQ
path.

> Probably 1.1V.

BSP regulator sysfs reads 1.080 V on DCDC7. It feeds the DRAM PHY
and LPDDR5 VDD2H. I used 1.050-1.100 V to cover the 1.050 V VDD2H
option on sheet 5 and the 1.100 V DRAM rail shown on sheets 4 and 5.

The regulator core keeps an in-range selector at registration. The
handoff check reads the selectors in U-Boot before Linux starts,
so the new bounds can be checked against the trained DRAM settings.
Before booting v5 on a Cubie A7S, the selectors read from U-Boot were
within the bounds, and none changed when the kernel registered them.

> But there is no UFS on this board, right? All the UFS signals seem to
> be not-connected, so this power supply will be going nowhere. And DCDC8
> seems to be used exclusively for UFS, so I would just leave this whole
> node out.

Yes, sheet 6 marks the UFS signals NC. I dropped the UFS-only
DCDC8 and DLDO6 nodes shown on sheet 4.

> Again, why the always-on? This is referenced by eldoin-supply, so the
> kernel should keep this on.
> As for the voltage, the schematic doesn't seem to give a clue, so maybe
> you can look this up on a running BSP kernel.

The BSP regulator sysfs reads 1.240 V. I dropped always-on
from DCDC9. The always-on ELDO1 and ELDO6 children hold it
through eldoin-supply (the ELDO input on sheet 4). I left the
voltage at the firmware setting.

> Why always-on? Should be referenced by the pinctrl device.

I dropped it. The PJ26 LED requests a PJ pin and pinctrl holds
SWOUT1 for that bank (sheets 4, 7 and 16).

> Does this intentionally miss the voltage setting?
> The datasheets suggests that VCC-MCSI must be 1.8V.

The omission was unintentional. BLDO1 reads 1.800 V in BSP
regulator sysfs, consistent with VCC-MCSI in datasheet table 5-2.
I set it to 1.800 V in v5.

> And again, the voltage is missing. Per the datasheet, VCC_LVDS0 must be
> 1.8V, and the VCC18-LCD label connected to BLDO2 supports this.

I set BLDO2 to 1.8 V per datasheet table 5-2 and dropped always-on.
On the test board, U-Boot hands BLDO2 over at a 1.8 V selector. The
3.3 V selector was read on a second Cubie A7S running Radxa's 5.15.147
BSP kernel, whose DT uses BLDO2
as a PCIe 3.3 V supply. Schematic sheet 4
shows a nominal 2.4 V BLDO input, so the selector alone gives
no physical output measurement.

> Do we need this at all? I don't see this (VCC18-CODEC) connected
> anywhere?

Sheet 4 shows BLDO4 on VCC18-CODEC with no load drawn elsewhere.
The BSP sysfs also shows it disabled with zero users. I
dropped the node.

> Should not be needed.
> Voltage is missing, should be 1.8V, I think.
> Please try to double check on a system running with the BSP kernel.

The BSP regulator sysfs shows CLDO5 at 1.800 V, which is
also the existing v4 constraint. I removed always-on.

> Voltage is missing, should be 1.8V, I think.
> Please try to double check on a system running with the BSP kernel.

DLDO1 also reads 1.800 V in BSP regulator sysfs. Sheet 8 shows
the SoC eFuse supply. I set it to 1.800 V in v5 and kept it
always-on.

> Voltage should be 0.9V.

Sheet 4 labels ELDO1's output 0.9 V and sheet 5 shows it powering
LPDDR5 VDD2L. The BSP sysfs reads 1.075 V. I left it enabled
at the handoff setting to avoid retuning live DRAM.

> Schematics suggest 0.8V.

BSP regulator sysfs reads 0.800 V on ELDO6, in line with sheet 4.
I set it to 0.800 V in v5.

Enzo

