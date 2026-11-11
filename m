Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796FD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Re+Bud10;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfHrM5Q5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rWyI2kn+bRFE4cg/aEwcjlnzCwXp15YvqY3EZ5DhaVY=; b=Re+Bud10+WW6h2JckR4JRPIGQ1
	csu6Ln7Yj8Z+qTwhjQHFABzbqM8Rvnyphdr0l6HxEzpWkHFeqj/Nb8gyKFAne7XX1Staim4nYqhKe
	BGvR+N9KL94qVoPztpMndvkJZ2feTPYuyBpmEIuFuoVARB/GZBlBF6eI9i+Tc3kE5AbGV8PhIIPCF
	bCe3inxRGmQQ9ujFMETAYNR665h1ValC1aPBd+FeI/c/8hi7IQeToE0Qo9FSewdwiOXwEnYj8bGR/
	3dihbBgyVGnGmyCnIDulKYrtXMve3BZnEnZmGR+iWeLTyWaCubjp6xJfcYy2mpABTzEE4nZYweXkK
	IGLYoyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Ne-00000005grk-3sjl;
	Wed, 11 Nov 2026 06:00:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NT-00000005gpK-1Nvo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B40046A80;
	Wed, 11 Nov 2026 06:00:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376811;
	b=pmteJnxMAmJrgXq0GK40OQL4ZgOENIu9PMC+QhgRNUB3TQyqWQqxcB1W/kyUmSIQxTlD
	 +YKJfGC6xMErZI+m339vH78Ta401w9lEV5zVVVNrEn3fXxKbu6Mp0J+WOdZupeQ9jQNTe
	 gdnyJ4AeyZcReGef7dvWXaqOG0LQgoEaxRw30F9a6VZNa3WSpVJVNf3ZVT0UkZjbxxSUF
	 hPnl1hjRF8Q8lK43urSujpCHvNT0yiG1o/wo3xu2IJNDWa5o6F4hHMPBnOBQTQcdDlFVF
	 sJc7nePjNhoayQgUx226ELnCZyR4B62LzD9i+EhosuX9gh5xMvj9Gk+hXA6r79E1MUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376811;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rWyI2kn+bRFE4cg/aEwcjlnzCwXp15YvqY3EZ5DhaVY=;
	b=IAthSS9gnVfxktqq/T7baSgMc+QzxY8db60yQtXnHIOgiMJ+AODSrDyNIvKTwsSvrb8v
	 SAejvY7r0QRSuh3HAjDL0nZC/BQleXJ9Nc35PR4io/EZ+W6fk5IB42/j1P2tZQM75rA7A
	 afJNYNC0KD4nFRBI8YNFPf1uWBBOYvOGwsO4ifXhmJN4Z7sNGxOYUu2btYIF6hhJJ24CC
	 4mR+vFxhHJyG/p7og1m97LW87HA4j/+KpwShWx0t5tnda/tPuRNAjPmsnNYj07MCb06Fy
	 sqmA35rJHeKrr43y1YHjpugu9E1zhHXBkyGSyovgQuQvMxG/rG7A7x2yYU/0m9reNoQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FCBB1F00A06;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376810;
	bh=rWyI2kn+bRFE4cg/aEwcjlnzCwXp15YvqY3EZ5DhaVY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QfHrM5Q5tlCF82OayNgYUv9e9GxPsgBGJpXEE7XmMvL8v0yuuMNnE0pdUjIsX8uaS
	 L1s5QL69aqWukC2B+SONdqxjSsaG4ev5/SPxrs9CqED6WJvuYaYRDZsey6XRaz2Ro/
	 urZtTUVUV54J6ScA6Lz6fRmFwdbtwwMfRHKKrJ9bnJuC3kG8aDNGF27tOKj4ntOK1U
	 MggPKSgKDOm62Mnm+gO3fTgxTEy+YX7hp/3Dbj9jOvAAoR6zPBBOms4WltT9h8Rsjp
	 gWbKvXS5CFJMaIugejZXhRkpZDsjNd2mkwQHyQGqQ6kL0CjBhGBsEmdCasVJbZT0Yz
	 2TfuqjfKT7xhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 838E648DD7;
	Wed, 11 Nov 2026 06:00:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/8] arm64: dts: allwinner: h616: Orange Pi Zero2 fixes,
 GPU DVFS and GPU cooling
Date: Wed, 11 Nov 2026 06:00:06 +0000
Message-Id: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7ZhOIzVx5T0MizIMMEaoaYGoh
 LsLuHb5kvffnyFJVElwyWaIMmnS0K9gDxlw6/tGUKuVwRrriMhg68jhR2KwWA3ouTwxC3tvalg
 3zyi1vvberfhxGsu78LBFNqPVNIT43g8n2rx/7YnQoMlz46qzM7Wla9N5fRw5dFAsy/IFAwUNP
 bwAAAA=
X-Change-ID: 20261110-h616-zero2-dt-acb4ccecaa0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=3816;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6jel4MoJqtTxrypSxxUTQ6tVnFHWyOMfTonT2Q2GlFE=;
 b=hSLIz7TyuZtdWQpe2KdWRIiqTkjVZpDUD2GjXphRwSTHIhU6vD4iiunD1Ci38649ec1wddF1P
 zaz9AqIzrcwCsV5BKSRpyIUJmDEhY7ZYYAxFm5Z+/Q/bvih9Y3rS4I2
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series collects the device tree changes we carry for the Orange
Pi Zero2 (H616):

- Patch 1 makes the H616 codec node cover the DAC RAMP register that
  the driver uses (it currently works only because ioremap() rounds up).
- Patch 2 fixes intermittent dead-RX boots of the Zero2's Ethernet by
  letting the RTL8211F add the RX delay ("rgmii-rxid"), as the Zero3
  already does.
- Patches 3 and 4 add an H616 GPU OPP table and make the Mali-G31 a
  cooling device of the GPU thermal zone, with a passive trip point.
- Patches 5 and 6 enable GPU DVFS on the Zero2. Patch 5 first raises the
  floor of the GPU supply to 900 mV, because on this board the rail is
  shared with VDD-SYS and the video engine corrupts decoded frames at
  810 mV.
- Patch 7 describes the SPI NOR supply, patch 8 adds i2c aliases so the
  header buses keep the controller's number.

Testing, on an Orange Pi Zero2 with a v7.3-based kernel carrying the
same DT content:
- RGMII: 10 of 10 cold boots with a working receive path (the problem
  showed up as intermittent dead-RX boots before); iperf3 853/873 Mbit/s
  and 86 minutes of traffic without loss.
- VDD-SYS: with the VE at 600 MHz, only 6 of 13 4K H.265 decodes were
  bit-exact with the rail at 810 mV; 3 of 3 at 890 mV and 3 of 3 at
  950 mV. With the 900 mV floor, a 70-minute decode soak (H.265 and VP9)
  had 42 of 42 runs correct.
- GPU DVFS: panfrost devfreq scales 306-600 MHz and the vdd-gpu-sys
  voltage follows the OPPs within [900, 990] mV.
- GPU cooling: the gpu-thermal zone binds the panfrost devfreq cooling
  device. The 85 C trip itself was not reached on this board (it peaked
  at about 70 C).
- SPI NOR: the "supply vcc not found, using dummy regulator" message is
  gone; the flash reads back correctly.
- i2c aliases: TWI3 enabled by an overlay shows up as i2c-3.
- Codec: analog line-out playback works.

The series is based on sunxi/dt-for-7.5. "make CHECK_DTBS=y W=1" gives
no new warnings for the H616/H618 boards. The Zero3 shares the GPU
supply design, but I have no Zero3 to test, so it is left out.

These patches were developed with Claude (Anthropic) as a
coding assistant: it investigated the problem, wrote the code and
the commit messages. I reviewed them, and they were tested on an
Orange Pi Zero2 (H616) as described above.

---
Changes in v2:
- h616: Add GPU OPP table: use <target target max> voltage triplets
  like the H6 GPU OPP table, so that boards whose GPU supply cannot
  reach an OPP's target voltage lose that OPP instead of running it
  undervolted (found by the Sashiko AI review). No change on the
  Orange Pi Zero2 (AXP305 DCDCC at 900 to 990 mV keeps all ten OPPs).
- Link to v1: https://patch.msgid.link/20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com

---
Arun Iyengar (8):
      arm64: dts: allwinner: h616: Cover the codec RAMP register
      arm64: dts: allwinner: orangepi-zero2: Let the PHY add the RX delay
      arm64: dts: allwinner: h616: Add GPU OPP table
      arm64: dts: allwinner: h616: Throttle the GPU from the GPU thermal zone
      arm64: dts: allwinner: orangepi-zero2: Keep VDD-SYS at or above 900 mV
      arm64: dts: allwinner: orangepi-zero2: Enable GPU DVFS
      arm64: dts: allwinner: orangepi-zero2: Describe the SPI NOR supply
      arm64: dts: allwinner: orangepi-zero2: Add i2c aliases

 .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++++++++
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   | 22 ++++++--
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 17 +++++-
 3 files changed, 96 insertions(+), 5 deletions(-)
---
base-commit: a7f6e476aaedba0d8ec575acaeb3257f900a592f
change-id: 20261110-h616-zero2-dt-acb4ccecaa0f

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



