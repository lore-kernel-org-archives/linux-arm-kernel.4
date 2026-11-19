Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64790606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 05:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zStqzGMD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E39OKXP7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FdgDfWHn+CQINgL4Pcimx+RwFaofGoA3my9IfcCmuK4=; b=zStqzGMDjb5rgJzFlC1Lm4gGf6
	rTNLLy59bodIfZ5yXp8Qy74wnHcKB/sligweYFDmSVKe4ZC9aUQ9v7VkRPa3Ot4NUZQ3Uo5u4msXm
	ECM9E0wePsyoFz8UK3XKj9zsDaHhct4fjNNCLvJ28HfPn35nZW1kutyo3zBn0W6731o8NDmO4RM7j
	LsKm6ACDj70wwmNch6LMkrTXsV0jPy4Z4zOz4kULhzC6CMacS5AgHucloDAz8JrW3n2O0bBE0Le8/
	hyfhoTPHPg5dTF1WUSckRWHKa6WRreLWzgiRCO6F1jTpK0ko2zbiCz6w5NH7Zgi+Zoj71fmnzl0/6
	jZyBJqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuiI-0000000Au4w-3R8P;
	Thu, 19 Nov 2026 05:29:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTuiG-0000000Au40-3Ur8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 05:29:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 025A461B63;
	Thu, 19 Nov 2026 05:29:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795066175;
	b=kjVJXWebTV+Y8a1oi36QW4slGXnMDVxhiLFJ7Beb8u0ih7DHsGm8BZHquZz0Y4H3b8PP
	 KTlu3VEIlrVBl07mnvfebeuHN2DvfmnGQcWcDPwy2NPRDpfVhMBKeEfjdgvCJP3tjU9ZA
	 3iS8rhKWgGDQGEC0SfS//1GHWxc/xGtvXE7XP3YowEIJsInZ5+LqMdLINTljR0zHpHl90
	 FmECrtEPEGPNXPxCByFqshiCKqilejSAGgurVWmt458MiX/t5Ko1EHaHLAL9fm6MI4FhZ
	 4OVndmyCsn2wcXYwaOI3bg2cRlhXYijysD4udl8bU4rxYs6QFJ3RRNHDVARzxO2H4JQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795066175;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FdgDfWHn+CQINgL4Pcimx+RwFaofGoA3my9IfcCmuK4=;
	b=DLujdHCTAZlYOKn9LTwkhcx4xDfHWpyCTa4Q4MN8kexhfihrw34B2DbvzKEVTH9R3jcp
	 mwRk8L6xjvdrQZfxTJTI51x4yGoRRIQi1Se4MIB9t8Ux9Ghd4zs5YIl9GKLNYfTPyQIDF
	 hJTeMnZZvnNYNOW0U5CpHXP9vUuH/UfDQgIvxF817WQRvX+VWDh1rqGzpYAm+qP+hzYGN
	 dsiB23bFKnvxrT5+0wPLBIs93GyTNjTl1uEz6j6gK8KqrYa11eWh8CrtsTAvgj0NfjNV9
	 vt+U7wMCmLJzS2y6sghkxjZcOgrlOqWPdxgcYDeklrl46fOkx4zqVsmzWT6tsESmH+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4A6F1F000C4;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795066175;
	bh=FdgDfWHn+CQINgL4Pcimx+RwFaofGoA3my9IfcCmuK4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=E39OKXP791VOkK8vo7vv7/q3AExhRKG1LmcDYCg9TV7jd0lSt7JiCy7kmKB+T1X5l
	 9bKGdpgQh2NTKxCJo0gqSfOtivsz+W6rW1PAtyv1mBmA14AKwQhi3Q3nxx3CcUhq9b
	 YmtqMcCgZWE6Z4J3e8HgSQTqxaL6JTivJxdui9O5an6EPZHqzdaRUGwfgWAzFPJuSf
	 IcsxJ2pXJntEMZQT5MGDbpscS/0IkNdnKc28ECIn7ysKeSWUu2Rqy5UummoFZiYPjV
	 YDUIGbeqpJ3CvhRfB4Z3MOJ/1BKXAwRiuPJrKO54k98DX8us7sBtmoOuycGyte1Gwh
	 zT3NHDYbwiI1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 118BB4B0F0;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
Date: Thu, 19 Nov 2026 05:29:33 +0000
Message-Id: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WPQW7CMBBFr4JmzVS2GycOK+5RsbA9E2IEcbCTq
 C3K3WsC2y6f9Of9Pw/InAJnOOwekHgJOcShgNrvwPd2ODMGKgxKqFpKqfGXU1SYx4BDTEizvWJ
 iS1hX2tbESrORUK7HxF343sxfpxfn2V3YT0/dO5H4PpfK6RWD0U6+L4Wl3zhZadE2JDqjW9aOV
 OO810IZEq3U3aezlSN4qvuQp5h+th8WuZnec82/cxeJEp0n77rGaMfieL7ZcP3w8QandV3/AFC
 vskkZAQAA
X-Change-ID: 20261115-zero2-spi-nor-dual-read-645a6de25e81
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795066173; l=1665;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dSUlrtuj/XZo8LVxmrqcGVmatGiczTvRbXzsTOXBhPM=;
 b=p6DGgixcbBrVaXI7ubEA+MhLxvzD4Dcd9aRiJTYGBG7qLklgmmtb9PJolIxZuNYvkR4bst+X4
 fdvV+6DSPb4DvykJXBJKX7CCREZBaoG/ELg1mT5uhdZUjIAe9pTTaem
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

Andre Przywara reviewed v1 and suggested labelling the flash node (patch
1) and setting spi-rx-bus-width in the dtsi shared with the Zero3 (patch 2).

spi-rx-bus-width = <2> needs the binding patch of [1] (acked, not applied
yet) to pass dtbs_check.
Without the driver patch of [1] the driver ignores the setting.

Tested on an Orange Pi Zero2 only, with [1]: 1-1-2 reads (opcode 0x3b),
two 2 MiB reads identical to an earlier dump.

[1] https://lore.kernel.org/r/20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com

Developed with Claude (Anthropic), which wrote the patches and commit
messages. I reviewed them.

---
Changes in v2:
- Label the flash node, no nested &spi0 override (Andre)
- spi-rx-bus-width moved to the shared dtsi, Zero3 included (Andre;
  he read 16 MB on a Zero3 in 1.8 s instead of 3.5 s)
- Dropped the driver dependency (Andre); the binding is still needed for dtbs_check
- Link to v1: https://patch.msgid.link/20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com

---
Arun Iyengar (2):
      arm64: dts: allwinner: orangepi-zero2: Reference the SPI NOR by label
      arm64: dts: allwinner: orangepi-zero2/zero3: Read the SPI NOR over two lines

 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi |  3 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)
---
base-commit: 90e0d3fd460ec365617982b56bd7ea5179b36197
change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



