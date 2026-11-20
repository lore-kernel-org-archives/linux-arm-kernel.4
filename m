Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA2F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VboYf+an;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MGH2y6iw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=; b=VboYf+anAKcWfnmS3Vnfua9490
	HWsGDGZKo00ckEIwZQOGp7+ch60uBKjGHjfqAVSYN0I0EhUeFEexVC0j4CI1nvvCTcvS2HBo4SokV
	t83w8gIuO8XjE3UBrEhbxfM1FfkdjzomMVLZLPDhkMgRusv9YXzo+R8KU8l8Aq+beXzs366+ZR5AV
	lyv1HgGdsDbaVRuHCJOgCPfqc2jiZWYGIsc5D7mpy8b57jlVVBdbW34bkT6kKPwWA0B/+gL/k1o3n
	kv4qH+IunCLsg6q3LU9miJqo4Ix+/Rs1iCZzu4dJGuTdSk1mx5mneTz4brejm+OWEvMXkwp3sxgvz
	KBwlsEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM96-0000000EdxA-2fyA;
	Fri, 20 Nov 2026 10:47:08 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM91-0000000Edtl-0krK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:47:06 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-38431138772so899305eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171619; x=1795776419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
        b=MGH2y6iw0Ll4LSAy5/xFQizDYwhrbdc7aYUEmtF2Q3W3vfqua/L2V+9Z1bWWaJTxIK
         O9nB2VIwceg3Mohyw/AIZb3bfQoX36yJUK2hfLTdMJ9TfO00EVGR3Omjub9Pzc5I5oKV
         WTIQ7GZ0BejCwiyRb3a43WqEBL9uanlG2jt4AFvKJKLgJez/RjNKMb1QMWBnLZOvTcpM
         /233cGHecq1qTiycYczrvDjxQkWYBhGidDKEeZ64YC0glGiBb+p9Gv+rF2Im726Pm/0Z
         qpbsJcHlbk1RvGVgudfvv9jgVRIht1iqxcLXhx1/ys2TsdW5kDcee9r+10o5VYyWpV2D
         HsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171619; x=1795776419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlPQk0xkrEmQkTap0k2QUV6qXixy3ELzOIiL8b3426k=;
        b=YVNHasYuc/V/ntssCO+9hTmsIlyaRoCXgBjOyri5M5qZYMoXmvYH3Y+Py7HGR9Pwu8
         3SuAFOstk8uvXn0FIbrYYYU9mo7fScjFni74YPImlZUDQI0hUOj+6efg7QwCSA5/Tiph
         +6wt7bQlwAe0g0phKeZwU78DK8avs4sgCKPD3cqondBZx7pbpTDYXZRNVivVRCOHP47W
         phirs9wPYxVu+UngdXR1Cfs9/oLZOlmipg47wu0nNdeXZ830lXXhvEVzu4SPsVVbmzJd
         JyrlpWYUI7GkElhJjma4ldfp2V+RKkbRQ0UJNYh14TCFhAI1qgKrtX67Di3gHiYyqu3t
         Wmkg==
X-Forwarded-Encrypted: i=1; AL+hErHL+RsQqdYx2zt8Sy4i5huHX6eXcHl3gl1+A8N56jnRbG2GyilDIq7Cq8PnOcWOXOj5xhkZZpJMR8HgxU0rZryR@lists.infradead.org
X-Gm-Message-State: APuU4Z+BLL+hsZoB5XH/zzgqQrZ6uEOtf27gmi9H3OE3LHR6D1a6s2a+
	lTFFQB0Gh5byyq2jCbmGQ10aFP8thi0fVOiMdxPxDPPiFI7d30mkmjKh
X-Gm-Gg: AZFdTZd2RUxhFnpzpQh6McrPbB7Eek49MaVOi1nBA1niwYCq838VF2FZXk9QuFAEbmJ
	b7mDwdOvQ/CS8CTo0Xy5JUUKNaR7vsDtA5rClsSfW/8ZZHVePL+rUkDys84XHOP/mL+id1b09Lw
	2gTSGjhHXny/xrP2cBfSaEtO1wLH/X8VW3amqxSlj+mh4v/FVdhwTQt8QZdgFAYoew6Nh4WLy0L
	aeNH4opI6q4uPK+NnY2UEkg6S3BS3LV+n6rXo6vsENqeyLHuJJb8RDuGpO2CbIgcDryv8TdWvm9
	C5bcTcnT0+iUqIYZpV4UXN9GdtAtVqsdMUSNpt67wRmoyIJi8iHuQABISA+dAOO6FKOin4Nei+B
	obmWr12dHM4KzWoP1NYhh9h7wwrWpiiC3TAzijOaE4YURoPoNNlHaTp3N9dqZ3H1wMGejUW25Ez
	fjI7MSqlzeseIVkLrMZk6WSWy8IuXrAF57OTxi0/dRoU/MrsyKobUVaxbh3VwbHQGE3xo63EBNC
	70K7GqwcJ7FXs8oPjsfKaEj/Az4pDZmyxpHC0mMPsoDHAVRTxdoWy77WkaoQM2kplJ79HeQ1vdX
	Kvfk4cbmJnLEuvUL4XErymPTeUn9EA4SllWQJ4C6gv1ep6nyQJkbCVkhgOg29n1DMJA/Zr2fcb0
	8aQXl/B4t3gVBsEUorSH6PwOCLtV+AxwkpA8YGEGOqigW
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr3506558eec.21.1795171619119;
        Fri, 20 Nov 2026 02:46:59 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:46:58 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:46:28 +0700
Message-ID: <20261120104630.10240-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_024705_580994_209CA43C 
X-CRM114-Status: UNSURE (   7.56  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series marks the interrupt mask and status registers as volatile 
in the PDMC and SPDIFTX drivers to ensure they are read from hardware.

Link v1: 
https://lore.kernel.org/all/20261120100408.8053-1-phucduc.bui@gmail.com/

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-pdmc: Mark IMR as volatile
  ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile

 sound/soc/atmel/mchp-pdmc.c    |  1 +
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.43.0


