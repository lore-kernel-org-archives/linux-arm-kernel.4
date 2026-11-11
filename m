Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BE2606A887
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nK/FI+I8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rOrf6fbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=; b=nK/FI+I81VXVsWJlYWonSaeToB
	JG9TW8gSuei8GfQ9IN3Ac8IgQ5tzdbwIV3nKQg8voC6fPaeTY/j1jSXk5den/KEg1AbmD54RPOZth
	PVqQ4jcTzUki5qQf/GR3DPUCq9OacTPlbz4P7gpACs07cxsYSL8RH1wEUR6ELlzlT3r8wa9UhtaN/
	ddsy06q+6zQhEAWcsuYBoC5IPRMclVtbeRDmMXLPk+Zx/pB8yeMms4t6fBsdX5Ls22Ej6pSAxTJEG
	c9XAJlc3xnoPi8EgJQheBXzd0/eJLeHkM7QPQTFXQDFxc1ATCfGAsTSgl9ZMJuGmhKJky7rRMD6mJ
	ReYYDFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hm-00000006sJT-2H69;
	Wed, 11 Nov 2026 13:49:38 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8hj-00000006sIQ-2J4L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:49:37 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b3a332105bso14612367b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404973; x=1795009773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=rOrf6fbHXws9xC5a6kvxQDi7wx6hWSZPRZdu0w6F93J4J6Hv6DjKr2ktiGcQCsRsQE
         I8lGbSgeDn9ldBp+fV96A9l/itQyIWYzdlmJqz1LPw9xne0wlNvKUbXvrVCr+Bw0YaT1
         ujvmmPTz48XAwQeqbaH+I9VQ6GMEspm3LHlcAo6ZaN/0rxnWh3UW8Ie+8fnQNiiaxqpJ
         xvjoL/L4YiAvx8XZJzSsrRT40yV0FsKlCsZkMCM9gAJJ6I+ZYDknBw9WVEGC6xKbEPRH
         w6pRCM2MnsfwGkk71y9yqe2uu+gjeJO+qE02IFv4X6kkwsPSzsEpKpOu5wpx++TcLu28
         Sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404973; x=1795009773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXy8NjisYDxdyWccLLdZy0AuSzDlkdMHnGHG7lMtXcI=;
        b=m9NYHXNcfgwiEar4Ce4gPl2PwY7zLpNge/D1dMQLk+Fb+qv6CGgzARqrXZBYlQXjGx
         qIEW+LzB7+mo2jweMwNGv/tX0yiWmd6kf8B/u9ao+gfA1mHgc5lekYafR3qsoyYAjG0w
         Nf60I+lXbgc2GNdx8calkM4laGQ5+V4Wdu6QiVHBamqFI15A4VihO7shmNl7x5GJ+ZIK
         THraDctamRGK/UoDyxEQfEpUMapgqGt2BHpgkQTz3d4TLUzeSRFVEWvCpEASr8o2FWiu
         wBWbqbhdCA9wPITho5qbNIVSYUfDKxq/HFsq73/2waz+647sRfpYZ/re5zAsRBad8uft
         AxhQ==
X-Forwarded-Encrypted: i=1; AL+hErGyYM75UGT7b+ptVEn9vtU75jTDPQxcNAlmSVwWlxxvJMgSfN+DmHyoozBbytml8XPHlu2KUzfbsEz3QU4lK/FV@lists.infradead.org
X-Gm-Message-State: APuU4Z+dUEgI2i3fLKurZKuNfMC58W1E8OPYBV+WlGregvLfftamk9By
	cjEV+gIqzd9tfS3NPR59CHrJwjCOuaBTeXGf5sKWUVkxIT9FY8W3+8KG
X-Gm-Gg: AYBFou0FvpVXrdJYxpi8Q7/nir56EEs6DzfPUTwIz/VbvpxEfGFOnUuQibHFX6eVLhm
	m38JYIEkVPa0wSHbcrKyFwF+NiqSrZ43NcY+FNzSAnM0yBcP/khr2MpjdVME7uv1R8CGnahEunJ
	bdAV/1y2xZXArlmLYRIVr1ainm1uH/Y5pYlWcUVr6oCkd4ZTuqEZU9LU7bCMMDYFJnxJ7viLQD3
	yTSRb4vNZ3QdnoO2ShBPR9QfEAfz8A4lYOHKCa5fmp98tHjcR5vi36mM+PoFAGXePwOukd1xYbk
	GSn48lOcs9yzoJR85LD5yrV21TYPMIff+VUS4cxe0Z/25Ii6wWouxKOYKEJnj8gNvNcbukEjxfE
	7n7uKQkO80KOKiWPHmANlkU2ENUbuml0eYEkcnN4k3NopZKwXZ7dy23RLtnyftWbH5YeVCrtmat
	M6bxi6e4OK06396X5f3Kxtk9NK4D/W6H4b/4sO0mEHyYG+K4MlCOEot3BqHRUslVukfhhbGGcTz
	47dWkFVIsWuPHjPIuTBGwkfpKj8WM/NJF3g1jM+4Glwtoy/Kue1znroISqbIQzord01TV/s6/ei
	XfbUKJBcdCMIS2nVjazyECmsvOAbSw3KWwkym/3UWDp9UYoDkabig1dyqKWmczFUO4JQXwpMVtT
	LL3DpY2iHBHdvxiHkAoB8FzD2PspyZ/0Ja5gz9Dxq3EWSHsKWvb/3Jiu4HVdETLPQ9cqeASGr7v
	U=
X-Received: by 2002:a05:690c:399:b0:873:5c6b:a31d with SMTP id 00721157ae682-8b3a80c2c99mr17468437b3.23.1794404971972;
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:31 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Wed, 11 Nov 2026 10:49:14 -0300
Message-ID: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_054935_607289_4877A565 
X-CRM114-Status: GOOD (  10.00  )
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

Add a board DT for the Radxa Cubie A7Z (Allwinner A733), based on Enzo's
A733 SoC description and Cubie A7S DT [1].

The A7Z differs from the A7S in its PG supply (BLDO5), the SY8089
regulator feeding the PMIC's BLDO and CLDO inputs, and the microSD
card-detect line, which has an external pull-up. The series enables
UART0, the AXP318W PMIC, MMC0, RTC, bank supplies and the green user LED.

Tested on a Cubie A7Z with v7.4-rc1 and the posted A733 prerequisites.
Eight CPUs, R-I2C0/PMIC, MMC0 read/write at 3.3 V, RTC, LED, PSCI
reboot/power-off and CPU hotplug worked.

MMC0 card-detect hotplug needs the separate A733 EINT-mux fix [8]. The
tested DTB also had a local 16 MiB no-map reservation for my boot
firmware, which is not part of this series.

Dependencies:
[1] https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com
[2] https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[3] https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[4] https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[5] https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[6] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[7] https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[8] https://lore.kernel.org/r/20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com

Vinicius Pedrosa (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7Z
  arm64: dts: allwinner: add Radxa Cubie A7Z board
  arm64: dts: allwinner: sun60i-a733-cubie-a7z: add the user LED

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 298 ++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
prerequisite-patch-id: 5d657469bcf35ca76bbe291203363403e00fab54
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: 4cdaae8c384016491ce01e6e328acbb347debd62
prerequisite-patch-id: cb253a02b7d81079cc1ea4f75def94564468c80c
prerequisite-patch-id: 1f869e65014f3cd678bab7f235cbcb14c60a1608
prerequisite-patch-id: 184825f979a16a0b6900c58ba342899747da11b4
-- 
2.43.0


