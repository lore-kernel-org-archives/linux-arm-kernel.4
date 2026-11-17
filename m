Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD624606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wfV8G6Mp;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hJbIwtc1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gsr7/IYfcSeGTQy76dVkG2pG06B1UPnep2DEc8I2vuc=; b=wfV8G6Mpg1EIGS
	/bT1bVDGSi7nZ9uRqAGBCkPab+fKRt3wXLA7gUReR4VZr4NUm1LExwLrZw8mcrvJ2qbqeP7W4oJM6
	YrIvDWdrSFndfWVPgmtMK4OI+kjD3F52c0JlvI7qJ8Bv/TcBElWwrUQoMIIyW4BZIIoLkxWRUtnJL
	4nsT78Y+/BQ8iYnUPKEcIsc90s/W0uRNWcWiP/i+7hU7uesV8/z6PLNmceBHfKXj6B/c+iAVboIS5
	JmrTrReoszHsAWkRriDu6z5CPhNjDod8HdIb+QSj/A1NQaw9wdac+rS2eI63yabBkqNNGsqiUBwI6
	kJBQ51j5AhL1z8i0hsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFld-00000005B1X-3AYW;
	Tue, 17 Nov 2026 09:46:21 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFlV-00000005AuG-0Tpl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gs
	r7/IYfcSeGTQy76dVkG2pG06B1UPnep2DEc8I2vuc=; b=hJbIwtc1tbNC56jZvr
	digXOxnk6vAVqdEMIKoQCFyRP2RQtKcz3NftbyVvpPFnkXzPhEOIVrTp4b/vRctk
	zhKqz/RylvhnZQOA9GPI1uVPN7TmkhtjdrG0b+zaAlTaojzbmMDy/dvfzD5wlTmL
	gI+JTXBg/NDmgDBw9XcBxVeFo=
Received: from SYPC (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAHhDpaIvxqyachGg--.34767S2;
	Tue, 17 Nov 2026 17:46:03 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: allwinner: rg35xx: keep RTL8821CS powered during suspend
Date: Tue, 17 Nov 2026 17:45:51 +0800
Message-ID: <20261117094551.13555-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117092024.12163-1-hsyysy@163.com>
References: <20261117092024.12163-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAHhDpaIvxqyachGg--.34767S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfGF47Wry7ZF1rJrWrZrb_yoW8Ww13pa
	y29w48Kwn8uw1jyr4kKF18Kr48Zr95KF45ZrykJ347Kw17ZFsYgr4akF1Y9rWjvrW8Jw42
	yF4rX3W7Zr9I93JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWq2iUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7Rt4rGr8IluYmQAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014613_669004_9494CEE8 
X-CRM114-Status: GOOD (  10.81  )
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RTL8821CS SDIO WiFi on the RG35XX Plus/SP is soldered and powered by
CLDO4.  rtw88's SDIO suspend callback asks the MMC host to keep power
during system suspend:

    rtw88_8821cs mmc1:0001:1: Failed to host PM flag MMC_PM_KEEP_POWER

sdio_set_host_pm_flags() only accepts MMC_PM_KEEP_POWER when the host's
pm_caps contains it, and mmc_of_parse() sets that flag from the
"keep-power-in-suspend" DT property.  Without it, the first s2idle
suspend aborts with -EINVAL before the system can enter suspend.

Add keep-power-in-suspend to &mmc1 so the WiFi stays powered and s2idle
works.  Tested on an Anbernic RG35XX-SP: the board suspends and resumes
from the lid switch, and the WiFi reconnects after resume.

Fixes: 398e5fdf60ed ("arm64: dts: allwinner: h700: Add RG35XX-Plus DTS")

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v2:
- Add the Fixes tag suggested by Sashiko.

 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
index 60a8e49..ceb25a3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
@@ -27,6 +27,8 @@
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	/* rtw88's SDIO suspend requires MMC_PM_KEEP_POWER. */
+	keep-power-in-suspend;
 	status = "okay";
 
 	sdio_wifi: wifi@1 {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1


