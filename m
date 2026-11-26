Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54A606A685
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NN+jorSI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXBW0Jox
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cmYgxX0wyUrCUPNHbGvSBKwLn/QP4K0XP4FUfbN/y0I=; b=NN+jorSIVgqcvv2xNlAd14fwe7
	I/j9bMfsqS0HiRj7OltNCd7YOtmzw/T63EzytB9TEO1z2yzobJvfmRMecjESikO4BIdR0Ohel3N4n
	KcvqfTeLvGbVddANFbAMqBkTI8DzFaZ5NeMHMYybUx1ii+HSYI0wStMpadid0hGRWLTwz3FUozVlO
	iImCkzAyuxTTTvK3n1KTWR1AzxTWBC7DMi+oSghUqszNLBD+PDf0oxBsPXm07W00gpW/ApZLQT+tP
	oAi+CZ3jimvo0ivoFbGkbAK7n69fyt29ZZZ4/yw4dFKun7fkVvJ4qnAxgWevqyuwyfK71KUHamGnp
	5qmPo9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVic-0000000CYAx-3OzQ;
	Thu, 26 Nov 2026 09:24:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWViZ-0000000CYAO-1Olc;
	Thu, 26 Nov 2026 09:24:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70A4E62C0A;
	Thu, 26 Nov 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685078;
	b=bjsnDRAaUoRmElIAetvYZoXnxXQNWkIpDaVqKIrSy+E8gXlOlzT2y/JdlolF2RjoWnSQ
	 YibolCQ+4BW8EMca3/R6vGhMrf+Zhuf2hV7w327H1H5Wfo5X8T/mDV/0USR/aejFOmJeW
	 8hX6MhCVrshT5uA6nAnbGHtIPAHJRCHntiaiJbcxYo6pRWcrVmVoPszWm1k7cvqz0QeZy
	 V4JOPH7bzeNAL8rNWazLvcOriYeImLWI3Zgh1TdcOoiKwQxhiODQpJGlSekaew3nbbLUh
	 kkJ0bnD6rFYoBzCFD76977DVAkfqJ/9DXEv68pQjYT3TkRcG+eaz827xGV6hp2R84MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685078;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=cmYgxX0wyUrCUPNHbGvSBKwLn/QP4K0XP4FUfbN/y0I=;
	b=k/cwVgV3pM9MIxSpRT7bT7ELhQP22Mm87PRMkui59SCYC+BsiMtYRFOyC30eHgkHVEI0
	 Jzq2018z94W3z+ScjcI7yJMEy7iu/85x4dRJUVJZvSq5mS0lqRpQEXYRLIMVRdXpk6gFX
	 msbEKnZHsfQQSl+6LzaeHVFeSeqXLJjTQWY3XIfaVy2kDilVUJuV/mAI7FrGBVq85ONe+
	 BO/FtSvdq7pD7gKgdpSz9ThLplnbWeOsIuYG4D4xKejQpSJaCXR3Du69u9n57Lj7UwuKq
	 4OrGtvRRjvcN3j3NzWmnPHCaDu570ioKlnhGHm4XdnTtD2UVu3II4VmcvaPKqiObZ3Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 369161F000CF;
	Thu, 26 Nov 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685078;
	bh=cmYgxX0wyUrCUPNHbGvSBKwLn/QP4K0XP4FUfbN/y0I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oXBW0JoxjSP3B/2uHmvdBQ3V4x8G0NdNJt6PPmG1B81E6SIlmtzkNp4RaDUyE9ePx
	 1XzBA8tHpB/5Lhvg4gUaCFbKPMV0FHAAfGHCEyQvgAMGOKPCOl+m644faOWBhe01cO
	 0KDZIQIx5miTr31uXCfH3G8pTdYf022N0+i67OBF89rfDTqumzx6TudDNeAU2qrHnA
	 q9DxIXnykcXo4+3VkkpfSDI4Q9QDpqGp6Iq85Ukk8wfPx92FczFpIQreAMFagTAyS5
	 F67/I4T1S9Q/d/NQy/kNx77blIBeE9YKTTXWeJXwieJOzA9aPY6vpweRzYWFnm9/jJ
	 XADX0uTZDmovw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8DA1A4D353;
	Thu, 26 Nov 2026 09:24:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH RESEND v2 0/3] reset: support reset for Amlogic A9 SoC
Date: Thu, 26 Nov 2026 09:24:16 +0000
Message-Id: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685071; l=1089;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
 b=7WkPlCfxU6cc4NNY9jDCaiVSFNgjX0BFQ3UsbkMwMqVdIutYlN491SnjJhXGjUDI9GkGdxodO
 otquynK8/eVDEp6C/RV3s6w5EcZRZ8rMoQY6g5OGnvfm7azgdq5HAsj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Use standard node name reset-controller.
- Link to v1: https://lore.kernel.org/r/20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



