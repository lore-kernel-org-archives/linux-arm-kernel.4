Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F78606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BmvJFWKJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pV3LgCgl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=; b=BmvJFWKJHcbuLU
	JNB4fTmffdO4NbtbHBL/53ZShq5tfAvfPOM2xSBLq/p+jYk4EIWyuBMWVCJiZg77d6wbIRgAL7Eap
	sgxDjD5DLT0hxVZQV/I5WB62CDPZvrxRn25JaCa+ILl8BFcdlRN2t6MosnPMqA7ro5MXPDV9GDVuI
	7pWMrgm9xIRiSg89oOwdwXOI9gNBrJR3ZHVA7yqtj9vXpPwDkY/yrgN95FzrFcnF3440SmUEp/qSH
	rcknrhObAk3AFxRcllpRi4zQ+HKBOe0An8RcewqsOeCGVlCn4EemtEH4ErixatctUY4Fu3ZdL+4st
	le/kEuSnyV7YPsDgOg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVD-000000013AD-3VUg;
	Mon, 09 Nov 2026 15:41:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV7-0000000137q-3HPf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5965035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238900; x=1794843700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=pV3LgCgl7WrvPa+XE8hId5tXKg6jUNrEdQYEF3jX1cob7Zu/NUnk2vEPP33qshmAEn
         S9hOlD1s7+cC2MseOAvF/XhtR7afE97iLHF5U3CAbW88T1ezS7oqNN2SVS9cQAt3VuLS
         nIfZsxmOFdQdmrOk/EPHNDgMoeIS1X5xzy+3lv8BWa1Lx+R9cdMCjMSRpM9QcnGeyLYi
         JbvXpVH26bAh4LtgZjhd+oEGpp6lFyhWMreTVA98WHQvhWh/oizExlo6Wd0G3ltI+iuw
         5qw7j4P/h/yJLyaqCgujIM8iS/cIoReg+yJaM/cxlP9hinslTS7dDz4VcqEufL4gMSQe
         t1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238900; x=1794843700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=comaH93BFGF8Vh8n0sOP2l0XgKNrIdjuktWL6ztAA3j+pTHxj11HyLHPR8UFSjoIBu
         kDNrVrldXxovJp4KsosPfyavs57Uy/5WqGx7o4ej0IUm4KzRP0Ug1ROBYb9ZiktDBL2A
         GpmI1zanqacZPRY3VrTfy5nvodSQzAxTrFHwHE+jWaC3ptXRdYSKS3RG3RdUfkX7JYSO
         1o3iqKcvSbi7fAwPnk49kP+UPQswp2VUvcQWW6rZMSesW2Q9WhAyGWMGIMEtUGu6d4Bj
         MOLC/hokXVFC1iBwU0uEPLUJ9Pw/jTFsm1xCOO5JARQvHOMvslhEias3kVyiS8e9MVR4
         C32Q==
X-Forwarded-Encrypted: i=1; AL+hErFetlUHGxMJTGpOyPTsEDMmdmfTXz6gH7hpxIrbjaLnqI+z024ZYVaki/EFeLsRs9quqKvWkb6CpdO/xBJXg4Mx@lists.infradead.org
X-Gm-Message-State: APuU4Z85FheGCcm1k8NArYuSnOB5cHAG7ZXmObDB5bOE7xPR33nPlv5q
	rWp28Fda7Xwn41itNu9yKwwmrHGbgzRtezw2ujwkeSIkAzPO7z5muFzlmCGazHCx
X-Gm-Gg: AYBFou3V4Oj9VoTP94HuIUZqOb55snZYWgqIbz+N5rpPE80M4/SBCnSpFOs/9gHYk09
	ASSQgpdXFwRiN1+cuGidbkeCwomjZ3XNsmUff5yHU6TgUYiUOSkkLDqpRweaj5W33kuBBm6INqT
	NftWcT0zeDuokVjsgbM3tem6xe2wRAD3+SrBGPip2oXH1I9emOyh8s+52dxCBWjxkDjmqSzXFSb
	1OQWOeURyassEHMgYu8GZfHlqFqfUXgXsaavIqEpKVEQl0St/mwvtvj1O1ozVITZqqXx7dOiNrC
	NBn4DnOph2w4oZYhUeUEHSPgi1iHklhR0LC7Jo/gB2eTVyJ4qEpAewwPaScbXAVSSyAqwyB3+Xp
	9uk7UbVJZ/8LsBdqtvT5SJErFNplX9omgPYL/TmKZnOjktIqFIA2g3FJWGHlcSKwdkqEiioyS3r
	hHxhI5qMjDmatBsNlfBEvXuFGlDHNMoPSrPc81EZ/PFE+USTS2OIvPKe8bYpzhPzqJgrRbgoymN
	aYllKM0aWNuGEnEddQZk2VOJ2wlfIj20Njz5y5q6fUyX93H/rbsKi7o8DWWkt91GT2W1tzrM5FB
	8dwvCC0C+aVQr5pYcgVcz9cthhj9cMe3qGFUsDKioufNjXZZVsEhqhk+TJlt7Iw=
X-Received: by 2002:a05:600c:3b87:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4b963c6d630mr91396875e9.20.1794238899925;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:17 +0100
Message-ID: <20261109154120.592392-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074142_007067_04F2FF5E 
X-CRM114-Status: GOOD (  13.11  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gx-formatter.o is part of snd-soc-meson-aiu:

  sound/soc/meson/Makefile:7: snd-soc-meson-aiu-y += gx-formatter.o

so SND_MESON_AIU is the option that decides where its call lands,
and the error below names gx-formatter.c rather than aiu.c.

aiu calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  gx-formatter.c:(.text+0x74): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_MESON_AIU
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AIU=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..d0f60f8af2b5 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,6 +4,7 @@ menu "Amlogic"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select REGMAP_MMIO
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
 	imply SND_SOC_MESON_T9015
-- 
2.43.0


