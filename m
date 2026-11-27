Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eIHq53d3;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hMw9Mmff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2xSkHmgwcY/UBC1h6KghOKuKRKbFTAGv0DCM6/0KU/Q=; b=eIHq53d365FuM/Za+NPBK/3iyn
	q7NvTWvRgLM8LgxMRFewFPaUPumL5ViUa5Rk1LLBCp8S1+/8XErqUbomhYRrKpAVqqAKZqXX99evs
	dzFXUYWV0xhT0/ZP7L66JLnaLnM4rNQ+PYjSUY+OoCbjNOJkQ91IcT7whFU9LY1j3xw0SntFnw+G2
	aCZC5RcGW5jYgUoJOF8JbXWbZBW+AKOXTlQgGCaICSlV1gZHhMeNKEOiBip9rPKzLERIUVvXVtKJ5
	M34elcahxsuuosCPkE8iGBDxzHr0ipuied1nmDxWvrVMUKbnY7CbwuRoxLzjEAUkoZxUpqEQ6fNAd
	v6gOphiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxxW-0000000Gq4H-0Eot;
	Fri, 27 Nov 2026 15:33:58 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxvg-0000000Gp1Z-3u5Y;
	Fri, 27 Nov 2026 15:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2x
	SkHmgwcY/UBC1h6KghOKuKRKbFTAGv0DCM6/0KU/Q=; b=hMw9MmffvoYK+85EWJ
	rgTbegGzzCKWXUqJ/BsR+0TwVnWua53vClugIW0dGs1pA5hgxMAMyvk6llibiE/Z
	aHtKDRycKzcDoqL76YzOnFF/nAN6RIaaZtmDlE+XVb76ifovaRmS+Ko1KxDAz/bZ
	7ocqXp3w/RVcWawP5I3+8BO2E=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3n_FLoglr+1AILg--.23527S2;
	Fri, 27 Nov 2026 23:31:24 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: i2s-tdm: add I2S_XFER to register defaults
Date: Fri, 27 Nov 2026 23:30:24 +0800
Message-ID: <20261127153024.2348805-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n_FLoglr+1AILg--.23527S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruw1DWFykZFy3urWrKryrtFb_yoW8Jr43p3
	s3ArZ29FWxGw1jvrn8JrnxCF40krWqya13GF4fKa47A3ZFkFs5uwnIgr1vkFW3Zr47Ca42
	kryqq34jvF4S9aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBa0dUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QzYDWsJokwXdgAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_073205_855371_584B4D82 
X-CRM114-Status: UNSURE (   8.64  )
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

rockchip_i2s_tdm_reg_defaults[] is missing I2S_XFER (0x1c), which resets
to 0 (TX and RX disabled). The driver uses a flat regcache and calls
regmap_update_bits() on I2S_XFER from rockchip_snd_xfer_sync_reset()
before that register has been written, so regcache_flat_read() hits an
invalid cache entry and warns:

  rockchip-i2s-tdm: using zero-initialized flat cache, this may cause
  unexpected behavior

Add the reset value so the flat cache starts with the actual hardware
state.

Tested on a Rockchip RK3566 board; no functional change.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 75e6cab..a6efd92 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -973,6 +973,7 @@ static const struct reg_default rockchip_i2s_tdm_reg_defaults[] = {
 	{0x08, 0x00001f1f},
 	{0x10, 0x001f0000},
 	{0x14, 0x01f00000},
+	{0x1c, 0x00000000},	/* I2S_XFER: TX/RX disabled after reset */
 	{0x30, 0x00003eff},
 	{0x34, 0x00003eff},
 	{0x38, 0x00000707},
-- 
2.56.1


