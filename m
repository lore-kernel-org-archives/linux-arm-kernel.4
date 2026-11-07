Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317AE606D808
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x9QL8Nqf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGYbp3a3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=; b=x9QL8Nqf1Odugj
	Fi+gYe3cLu5TYtaoj8r3ECsbQsmIOr85F7XGMKj+ce9yz1qsF6RihgQOh2cgTKL8UHHFqPAXe13Vm
	cS8waKMUQvTH+rLZkbic3JL/xRu5h2gJ5LO1QnFWfNFDK/C991buloknyBugd6WithmTl4CtMqeqf
	aLqHGmNkPyCeCxL8O75L+estbCLiG6qpv1WORoexs0dXohTIpwviJ0+5nEnzJ2gBK4mKUaLwqmuxv
	VCQ2D/IiyslN1XMJggpIMaUiOAhXgmPVzwVjGlWuhFbz6NjzN1/WfDDyy8TZfhofgWreakhiudM7u
	J25IniIBCNmzndNInj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjho-0000000F3Hr-2via;
	Sat, 07 Nov 2026 16:55:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhk-0000000F3EK-2jbS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e09aa5264so846678f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070546; x=1794675346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=ZGYbp3a3ip72WmBCmyOhDqV1xBtkmvUZo0zVFtjq+MuW7+04Ga6K3mUY3RJwKi5z5U
         NyjeK/ScDYhCL05m2OIZl5yKy3Oc2y3HsXSzq79fMYUXcSLqzxabIDTsxdZhkvF9PWAG
         gboQnAAonWbDZEs67+IArV1F0DsDfmL7bqTdVYWh2AC+ZFfMskIYGBt6tvHSa/+G2JoH
         FkYp0RnngNIMqi/DblACLAGA5fkPizAo6x/D0lAEjwyqbaBP1/jETK7On3SW+8hraSnB
         SV42NB/sG79+2UN/m943dYpIOisCJ0T+rhu/mRzL9zziuEhbWGRRF/a+3kSIHlWbIVFK
         8k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070546; x=1794675346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=KUrXn8HL+NRC9yFy1O71Q0IMBUjuVXjUBM+BhZrfQn9PqWoDMDWxIrKhKiurVO6kA1
         avmD+lvmf1Wcdki6DXBZOyC9u4stXJLQNadVDrnZltjTzBIepOkm1mnVMx/FK5YQ+8Zy
         FrvjvnNd3+o75nkhRZOiXIXozfoLiMgy0yv3MPvRgH3nffMW5i7VAmV3qEYGa617/Cfa
         A3+C0xrFgBxSph/DNhhGqmrFMZpbqN8ZgP0coESAk4tXuNFCSB+fMJ688wi6QqmTTjVB
         RLv2jWqzWyzQci3zymigU63tjpWZxoKZfYwLgoozToodqTv3NZ9x+hCKnEz8QKwioWv8
         u9ow==
X-Forwarded-Encrypted: i=1; AL+hErFqj6Pi6VbsrcZdrTDQJpp5Yci10rjo183WgXnelrtcBzz2W248/Rv7yWydFMLXBU92DKg14SfvNH50YPkZQcje@lists.infradead.org
X-Gm-Message-State: APuU4Z/CJTBngEiaUrNvMfciFpV5dUXYT3sfh/jyL0xLGZhwCQGXx0Il
	ohaaTBzZ/3ssv41xuaXbz/u2HY8u/uvrejRF7mOxLimPNsljK8AT0015
X-Gm-Gg: AYBFou0cSQULZ/zOoeC7zcPH+errx7GOlAZSqf4R5yta2RW6kf9fXshpIB8uCAEhfZ4
	8bm56zrxEsuaIpfWlLv8QkLqOiw+ycWAZ0vNH2wYnKUssmGE3IrpGalwVj9L60pgoHj5YMsZYED
	5TKPUihqJtL8Uf2qPOTw1pXwNBElImTKDf01b8P74VbkS3FUmvn0MpbKqBxpWG5C//9TfzKL/s7
	3MdEkBSoc9nZrmG0VeiJKGBv/RGOO3Uc3JHJiB5+iGop+I5UOm5e5EpAlB0ZOW7GQec/I6Aaq4X
	mN+Y5lkZNQJxfG+he/TMoExV7ZJatga0pliFG8iD6bGBmO+KE+Lq+z6fAclOCcUVQq7DRVWV6JB
	GVRaNm5UambfGmOrfAJEy7fsqCZvz+JZY2Uj2I95B2fYN0pvtAQY1XikoeYmXTV0+A9aOd/yYln
	cfb9UWtdmCskOpFWjDwh8JXHo4zZs6pa/bysQqkFZZzRzq4wLtM0lapzBnoF5qU60lAG7my547c
	YhlbVzMYQ+zg3A6tD1u5NFKGHJXhVheDOGb6IK+BKd7Z70OsLtXyOi9Nj8EyOMyDs1Q62AgBN5/
	34/ExGpiWfcv0/b6981+hZxxIgolEOYhNQ==
X-Received: by 2002:a05:6000:470e:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-492733d1ca2mr11716934f8f.3.1794070546480;
        Sat, 07 Nov 2026 08:55:46 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:45 -0800 (PST)
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
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:24 +0100
Message-ID: <20261107165527.576383-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085548_731778_F0119615 
X-CRM114-Status: GOOD (  12.63  )
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


