Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD03606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m8ozf94/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PObLrwPy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=; b=m8ozf94/E/K9OL
	C2ngiAfOanA4gwgSxUUGmdpp1fYs40+WVUpAyRl2BY4bD8BWll3KqToAuCiUKGzUmc/WWfgeR4RnR
	GA87CuIlb2RMUZnoGvCHnlDf9BIRtXupDWNTwnATEHQ7qEX97nDabbjpBleGIyBhODETlYsbdMbti
	tnOb12n0wyg1voqGxl94FPPUEcIP/n4rGHMO6H4YxgEP++wy2ahFM+D5INoA0r29gTf6w2z5bFV5X
	ZJhoJo5JKilAfIAlSztIOqGJFIJUeU+0I0P+nvWt3m8yErwZFkarOZXm4uOKjU6EqaOUCOvbuXEZN
	K6IewNWH5A3trnDnI59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5EB-00000006ISR-068F;
	Wed, 11 Nov 2026 10:06:51 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5E8-00000006IRI-1Snf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 10:06:49 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6184272eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 02:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391607; x=1794996407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
        b=PObLrwPy8wp3g9yLHB5ydIqXLbrMTbuHRS++PGLIreooY+U2JPrFRXXtv0sCZONMQH
         aaTR5Q5zWjDjXd+IXnJvqH5FVSaS7fU6tkzYB2GRzS0dQ0PgKo9xrsn/EmZsdkgoIMZ3
         i/7FJxbWdse6+fCYJE/jb9itGazB1fxWF4Dh85Kyorlc7R1MY0SJN5MCp6wkAtRLMFxs
         cqcRIpbCoOHLi3l8S1xpQUF25HovH6ILH85xEPTyWPTxXQISGIj+BBC9W86llBqm/3w2
         KTUnqTxGFgucVMYn7t2XFuFomSUYyR0aNM6LpvemcyRvNLHoi1TAOaogL6YjvI3XIXXk
         QGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391607; x=1794996407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
        b=0slbGmByPTzxAuesN670JuQ2Ais3J2Lgs37njRlzKS/kIMUE2W7Hau4T3BH9EjRzBa
         Se6tzC+yw6ij4UnesQK+VTFhEIjgurjhkp7sQjSm4NMHgyjpyHs6wKPkEqeAloM42k6K
         E29pktDPiXKc86j011oVgVTxL+vjsQEaACSxDqE7IVnSb9vfJx6TpCZRIgPWN1SvFb5s
         HzhcF/WZkBnfFwXAEbiky5ucT/fvTLYwxqFxlzzf1Y4ycJPSsYJOjXyqeHQsIzdu0SD6
         Nk536VddR8D5zx/LFx5aYXztNgZK8g4ISnBuSK7H2Wvznm3Dj4ZAdOfDuyJWY7kMzYNv
         AVQg==
X-Forwarded-Encrypted: i=1; AL+hErGqUu+ScI3UwAw5IiaPkCO3k/YN42Rxu6PZ+eYUPpH5xAD4uKYYW9uT+oj97f03D0dSLuWEdvTWy8q8ZXIqEaPF@lists.infradead.org
X-Gm-Message-State: APuU4Z/fwibpImQHMjauh2on88CSsAIGrA5HmHMmTSktRXjDJ9n3utl7
	G1KLfzJtXkffw8CF2sFDZYaAI062sIlZMRTWodWnmwnNdTm68+aR3jsk
X-Gm-Gg: AYBFou2c9O2NDOfoH30mWkvUzCuxkilwOD9P6vmJ9MOA6GPw5rkiHW7tLNAzeqWeG7F
	nY0NUNorapk9YVAhGIS8OBThLSGYiWKbimUVvVmi35k9WRUf/AtCdKBPPToQ+z1nt6VinqAnon4
	wygaudoxMAsNc2uZQpvqTRbmvDnZYh7QN9wmHwsAVrr14/8js0HIL3o2sK6ylA/wqg9gY/9wgcU
	fyxQG/PKxLXIzVXCLPtlNHZcci8sVL1k+VOw1WbMLaW+zKW7m1N2yZVBr+79q3l6YCZJyg0Pq1t
	UdCGZZOEHq71ahVe8tlYQRsYfU0ahPjiXPK5MiavswGRsHD45HQsLIHjmrFrEuvmVE1GaJX5AQx
	KtJxfyK4B/h/Vdo1UA12KZ3mnlLiO4bcHwfKRHq5BHHSL+lxUHSOLa9T2GInFiPB/kN6L2KwXoO
	a+2nR4yCte0dPieME84/vhS0K0SRH1nffstjpmLzRCdmWeoERgnSNYgWAk+S8tTSxYIjCFUZK9n
	5erzGc7y5Cl7LRlpq04el7yCy/kHb/ajWxqpn9TUdfZVj9e0cGu+nqZsfk15BJ7SGPv7G20Fw6n
	LrrX0ojcmVcyQobC3FQZanmI3+ovRvlgwqKPp+MmuHAj33qpWdT+79KL/8cyjZNcDhYy8/h7jV1
	hTMY1yHylXbk9LWwoBriaNGjO0fo67O6sp/YBIIpyoY4t
X-Received: by 2002:a05:701b:4301:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b3c0362b3cmr1960965c88.39.1794391607537;
        Wed, 11 Nov 2026 02:06:47 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:47 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: atmel-i2s: Fix I2SC_WS slot width configuration
Date: Wed, 11 Nov 2026 17:06:16 +0700
Message-ID: <20261111100616.31211-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_020648_401250_EB1B78DC 
X-CRM114-Status: GOOD (  12.63  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

The atmel_i2s_hw_params() function configures the PCM formats
S18_3LE, S20_3LE and S24_3LE, which require a 24-bit I2SC_WS
slot width.

However, ATMEL_I2SC_MR_IWS is missing from the mask passed to
regmap_update_bits() when updating ATMEL_I2SC_MR. As a result,
the IWS bit is never updated, potentially leaving the slot width
at 32 bits.

Add ATMEL_I2SC_MR_IWS to the mask to ensure the slot width is
configured correctly.

Fixes: 3b7961a326f8 ("ASoC: atmel-i2s: Fix usage of capture and playback at the same time")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 60e885980f4c..d23ac43590d8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -329,7 +329,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	mr_mask = ATMEL_I2SC_MR_FORMAT_MASK | ATMEL_I2SC_MR_MODE_MASK |
-		ATMEL_I2SC_MR_DATALENGTH_MASK;
+		  ATMEL_I2SC_MR_DATALENGTH_MASK | ATMEL_I2SC_MR_IWS;
 	if (is_playback)
 		mr_mask |= ATMEL_I2SC_MR_TXMONO;
 	else
-- 
2.43.0


