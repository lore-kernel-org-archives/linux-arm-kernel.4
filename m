Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rkjaSSBk;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZHzxj3Em
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=; b=rkjaSSBkJXsZpwzqNneRbSB4IV
	aJoOhigQotDS1IiWSuVItMUBZY4KIT0PZLevPck2bDN1bkS71buCXLpyAogFYzoCspwHMjvwTAVNv
	px/Aa9QymUIdmDbT4RWGy162LPgXZ46249jl/AgFBIKX2aDA2xb1XzRKA6dZBeNg4GEtEKMnKiEMH
	eRgVVhEHkq6hRB5PkS7XGsJVm9HXK+612vzJMyvWt/B2mlB/I34ycWf/Zt0+qA+HhCAax6neAj/dt
	WpbiarsDfRKINOGoMnOIjOOdkrDdDU76+LUDMbySscx/o7Jv+QQaOlRCQVFfG4H6jsYES2oNCUbpi
	DBFPhyAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUD6-0000000G4g3-3HlD;
	Fri, 20 Nov 2026 19:23:53 +0000
Received: from mail-dl1-x1246.google.com ([2607:f8b0:4864:20::1246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUCQ-0000000G4Vu-2PoR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:23:22 +0000
Received: by mail-dl1-x1246.google.com with SMTP id a92af1059eb24-1a71dd190b0so3642345c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202582; x=1795807382; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=ZHzxj3Ema4Bu6tIq9CnwEq6uGeRLsAl14hIiDv9s9jC48oXdfpNA/H6BM1jflKhqOt
         2Seb7bP4rvJ0Wp/mKNVJ5cHZBmqEACcJ7Usvo9YeoM1OINrPVsuX23c5mHZZB5xEI9cS
         GvZYsGYw9CYEph7kB/xb/f3/+WqCmhOTMBqFR2pG4IFriXwevABlNur3NvpPoUyFDthQ
         96n3/RUmxq/laetuSPyHV5DXt8D45Ot9JCbnKdxJAbfZTMhkRxwCDnaTAAc9a7Io80jp
         FyL7rF665BUuW3Ke4+Te6DyoYTfDOXfUTCtTJpTBs2n75AAcF0v3WR8wDtRhn09jBf9m
         tmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202582; x=1795807382;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmqKUKumdGxdwkhpKUIyZ7SdR8A0GxJKvjackS3hq4w=;
        b=OB2y4ncuWsOkBD2RPDd5j24T3Mqju/Y22V/lVCznUHsv8mo2+oPITcGeRmLhbOQF/I
         mbq9z/xtubLYFU0mFFx0+QNKLpczSoeL6eQ6tKzvALAC++TZ1uDM94ATjL6O9vB6WI79
         HbYCvZbFTT8pRXaFLIb3jvX8X1YNxq5uY4t5Etlb5UhcHsbQpC5nsM10CheZW31MrUzw
         UZ/FRl+oNMO1p+GKle+Y7d4gjoYJBEKck1E3LCeYzH9+9gzAQ0bTW1kpQ/KteSkec5wu
         bodzszN3h/164EViryE3o7AAhS9TyzL7ogu3U1xqwhfTIVKwxFm8UAykgHuTUeU6cp1+
         PHpQ==
X-Forwarded-Encrypted: i=1; AL+hErFS+lUr/AH3FB9nSdowkKWT3broGBRJ532B3KLGrQDwK9TJcCguM7NMImQCwlHU9XoKQtLZitnD/TEUnSaM+eK2@lists.infradead.org
X-Gm-Message-State: APuU4Z+hWDY+HJdVOXQapvK4ApG8OK6JSR2EXycGoC5j/qi9VPBtTD4+
	yaBoXIrgnmYhkMn9RNgqarW48yr9TG1I7KpeIi2m1vTJTIUbb9y2Z+AnwjEucLB65XCC3lPa5BN
	WzA==
X-Received: from dydu5.prod.google.com ([2002:a05:7300:51e5:b0:384:8179:4ea5])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:465f:10b0:1b2:48db:23dd
 with SMTP id a92af1059eb24-1b5568cfbcdmr4131052c88.16.1795202581997; Fri, 20
 Nov 2026 11:23:01 -0800 (PST)
Date: Fri, 20 Nov 2026 19:22:35 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192237.2870582-1-elkin@google.com>
Subject: [PATCH 0/2] ASoC: mediatek: clear afe->regmap on devm_regmap_init_mmio()
 error
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112306_663836_6D98B432 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  ASoC: mediatek: mt8196: clear afe->regmap on devm_regmap_init_mmio()
    error
  ASoC: mediatek: mt8189: clear afe->regmap on devm_regmap_init_mmio()
    error

 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 1 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.56.1.750.gf70dc682cf-goog


