Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD85F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHBa/QjD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd2Sqnln
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=; b=vHBa/QjD3QsXVE
	61oe9tYBmbQt+7hMEx8EQmhPolQyOvMq0LLVNM38ct1tLMvB1eO7x1dRoxeBN60WtRnSCpPZWBK7n
	gO+q/OyVNwtg949OoKrFPWEhUhVb22PXqFx4WTwH7vPymL1bEjFrnpZCrjkb2yFIyW2HecXCqDJcM
	ijEe9SdcNY0m1mqUp3riDX3a8n1SbRrIMGJeko0aXGI4xkxW/QOfVFirG8stOryJ/KdFk0yljCRzQ
	ZXQ00gGlYrfSbUlcUUDdryVHqYgT6pq4oiWct0JoZtZ6e/OvudR7PIymL2HY+no14b5GgjukAYDi2
	8JKaqqU6xecPjvBs5QdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDj-00000000paS-3J1L;
	Sat, 28 Nov 2026 14:16:07 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJDT-00000000pPt-2oCp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:15:53 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-38692f62b22so12662734eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875351; x=1796480151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=Vd2SqnlnfQLH5tdk0tCKSOucNSE+eyB67AUyI+UTA9gxOClI87oTZgWqDKMDJr9nrO
         LKAKGHSlQ9ShqM1w8w7mBR5rmKvyPycRbJnci0H0I0WrHUcI5mSZ6MybVww40iJzDude
         NaQt8wWtmX2z2IPFRQT5njRkDsNx9859Q2iAfMfOQ/7EYqVQNkI+5v0jQby7mccCnDN/
         K05vlqy1JO6i1Rl1qrkdxIwq7WIuiZo/UfC0X/2UFAZVGb7h20jfQD06xdzrPZgbB9pu
         kk34e8uLbv9GM+nhRRI+jejMhNcMefzSAygXZebva/MmxmFZF5ZzA+Yi+MUWcx6xQWGY
         Obag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875351; x=1796480151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ev8d3+xo3xhDELRSOvURnSYyDkv05Teh5t0TRLg5EnA=;
        b=RDdUVJ38ezgLD18fAi2066Lo6KhAk8XMjjt0XbMZuVb3mHuUfkVDBOGLPkUl2OftkL
         004qhhARYUzyB+f/LRMv4zvmU9WOD/y0S82neY/AT+6CwK7XOrbDSeOhR+fD7gDNum+C
         DC8MFkUaGplW4lLiRoBVSqJXGA2tB8OYqm+ZccThPJtv/TslHW3e8XwhgqGfkPDd5RQM
         nzaOfJDYS/isFBpD5aw5EskUGhRUfQDKMSB67M2guYRbsK/B7HmknQR8jThN1OAQX6J5
         UmUSE3FqW2W+Q9rM0cd2ffXAas89OiaKp4EZxPw9QvXSCthYHxg+HlfiEV7+GMqpque9
         Nv/A==
X-Forwarded-Encrypted: i=1; AL+hErEYXX6ncLW0lQ1utlVje7cx4U2VC49ZfQ+ozjiKQGWDG3qdvRAlLOFbK4yVK+ZWC/RitSRfXtUWvXkbXaf3Y4PR@lists.infradead.org
X-Gm-Message-State: APuU4Z8y8Wl3lZhDGnSj2SyJYVdtztEanPyHkZfxn25/1vEcGeitDGHq
	xIqSwb0zqUz3QnsXoQFDtHBTADQ/LcIYAPY59fiEY3VVSF+u7LopT28a
X-Gm-Gg: AZFdTZcNbFQHwudGC09ILMFDSc3eLL9rrf+Jbc2VoOBVU/Ypc4AW7q/7tGfTJP4pvz7
	HXmzE3rJEYhVXZy1kYktaCC8X8jSSBDfFH41csxHMK15TMNEaf+M/6/nLG6A609Tjg72ztLl7qC
	1R/R8amGHLZvzPBs184lUd75iZPVHYaqCtKJaPeukTm77C61MlJ3Hq5e6/Ejq33oJohlyks0IX0
	Sq3OBcS3ZlX1Vo0HQ6eY7O95utQjMxzObW91MwOghBm+ArQnvrWyMG/Uf34TjeqwrrrThyJ6iy/
	vpgG8qS9tf5HlM4fEeDVG4TdfDHGTH7ecLO7vUxmD2JP6Vy9lerYUpY00duLfwCOL+pHtWxIFFd
	A92vAMRd6w29wE4px7cjzn5/Agu6cOZkEcbWRxO8t1MUUA93DWg5pVj6eAgsnKKxJXYRzCevuJH
	ne8AfpGwNSQJ3tUAS+at92Ke0fzHdRMc2+Ln+fD4zRQ1WnZRAQUDGnqNtNm+fXj92DIJ8C1Zb3M
	igbpNgZIrF9v99pcESHGgSUllCBzrs38zuFvOXoB9wb6zcj8+7Jtt1b7r9IELltWEVhEiEbCnEJ
	OF+bbLHFOTAyhnNrwOd0Rn+O9tF9GdI3xkJuS/U6rW/C/Zd6kCs1rTzjij/nYBJ/wJL/DCA0+qL
	9H3DOJhFyG1+fR91tSqjLQXeFczLKzQmgGwpJUO/Cplyx1cTQwA==
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr24839784eec.39.1795875350839;
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:15:50 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 6/6] platform/chrome: of_hw_prober: Support trackpad probing on Tarkin
Date: Sat, 28 Nov 2026 19:44:30 +0530
Message-ID: <20261128141443.13065-7-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261128141443.13065-1-sinha.aryan03@gmail.com>
References: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061551_740573_6C2E8CEF 
X-CRM114-Status: GOOD (  11.15  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tarkin ships with either a Pixart or an Elan trackpad on the same bus.
Both are always powered and expose no reset or enable line, so the dumb
prober can pick whichever one answers, as it does on the Corsola boards.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 54d894161..215fa9adc 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -111,6 +111,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,tarkin",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	}, {
 		.compatible = "google,voltorb",
 		.prober = chromeos_i2c_component_prober,
-- 
2.46.0


