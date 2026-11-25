Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w00dlTc9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHZ/ZdKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=; b=w00dlTc94SDKrEuGuVfQpyA4oi
	uVZfsx6NGOWEIc/mStJlT4v8BkID/GpcAHF4kHGFlNrOKK2GGje49+m0GEBgmHfaOF9XTc6tgKg1J
	gFYImOyPMM5gm40+YitNBFwGsW0pOKGnwgzg9S2gyg8s3uk1AZEOP4oBhNgu/bQZp0FpyMHYH7dFZ
	MZC4oLmKA2xZTaeqbWy/jW0osmZBjGyW4/Y2vS4LfKHqT6vpAxV6/P+/A0UJ9wP0UgzzJmQinTWzd
	GZwyfKyB6Hg1js7G6XPCdrcSqYFG+e8ggAYimtIU591vX/t3cChqtUzChP+xReOtc/vWG79EmLsYW
	5RGzZQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBTt-00000009h7w-3GdZ;
	Wed, 25 Nov 2026 11:48:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBTr-00000009h7C-18Mv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:48:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso70216085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607285; x=1796212085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
        b=vHZ/ZdKshaq82o1SuNRcYw1hpFwm7bjfzLObfCXZNa2t8tJzB+7raUvyK2n98MyhNW
         lH+xyZ00HZoly+2J6Gs8S9ID0bJT9vXQFfl6rqsVp+wkiTfoZfcHlJybJbMBTs98LAeL
         FOuVG1AFWe91trILEMLITQpaxKYqCV+QD8oavhPdJAjqAHQC7zV6uxfTfNb1rCysm5ET
         bgm2bV4ycpmvdae/n3OGJr2szWt/9lfejsh/y/6UpAEVOLg3n5OI2xTAk1pKBmafdQc0
         lJonl2F44eNRgXi9bro8kTrVbbUflGlGP6Y18fh3rjK0NHMzoI/j5NXD4pKQ6KZnyDqL
         9hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607285; x=1796212085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpR5O1RFGnmEKRzAE5aTOTm5Hq/TE8oYJvYgkp4gzQg=;
        b=FwgvYiyVnTIfyjGQh1LIU9QbI5GfghfhV4FHYTHoLYkMeF2M8SXiRplqo9vVY5A24R
         Mt586DZPP3bApHg1slpStENX28ixHC4mBAg4DvTwCIWvOvVUEAfamDzU28SZnteWU+JU
         nQvfwuqxaP3FJ89hlnIUKs+kTi0Lh1T4u4lSn2eWvEPZdkV+o/GjDpfanfQhhYcDp9qz
         gs/Fy5tOq8ATp96nSoZS5SNf9xmkLOPbppgPZBB3LMaqIlxJzgswDDJvVX3C1CzOG9yE
         QCMtC70Jk+oiVD1mqyPA+N54/4T2RdpZCJWzAX8RRnu+khtKoB1R1AhQ54sXsq3wIgJd
         72tw==
X-Forwarded-Encrypted: i=1; AL+hErHEQKYl1n0aGpnPtWVGT5L6rVJofr8glPzRBMQh6d533K8H31vV7MWKlnBCQ0kFpjBZV9pqn608y5Kpxhe7M8qT@lists.infradead.org
X-Gm-Message-State: APuU4Z/EFjTZc6tZam7yFGIifxodkyvN8MJokknMA/KvGziFoFR+FECg
	gm4YSxf8DDTfGE3vLfeRoKtjdYiz+7hDe7HBcORyho00koE/yZsRe2zC
X-Gm-Gg: AZFdTZf3mPaVrd9tdw3Cahkb3TqnTp2deTtTKhS0UpGi+JiwcNvn9KQ39lARlTkT/+V
	wN4/TxTtzKp4xOExdrXuUpaDo/w0SihTle9ICRxFZRFC2yY/4T8WGin0XCKbcCndM4K/IPG6LkZ
	rbvVMcewSA+uKHwjEiscSQcxQymdgjnF3TFRNPnjKw80WeGRJ6wc7vM/0ZVaWJLf2lUHrMXtW0H
	s7e8MUijbS7/0+9MnRBzwsEi6r4Eo0WhfEfeuNmtRO/3uC9wSUovi9fQymBirYh2oGVbyneToFe
	y/9KmnvIBu+HbF+zagWnrbMCMn+Trkhf67QhiyRDO5I3nGZ7XzsL1X8ddWbmkuqroC1GeKQnMh3
	7xIMDFqLqfpxzJavK+PqUhPJ6DITSskZdrDV0cHWqE+xrKNGwxFn9nln1Do6XkxGA/ZEDOoQfaj
	0n3Xgj9q4e3HHsaBQyx6+9VogUY5yszqH1aEeh6/Kl07hTwchTpJVa8zu6UFC23QpXpAL0Zmro4
	xx2DPUPd/NZK9fzqxesbLrKUf8uOcyzOPU+dV311lR4zwlxv3wb2J+i/uYcy6OGrLNbCMmgVXOK
	/pbCVHmK6O80ne9nh76vNwVkVGGkUlifk9SPSG/fZp1zrvmM+742Ltm100pbBVQBfwKAWpIdRZQ
	EbMYZod82UsHokh4JuHw=
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr350066075e9.0.1795607284755;
        Wed, 25 Nov 2026 03:48:04 -0800 (PST)
Received: from saeedvft-ubuntu.tail2d4112.ts.net ([46.100.16.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm514068355e9.15.2026.11.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:48:03 -0800 (PST)
From: Saeed Nourian <saeednourian82@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Saeed Nourian <saeednourian82@gmail.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add Firefly AIO-3588Q
Date: Wed, 25 Nov 2026 15:17:55 +0330
Message-ID: <20261125114757.654051-1-saeednourian82@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034807_330493_340B41FF 
X-CRM114-Status: GOOD (  19.20  )
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

Add a device tree for the Firefly AIO-3588Q, an AIO carrier board for the
iCore-3588Q system-on-module.

The module itself is already described by rk3588-firefly-icore-3588q.dtsi,
so the new file only describes the carrier: the two RGMII Ethernet ports
with their RTL8211F PHYs, microSD, the USB hubs and ports, the PCIe 3.0 x4
slot, the M.2 PCIe slot, the PCA9555 GPIO expander, the HYM8563 RTC, the
fan, the LEDs, the recovery key on SARADC channel 1 and the three Rocket
NPU cores.

Besides the board bring-up itself, this series enables the RK3588 NPU
on mainline. The three cores and their IOMMUs come from the SoC dtsi
and are bound by the Rocket accel driver; all this board has to supply
is npu-supply and sram-supply. Testing details are below.

The first patch only adds the compatible string to the existing "Firefly
iCore-3588Q-based boards" enum.

Tested on hardware with Linux 7.4-rc1 (for-next, e19bd795e8, plus this
series), booted from TFTP with a RAM-only initramfs, without touching the
existing image on the eMMC:

  - eMMC comes up in HS400 Enhanced strobe, all existing partitions intact
  - both GMACs bind, RTL8211F is detected on both MDIO buses, and both
    ports link up at 1 Gbit/s and pass ICMP traffic cleanly
  - the GL3523 hub enumerates on both its USB 2.0 and USB 3.0 side, the
    four type-A ports are its downstream ports and a USB 2.0 device works
    on each of them; the onboard FE1.1S hub enumerates on the EHCI port
  - a microSD card enumerates as UHS-I SDR104; no card detect events were
    seen, so broken-cd is set and the slot is polled
  - both PCIe host bridges come up (both slots were empty during the test)
  - the PMIC regulators, PCA9555 and HYM8563 (rtc0) are present on I2C
  - NPU: all three cores probe and report "Rockchip NPU core N version:
    1179210309", the IOMMUs attach, /dev/accel/accel0 is created, and
    a runtime probe through it passes
  - the devicetree has no deferred devices

The hub RESET# lines are wired to the PCA9555 and are released with
gpio-hog nodes; describing the hubs themselves is left for later.  The
display outputs (HDMI0, DP0, VGA through DP1, eDP, DSI0), the Type-C port,
the ES8388 audio codec, HDMI-in, the camera connectors and the 4G/5G modem
are not described yet and are left for follow-up patches.  PCA9555 line 3
is used both as the user LED and as an SD power enable; only the LED is
modelled here, and the card slot is powered through line 13.

AI coding assistants were used to help prepare the DTS (cross-checking the
board's hardware description and some of the edits, mainly the USB hub
nodes). I reviewed all of it and tested the result on the board.

Saeed Nourian (2):
  dt-bindings: arm: rockchip: Add Firefly AIO-3588Q
  arm64: dts: rockchip: Add Firefly AIO-3588Q

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-firefly-aio-3588q.dts | 434 ++++++++++++++++++
 3 files changed, 436 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts

-- 
2.43.0


