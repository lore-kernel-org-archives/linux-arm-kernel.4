Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13D606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZ3IxJYm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y93vgs+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=; b=qZ3IxJYm7mFoMs7mSeBZlbe47K
	gTSeYPagRCgl3FLye5yOCKFwNnNjiQdpncWpvq2HZyEktcrz8LS1KyyGjU5Afk7TiIR4TEaNSDRl8
	bqKyj0tTU3Nfyt8olv+ZQAxKLVAkE0o1HP+M8TwcYntArYl4zPJtMMeI7axXntL7aaFFEic1W+OvX
	tRHKVjP1ft4Bnczfo5Rp1XzcNxdhJ27iWB5C8iGGsQoMxvABnzQHCMUuaHsZJnx2xax1K0B8Rzolr
	pClxWfBPteYiYi4JFdDkKLGVzMcOxWMZmGj9ULLhIXT8Q5cQE+fl6puZwdX/vfI/vjWt9Xe17ecYf
	0FmyVgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQ7-0000000Fwm1-1AYa;
	Fri, 20 Nov 2026 18:33:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTQ2-0000000Fwkq-3g94
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:33:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14625415e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 10:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199585; x=1795804385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=y93vgs+P6lwLVaMwEnT+BKjqKLf/la2lClN8a9GP9BJOx120NXUdzoLsOtGIHrye/E
         yVWV5ttj+ToRkVntmhRjl4HyDjBFLGa+FmptD7ut+g9bu97vpvs3KIEthmZeOa5k+FsX
         lNHJwqL4Vq4eA9lGMWdTJDB/Ob2whPMKW/aX5JwxSfsJeZrFWSGL8ytjxXUS0Xn4KDlS
         CEkPB/+70g8cnA+Qw4j5CPPKPzTP8CAqR0WZj0/rdgq6qibryih6A37gnOVD6Z2VvM1D
         TO6J6KPaYPXDs46mirIwUkvFzbM9J33Bx5094Qy1U4sSHIoK44vBZ+13mKhjlBduCupH
         mp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199585; x=1795804385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=OdPBil3VyqKB36HvE1Wg1dVJwT4HLRfnvsmk17wjYXujBkd48wBv0QcE4nBB4llruU
         R+5vOqFHH+WE7zHGxx3okwgLxAteJ/gL1F4BLf8w09eQoF8RxjzeKmGNSJE+MRbsUVcE
         m0O+78T6HxVTJl++tG1SVaDm2eD8IX3UJVVIV6ePgZxm7xsHisNuwuxrZhJXc+UqRE7G
         Mkzi6vaAaZRANKBwMloa2wr9BSxURgYt7VGWIsc5bQK0ZZcyQ87tysSb2J4nSIOwHajD
         cpmDJE4URA5ubtaeNAZ8+SaVi537H+kXDqkQUuKCCY0zpB8pAKnhAsNL9rfwwqo7R7GS
         yStw==
X-Forwarded-Encrypted: i=1; AL+hErEY6I7aiGu93g2qU5csItK66E1XQeShRgeTauloSgf3LKdj9ftsp2akC43XO78IEZsnvT7a5V/tLvVwwklvR/bZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/JXRlwFAcWUJ0MVTc+oHKi54PNRVybNcJtzCqdzeEdlv/Gzp4Y
	XK4hXXilldAJmmNAqeDizvCcYogCjS1gkgIsh6qUpE7TTaVHu8iIEH4i
X-Gm-Gg: AYBFou0c15oo5++nB10b1Jri2dGPlF3KnUGU1+ie/lmXePESPPx82TBXE/l7fRZMguh
	euoAMeyMU6etgWeq9GsS8C7yVbJ7f2MbVLi4qOZXyt8f+jB3cWSAcDZBymOELzUJgHuB2gR31PZ
	ADIRNnJ2nH/pWv0W7UMnfJrfj5aCQmVqjsmyTGnOu0nfMTBTXf4GUNsYdiYvXkPRYKZG8hELhq/
	86T9lmTgRsOy6H3gUK/yDqQdt66FUNce5LM/uZvulUle7ncqbbpWbDKiPvMyT9+qYMD6lNoZtkP
	6ERv2Zk5p20cvRrfA0MBhb+ecTNS6QKpbjmAgn4eF8OHknGiJ/AP7kP2Q2IrXptDTP6P2rQKKpP
	Upx5zquNDzieGyUduDLg9/pBT/T/l8xtb7gbVKj3lKa04T4bIMuFYW/dTZ1WQA71GyT17h4eP+a
	shOrSL3Xr5x/ABbeYFqabpSb3TmNBkWdY7GtfaXnfyIdhRatjowmIeGB4iHsBE5VY6uDBmjqMGb
	Ke4ZAjZDVPfHJbeLaYlxlUPhRoKqMXxQfCnvijGj9Q+8RJTXyN5VDOeINNBac9pylzm5hnJwg3z
	1R86ZHV4fJrIGcb4ST2+K1i/WmLRbhD3hRi7FXb4GVxUCHwZBS4QRVwbebXuMmDKsSlYLZTUf+5
	6hbKwjaoajm+Wa7r3cRyNwJwDxBYpoJTV9bwP+RUOMtYeXVY=
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr97174585e9.4.1795199584794;
        Fri, 20 Nov 2026 10:33:04 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:03 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 0/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:27 +0100
Message-ID: <cover.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_103306_952473_3A8ADF5F 
X-CRM114-Status: GOOD (  14.39  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch corrects the Symphony resource table address. The second
moves the M33 reserved memory and remoteproc configuration into a common
include shared by both modules. The third adds the M33 overlays and
combined DTBs, and moves the common include from the module DTSI files to
the overlays. M33 memory is then reserved and remoteproc and MU1 are
enabled only in the M33 variants. The overlays also reserve the firmware's
peripherals and disable dependent devices.

Changes in v4:
- Add a separate fix for the Symphony resource table address, changing
  it from 0x2021f000 to 0x2021e000 to match the firmware.
- Move all M33 reserved memory from both carrier DTS files into the
  common include, using generic memory@ node names.
- Move memory-region-names into the common configuration extraction
  patch and include the common file from both module DTSI files.
- Let the overlays provide the M33 memory reservations as well as the
  remoteproc configuration by removing both module-level includes.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Stefano Radaelli (3):
  arm64: dts: freescale: imx93-var-som: Fix resource table address
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 ++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 33 +---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 ----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 ++++++++++++++
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 7 files changed, 180 insertions(+), 77 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3


