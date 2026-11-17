Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070DA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sd7TK4Qk;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TFQzJ0X0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TzwsEBgKW8jB9RMsf+8WadAiOdNeN3ARQQcwnDStTM8=; b=sd7TK4Qk9CCLR9PjTMlRtchqpC
	/hD1c5+aKveJBpYK7BhXA0p3JxUNl2seIRatmP5YG32M/P3Zv34RESbNgxg739iNT9xDPOAbbgnYY
	mlLDk5k4wwNI2tkk3sEOO+bsnRuo4tUKkdKHqxvFyu1fMKbczCSJLl2UfMmj1m7obKhcVJIePzMcJ
	6xJdcS/nEr3HqlIceoeK/HP1kqgAYvRk1D2YlhCOk8xc7bG7DAxc1Vt5/i3uSyHptGzRmz7mfisE+
	NMw99Hy0D0Fq/JJHkCMEKICBJnVjEwbWZOYQJ2vfnVCDo0DbzY52o4C/wEJOxpd3l1LaKHWnoyllQ
	3ZD9stCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFMu-000000053LK-0gCG;
	Tue, 17 Nov 2026 09:20:48 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFMq-000000053Jp-3p9M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tz
	wsEBgKW8jB9RMsf+8WadAiOdNeN3ARQQcwnDStTM8=; b=TFQzJ0X0q2vlmw/mVN
	4HstBU6y2ZF9k/HfpNBWvWYfT3lpvo9rar7UWNw2elcoJLOqAGZ9E7komHPFbJQ8
	rcJ39B7hE80opKlNM8qxbKBoPOjrRs24mqg53Z+HR81k+m76l276q/lo6elFEw1c
	obCVyJZamu/g1alRdRKym+T9A=
Received: from SYPC (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXl39jHPxquf0OFw--.36174S2;
	Tue, 17 Nov 2026 17:20:36 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: rg35xx: keep RTL8821CS powered during suspend
Date: Tue, 17 Nov 2026 17:20:24 +0800
Message-ID: <20261117092024.12163-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDXl39jHPxquf0OFw--.36174S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfGF47Wry7ZF1rJrWrZrb_yoW8XFW3pa
	yI9w48Gwn8uw10yrs5KFy8Kr4UZr95Gr45Zr92y34UKw17ZFsYgr4akFn09rWjyrWrJwsF
	yF4rXay7uFnIk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXa9fUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QT5Lmr8HGRs6QAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012045_351890_BF1ACC66 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
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


