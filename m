Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0366606EE93
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+bIYXmf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLL+6081
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=; b=W+bIYXmfajmKOz05SUqfr2RM9O
	wRleowaOMWnqJjWlfbEoGGDxrLg1XJMSe8U3J0M0tujerONcgToL/OZ27iDz+N9oLS5tG/k5Ha1xx
	lwuoPhaUdvtekMEPh7YjQxh4/lZPWpMqHdIJwcwPH8X0v8FftECx//QmIkn1prh7WM+FVA+/+lnCd
	N7ft5quHHQYQMnvPPT1Z61uJnfqtnW+6aYuMdrhj0WJDqsq3D60/OmLMQXaePUDu/jy0lOFj7KJea
	wp4oCtEr0tSfvD99LrhqFQEaMlSRkRsupMyZtn4ILixPz9gASpN1EydkMKE/esQ0CY6LhHx7IthAk
	BnRrfQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAmO-0000000Gl8v-1rsK;
	Sun, 08 Nov 2026 21:50:24 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAmL-0000000Gl8X-49I7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 21:50:23 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-36caa19b0ffso315696eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174621; x=1794779421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
        b=SLL+6081EgUuCyumu7av/Rc0wR0SWwfCmBnvI6QztILNGuPVegdo/9DCziivyA3SmY
         T5uT+syS4zIrbJTmmC2Y/MmMIdNMCZhE/k93XaNkno+vhe8Mt26+AqkvnPb9eCZAruLu
         gH1v+qnRUz+WmiYdPUeulPVQXeVEyKTcKxi4NJe84C9QRfZw4TRmsyblymXXedLeECg6
         7m5tDW5S4q4dG0E68dUmekrI4f9DueixEZQkfkaWzxyfNBCUCLf7GxNlDYVtvwWPXc5Y
         LkSow3aBYDP/6rDKzrK719YV/9Hi2IThhxvoulZTs6zKJHUQqs7kF+MSf6vVeFsCbNR9
         qYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174621; x=1794779421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
        b=nIZc2E6+ep2bONNK8EYjT/N+iGPyW32ihNHMaf09bNQmuI0+97Arf8ZwoNO6grprAm
         Wt0Iq5IrIppJd3rUQtNeCr/cxJ/9W+7E2AEBfK6mh6oAo+UyTrmMvTS6nCjLAdgAyxLI
         2gKj3qM9+O6NK00rcjKM32lE4aeHndEr1E6HQnQKEx8hZ32QJ0OmdaGTlg/Ak97dHWwQ
         Pd3dKnq1bjUwX/HgAAkk5a/RBBucCX+sqjvfBvKf+kxNhcS06ww1YLudQ8YS6R+ynaIl
         M3Z7rZe03x0YspEG4i/YhZxzECm0yMToxqXS6imERYE9+E73OhUdQWfSbKRagFBZRA4k
         hFHw==
X-Forwarded-Encrypted: i=1; AL+hErGtWTQsnq/i1H1PkOB2F0EBsWjH54GXbSTCATkxVX6vzgdn5J0uER1oUYfxQNtA6tml6zTZjsyHyt9UImOUHKBE@lists.infradead.org
X-Gm-Message-State: APuU4Z/wIQHT/3DUlr/hPboa+/pwM31EtfthYzI++Lv06sprsBo8IDNr
	YYsstJJa36fPuCEnB3J2ut4Y8uCLIEtYuYnZj2ndqUCgeJNeJqba0nOc
X-Gm-Gg: AYBFou2aVnagv4e1DnOch42J3UKsAHb+e8qAqJwSXUQYBK7cmaM0if6tJR9/glrl/HI
	aQ1VC2ujd+cBWELjCgbXrk59QgPDoglznRRR1EjS/Blo5pdHnrxU/axiLuFspDDCO4UCDoWsaZl
	M5P0hA2lOfB0yLk7I3kWwyPmOCp4+EPVbijXDmsSUw3nW5Xhs7j1hTb8wZKekgWk2SC9eVFT2oC
	jIfgqBo2jAHd018/FvBQ+iKz6+yDBDlkser6W94bAp4y0R/AoqIiKuQQAkijFf2cpbjU+27WeOt
	7ydLss9N7thNHk0QAw4+FI33Mw5acaFfAXtosPpNsHJ5SBDpfXEzr+ZxEDe3o29rjIJN4t6vs6G
	KcfI2Ku+SKAyLuhggbFAAy4DEap2MVM75sQT3e18UwNITIhPDvAatWkSSrV/suCWDwsKItaeE5l
	150akZwRfc/pW8Wmi7l5Q/mTtooLX02paoSOSKn8qVaGQJ9L2NWsgytHK+d0LfmpY6ODHjK6WgN
	vfFozLzmSKTBUUSZd6YHf3C5Ekw0xDGNqfE4MeLhJq3gibv/ZEpt9BC5CNSAec7viGAyF7JbBH9
	5BzZChUQMkcaRSrE4gjtGuMmPAszPp8N/GWNWDKnZctERZ5Ge88QcCAnBChcR7WSTTM6idA=
X-Received: by 2002:a05:7300:2215:b0:36d:48e:82de with SMTP id 5a478bee46e88-37256615312mr6819539eec.12.1794174620977;
        Sun, 08 Nov 2026 13:50:20 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:20 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Mon,  9 Nov 2026 05:50:08 +0800
Message-ID: <20261108215010.351256-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_135022_027973_76256EF1 
X-CRM114-Status: GOOD (  13.18  )
X-Spam-Score: -1.9 (-)
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

This series adds device tree support for the ALINX AX7Z020B development
board, based on the Xilinx Zynq-7000 SoC (XC7Z020-2CLG400I).

Note: the "alinx" vendor prefix is not part of this series, it is already
present as commit 1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX
vendor prefix") in the Xilinx for-next branch.

The platform consists of two physical layers:

1. ALINX AC7Z020 system on module (SoM), in zynq-alinx-ac7z020.dtsi:
   - Xilinx XC7Z020-2CLG400I SoC (dual ARM Cortex-A9, 33.333333MHz PS_CLK)
   - 1024 MiB DDR3 SDRAM (2x MT41K256M16RE-125, 32-bit bus)
   - 32 MiB QSPI Flash (Winbond W25Q256FVEI) with 4 MTD partitions
   - DevCFG FPGA manager

2. The AX7Z020B board (AC7Z020 SoM plus carrier board), described in
   zynq-alinx-ax7z020b.dts:
   - Serial console via USB-UART bridge (CP2102, MIO 48-49)
   - MicroSD slot on SDHCI0 (MIO 40-45)
   - Gigabit Ethernet via GEM0 (MIO 16-27 RGMII, MIO 52-53 MDIO)
     with JLSemi JL2121 PHY at MDIO address 1 and RJ45 link/activity LEDs
   - USB 2.0 host via USB3320C ULPI PHY (MIO 28-39), reset on MIO 46
   - Dual CAN buses (CAN0 on MIO 10-11, CAN1 on MIO 12-13) with
     SN65HVD232 transceivers
   - I2C bus on MIO 50-51 with 24LC04 EEPROM, DS1338 RTC and LM75 sensor
   - 2x SMA AD inputs and a spare differential pair wired to XADC aux
     channels VAUX1/VAUX9/VAUX12. XADC is a hard macro accessible from the
     PS without PL configuration, the channels are enabled via the
     xlnx,channels property.

Tested on hardware: boot from SD card, UART console, SD card, GbE with
iperf3 (940+ Mbps) and netdev LED trigger hardware offload, USB host,
dual CAN (SocketCAN at 500 kbps), I2C sensors, QSPI flash MTD partitions,
and XADC temperature/voltage plus the external AD aux channels via IIO.

The DTB passes CHECK_DTBS=y and the bindings pass dt_binding_check.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   6 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  72 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 137 ++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

-- 
2.56.0

