Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0FB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qoSmHuG5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlUtTJFd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KNCW80EKkgkub+KVtT9hArODSp8/RAIXlPuXxJ4OBRA=; b=qoSmHuG53884/y
	PSdc1gvGd6rxqj4ok2MnDRgggWlZCuBQ1CPAXRyWrPqq6kL9JyTHOfRwoDFyaa951nhgI4eO/CLwI
	AMTM+hBeAjt6KfvvbP7cOUIXX7uXS9gONQDv5un9pOYvqMDickzkPehGBej1oH5MMaF2rKIRZaBL9
	Eimen+QUarEQs8iQAnSmheWRSnvl6drlWA57ZQhlQt9LFYZVypUFhiozoOHubrsKqFI2quQtPD61c
	q1rVyY4CWlG5KKOinDMAmho+7hNMe6dRPlLiZEMAI8Vok4+afoi4AnZ2IHsRkYxs/KBgEhAaFoTmQ
	RPaMzABrd8lXlgEgRM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsCZ-0000000FQfX-0iMv;
	Fri, 27 Nov 2026 09:25:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsCX-0000000FQeh-3yoF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:25:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25E9362499;
	Fri, 27 Nov 2026 09:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBA71F00897;
	Fri, 27 Nov 2026 09:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771504;
	bh=KNCW80EKkgkub+KVtT9hArODSp8/RAIXlPuXxJ4OBRA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OlUtTJFdtNqo7bfs/0hvDfkw1m3FMg5ZIMMYbahEh/4dsBc72y3jfWgaerA6VOnKQ
	 lt5ackU7cWPKRs1oO9sDT8vPTSOkkSVObb2st0mS3brQLMwyK7cXhPqRlWxt5djiVe
	 VkpUxbuCrrMAhdmkEcO5RdRldDZ41rTNiSCXjbGKn7bg++02yrdF0BZ8iNveXHphff
	 +4hDPe5FI/2tRy+6p9lpAxH3mHorWUuqkzxOIJlhzwWzEF3Gxm8BuJwJjLlHqXPWMB
	 1kluh2kZuzNXIoyJM4LS0FL07yPU9LMY6P1kj2gIo8/smVVqUQyI6JN1S2zfgdrmSX
	 t6BMwNop2JamA==
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, mfd@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
Subject: Re: [PATCH v10 0/5] Add support for AAEON SRG-IMX8P MCU
Message-Id: <179577149953.44397.11685484329530619531.b4-ty@b4>
Date: Fri, 27 Nov 2026 09:24:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 08:23:52 +0100, Thomas Perrot (Schneider Electric) wrote:
> This patch series introduces support for the AAEON SRG-IMX8P embedded
> controller (MCU). The MCU is connected via I2C and provides GPIO and
> watchdog functionality for the SRG-IMX8P board.
> 
> The series includes:
> - Device tree binding for the MFD driver
> - MFD driver that serves as the core driver for the MCU
> - GPIO driver implementing the GPIO functionality
> - Watchdog driver for system monitoring
> - MAINTAINERS entry for the new drivers
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: vendor-prefixes: Add AAEON vendor prefix
      commit: 8754d4912daa776faa2525f5e6277a18d40fd939
[2/5] dt-bindings: mfd: Add AAEON embedded controller
      commit: 62eb7223813ba41684a22494de046e240f20240a
[3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
      commit: 001731afc45c1d8b2724346cd806c02064032ed5
[4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
      commit: 10237675f88d8b90eb958ab123f2cdd2c61705d4
[5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P MCU
      commit: 7f99cacfe2793d19acdea392b46592b0c605845c

--
Lee Jones [李琼斯]


