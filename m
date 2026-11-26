Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B53606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mdnN6pqG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoqNCh7n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4z2oKg4uwmOJVBZfpANbqdPA2a5xQkXipkOD6MSZYT4=; b=mdnN6pqGVlC/Lta3a7tJbdopB2
	bCAiVrbuYae1ytIAG8wZt6VUN8LUKZBxXsTh7ZU94sG+WIMoMGt5TtSZAkS6WxXbnKx2X0TwFV9V9
	/0NMuBRWYHOWC2wS+prljT9D+YkfGDUXhBNMXyPupHCXPaAiD4j+T9FVE64xYxAX2YhtJVs6qpUXm
	fg3GIRY0KpMZGKVzHzlqOa3VrkFRy7mX2YXe5Rc4TlQH9zCBKk0JXacXo5m8PmYEe0PqnB6552u4j
	iJn9+6hOcgkzc8bWSzfpDhlgOvAXcxQk3pyqMFFwyan1+jqG/oU5dDPptf5HkuFFAl0RDGMP55rQR
	z73bWuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWAp-0000000Ccqq-1dpH;
	Thu, 26 Nov 2026 09:53:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWAn-0000000Ccpo-3l60;
	Thu, 26 Nov 2026 09:53:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 321944347B;
	Thu, 26 Nov 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686828;
	b=rSGvo3dup4oCPBHhslCBCSG6KgEcFlBIioBrKy6gPc1cXZHtkHwE+gXEeEamtX4IYUD3
	 SdjheIOfta/jF2FShQu4rb8fnr1a0ChT+YBGSpoDeiB9kQTrnRou6angsRay1rjpQcIwN
	 RzNZssmXgi0mSKOUPDUcZw43AGn3XVkJatIMJjQfxhspSJ2j9uub7bzVyGxgENV1Uamkk
	 ofnIx7aRm1cg/MjaABOJnIh4nTQm+HEzjeuCgin6J5tV3D5OdFwO+oqEpTNWYhDJEJ3f9
	 NqSGgLzVy5g3aCzfQTpAwqkkx3J7/DWTuUIiN3hTikjU6k6fALD9XrLdqLA8aHBv5AQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686828;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4z2oKg4uwmOJVBZfpANbqdPA2a5xQkXipkOD6MSZYT4=;
	b=qwA3WciiQsBt5yuKxASsAi5fnTKcqGnYrZnnru6Cqe87qdqR5tTU1YXR5R2CwhY+Sqqb
	 OV0cV7SKm9Jv/1BRDdmLqdaE/QJNKNjpNntEFfouKT6vXXV9Wss1cWkg/l3/NErrsC4xE
	 NqsjXhNJ53/ZEUDeE9kOuLbFW6CVq7oBNlsDSOXgYzD/y72wlrkp0L/jfJHLfIOwNM608
	 9t956ctwxtv7MZyIIdwLB52uYZR15HEWazr9a791vw4Jxh3P5bjEBDJwnhOwuAUu/ttzY
	 lTH7/zbEmj1nQ25EVumNPIgiE1BjZ43r6n+mbHUkgeCVxSL79m8Gr3g/p5zWSQckD0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 576881F000E0;
	Thu, 26 Nov 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686828;
	bh=4z2oKg4uwmOJVBZfpANbqdPA2a5xQkXipkOD6MSZYT4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QoqNCh7nDB/nDGu4fo1Txr2KQPaxgTi/TIfBMZA4MhbpO6X7m06V1okNDe5tSGN3I
	 znmWqxi1DaVV1GEqd9aQtk4LjJKYJ6QXcGd0VTeLAgLjykKjKiheKbqZ7C0HzcL1Y3
	 eTZlpK0sp49zGHz0CzNz3ZGeI/fQSqebC4nicD+8vuP4w1P8Zhs7DZAfm8tkhAhHM/
	 0AlvMZ/zkdxraj1ghB26LoA5IcFXn4zORELOlaANv/DuD9Z1Dt/OprXMz94alZ5kZv
	 aUudvbMUDbH6SRcxBjlsnTGXtT1nmcwvamV9HHh4kTr6wXMlzIXeKQKjqKPC7Rk2t5
	 d/qY7UyOKdUVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A21D64D3BE;
	Thu, 26 Nov 2026 09:53:40 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] reset: support reset for Amlogic A9 SoC
Date: Thu, 26 Nov 2026 09:53:37 +0000
Message-Id: <20261126-a9-reset-v3-0-fb9bb01f33d1@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKEBCGsC/1WMwQ6CMBAFf4Xs2ZqlRaCe/A/jAdotNBFKWtJoC
 P9uITHicV7ezAKBvKUA12wBT9EG68YE4pSB6puxI2Z1YuDIS6ywZI1kngLNTCohqTa6xVJDuk+
 ejH3tqfsjcW/D7Px7L8d8W78R+YvEnCEzulIGhWzri7g1w9N1Vp2VG2DLRH5Q8+Kg8qTW2qBsu
 SlEpf7VdV0/PdiiEt0AAAA=
X-Change-ID: 20260706-a9-reset-9c39e8fdb06d
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686819; l=1303;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=L96yI3Yx/j1d5Y6jYRCC8qNnGbrQ6QxdVZQl+y4ySbs=;
 b=WMm59vQS484rXbcEcS4wquK1SzMIxM+At+yBWURtC90oFy1BzU7wucfOBfl3VRHdXvT1ICQoB
 P6l6pxsUsTSAf1vR1tF7V7HtpxD7gOpiR05J67x6YVg14qSBKDWXRD/
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
Changes in v3:
- Update the header guard to use a consistent naming convention.
- Add Neil Armstrong's Reviewed-by tag.
- Link to v2: https://lore.kernel.org/r/20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com

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
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



