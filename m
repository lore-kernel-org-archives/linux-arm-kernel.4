Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yxxh80v5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8eIvoFr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7XAv450XHDg88lcGf64auwSEy37dySq1HHP//7UhmG0=; b=yxxh80v5jHocpCDr6kwzBRU9ej
	g+oDNRzU+6mazir0Y1Bp5yv49aTlA4t0XlmHDqi24Ld05KCUA9hTpbA+z0FhYKyTBOtcbv5zf6qtj
	Ok98XXWrYoTgC5oYHRdaxlK/1vUOlNPvGO7034mcryym2/iMvES8H2lfE7lgdBRdFccM8VT5EbfeU
	kFVroJTqG4Xu7RIW81W/oypVxnyAvy/4eAjd/tjYGYy6kvOSHf7pypSPABvawa+pvYf1HZthvcclZ
	30Ye+iEVx5ZXX4FRMcX61uJFcpc4ePrJRfiaBcLkvw3cEoyCG+6pl1omLjC+JKAngCVfbIvidTyvW
	CXz3xkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIh-0000000HWyW-42Jr;
	Mon, 09 Nov 2026 06:56:19 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIf-0000000HWxm-1YY2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:56:18 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1962471eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 22:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207376; x=1794812176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XAv450XHDg88lcGf64auwSEy37dySq1HHP//7UhmG0=;
        b=C8eIvoFrNaKBT8ij4EwGZ4PsqTPTh+4+SnWz32lnTqLVIPpVITOZnAe7iArC99Sj9s
         3x/5LkLxsKtf+Qm4WjQ4MiPgUH5iDG2PGs1o467UiEKFJTv8SXC87lwvQ9OyGuv6oSfy
         wsC0X5fyjRMf/BarlsO5NwIPIChqyDIZsLKfsUWdmIbXfwScZOOlaMeQyDUcZ3nZHCEb
         gMFjgznk3hK4FcrujDRkNEX4dHUNZJUq7dDq5tBJTY0KWDGChEL4ewP3jPFyaDb312wI
         Qj9W5P2oqTZG+bn3hsnHL0cV0ZwQQbSat41NLaQzVL+evEx3RnKnzy70K72/Ca5ju90/
         uLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207376; x=1794812176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XAv450XHDg88lcGf64auwSEy37dySq1HHP//7UhmG0=;
        b=DiK3N6oNM60bo7ClFAb+hW7MQ2F62D7CiwWiSKQtudxsoYdYmOzj4ClQBMUB7G3cJY
         7xaS5IOmgNjSX5dRjOvSZeSvJYU9UchNbpfioiuh4K0ewGThvKmdlnl1m5sOE9rJsq3F
         CiRTzWzmlUAsBb3JrjpyRLEHFgmwV7gDUm939puA9QxlBevPSxgdJTmUX86IbtTPabqR
         PvNj2xC+5A1LGrkH6ZRXQr9VX4l3Dn0CW2WiyMWevCYI4epJemQ1e30cqYTQ5VWNIYgT
         DYrX8w7uRQaFZy0gp+lWSqhOVj/S/BFG5T/cp8kWC0pYEopqY50rdFwHeZxMta1Z8BeY
         fLlQ==
X-Forwarded-Encrypted: i=1; AL+hErF+bzESTOicmS+P8yqdBuBB3j8pmqilY0GMhrNWSqgytbqvnrJlgpLI3z8T/ZjHVWy/hi0Mz3JJNVfAl9kGzecj@lists.infradead.org
X-Gm-Message-State: APuU4Z+mdRCcehm2W/dF4FJ76CjPQ9KKXsJgKLFk1TCmoX0nNXsikLxz
	u7JqS0RAMNEQuvkVuEWJyCH8ngqQK+cVHnRG2WfJ9PmpmG/dXR3ZQwTe
X-Gm-Gg: AYBFou2Q5LXWOLCdBdD6wRWDyvF1QnFtNs7+yJN2WqAgvO1U+ovhIEpeAfDsAwtc1Fp
	DhKtBQJuzbQOXJL50VrI3tpjfFl+kMVXNmlYIsMdFNUu0QVstEZ99S9yA1HpniSxE3z/EJAy6yW
	Vd50LRsyKnRqxzeu7bROPniKbGz/kSGEOfI+n8M+N8SESDfLcXe68vkgXGQLe/mynUWd/VzwFbj
	PWjOKPHkCHqx3SDukjx7Ur2oZyh9GDQA4YSRBZdPZgSfRD5Y1CIqYfUtokeH23tEJouBvI87cu2
	a3FkoSCQv4lqHp3GbIOs/tB65wMOMmmDFQaoo9uUQTA7IvOSat9+KxbRj9UK7Wq0ySZh4iqAJ4i
	h/q9MU414fcuyP1rzzVGrD3Jy/+QHu4G8x7oPxn5e5czTgs28Vid6u2JER+I/JWtXj6QFXnxkRK
	PnVQp2f/zaw4a9Wjhns2EZ8zbNLv00ticZMW9ACQPM8134ZiNZJ5KJTzkpDigrtF2KoSu7HRYHQ
	Sn/vRxp7r5fO2gZeOJ7xiiW9cMnOMMooXqRGpjfDoVyTu2wrVfvV1SApe+OXo7KvPYba/xnAX8s
	qctbqe+5WmHqqrTGtOQIqEQcKxi2e+iQ1g86dDIbZoknKazyhqycp7FPpKULQkCCpta2F/Z8O+O
	KGudMCAoFRtIG6FUH/DGwRfn5eO91bdi2Wi/urXE=
X-Received: by 2002:a05:7022:2641:b0:14d:cb67:afc4 with SMTP id a92af1059eb24-1b39ff1d210mr4646567c88.41.1794207376356;
        Sun, 08 Nov 2026 22:56:16 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:15 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v8 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon,  9 Nov 2026 14:56:02 +0800
Message-ID: <20261109065606.62641-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_225617_617768_B7FE45B4 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v7:

  - phy: add "depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH" to
    PHY_MA35_USB, so a built-in PHY driver cannot be combined with a
    modular role switch core (link failure on usb_role_switch_register()).

  - phy: restore the PHY reset fallback.  If the PHY is already in
    operation mode but its clocks do not become stable, reset it and poll
    again instead of failing immediately.  The reset is still skipped when
    the already-running PHY reports stable clocks.

  - phy: gate the HUSBH0_GATE clock dynamically again.  The clock is no
    longer enabled for the whole lifetime of the driver (devm_clk_get()
    instead of devm_clk_get_enabled()); .power_on/.power_off enable and
    disable it, and .init enables it around its register accesses.  The
    gate can therefore close when neither port is powered.

  - phy: nuvoton,oc-active-high: keep writing the polarity bit
    unconditionally, so that an absent property means active-low as
    documented in the binding, regardless of what the bootloader left in
    MISCFCR0.  The bit only affects the EHCI/OHCI host ports' VBUS
    switch and is irrelevant to the gadget use of PHY0.  This is a new
    property in this series, and no mainline DT depends on a
    bootloader-programmed polarity.

  - Patches 1-3 are unchanged.

Changes since v6:

  - phy: update the copyright notice in the rewritten driver header to
    "2024-2026" instead of "2026", preserving the original 2024 date
    rather than dropping it.

  - phy: split the unused linux/io.h removal out of patch 4 into its
    own patch (3/4), since it's unrelated cleanup that predates this
    series (the driver has never done direct MMIO access; all register
    access goes through regmap via syscon_regmap_lookup_by_phandle()).
    Placed immediately before patch 4 since that is the first patch in
    the series to touch this file.


Joey Lu (4):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 ++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/Kconfig                   |   1 +
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 313 +++++++++++++-----
 6 files changed, 419 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


