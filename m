Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC3F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PPpjVMFa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZGjHH9j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=; b=PPpjVMFaNnbfJ8
	qbP8vx8ogAm6f4Riff6kYJH2KeOz056vvENqcm9oVeTW8GVL458/K6PnIfi5HGcP6RYdZmfifdHIy
	xhlR9V4n0m4vQZMfbwkw3Byw+4cvgx3cYAA+xNsXDMAha/93il9pRL//Hd8B4tkmEbTRycoi/tGfD
	xZ3fxaPfce1MAUS1blDitNNI6/CYvuzQ/8blEVP4CR9ZAaBa0rk5VdaDIIImOIzv2cdz5ECPMboqF
	TPVhkp7lk1rk9f05Nmpgy2mxz2zmXM+UX8h28AhPp/7RbuE54uBa9MrA1whYgfh/77RkN6CwlACSY
	F9DJKG5hLyQ92urSaMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBm-0000000FQEf-23nD;
	Fri, 27 Nov 2026 09:24:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBj-0000000FQD4-0khl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:24:16 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so4392863a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771454; x=1796376254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
        b=hZGjHH9j+5lUrR+DyWk8B1bPTUhNinj65qjGrm4btHBjP4oXrftp0DhgQFV8tZxIgv
         Id41KRsbqbtyE03i94I203vzFnu22vxNH3znQfE5RamnXVQVfhOZ71HVzLvQTgEaRiRA
         2RzVTsNc8ZvzwaM5MdFQHKbKTlphEZtvTqNK4bs9E6feq2Tdzm8efQ0eSsSJg/fe19rv
         zCI2lfwXnNrum3tr9SbfSoqy2KwsP6SLxOkRfkWwjZrb/HSoFYt0RA6ABWxEpplIyTJc
         oTmpevoYvpfBoBmyVMP8CuyBQrEZ26L+iU0oAxZNksX6jY8Wx0yFTTgSlWwtk/ipeOPC
         OWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771454; x=1796376254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cld24QN+1u4mT2MWMiCkwvVZkrkgbkV47el//g55Ho8=;
        b=u5HIivn4Xv/PjVU3gqq4JV5IUBdPviUEsxaO6l4NyEmatu/HRqHc/C5rQ4rNp1jYdr
         YTA90pL58mKHoVVsdykiIshQ1RZN+cGTmNaxDlutQSPffsv56XyoRzZJmsM2ggyD1TS6
         tUSjyP1YSMNF5C90sURItIYyRL1Fihi45oRTL+73Jr0ezlKxXL3PC6ePa7uiCsCi/Nu0
         t2iydHp8ETgm+Oeg8PiVMuqRYMIC1qiKCVarYjo1ZN7O5agdxqzXEUQu6fFtj37ca0ZV
         cs5Vo+j0jyigXtFdGbAsORjIznK3Dy0+q1MluciF0WsJBJx+E6rO6gvxR0ZuQ+lLJO9T
         Jb/w==
X-Forwarded-Encrypted: i=1; AL+hErGuHIkccRp7oCMTrsI6XRzl7Oz8xXaVEkxmw2FCTHhS4zrN2g5rHJWmdwHrbwebmnJl2XJgIaJC0jrGbOfWq55q@lists.infradead.org
X-Gm-Message-State: APuU4Z9GkGZY9o/exU0c0xnw4Vjn/acbBw9CprnmtkjV2epSDau3IZ+2
	tHSHR+7UfIEVY7Kg/26VwOuInMMPd8FNc0SFdAtOW3RkQk2DDRIu3SM4
X-Gm-Gg: AZFdTZcC47qqi0HoZCpHLzll4LQXCiWIjg9ciB9/b20Ot+PVIDznfOWNkDia3l07bBF
	f2fgcta5t/F4mtAj6dVofYoUs+zJuqb5pcmqvxaBtDsfKkpz81CBO0pxfxgoivaPNLcqyriBUt7
	J4W5ZqQO2gi6PFXipAerOsu3jwQWne1ST0MB6vgHeW5nOwrKjcf8Mom4ihuFhhW3OCiCBZ7CBIe
	N2+KuAhjrZqCoJT+yCVrX26TXLwTPK95hZh7anfe8O48YwUNpFrsx4o6OCj3vzal/2Fzwzsv+eE
	eJ7YerpqiWOIfouQp+R8iUN6AR5sRA+l3XNA7C2yXbMMf0R0/zprEI/zc91p8vXXZGmyxbKyupq
	dTeRt3BUoR3Ks4SWumBHq6bOuJVTvvVSb8e2AHUgrDjuDbo7H1Nz6mmNalpizTR2aEDJd6RYvNT
	+I6no9/xVPu2E6oTZZrpww8Nyjc57gOWmoJ0X7s5xaFX78Bu+gYfZnt0bykJ3bnL3NQz2juWlop
	Bz9hTQ4fB+bNy9Nbf+OqkBRI1AY2WEcqJmy48dS/zsZUqtZWwQFWs2HiORiX21pGxFbCwOgmeST
	urneDAfj5rQ0yz3BL01ovpBLxZZJvKkzO1LU2dxNE2U0QWHE/RDzOeQTjVhq0dBnbdXYhne3ppE
	tc/j+xZcKByEJVRkcyJ5O0bLKlLAZdwdipPkzFZcaJWnZ
X-Received: by 2002:a17:90b:5407:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b41c961ed9mr15001842a91.39.1795771454306;
        Fri, 27 Nov 2026 01:24:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm37942052a91.6.2026.11.27.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:24:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: stm32: spdifrx: Fix refcount on sync failure
Date: Fri, 27 Nov 2026 16:23:44 +0700
Message-ID: <20261127092345.12383-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092345.12383-1-phucduc.bui@gmail.com>
References: <20261127092345.12383-1-phucduc.bui@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012415_225390_2384AF1C 
X-CRM114-Status: GOOD (  10.93  )
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

Roll back the refcount when starting synchronization fails.
Disable interrupts if no users remain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_spdifrx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 467c3c583a00..ba6c715750aa 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -358,9 +358,15 @@ static int stm32_spdifrx_start_sync(struct stm32_spdifrx_data *spdifrx)
 		cr_mask |= SPDIFRX_CR_SPDIFEN_MASK;
 		ret = regmap_update_bits(spdifrx->regmap, STM32_SPDIFRX_CR,
 					 cr_mask, cr);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&spdifrx->pdev->dev,
 				"Failed to start synchronization\n");
+			spdifrx->refcount--;
+			if (!spdifrx->refcount)
+				regmap_update_bits(spdifrx->regmap,
+						   STM32_SPDIFRX_IMR,
+						   SPDIFRX_XIMR_MASK, 0);
+		}
 	}
 
 	return ret;
-- 
2.43.0


