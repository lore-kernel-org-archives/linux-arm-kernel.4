Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kpyi41/z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Fxnvak0/;
	dkim=fail reason="signature verification failed" header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=7Wn2AS8k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mCTL5EvoBNQXTJTXdmgYEKENHLcWSBGgDwEoOT4R3Mk=; b=Kpyi41/zFqPEbZtSHrGeFmmUEB
	NKJjuNuQeRtiBbUNYCzoBeaOF8vyXA08vxsCqVuvF8sdyTLLAZd666AhbRFSb+4Vwv7Sm3X2ZPfUL
	hamdi4hpna9n1cPAuE7rZ0emAj2v/OffVcR5Xvg0wiYCMVX6Y4BuVtZ2HHaBs0fAmqHDQrHWqC9+W
	gecQIflL04pv/X8rJKwYkkDdKTCbsHY2cC9C7pvgh3ZQ0Cp3pF7ZquTPwp3FaFY/jK4Mh3dG8n02V
	7ZJlBN7A30+p0mBVqu5WaNDl2FzpUFpdlxefO2RZhqAIggY6dvkFBwCa17/MMSILNhyJtaZaxmNoO
	PjVoDKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkwg-00000005jxQ-3O2p;
	Tue, 24 Nov 2026 07:28:06 +0000
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkvN-00000005jL3-3K6h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795505181; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=A3XF1ilXUm20dh0OxsSuCe3Of7WWYq5ZPtt2AYfQLeflUb4+Cl1AYyzcaqgyDoLGDU
    2jrsAoVzqOG/WEMuozZPsGkA4gcddUB0xRq5LnsA6yF41J2H+7Z/5VnO3hQA4IL3G9FW
    V+lKNTmoTdIQJcVxJOELZM2r4eNUfjadAYmoyAfwLfja8gszawx6bTAUI4mVz4cz0ABP
    sxG/KX3zadCk5wP4tiW0BblkhQjniNFzFj0ubnQD04XibJTEXi77vp9lPQIA+5/Y8huG
    J/V7KJpqncoP29i3/dUfuDzjaneMgAbUje5CKg6g0HVzmxrEQoECV0Ab/oKOGbJhZlu8
    NNxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505181;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mCTL5EvoBNQXTJTXdmgYEKENHLcWSBGgDwEoOT4R3Mk=;
    b=dQd8m9zSw4xOEHf7fb+yKlbVKpQZptCr/I02KCLYQ5+88jUwqDu1n0uk6rJ9juxxGg
    M8pGZ6oGu1RSOr4Rn3RE2fTagJDQJu8BLFQDJft81vb0jaT9xWeDM3vYVVmIZPV+PDmb
    TGb9t9zYghC2dcRra2AP1hAvdnDF6/UNQQwkkrRQ62FQnm9ni+B4iwa9JfJrth3PsEsG
    6vRzVU0hZbvXt6s63tb1nMlHMxNNeEVtnwZcRfFk/lO7G179MouDvZWUDolsKq3xZr3Q
    dnOsnS7ENL3MArrAPNarHzn/XpI/5SGyMsETwqStkwF1nctyuGHG4HKo1tapb0OiuTkq
    flNQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795505181;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mCTL5EvoBNQXTJTXdmgYEKENHLcWSBGgDwEoOT4R3Mk=;
    b=Fxnvak0/8rqxa3Afav7WD/Vb4Xmp/7ha3h2kETtQauUoh03jLEn8mYcbsLwBMwL6kw
    IH0tgaWVQPeQ7FFdoO2/+qscKr5HHGYc69YBWXiKhde3uMhwqI6xSoHkZbTcTgwVc3Lf
    X0uRs11os2b2zMNj6a6YyMcHbP3q9Dqd16VGxWURKvHlXNftnt3w0kTEQn57tx1Lp1YN
    rCmeBSy1VHki5+Q/JzLbgY4VYxhVXaYWXvEV6UqYTCJAd7ICnv6yCHkN/J5sVmihEsl+
    Lpz6ClZoOuDz4a6ukJ8TdCWHd1TlRMyfhosdP3kusZCR98KbrlcvujFQrY4TJKSbcdrU
    yDgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795505181;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mCTL5EvoBNQXTJTXdmgYEKENHLcWSBGgDwEoOT4R3Mk=;
    b=7Wn2AS8kMWAXG2COmnHxpUcRqKgBo+1TebY6U9yNLv3eHDO0gCdjGuFU8kcfcaFDs3
    yUe4lsGOSnZBVr4ap/Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3poLlciNVTQoM6kVxzKyrKzkpjcAwdDfiN49"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22AO7QK1HT
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Nov 2026 08:26:20 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	Stefan Leichter <sle85276@gmx.de>,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 15/20] ARM: dts: omap3pandora: Enable audio interfaces
Date: Tue, 24 Nov 2026 08:25:55 +0100
Message-ID: <99b22d8d689922af59f48e3a703bfee517e50b3e.1795505160.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795505160.git.hns@goldelico.com>
References: <cover.1795505160.git.hns@goldelico.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_232650_732698_6BF7454C 
X-CRM114-Status: GOOD (  11.62  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefan Leichter <sle85276@gmx.de>

Enable McBSP2 for the external playback DAC and McBSP4 for the
TWL4030 capture path on OpenPandora.

Signed-off-by: Stefan Leichter <sle85276@gmx.de>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---

Notes:
    Changes against V1:
    - Historical origin: d0494afbcf2e (Stefan Leichter, 2020-06-29).
      Commit-message review assisted by ChatGPT; code unchanged.

 arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
index f25fc4f8ad042..2a5e8ba5714da 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-pandora-common.dtsi
@@ -728,6 +728,7 @@ &mcbsp1 {
 
 /* audio DAC */
 &mcbsp2 {
+	status = "okay";
 };
 
 /* bluetooth */
@@ -740,6 +741,7 @@ &mcbsp3 {
 
 /* to twl4030*/
 &mcbsp4 {
+	status = "okay";
 };
 
 &venc {
-- 
2.56.0


