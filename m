Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B77606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w+Qwjzf6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0cvBqOu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=; b=w+Qwjzf6fnDiL6
	rg0yWGz6oQwhjyrWtI98r5YZzuI2g0Ie+VMNrj3KhoF4h7kQeWjdU5JrQ39D1jZArgSyHu4bNrcZn
	CvcM7a86zI4emf1gcrIhDmTpdip89oXhihgTlWv/AuVM5iF83ywE5e3fhZb7ykdsWDUnxuyKAuUbO
	vRjs85t5lQktOW8UXvjmh1Y8Pc7iHAZGOuNmB1C88CwJ4YtUL0347nsk44u2MSetbRCCAP2syUBcM
	Z203wPXHIKkM0XAO1ZXd6m6zS+ZugFrPrhej8PqROQ4hyCGBrF/epV1QQlMd1fjllGZatg75Y6hQ/
	kObx34463QizzmHHLPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhp-0000000F3Ik-0F3v;
	Sat, 07 Nov 2026 16:55:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhl-0000000F3EU-2oxR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e47347279so931464f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070547; x=1794675347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=u0cvBqOuZibGYXlrmK7VbAJfhc7U3mouUd+L7FxTaiEr2hPNYNLZN46I8MbDhyMGEa
         zXgtQJnD+W5nu+SfWER+1KL1/PNdcXfCElr19k3Ste7qGjTvv4TXIXy6TQMMmmnq6fTX
         R+MHqNCKmQrUECUH2TBstq0GNCQ1BSIzNqyK5yWoMTeD9B6fjNYDxHf6fggGpiA8Kf73
         AVinWpEL78XWm1cqCcD4HRdACZRs5LkZh8gbsSAXxiEI9jGtD5fZc9FK35DicLyiZTgQ
         Lhe5el+AxrjGJAWAb4ldKdufWvL6JMnw+AqSj1AZEschEuMiMU4HcDl4ePmpzEuGrDrw
         96Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070547; x=1794675347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=N42mt9onGw7HTn5M/Aov3OliPBmFOvwhhNl6yzTYbTnSUiZRfeDTSxNa1eVAulpcfR
         KFtSe0CfUwgQHJr35lW4rClo5bINcXcqjF2Fsm7eEm54HYl4XTwR4Avz9cgL1/EHK/s3
         6tgShq1NEQrNKvu9Wq0Hcg0OsGsQcnZVi/qZvhf8K8S2m50r3pylDvpKv9fbWhIRcGkk
         wmiT4DV1zCz/MCBo0xf/IPp7q66R090Km3d2TaValhCLfYLW9QSBFCF767aGmgKTVu9y
         v50Y0Mz3Vj7mqKvaGDAaiHQ6pGEVN+eMLEUzPeZ/otVGyRlEdMmLN9xYS7mMwXo/qHAK
         SHdw==
X-Forwarded-Encrypted: i=1; AL+hErFL/l1WwkzTGo06HsRQaiZqKP/+5yOlxvVXZCjACoVy1wBOY7oPJAB/f8lxDnLX5VvbPAiWlSgfjaWRR7wfflgr@lists.infradead.org
X-Gm-Message-State: APuU4Z/gXjdHjnyXI4yWEHUJ0lWXWr/c3RERpLiChv533kGk3HiqD1vg
	iW8cbmDubqSKNuRVHqXtfQ1FQ4kF9zTxid9YpgaMmTZnR9e3bfrCSkcW
X-Gm-Gg: AYBFou0t971ny9Brp2Spuckxx+3he6pRAwI2kx1SIIa1p1reKH+jft1boojsGZQY/Jt
	CsYWvyypvGLqA1DtP9hZ34rEsCRMuacCPYKfemS4oGAn08SYUS7EhZDs7EHEhaxwMAtkGk7Eyem
	Y1PuSxnXLta8osY/rW0v2M9WFUviaQVemPog4qJyHlDdIk5JRCIz9nYRa162oGJDnkKGhtz5ery
	TMjDbbm0awcmXObHs14Y2FGdx+y0xmQjASNZFgNM+meoc63QeEetoUbZj5gKBOMArGoH9GGsbgt
	rNjVUnGLFMd8fp/9Uv1OqDS4xAzUifylVDSEvyLzx1Ax1O5s6Gf8ZuSs2+ZbIIN1Fwe2dBjPHAF
	ctWKPUyDAtnzzXGMaoG4U7d+FX0gaHcnIPTZ83KW2x01P7X/wNMbm6LCUyGlQSOLzfRJT9JDwPu
	J09WfXK0DMKL7qepqt7r5FivvNh2prDYy+GmjIoU1YyQWU3UOhVDNP/woIz6fx7G9N54j4qK4wB
	aZzcRLnjTZXZwH0NhjCQ4b2M4yFgvtmGTHe5kqx/rHnwbF0CFQgETh9mfB/4IkOak/sm5VFNm5+
	4cZ1Xy2XF/o954wVOsagxjshTC+rtZDMzw==
X-Received: by 2002:a05:6000:40de:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4927ec0bb02mr11650221f8f.29.1794070547458;
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:25 +0100
Message-ID: <20261107165527.576383-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085549_723321_AC65AE22 
X-CRM114-Status: GOOD (  11.94  )
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

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  These three do not.

axg-pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-pdm.c:(.text+0xc4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_PDM unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 2cfc123eea74 ("ASoC: meson: add axg pdm input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d0f60f8af2b5..4b06a9e7c72a 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -92,6 +92,7 @@ config SND_MESON_AXG_SPDIFIN
 
 config SND_MESON_AXG_PDM
 	tristate "Amlogic AXG PDM Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_DMIC
 	imply COMMON_CLK_AXG_AUDIO
 	help
-- 
2.43.0


