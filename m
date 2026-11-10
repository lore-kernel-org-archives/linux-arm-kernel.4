Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07D9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y73hlRNm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUo6AlYA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xm/hDezALdKgLZC6Xh1IsOS0PUBPGaKTPc3nHwBJQ/4=; b=y73hlRNmyVsEYCcRiy3vrUsIwT
	CR+GklbIGwwhKK/RP3YmqyZRM3dFGdYGInStsCXvXO1VvIQAeAKOWSpGRUEV1CUIH8m4EH+N2FZoB
	p0tWBCSqFz8YhV0hFvlXv4PRzb4OnEAzSl8PxxjBD0V3d6JKICEZ4YrzjX3Gk/S7yQLkMRo3nY9RJ
	SoHvE++zrv1pAmXt9/Kr5XiyWczRLePgZxEe63tZJs7NYWP6S3yMNJ7zlOoikdTNB/1ALDzJDk1d8
	DSKyRq/Y/S2Jk42ck0uTp6XrEyBsl123+HxmC8rfLtf8GNJPVT6IrEBA6Hax7sM8PUy64XRl+dP8L
	+pWaZyyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6N-00000002oVs-0MIz;
	Tue, 10 Nov 2026 07:17:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6H-00000002oRT-2eD6;
	Tue, 10 Nov 2026 07:17:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6784463799;
	Tue, 10 Nov 2026 07:17:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295020;
	b=vrbrI/rHDQ1T7krxW0O5ExyBptna2MLxZ/v7DRoOK73UZCrs62abC87i3fQBji2HrLMl
	 bacVl6j66lJdjlGUpSuoZc4of85Yoc9RtmjIyOxplkxg6bjDKrg86DlYFKR6hfAorSBGf
	 /g+mFzkyynKo+Xbsx0jC/lRPKU+iL7Ck6NTzLtHoA1cGneRbbE75SUExNa8BP3947m9u+
	 HbwmBGzAZhfUD3mS3iFPTHS9XcHqOGgKD5L+HpHgz0lKUq0oRobUgIpIakyyVGTjARnKi
	 ui62MQeMemHW1hC2J32s9MHG8PS3Zk+nRTAVlKdiB+LJW3U1gJbD+kdm9CPTzFHZxaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295020;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Xm/hDezALdKgLZC6Xh1IsOS0PUBPGaKTPc3nHwBJQ/4=;
	b=V/WwnkTC7vQwCT3y21GHDMtQV541zJMestfOvsQJibDkg5s7fk5gHtPGuqRJc8wotMM1
	 EsFJDv96qkC/jLsw3yKD/78QsFbiYHcdRPW9irOfk0sNccrRyWfl+eLkABYgKv4Ul69P8
	 SqjBKmiz48ZuEj136anhPgihMZief7FP7CKtA+2yX+21JaIvpxWMqZXvHtK65SUWizp40
	 tM7bwF5GWJIoItgSQBd2ogSMdLO9d3lAQUdLBMyuLHwEpQUvnx+rpMKUx5G/IhuttaETG
	 RJ/pHUENEYxUXE8VlK2JCu83vScQm55dmT7DmcYO2EM/AZHfUwrGxl5v/dk6s8bf18g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2D001F008A4;
	Tue, 10 Nov 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295020;
	bh=Xm/hDezALdKgLZC6Xh1IsOS0PUBPGaKTPc3nHwBJQ/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MUo6AlYAI+MyxMt8KCEB4MD4bflYgACIs06smMQeCtcrOsGQJqsCb7YvCI36F7K3p
	 SBT3H0dsc5kfe0Ybxb9bj67PzQIzgZa9X4YLD4Ys47R1TOJaaxInOrpqd70HLcUIsy
	 OVKSL/ku65KAoAs8B2r5XTQrcXhwUfHhmxSDPmfm0oZFALgA6296tJTVZQO+lqjE0Q
	 k2a7qjxHLZ/KNHTri8LLup2UebaybPCAHjnKBgS3F5UNQlfIUVoVzH60rbEsMYOy8b
	 f9lWQq0nSfVQkxYnYOqueb01N86ensMf9jMrWmvArjxycvjgvTG/B6GHEvm4dOrttj
	 qGCQu6NRpDtsw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 74BBC4896C;
	Tue, 10 Nov 2026 07:16:58 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:16:59 +0000
Subject: [PATCH 2/2] ASoC: rockchip: i2s-tdm: add the reset value of XFER
 to the regmap defaults
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-asoc-rockchip-i2s-tdm-v1-2-f32951b3c527@gmail.com>
References: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
In-Reply-To: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295018; l=1378;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=tfT+jEvZfGZPAFf1LpE7sgBjWqRXKwyeQFTfBhDpaGw=;
 b=YA1G5nxGLOCp90pxzz2hYjwcZlCjhLKo+suxmsn7T/GVXpGZfLXsiynDfnogWAhXP0lSCYmGE
 t0A4QEnH8I6A19D8HzUVF2nvpDc/Trndk0VEaZToOuTFuXSLZQMgCw+
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

I2S_XFER (0x1c) is writeable and not volatile, so it is cached, but it
has no entry in rockchip_i2s_tdm_reg_defaults[]. The flat cache then
treats it as uninitialised, and the first cached access of it -- the
regmap_update_bits() in the trigger and stop paths, or regcache_sync()
after a runtime suspend -- warns

  rockchip-i2s-tdm fddf0000.i2s: using zero-initialized flat cache, this may cause unexpected behavior

It is the only cached register without a default: TXFIFOLR, INTSR, CLR,
TXDR, RXDR and RXFIFOLR are volatile and all other registers have one.

Add XFER with its reset value of 0 (TX and RX stopped), which is also
what the zero-initialised cache assumed so far, so no register value
written to the hardware changes.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 0abd200a4268..63ef7f676a75 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -926,6 +926,7 @@ static const struct reg_default rockchip_i2s_tdm_reg_defaults[] = {
 	{0x08, 0x00001f1f},
 	{0x10, 0x001f0000},
 	{0x14, 0x01f00000},
+	{0x1c, 0x00000000},
 	{0x30, 0x00003eff},
 	{0x34, 0x00003eff},
 	{0x38, 0x00000707},

-- 
2.55.0



