Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4F60A5BE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cpBK88U2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRJs2eHM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=; b=cpBK88U26OjIJYmNAVopEMdbqD
	18VUqfKhWTjTUyk/f1lDXFo3QlkPxzldcQxBczNOsDELIH7sXjrCaqj+jc7k7N2oK+f/NApFUaHQc
	3MgtjxIUYeknVd6lQAQrUgeDv8m4RYg/fdGOKn4a3TYjLH7xora+vrQ9dxAqpZ/JWU9NizdU6zsU5
	OQaPihBSCIDe53qXGbnMay4jpZbAoNxsJ2BscT3fpdzkGlS43tec08HzRDBaz7Ky7v6dTG5bpOTrR
	aoys7GOude3hDwdQT2XaMWzyP7dNef1kev07QDjNxg3381hICN0ik79+dLiHygnihmxjEMjSIWOIZ
	VUuAqXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvT-00000007O7I-22bF;
	Wed, 11 Nov 2026 18:20:03 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCvR-00000007O5s-10H9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:20:02 +0000
Received: by mail-oo2-x03.google.com with SMTP id 46e09a7af769-8459f7bc7c0so1582641a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421200; x=1795026000; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=fRJs2eHMU3g82OLUiklQXUwmrzjZ0FXoxsu2LxtF6kDo2UMFJcggKQfY06VYu+Bz8r
         EaR87eyoYZMI00WACMqaeB9z7w1WSac5+n+ViCO4WU6+GRq8YeOzTgOBTptQa8Ft5BLM
         SHrQjIYEN88tqu7vicUMLxHQYkhlj7F2813gx3PVZt0hpioVRtkTHQssB4F8HG2gxgXk
         BdHUX9XetFlX+gUqrBxN9KYeCp0cIepBoiqpjFKOV0T7xMR11PYuzhLkx53ZEV+0gCIV
         zfmgYpgxpar/6K3bi1cSgL6oS/mqcsc2X7li47dCO9qUxK+VWd4BIq24tXy1tz4c+FTE
         Uhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421200; x=1795026000;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xRpDzY5ro+DikjzbuxDzUEQHXVx0ELQYNE+a+uwIdG0=;
        b=gVJ/cgMCV3DAm9FO7w1dsggOkUk/jVRa9LV4TCx2e/TiMpNQrrOaHo8l7w8Cjz/kkK
         g4e+ZlCfcUssgABGYZe0xUwiVeXIImFSw0l2ph7RNMoqZhUn+0TwIMkF8UC2epF3ul1P
         9ad+xh/o60erNv0U+WuVsU9JONu03uUGlm00p5n9ydCxlDuWZuqNOh9h/poPIJ5XAaqx
         wni1GRWoKdFAaG659IY8+BR8hpNG8JjYw/8mqlcrOrNJLCRJ2cHOtQx6wIqWE5cJJNDf
         bWND1a/iIjULSq8y6Z4J9txmX3TD7zRU1VUGyJ69lFDKy8YzgDirWxfhKjtpX1Q0sGpu
         cuuw==
X-Forwarded-Encrypted: i=1; AL+hErHNZ9V2Q04zCjWVuVC7hs3N657bQPeF/CizEX5nibF4IwUGNqb/AS5mubAfXddng7Tdx9OVdzPWJtDONkuIzPVv@lists.infradead.org
X-Gm-Message-State: APuU4Z/91q1OD2vJJimb5t0JmhK+j2I5aWS8h0CozbwvqaPwBlJdFRJX
	2Nb9uZSrddqfqg6bWx3hQ0npHIN5Ql8TZ+c9OeSbsIc/8HNhDX0wIbBi
X-Gm-Gg: AYBFou3zKOlVSa8O2hLAgJPv/0y3chpTjOCEgskwKjJ16RnVxoiVwGBEOOWjAg1mkc+
	CRsmPTpTPXi2CfM28AVIHGVZbU7SHdndUIn02fqoBtKSsPMAKAo3XepoTDDTcFhJFvDV7VRqzEg
	2CtqxKnmFPa1DRTx1F6YVZrCrwK8lB44kLggnA0GTz9Hg3wmJM3GOxrLiZrkRdNtJI3T6ol5GmY
	uzsQhGIC5HTJXyqqXiMzI8KKgLzRm5VDDs6Kgf8rKkBb/y5AzOwWHf4V109SfpX/POmqPTYAsLE
	6dNjTYQJlExzJu+FM3Awz0aS8OpFtjE6/CmkVkRkJn4Hn/+dQ/O/O6Se+XkZeDkVrEw4f/KZRL5
	aJtUAox6HfTb+d4zkbHSWhMZGA/JCjXtwYNFYmFzEJJm0BeqcslW46fVGgW2h2emJ50q8axvHl1
	Syeg6LittG6kQ0peIO/2pqP4C01U6ApW21jpg5UHvQB0NuppBEUSVg6pjZ7izF4Pa/ki1hl7jjR
	tltPHCgr4b8iHS0MfkzolMPLb4gIwu2UAu+UhEoX6GNOXuS9RMfPeROyOgi4ZHra5YLuz/rHWZI
	5/vDbQ/zKelVy/KG5lGx57G15cj+s2/DfCjFSaFaDYPWUMgO7wcVUcJY2CWd0JCQgrgmUOdi8fW
	Dezc2YOHD0GoXoSdRHD4=
X-Received: by 2002:a05:6830:230c:b0:821:c75e:5309 with SMTP id 46e09a7af769-860f2824528mr4052098a34.7.1794421199944;
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:19:59 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/5] arm64: dts: mediatek: Add the Amazon Fire HD 10 (2017)
Date: Wed, 11 Nov 2026 12:19:49 -0600
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XNOQ7CMBBA0atYUzPIdhaDr4JSOM4AUzgBL1EUx
 N1RSEFF+X/zXpAoMiWw4gWRZk48jWCFOgjwdzfeCHkAK0BL3Sqpa4x9LISp0IrlkXIkF3i8oQt
 uncb9Dzmh8q3pjTJDZSo4CHhEuvLyhS7d3pGehRPnff44KzZMntVfLOS2Oht0ZXGDx4aU1iepG
 99IOzeb1rtE6KcQOFsxm2ON0Wvo3u8PINOci/AAAAA=
X-Change-ID: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=3441;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=JY/ZMokU8A01a1ECQeqMylLF/hWf9QwtOhovwgrHl/E=;
 b=yxUBcqEPnePvIAwjsS0Wu2SVXsFmjFxaGEtbfTmm8jhed19s+uQENEkUxREo6Yd4B5zk5bx+R
 s/e+p1ybKXTARwhbGECLRC42nkc4NZ+EFC7VSvDb9/DeY9c1U2jbR4I
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_102001_366742_4478BB67 
X-CRM114-Status: GOOD (  17.26  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds the Amazon Fire HD 10 (2017), codename suez, an MT8173 tablet
with an MT6397 PMIC.

Patches 1 and 2 add the board with what upstream bindings already describe:

- The eMMC and microSD slot
- The micro-B port as a USB peripheral
- The panel, the backlight, and the touchscreen
- The accelerometer
- The light sensor
- The charger
- The lid switch
- The power key
- CPU frequency scaling and the skin thermistors

Patches 3 to 5 add the keypad and the PMIC AUXADC, whose bindings are
applied for 7.5. The keypad binding [1] is in input for 3 and 4, and the
MT6397 AUXADC binding [2] is in IIO for 5.

The board needs a PSCI 1.0 firmware. The stock BL31 implements PSCI 0.2,
and its CPU_ON never powers on a secondary core, so with this device tree
the stock firmware ends in a watchdog reset loop. On this board it runs
TF-A's mt8173 port as BL31, started from the stock preloader by a small
loader that hands it its parameters, with U-Boot as BL33.

On an upstream kernel the panel also needs the DSI command mode fix [3],
which is reviewed. If the bootloader leaves the display scanning out, as
the stock one does, the board also needs the MediaTek power domain fix
[4]. Without it a probe deferral of the power controller turns the
display's domain off and on again under the live scanout, and the board
hangs.

Tested on the board, booting these device trees on a v7.4-rc2 based kernel
with the pending drivers: everything listed above probes. The device tree
validates against its bindings, with patches 3 to 5 checked on top of [1]
and [2]; the one warning, on mmsys's assigned-clocks, comes from
mt8173.dtsi, so every MT8173 board has it.

The fuel gauge, the sound card, the MT6630 Wi-Fi and Bluetooth, and USB
host mode will follow once those drivers and bindings are submitted and
land.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/
[2] https://lore.kernel.org/all/20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com/
[3] https://lore.kernel.org/all/20261004-rbrue-suez-upstreaming-mtk-dsi-cmd-mode-v1-1-53a4f46ca489@gmail.com/
[4] https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (5):
      dt-bindings: arm: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: Add MT8173 Amazon suez
      arm64: dts: mediatek: mt8173: Add the keypad controller
      arm64: dts: mediatek: mt8173-amazon-suez: Enable the volume keys
      arm64: dts: mediatek: mt8173-amazon-suez: Add the PMIC AUXADC

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm64/boot/dts/mediatek/Makefile              |   1 +
 .../arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 702 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 4 files changed, 714 insertions(+)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20261024-rbrue-suez-upstreaming-amazon-suez-dts-1c67b717d373
prerequisite-change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50:v5
prerequisite-patch-id: d709637c35c840fbd22b30dd39452d3116a8e8e4
prerequisite-patch-id: 04f2ca8ae588298f0ad75af44266cd028d00bbe4

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


