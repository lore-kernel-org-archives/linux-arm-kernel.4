Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC13C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1eiNciwZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oE2k1p15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=; b=1eiNciwZmYqDOpopC+skZ0dqCN
	X0yND6ufBp6uAe9bqZHd/o3yyWBTxsU3EpDE+6CDZ7Fcfw3MMLQW1MfdHXBIgYu/bXMX4ZjMHdart
	BWfmxDy57Zc5CIUp35r19TR36DtSd7x3k1W2f6DngZye1xIHE3JcfwC4p2kKQOiBcxONEModrPppB
	3M1hfIyf3qkCEJP9bUelhSLmXVIoNpsBHdD6x4Pe55Ld8fjeYNBBPxjUnua7Md0W2pB7ddywrJj1E
	ujk3eK4IALeI3ZyMGTW1ydp8Jn0dQQ8ylTMtveCPOL+IknkDeTjIjF8N6klPtYCCc7m6xnSIeUv2+
	BDM4j+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBp-0000000ETrv-3OoN;
	Thu, 26 Nov 2026 20:35:33 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBm-0000000ETr6-30Hk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:35:32 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6ddef424972so5929870eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725329; x=1796330129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=oE2k1p15IG836QVtFMHcriXcAfAdZxBKbbHSHPuT+7l6B9eeMOZa8sUUzjnS2lLg1v
         CUROOLHfJsaA/M9EMleaa8HLXAUo9XlVMRjGjKe7wxkv/IUKJfZnIUHEuPuT2Yhayr4t
         VtQnFobeGAtcPjk6vGknGkqieYxKdRNmGG3a7Fc3+0qW+Eac2okNhXgKhd04sJWmw4d1
         iYBxPuTwdnjrCGH3gJ3s6IGMmTfIFb2MgtKwiE8pFILpn9Yg3ZoNRUCXEmF9zgmXqduJ
         4SySscyHs9h4lRLQ/adn8l3NmHMQ6adtXUC4oPGV/59PZ+4E9T1V0+z/Fg+B6bjAGmOb
         CEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725329; x=1796330129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqO3yiYGog30zyUcuMfbgRi3wkNhqWosSS3VtCYqruE=;
        b=FZrxAaUP5F5V4RSVD5CodaQqt/ULe0mqX0XtYzHIT+jUG2XFOW8HGJOwnIwYjDJJrd
         J3UCIfZjmF1/92raA9LCgIz2oMh49oSzCtfrqdpyMB+gQUJN53pHp3SuOsKdVQ+cGRpp
         RavhWyNve66YFk/KuJSfImr35E2PkolsDJDC3YdHTVShoKUnJv9XICRF+nFOmH3M5Dp+
         HiFcEvUk4U/NO3VFIzRI2aYtL7cY1bn0nDpNwKrcrPXmOYYvDZlZCZRtNINmgxZZrdyC
         GtbD9e6CsDkYObvBtov4Ykf/L8YoVZjXjQpAQa/KCzIcVljuIjEnL660LzS1x3euWROi
         Z0fA==
X-Forwarded-Encrypted: i=1; AL+hErEgEcdXDwNAr978dPZhYymS7hBiaA5ZkEXarYSH3bVAmKMnDP836TwOO6jh7fNe1MqyR0CI3rbbTYK5YcqxZkJW@lists.infradead.org
X-Gm-Message-State: APuU4Z/m6bzLK4L+/19dbyGbg/6fm0L04NSbgPRAMu8H/gKB59cdWchi
	AxXu92f6sczrSGZX1xfeF6cDJYoYxH8gH9ajm8cpfwSSSRzA/x5iBvcg
X-Gm-Gg: AZFdTZcuxci5/WQiVQJUkthryzvrVpYQL+G6YJaaTOW8wHO+UDCP+hkDfIlAMC6jsqU
	ypkKJi4uu972qCJNpQLr9P+2PsP3Ebd5bBEhdMjpTTIXPvTTdsKcvn/2G4lqGif3kMSyEaJNAZP
	fB9cL09UkosD3QzMWXjOzx96NXp6w3S++9lsYBzyjb7/BN4LQ0Bq40nqUjsPpQM3jMrl1tE7gmM
	1rFzLivBtSKbCGuhI/EIYRxAagETk5XDMYR33lYfQ5hfv6zvXB7rce+kYfbduD4l1Zwl2jx6qzJ
	1cIqjCkm4E/1bJjkbmdYMT0Q546OzaychrfA3k9zoe+dGz4iynMHWK0q8CzSfQpwMKke6sI6zY9
	a78bOTEpwCxqgb1I27c1ejJbEbLattAE530X2LAoGC9OXaCBe0oMtw6KUzmWaSiHvhekWD0+ooN
	6VZEBshwmzdb+q1hslgnNMS1ilgPxQdoWrQVoO500UxZfwbaLkjL5lkusbBCvHMzV5wYGVhDI/o
	RzSrxbh2N/03+u9UZdEI30zXi24m04QgxKNBeHUteDRm49sAbsBWN3vyp/XQk0Xw1o85+CDYFim
	zyenPQmYVqu9mQ9rVTOBjWjPXXkLFOCXZcJgHgRfPUuHUrcjDcZVhAxlMlMW3G+dem1TSaeDIzl
	KSfLTlg==
X-Received: by 2002:a05:6820:1c86:b0:71b:790a:9ee7 with SMTP id 006d021491bc7-71b790aa590mr6624976eaf.67.1795725329526;
        Thu, 26 Nov 2026 12:35:29 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm18946578fac.8.2026.11.26.12.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:28 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 0/5] arm64: dts: allwinner: add A733 and Radxa Cubie A7 support
Date: Thu, 26 Nov 2026 15:35:26 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123530_764413_2E04BA48 
X-CRM114-Status: GOOD (  11.18  )
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

Add the common Allwinner A733 device tree and initial Radxa Cubie A7A,
A7S and A7Z support. V6 adds the tested A7A and A7Z board descriptions
and their shared pin and binding updates. The A7S ELDO1 voltage range
remains open pending Chen-Yu's answer on LPDDR5 VDD2L.

Base: sunxi/for-next (abcb290978fbfddb56fc77171918dd8b8ef3e81b).
V5: https://lore.kernel.org/r/20261121-a733-cubie-a7s-dt-v5-0@gmail.com

Schema check: arm/sunxi.yaml and all three DTBs with arm64 defconfig
and W=2 CHECK_DTBS=y. The three schema prerequisites, in apply order:

  AXP318W PMIC v8, 3/5
  https://lore.kernel.org/r/20260910-axp318-regulator-v8-3-e906a61a7f3d@baylibre.com
  Pinctrl IRQ-bank RESEND v3, 2/3
  https://lore.kernel.org/r/20261124215048.42074-3-pmazzini@gmail.com
  A733 UART binding v2, 3/4
  https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com

The A733 CCU support is in the base. The remaining runtime dependencies
are the full PMIC, IRQ-bank and UART series, firmware clocks for warm
reboot with vendor firmware, and automatic pinctrl voltage detection:

  https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
  https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com
  https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
  https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
  https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

The card-detect EINT-mux fix is in pinctrl fixes as a256b8c8083e.
It is outside the stated sunxi base.
https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Boot: the v6 DTBs have yet to run on hardware.

- A7S v5 booted with vendor firmware and the runtime dependencies.
  Console, PMIC readback, MMC enumeration, LED and EEPROM probe,
  and warm reboot worked. A follow-up with the EINT-mux fix read
  a matching 16 MiB MMC prefix at 50 MHz and 3.3 V. An earlier read
  from a different offset returned an unexplained digest mismatch.
- Norman tested A7S v5 with his own firmware and a 2 MiB RAM
  reservation. He verified PMIC readback, PMU counting and overflow
  on all CPUs, MMC reads and write/readback, EEPROM reads, visible
  LEDs, warm reboot and power-off.
  https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me
- Vinicius tested A7Z v1.11 with a local 16 MiB RAM reservation
  and a subset of the dependencies. Eight CPUs, PMU counting
  and overflow, PMIC probe, MMC readback and the LED worked. He
  tested card hotplug on the preceding DTS with the EINT-mux fix.
  https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
- Andre tested A7A with pinctrl and PMIC patches. MMC and its
  card-detect IRQ, LEDs and EEPROM reads worked. The external RTC
  probed and reported an invalid calendar format.
  https://lore.kernel.org/r/20261126172253.1097838-1-andre.przywara@arm.com

Still untested: physical rail voltages and CPU/cache topology, EL2
interrupts, ITS/MSI, stimulated PMIC/NMI interrupts, suspend, 1.8 V
SD signalling, A7S card hotplug, EEPROM writes and write protection,
A7Z v1.10 pull-up behaviour and A7Z v2.00.

Andre Przywara (1):
  arm64: dts: allwinner: add Radxa Cubie A7A board

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

Vinicius Pedrosa (1):
  arm64: dts: allwinner: add Radxa Cubie A7Z board

 .../devicetree/bindings/arm/sunxi.yaml        |  15 +
 arch/arm64/boot/dts/allwinner/Makefile        |   3 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 333 +++++++++
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 349 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 671 ++++++++++++++++++
 6 files changed, 1756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: abcb290978fbfddb56fc77171918dd8b8ef3e81b


