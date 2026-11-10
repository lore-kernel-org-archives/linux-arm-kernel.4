Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A960A381F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dW/+KnKQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hg/a3x/M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=29DACKgqdQGqTbbHLiteISW3oGkID104sqmdAbtVPZg=; b=dW/+KnKQ+vtBe8GnKViJP5ZBLl
	DPUO5g4LVIGunSsPBcQuI/QzNid3LFp150Zvv30lVRX0sDaE5kS5CSKIIwDJkoqr8RMxkZdWlQmfX
	URU4zIOZ86XEherOwa7alwYdhBTf82gqlsRk/p0Ey99vmsHZU/uR6kj+j1npN8KsilZx0yzcE+pAJ
	snDuBl69z2NO6bBnIdiMXHcfaWrnOqNis3+A4KWO6pXLxzHMVNlynsR9+i744No1uOETbUsnm8G0u
	odcSSPUJKBHY8DaAAJamOc7fo/2U2eoyZ7SGRYh+2cbxdm6RAMchueAW0QomGYt4eYl6ufz1fzhqz
	l+tbhl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXT-00000002XeV-3TR4;
	Tue, 10 Nov 2026 05:36:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXS-00000002Xe0-3Bc2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:36:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4004C45F3A;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289018;
	b=quTq8YQzNXcniJUmmRQ2qHm5O5sdN7rp2OXedOLTq1MP7TdakmEkBbi+dusjYkBk/zdy
	 EkY5KLDiQImnjMNBsUvGtPA/3a5GbO3/5Al5x2sggT3dw7mjyTa2Og09e6cvpAuQJ6qv8
	 WTLdTFgD0dq8C2lTMVQIsR+DriJX5OC+3lusU0yufJ1YZ/i/kQsUOE1xkI1KYXqezoPwq
	 WcpbnXae5Y+Rp7G3Jw2ZAgHdAo79cr/ikNJUL1rvCNsIBYK7n6GDpr3dDEbL9828647ml
	 YjWGcZz1+lhN/v25unYFIzvYoqXKq17cb+F/EUh71/vqdQxjuVH1Xtdmj6hAeLrXEyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289018;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=29DACKgqdQGqTbbHLiteISW3oGkID104sqmdAbtVPZg=;
	b=jv/aBe4C86cJFKgFW3kUSQqWa8e2FHDzMuxuJ4B9mZzWZYSLOYrSgLRGwMscYTWzDpYf
	 1hq8+3m41uIblVbk47m/sOyz77lpwmG/UTZZMUk0v5tj4zdTtMnLKztFupZ4FGuJdV7OT
	 YP4OU6P7Y+vOtfUEstTrjBfTpoFEsnQ6MF82g8G79AzZ54gPEKASIBMUSnj3WzZFueRGk
	 wWG1dmCUe428L0gQh7gz0ncDt3JH2N7eDvUjLM0fFbBWKs5JH40CI6O5aVaOXfxKn3HrI
	 Yeam5WRaHaUTTBht1kCBC6KDkRgAdMfMgRghYxeZZHmTsu8wDg12PvKbnm/oKS22irg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CC9B1F0089F;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289018;
	bh=29DACKgqdQGqTbbHLiteISW3oGkID104sqmdAbtVPZg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Hg/a3x/MbAcOT34XF/zYplXEIcInOOuYnu2yw/8GzZ8zMVw9QINDCmh8I5WybDI7I
	 ZzK4hsSAhMwAos2RorMsvHy+EkQH5zxlhv0snjb1dQEhTGC3EMVN1moJ5Tl6SFjhfg
	 IjfygELNM62v/qYVMGCJMunRXC0UiZQ/zvnEk4FdLMT29qDo45Bz8yUgA8+DTiYqF8
	 YbOfu6o+Pi0vKIWLBjIl+IH3D34iLQdW+Raj8MVvSTXewO2lXG6XBT8Kupq8JvgZ6Z
	 VtQuNUcGp/Wxku7zc8Br8aqLH4KcRDbDE1FUSDVeQR3Dp1R/nHfSVFToSPUgcidRBb
	 OEiZhy8+MFsFA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7C4CB4889F;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/8] arm64: dts: allwinner: h616: Orange Pi Zero2 fixes,
 GPU DVFS and GPU cooling
Date: Tue, 10 Nov 2026 05:36:54 +0000
Message-Id: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrE3SaaQLVxGLGoOxQFpEiLsrl
 m/x/wVRgkqEMrsgyK5R5ymB8gx48FMvqG0yWGMdERkcHDk8JcwW2xU9NwWzsPemg9QsQTo9vl9
 V/45bMwqv7wTu+wFFE0y1cQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289015; l=3358;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=u9LHr4/rzVM9FYZD+x2eGBKLMGq7N3wvsXaVbUEYayk=;
 b=pZbSwu/DgRU9u5qYgcYAYrAobT+MeCHW+t7fPQ2K2o4sB4/ZK20rgX4vruqWDB/HvjMAtbPs8
 YwtM5gHxaQtDpkqdyip56x/UCQKYd9OTWoR1EFR9UrCMgept5j2mcBm
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



