Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36960A2601
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=reHhyASY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2ad4fgl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rzpHNc9Y338Z3XYGUvICOSfle7Tj1emLTrZGLz3fYyM=; b=reHhyASYZIciyf2b0wRZzJ0JCE
	MS5u7RcUoAmNpm7mCYFFhsAqFvo9fIhe3NXWpVz0BKiXdM9TkQyfkKusrRAkdkQTLPN4ecri6b8nK
	TUb0h/fWcMfG3F+7KryRA/2ATvFbrX9LG8Ybv53MftTqCv1oJF5lWH0taIP18NRvpBDSF6YEWS8fE
	DeAG9y6l6exyit9DcEZ21IHtVyRJz+CE4/JGNHI5LUg9xGJTLFaXrDDPq+Ubdo9DonS1zBp7WCrIQ
	pdkIUxGvxbNqE30GNT7F5+hJZWSOO1aHb6D8uK6F/A06BknvMIx5xN8RsSEqxRpC0j9fGGMvtOzax
	JoNdXt6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvHy-00000000ZNo-14MC;
	Sun, 22 Nov 2026 00:18:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUvHw-00000000ZND-1jor
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 00:18:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C3C060D43;
	Sun, 22 Nov 2026 00:18:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795306715;
	b=aUUQEiKn5uBkusycddCXFaEoSnnlvDGQCM7p5RjmyQS08ZC1ULiKZCtbpNISG7Xt/G29
	 f+nTzdl+yDmPxpvZlD7/iSEDEf6siBNFVXQ8saomLKXJRJVfcsgXx6T3cpH4ys+KDGFDb
	 CRW37q+bVyO/CPd6jzl80E2z4++TumCMP3TS7uEg2LcJyANj5dR1ip/de/J5TbXlP6/yn
	 JJ6SLgMu8HwN+csO3wv523sKkq0TJrIe4V3XVNKwDm2g6M1nSwb0TWnM2ghfa12CTMBKT
	 OKQLwL6FMsNz13t6Lu3IfUH7Nok3qJNF6RB1SRcYtufRuuy/VFKUdC130V+grUqp6jA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795306715;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rzpHNc9Y338Z3XYGUvICOSfle7Tj1emLTrZGLz3fYyM=;
	b=KhROUzIlY3SMDyRE+4s0vN3zytOt94YuSIbCCp4mRTjO8SC5ZFUJg69fdDYVry8iLAp6
	 EWFcGXrzMfLIW9xrIxzN9zMelsJ3/e0eau0nKfpo9Tm2K/xUlW4Yp21M0QQNCWBEzUuyH
	 y19AmxyEJd+v5derHB8fFnJQ3KzK+0xoCc5F9xqdqiy8GK7ZDhQzyxdVDLkjYqTrCGL1E
	 oNNzFC5VA6Am6DLE7DQJWgDlyTPDs2k19bSB5G4IMxfLC5xZrtr4ljOGHpnYmEBO97EJj
	 8QJoVOknVgpz1GeavNsMgFmGG21RroJl6sVcz75Ybr19rD6Z+EIDODYew7fYGRJ7CTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 933EF1F000C0;
	Sun, 22 Nov 2026 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795306715;
	bh=rzpHNc9Y338Z3XYGUvICOSfle7Tj1emLTrZGLz3fYyM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=a2ad4fglVDnATNGEFyskQPCPhOt3G2RhrJcYsOJ+iEIx3v37E12nGNmTIwjrfgo2K
	 /in/QouaXBsBf6cgk+Tm1osRV8LCBuDFxxO95cS+yohmB2hiLP0kUXH/lm+mRR7DHD
	 evHOM7Qfuwf+uRUBOUiA4s9u4UxXurk0phKdRWukDleJHGneTjIJDLTsrTp2vLFsfI
	 7e1D8aPPktO6beVk3kL2BXiOYp7QMJDSB/Mmc0oStOeGrmAaakfVsAkoV1UvhFfxLF
	 K8le77edyMGtGCbTzyvEpghA4tOu+sjHYBUQK3GqTt6tsA1L+KJINjP0f+rVi8Qed9
	 59l9kFZJipxPg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8CFE4BE86;
	Sun, 22 Nov 2026 00:18:33 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v2 0/5] arm64: dts: apple: Add CPU frequency scaling and
 OPPs for M3 family
Date: Sun, 22 Nov 2026 00:18:21 +0000
Message-Id: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dkxbCKAr72FYlGGAMUJrC0RDu
 LsF1y5f8v77qwjkmYK4JqvwtHBgO0bQp0Rgb8aOgJvIQkudK6UVDCmgm1tPL7DOAeXNJTVloVD
 XIo6cp5bfR/Be/TjM9YNw2iu70XOYrP8cj4vavb/xRYGETBuJssCsNNmtGww/z2gHUW3b9gWBL
 TiEvgAAAA==
X-Change-ID: 20261121-m3-cpufreq-opp-e6d93a871c2b
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795306712; l=2275;
 i=michael.reeves077@gmail.com; s=20261107; h=from:subject:message-id;
 bh=/koNC4s8lnU15asJdPfp4bY2LX+NiaD8WCHNpdk0oLo=;
 b=UEnk8AVwn5vvlcuSPASfS/pke7z4HaDTII73tGzgzX5eTJJKZNB+y8C9HwwmCOZ7NPPOhuGMC
 6lwI92uHbP8AIs603GOrnWVT52HxEW93eyRBHfsknPFs6lrPCtQrRgN
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

This series adds CPU frequency scaling support, operating performance
point tables, and asymmetric CPU capacity values for the following 
Apple M3 family SoCs:

- T8122 (M3)
- T6030 (M3 Pro)
- T6031 / T6034 (M3 Max)
- T6032 (M3 Ultra)

This series is based on apple-soc/dt-7.5.

Thanks,
Michael

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Changes in v2:
- T6031: Add missing capacity-dmips-mhz property to cpu_p14 and cpu_p15.
- T6032: Add new patch duplicating die0 CPU capacity, OPP, and
  performance-domain properties onto die1.
- Link to v1: https://patch.msgid.link/20261121-m3-cpufreq-opp-v1-0-42a0c07c48a4@gmail.com

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Janne Grunau (2):
      arm64: dts: apple: t8122: Add CPU frequency scaling and OPPs
      arm64: dts: apple: t6030: Add CPU frequency scaling and OPPs

Michael Reeves (2):
      dt-bindings: cpufreq: apple,cluster-cpufreq: Add M3 family compatibles
      arm64: dts: apple: t6032: Add CPU frequency scaling and OPPs

Yureka Lilian (1):
      arm64: dts: apple: t6031: Add CPU frequency scaling and OPPs

 .../bindings/cpufreq/apple,cluster-cpufreq.yaml    |   6 +-
 arch/arm64/boot/dts/apple/t6030.dtsi               | 228 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-base.dtsi          | 215 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |  21 ++
 arch/arm64/boot/dts/apple/t6032.dtsi               |  48 +++++
 arch/arm64/boot/dts/apple/t8122.dtsi               | 210 +++++++++++++++++++
 6 files changed, 727 insertions(+), 1 deletion(-)
---
base-commit: 477f3d0f46b0d885f162a64d13ca51e2f7afa542
change-id: 20261121-m3-cpufreq-opp-e6d93a871c2b

Best regards,
--  
Michael Reeves <michael.reeves077@gmail.com>



