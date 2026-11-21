Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C1B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ro/jypyy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfuBxsb1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+uIxrdqE5r+AeSD4q57ptStowr04BgOsL+c0IfgWRB8=; b=Ro/jypyyq3H5a1EsQtttm8yoW8
	m30FqJ5kAJQlVPSuYPG6ZrnMU3bwjjxHOmAhkaB2juHsa4BCtw7lxJQI4D+8Yflxa3+S6xi1Rtvo8
	8KEOIETPFlu7ZL3RACFkGd/vC9BqUtOF0MG66htdnhInrw5gwKrv8bYWeOnezFDulESwnRuZSloel
	CfEdduPXwfHDEj3ZGFEEM9wW11BHkO7IB+VzrEIKwwFduLcMyEc1UfAi9eagE7TLq1OSydWLD/JlA
	mVzEkbAmU1ifXoYhIbyVXhp31u4+7aI73YaZ8UFMq5MTLKLYvwnnDeSWqMcP4GFWiJfAvpPn0SkM/
	2/gqXctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgYj-0000000GwD6-1gYp;
	Sat, 21 Nov 2026 08:34:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgYU-0000000Gw83-0rPN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:34:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1482613A9;
	Sat, 21 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795250081;
	b=eeinYktOgK44eNJtba06DHTwD0xECF3UDSG52pOBI5eCemom0mA/af8nnCKM5LRAy+am
	 NwIVRWZ5Gh30iiRXEVmuhQxH8Q+Y4LEZKs9+DYcS+8nmfTKCX9jnZwbg4BfaF7+CWiErm
	 7HUxCea//Tqj9jZLr0ljWt2cH+9NQbQojGEjcXJzqYxNHUWD5b4PTk469wLI5n2Lrj1IA
	 eR0Ro4ASnNpXewYy5GKf0TUeugwwnhcf6sr7C0/g+QgGvBLRX9Sx/puvAl/XkS9FEvBqi
	 kPRIKP91VMS41c6qSt5RacU7h7AyjtrrLtp8y/VNeO7GnZlVlrKrDhj/mKcrmXonMRg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795250081;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=+uIxrdqE5r+AeSD4q57ptStowr04BgOsL+c0IfgWRB8=;
	b=ySbJu6i5faxIrre05eOfykgBWTs4X9TmuQGucth4vRY0SDFKtxM/542GnjBtgkLNxLio
	 Ki57+z1CHVEvGswLnrM0jbVl5By1QWSnuRl55Z0n09ANC4oRtWudtudFV0BAAO7iDAyr7
	 duiK87IyhGjhCZTrdv1EeA5va+xT9qvrbn/p1pmiTriMtpYBzL1kKWGZxwI2BJDH0vLvy
	 4uffv6nsJj10I+ztOlDJy0UeLstC9BkgAvXa0qkgkkUIYZzSwrQ1SlLPoMF6xwBG6iHBe
	 kfDu3Ed3vxjxjYfd2aGvVx3sn84hZmnkn43rPqGzjUkJhThMcWUl6RIYUTxM2cY9eYA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD8D51F000C6;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795250081;
	bh=+uIxrdqE5r+AeSD4q57ptStowr04BgOsL+c0IfgWRB8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UfuBxsb1VVFfjGRPG52L5n9rOidFB2T4OzEte3sa5Uqdajt2LfqPSLnACaK4cV2Ow
	 nNU4FVBovCQdDNn+qm71mVtFJVnqt9cungX89R0iGhOMk9mRWUQ6BQsfGbjB3PFzKU
	 XhWh3B1GYODSrxDM0p0ISZWg/brQ64IfK0sU/w9gZ4VKCVCVos5C/JiEocg9R0KVd2
	 KPvOOuPfHIAXYRkaLsu3QO7VflFaslf5ydIFUWl0htioospMoaMIeDLhJ+qZQLixiL
	 oD40f6IR5F3SfiNIlCXl23OZAoOyRkdkrEpB3N0h6w7CeZJvVMCpI9sWBVgKeTirQ9
	 R1qFQHnKx4P4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E7344BB93;
	Sat, 21 Nov 2026 08:34:39 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH 0/4] arm64: dts: apple: t8122: Add SMC and NUB SPMI device
 tree nodes
Date: Sat, 21 Nov 2026 08:34:14 +0000
Message-Id: <20261121-t8122-smc-dt-v1-0-898f3f5d6228@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnA2YoMXtVYaH2sYtg7nR1DEQ3
 91Oj9/h/1cwSSoG12qFJF81fc8FVFcQHn6+C2osBm7YETFh7okZ7RUwZhypbaK7UO9dByX5JJn
 0d+xuw2lbxqeE/H/Atu1f/uXLcAAAAA==
X-Change-ID: 20261121-t8122-smc-dt-b140d6918a65
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795250077; l=1103;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=+VGF3OgM8McNO1QrReHnnifTPEONvOY5aVFINlqg0P4=;
 b=69QOjr6tPfcAJvARlYWO+HNGBJ4V7g5KBF7WR4kbSxBU+WYYhLiE4W9uYoqIXgUgRiOS4i/cP
 Cehpxr6632hAPeZrX20exaiB+Uk2tfLDKDlfjfZUfaEmQzbBiuS5+BQ
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=ykwkLcuByJYb/cdLc2UuoYP03pIzwrscEZg30+4tJL8=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20261107
 with auth_id=1442
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

This series adds the System Management Controller and its NUB SPMI
bindings and device tree nodes for the Apple M3 (T8122) SoC.

The SMC node includes its ASC mailbox, GPIO, hwmon, reboot, and RTC
child nodes.

It is based off apple-soc/dt-7.5.

Thanks,
Michael

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Janne Grunau (2):
      dt-bindings: mfd: apple,smc: Add t8122-smc compatible
      arm64: dts: apple: t8122: Add NUB SPMI controller and PMIC

Michael Reeves (1):
      arm64: dts: apple: t8122: Add SMC and its mailbox

Sasha Finkelstein (1):
      dt-bindings: spmi: apple,spmi: Add t8122-spmi compatible

 .../devicetree/bindings/mfd/apple,smc.yaml         |   4 +-
 .../devicetree/bindings/spmi/apple,spmi.yaml       |   1 +
 arch/arm64/boot/dts/apple/t8122.dtsi               | 102 +++++++++++++++++++++
 3 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: 477f3d0f46b0d885f162a64d13ca51e2f7afa542
change-id: 20261121-t8122-smc-dt-b140d6918a65

Best regards,
--  
Michael Reeves <michael.reeves077@gmail.com>



