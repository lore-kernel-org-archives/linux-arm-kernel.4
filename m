Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C460A2634
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 23:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WN+t8Cx1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qskUgRn5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=; b=WN+t8Cx15v6orRWdObcC4vYV/0
	YOwIaX0nQrAZTxmSLOhJlAvb9JIDAGSAtFzJSrN3gpnllXXafwtxaUDP89gtf7WugyO4Us8JZC/ZD
	Benn/U0fz15ME3Cgr6Z7xzFa7yQ68e5nKOxsYA7iaC2IlQCuz1Vvbx9M6ZrnVthJNLrffJNTaHk2c
	NhqDYVvr40T0pFlzLGGXud/UVsigetaP+QCjIUahkNqNdwEgHhvWQsLbNMZuC0neIhJdMZcsLFWKT
	9psEV82Q4HqNpPaz1P+0QjNeu4r1LbphQC3h8OrV4d8nl2nelb1ix1aeVCFIEMFHsTGf2PEDre46q
	RiQChFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp6Z-0000000AUAK-1e8W;
	Wed, 18 Nov 2026 23:30:19 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp6X-0000000AU8q-15tb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 23:30:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c511c0e2826so130296066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 15:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044615; x=1795649415; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
        b=qskUgRn5Idc5/qg2jkk4PrHihsv20V+skWjnr8NqtMB+is7M9er8POGjI4NSB/Nlzi
         8P5dymqNul9irDYr6FA8jWD8XprJ+ToEGy4Ndth1y4Plwq93rxdw4PvrS03xz7xijrfJ
         lG3xEP8gIc9PN8pJO/wm+4jsQL4byUtJUbR0TOH+soonIaAFnXhUaCXM1NryzOpmukRv
         CYr3+PkZL2KFx73OceKUE//RfyqaaHxElJbYy4auD/56BrICab1F5F0muT0cVvIbvKIV
         hmW7aQwQ/7ff8FByZ0vRUMkkrgN/0nnxL6fMmWC+X6afUZiPidaaNG1A5XCvhdftBcal
         f6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044615; x=1795649415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TJp+v10EMij7VbtZSi1N0VBoPPwdYg/YL3FSqlitLFE=;
        b=fmEfKDooqMzv2ldaMfxhEdbhcd/9l/LwN8N+sIaQ5Sd1hXZtkpFwg0pvBSjbRKpCdK
         s+0zR9wPrWHQj+28NEdJt4oSssH4P6Kaqtn89fstL7phpskv1vsxqACnpxXHEEGgsXJf
         CY8FJVhcrDZ59R+6gA65kPxe/MSmJurX8t1/y9ehn7Vr6+kJz0NDtVp9X34rzug1OMxv
         9v7DhJ/Pi2V8HB1MCRRgIGFWaS/URNq6bDZjAMw8/AXquMrJ2esQqyG8hLma+jEPxG0H
         s5K+M5CXZxpuOgfrG51d8OEfZU5rbtK4ElHH4L86SkVCz/OYk+RmA+ufp9aFRLXy4wJG
         +JoA==
X-Forwarded-Encrypted: i=1; AL+hErHOQB+Fi7x25kVv5vqNbBZ0vGuEp8BHTbZv9UnMwhgZvM2d6Hj/CcutYsUgsovjMXmPqdo9R4MlfGvAoqXdTejJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+UATX7iQbt/uTzGIhKEzAhlsFuXxe5xVrXjKXIMuR0GRgDS6DT
	TsJ9DrkLMSfSegTUo60mG+XlOjQ8hscRueqqhDAr/MOVtXsOrgOqJeik
X-Gm-Gg: AYBFou2gWKWryJiFG3Mli0cHyqY+AnWKs1CNDm5QxCeovGAd+2BYLpm1CfTvPjlkJvm
	aVg8y2Qdwxp1GNBWXWoGPER8/osukVLmeG8B0fucl7tWFNyf23+j2mhR+OW8SNKeIaTnbHOtq8i
	arRAOxkGeN8LTDKi3fbR+iRbp0nVYZAZyzF/0kBtELzLsBzvIYC3hNEbldsinAUbG4fLAhPCu8e
	Kh6Nm/n+iXWKuX0Bf2w0jrCobazbRj34eJbjXh0Pv6IScYqYLYuwuhRXdxSeHHKM4rQfFVM9ih5
	mi7dbGgZhcEPoWiSMea8+2GZm6mph3AYhcWrZEqZFt45Gn2xVNXC3LaPsEb3o3s0XiYlYV/zExG
	PvKeXOVu1mFACa+ex+f2L+XYc/tlpxakuN00aMiY29cnCtBIEjjTaPZHhMhqETdlxryca9O043/
	Z/KAO85H6Qq6O/Kr2R/4podFljWR5ZVmOoJpxoAv5JkBe7C3uvIZI4j/ZKQEcObcE15CxvwNVye
	Fb0red+9P6fAuauIDuGYIxWL9Kr4u/bBeJ91t5J9irxAegxM8bK/iDyVfF3HrPguuK7IlNAO6ok
	8tiOCpC2DcXkWn0IP9LR0zYAqo63OyMjlYuqkCCW2UI=
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr378449666b.8.1795044614898;
        Wed, 18 Nov 2026 15:30:14 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:14 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v3 0/4] arm64: dts: rockchip: add Forlinx OK3568-C
Date: Thu, 19 Nov 2026 04:29:38 +0500
Message-Id: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI0/moC/22NTQ7CIBgFr9KwFvMBQoor72FctPy0qC0GKtE0v
 btQE9OFy0nezJtRNMGZiI7VjIJJLjo/ZmC7Cqm+GTuDnc6MKFABkgH2N8ZFjRVWILmkvCWGCpT
 nj2Cse62p8+XL8dlejZqKXxa9i5MP7/UrkbL7k00EA27AWs255UryUzc07r5XfkAlm+hPJEDER
 qRZBFFrUR8YGKG34rIsHyni6izrAAAA
X-Change-ID: 20260930-ok3568-c-c095925b1e26
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=2429;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=yfphZ0mTqNHaO6RXY1MSM8psuzP4gCsZLr935QJ6cDE=;
 b=neG5FXjHJ3lCTzvjwqvTzSD1TXFJGfOQShzFZwf6DbnyC1XRKKAAxGFAUAWz78in6AAG21nNg
 boa7IydzY68Bg+Dw2CevsXCSp8YiulDdybhGSbFA898d0oXb2CSm1Ju
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153017_318248_637C632E 
X-CRM114-Status: GOOD (  12.94  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series add support for Forlinx OK3568-C board based on FET3568-C SoM
(rk3568). Patches 1-3 add .dtsi for FET3568-C and .dts for OK3568-C.
Patch 4 adds .dtso for FIT-PCIE-SATA adapter that allows to connect
SATA drives to the board.

Note: tested on v1.1 board. On v1.2 RTL8211F phys use dedicated
crystal oscillator instead of 25 MHz reference clock from SoC. Patch
should be compatible with both revisions, as in [1] solution.

[1] https://lore.kernel.org/all/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/

---
Changes in v3:
- dropped rfkill-gpio dt-binding patch as not appropriate
- dropped rfkill-gpio node from the board's device tree
- Link to v2: https://patch.msgid.link/20261016-ok3568-c-v2-0-068d68430e6d@gmail.com

Changes in v2:
- added patch for rfkill-gpio's dt-binding with reset-gpios property to
  suppress dt warnings
- removed mmc-pwrseq. AW-CM358SM has only power management PDn pin
  for both wifi and bt. Using shared wifi_bt_reg_on regulator fixes
  bluetooth failure on cold boots
- added bluetooth wakein/wakeout pins
- moved leds/common.h to the SoM dtsi
- switched gmac's phy-mode to rgmii-id
- added rfkill-gpio for modem reset
- dropped unused wifi and bt pinctrl's
- Link to v1: https://patch.msgid.link/20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Dmitry Yashin (4):
      dt-bindings: arm: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx FET3568-C
      arm64: dts: rockchip: add Forlinx OK3568-C
      arm64: dts: rockchip: add FIT-PCIE-SATA overlay

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3568-fet3568-c.dtsi | 332 ++++++++++++
 .../rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso    |  16 +
 arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts   | 566 +++++++++++++++++++++
 5 files changed, 927 insertions(+)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-ok3568-c-c095925b1e26

Best regards,
--  
Dmitry Yashin <dmt.yashin@gmail.com>


