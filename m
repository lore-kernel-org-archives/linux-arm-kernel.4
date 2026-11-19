Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5A60A2633
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S8D2Il4v;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vo0hJsNJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3+49QTDjm/vKqS/Wcu2TETTUiKiVb5Sph5ntAgUjO8g=; b=S8D2Il4vjQNnE6oCSGsZR8Fdfx
	OfyZZYn4dXaFatZ2kxMth3eRoOtH1VoRPJpO+YsKKF2d+/bJS6FYViedrH4cXMUFuBwda3d1WSjUE
	iCGunz96la/MjNwIe0G9tVUKC8VHJy2d7wMjJ88Ql4U2/366IIlavwD2R/GvgVFfzgWVtaLppzsGJ
	u7mqUNE7h7qg+k2vVRHqLOOwUPiLXYXnDs4hZ/D9f/ovwQSwd0HmRQulcj3sXbY58BSh7HfX6svTj
	Vslgwbw43REO5ZlY3d1JXf12Pi9R3L3gOd0z8u36qjqKr/+4fIxgoNddqHnsoRHyUUWQhiamlVHHs
	+suXBPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88K-0000000DGXp-2eov;
	Thu, 19 Nov 2026 19:49:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88I-0000000DGWl-4Agj;
	Thu, 19 Nov 2026 19:49:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 27BB360DE6;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117761;
	b=TwP3P4RqGtTF5Irho9PrA5dHJLqRVX2fgjo/8zvBqU88AmDOGIVwihCE7r3OED/sR0Io
	 qiKWjldpx/bZlaWIXqRkbIdBoJAzQv/50Qd04gjgdGgPhUAAWb2BEKGCC0eIQrELZf4Sy
	 szAxZTYJVwgCku4vMcKv6kzq+FPig1VlzFqc3QVjhmOdHvnFe+LbZLH6Ddz7P3bGSq/ra
	 2cbLgIK2vEoKsVncVW5aTFw8aJMqGlriBzyB1htVn658nmETjkfIRJ+Ho23l3GLURd0YH
	 Eb224ZbPG/vhXPFgf0TCerWNUZf1BEmu4VJ37SayMqLYRBJRVb0JJt8XgcRhBlyO7oQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117761;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3+49QTDjm/vKqS/Wcu2TETTUiKiVb5Sph5ntAgUjO8g=;
	b=w8k9h0DDRHLDEfsc5XlcL6cYupKzAQFwMLA57T2gncEkC5gpsfo5CmXrg6cahql3b+29
	 60h1wCLREUwfoUzJY7ss+/cyAue6x16JYS9ga/4D9cGbC7eHooC9LmQ6Q7Fd2Md7FHPdz
	 CBK2ADb2SPCejmV7Xuf2n0vHy03aOFZLCwZZOTOIDvwLHXeGyHrIlfNhVCxnTuCors7m6
	 vpn42U8PVMTY1h8E7BoE+fOXYpzyDalh8f9tDNjY7VkNWL+JypT7IFx1U8KCU61dLo6VK
	 1c6HWCq2obVKQV+sy03CA69DQwby8rpsiuJTrZ7BSPNweunQcLX5vSqYaG02N+K7R4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46C631F000C5;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117761;
	bh=3+49QTDjm/vKqS/Wcu2TETTUiKiVb5Sph5ntAgUjO8g=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Vo0hJsNJlVDFRsdVjfsd0RHe/k+Ox6HSa43+JUz8lFrgi6eUnlO7JU6yN08HaPClD
	 y/1P0k3bOduEguVMKjCnvMzX/Mk75OI865fO4mXvyNu7jIzzyRejILryn2rbXtu2FV
	 iZu2Hpg3Ik6GVi9prhxDvjXvFWf2pbB609MS51WQRBkFlACNuLX7p3vc9snrAQGphH
	 KK3J18wx/itrEj1/BeIkqHUQIBNVBrkSnh3OxnJUgp4DRk35fLeQmsVKXhrkPMIC86
	 obiCB/kbaJSuluC3MKcnemo8Jf70bGS+YoiErfVUP+M+yureJeCxIV1fwWvgKAsjrm
	 AOrrHETXnfQQQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 992A04B400;
	Thu, 19 Nov 2026 19:49:20 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Subject: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and FG
 on gta3xllte
Date: Thu, 19 Nov 2026 19:49:16 +0000
Message-Id: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTuJRTDUqxgWLfziGIKmMxgI4
 e5WXX6L9zZSJIHSpdgo4S0qzynDHQrq7mEawNJnU3ksz845z4OF0zKOBp41cgxmSCtHX6PqGx/
 Q1JTbV8JNlt/32v6tc3ygs++M9v0DH3PPq3kAAAA=
X-Change-ID: 20261119-gta3xllte-usb-battery-b95e4d89ae85
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1828;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=yfFFDGO1vosaycRHkyMq/ESVrYzVjaRTqRdxrfEOlRU=;
 b=DOUWCJC+nGAPnXyDeJyc7GzcvtXM33vcEfPLeUGUDgC34VJmZIADaL8pMrRRf0Q+kEdHuXTF9
 pScKDNhyaBXCo8FM/p5Xk8rvTEEKTBTi+pjQnkEozJPcCyD4Te1NT4c
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi guys, this patch series adds support for USB on Exynos7885. This series
is based on David Virag's work[1] I had rebased it onto krzk's for-next
tree and tested it on gta3xllte. This series also enables S2MU005 FG
on gta3xllte, which is also tested.

Please note, I did drop enabling USB on jackpotlte, this is because I
don't have the device myself to test the changes personally and I didn't
want to risk a regression on jackpotlte.

DT changes were tested with make dtbs_check W=1, and the dt styling check
scripts with --mode strict flags, both of which returned no warnings.

Best regards,
Umer

[1] https://github.com/VDavid003/linux/commits/linux-6.11-rc2-7885/

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
David Virag (4):
      dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
      dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
      phy: exynos5-usbdrd: support Exynos7885 USB PHY
      arm64: dts: exynos: Enable USB in Exynos7885

Umer Uddin (2):
      arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support
      arm64: dts: exynos: exynos7885-gta3xllte: Enable FuelGauge support

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  2 +
 .../bindings/usb/samsung,exynos-dwc3.yaml          |  3 ++
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 50 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi         | 43 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 27 ++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  3 ++
 6 files changed, 128 insertions(+)
---
base-commit: 397f550f3c8551b3ffbf3f45a571b58448514988
change-id: 20261119-gta3xllte-usb-battery-b95e4d89ae85

Best regards,
--  
Umer Uddin <umer.uddin@mentallysanemainliners.org>



