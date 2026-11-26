Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JX00gkc2;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=rftm64vbdza77cgdpmci2epy6u.protonmail2 header.b=nWH6KR50
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aFjQaGnUmlptpLWffrEp74iYT+06fQSQqhzB/0NW3O8=; b=JX00gkc2ogkd2a
	Hp4vvWv5R1ML13zvR47aCbUSjXN6W2FxZvMiSqHVXOaT7jqKS0TKF/S+oQO17E/9ry11nP3hqvjrR
	4O2dUCoeY5H3Is+Poggv92xs6y+2eeYLgMYgn3iStdrbSBrWmyQCC+0KwXXkHoGW5fIC0in/HcIZR
	z9KsH1lWA3vG0e7cTZ7VE9IJKr6zvQwt+2xku+iH0Uuv/15iDwenw21WvxQFy2iQ0Xj0DTMtzQ4Pa
	bhfKjuWvT+Dg3YTw4c+o3G31YWJigrVLuJxmjmMdjz6dFr2CNF9lgeBVzp61jUBSqPWpSwD7/XRbX
	zp/TJhdHynId9nJ5760A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbYL-0000000Dl9l-477z;
	Thu, 26 Nov 2026 15:38:30 +0000
Received: from mail-106121.protonmail.ch ([79.135.106.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbXy-0000000Dl07-1jZw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=rftm64vbdza77cgdpmci2epy6u.protonmail2; t=1795707484;
	x=1795966684; bh=aFjQaGnUmlptpLWffrEp74iYT+06fQSQqhzB/0NW3O8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nWH6KR505JdzmQabJo+ECr4pwDXVoLh36SWJZwzBDJY6Hu3IjjfoUwtUc88w0UWbQ
	 5bbcDPTYeqhurqiRM6rN3fvyH7FcMqWZ9BlI7iesxuUr2LoHdzpPW25iBiwtyhe2BV
	 I7L0Edvp6bdF8mDFDgNIeSLwOpSO4UMNcvlbljeW+ihHoJWVFaIIldnqb5WuqjE50Y
	 0PopXIlUuaMERP8mSciumoQlp2h9opqH1s9+fbiG4CvI5/VIJrj9ww8kQWqWOrWZ4F
	 LJfaWJ1cG5BIVQpF8xjJK/94z5To9ZBG2HWSnZs5WhndzymNc7JEklzLtUaZnrEEVw
	 jCBp8npHBvFZw==
Date: Thu, 26 Nov 2026 15:37:59 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Message-ID: <CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 8075a9d6fe42b37f7ffdcbe99ce72b6c0920a791
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_073807_279246_404F3C5B 
X-CRM114-Status: UNSURE (   5.50  )
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

Tested on a Radxa Cubie A7S: sunxi/for-next 2ba07dfcd45b plus the five
dependencies from your cover letter ([2] as the RESEND v3), no other
patches. Own boot firmware (U-Boot SPL with the vendor DRAM init,
TF-A, U-Boot), not the vendor's. The DTB has one extra 2 MiB
reserved-memory region for a bad DRAM area on this board.

Our U-Boot starts the watchdog at 0x7021000 (16 s). The DT has no
watchdog node, so the board reset after 16 s until I stopped it in
U-Boot.

- PMIC: all bounded rails are within their bounds, and the PMIC
  registers read the same as under our 6.18 kernel.
- PMU: A55 PMU on CPUs 0-5, A76 PMU on 6-7. Counting and overflow
  interrupts (PPI 7) work on all 8 CPUs.
- MMC0: High Speed, 50 MHz, 3.3 V. Repeated reads and a 64 MiB
  write/readback matched. PF6 reports the card as present.
- EEPROM reads, both LEDs switch visibly, and warm reboot and
  power-off work. No warnings in dmesg.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Not tested: EEPROM writes, card hotplug, 1.8 V switching, the PMIC
interrupt, EL2, ITS/MSI, suspend, rail voltages at the pins. Built
and measured by AI agents (Claude) on my board.

Thanks,
Norman

