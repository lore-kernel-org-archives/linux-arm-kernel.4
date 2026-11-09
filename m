Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5277606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y9ZgBW62;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yayMtlIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=; b=Y9ZgBW62LEkMXh
	UIvPhrwtm8fh9cDwQJ6L2JQWxTuQpk15OCFqTIZKZVsHkp3qYu7r1cDBxZPVkmmfeu+V0+tsSyOdB
	+lN43w7mSUX3h0Jkllds14PIxaRbnLPl+shcjP6wN6XJH3WeEtda62awBEuicDjObzexi63oNGIZ+
	dEqpjq+pTzWV1u/GcyTW0HpIiKVDEfwDEf4ATwN6dL+k1dt4oAJ0O97Oj45ZJVKKdMrvpxeHkbRYs
	/yHOEDh3iT/uMaUtMj374OSw7AtislVFPJN6Vq+0ZYkInXGKo6vFkhzy/ARPJwPclFsaRLhghNgSn
	fQWNF230wMXJgocNQdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVL-000000013Eq-2Y3A;
	Mon, 09 Nov 2026 15:41:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV9-0000000138m-1hTw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8772425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238901; x=1794843701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=yayMtlIW1JBmx9J0uew6s68LB+fqaeSuKjSqt0E3+/wQO4cxNShIR2Hf0M2taAcZNN
         LuDvji1W0OjhoGlwWz7IMDjDfjbF317A81tKtnzUms79LwyPL9ATDVMVzpkq1xVOKjdY
         PCnBDbcaMFZRPLvGgFYprSzR6et9G2+HMQ504G2yJd5u1uAMToQdBGoLR1ai2FF46EfN
         ciM3Rp8nkrnBlu6uJCq9IgAf5olLVqMEj9khM9ObEXod88W+Lj+/WNrws01tX1bL5jqb
         NenfxCN2MZk8U7KYWuaP4CxrnjrabKkgBqvs02SunFd8kCiMSHQYgmsQ7pyXzb20uaj5
         5+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=LD/yKr5mlVHn8Gz6npM2OkgVAMjCi1dXqsrYICK2RBzH82fByq7MHv0hrPCXPK3pPY
         pU9V8rhyqHJH6xGOd+l91aOTbEQmluc0rVZ9W5T8btBJ4ZRFjsUq69AzqDqyzqWT9sOf
         Ga2xlq2UuHzvHHZzZhaNPjZ8/NCwNBjtlHe011DDTYNj8koQzpVwAJ/e4fG8gAt/9JZa
         au33SsUACZHMIgB6yBFlUJ20JMncipny4bOIadIeDi/jIWVxWi7mi26lVVRaLMn6lUF6
         V5R3WDSqoUsSd8pXG+9aluhxXjKYtwn7mxN/7bFQf+UjtNsDFDwzRenR5LUupBoQR5J+
         zq5w==
X-Forwarded-Encrypted: i=1; AL+hErGXCvKd7PVr4+T08zXlEb8o60SJwafNtLe4sUnITbmn0QFnDh3Itwrh2oelmzdKkOIOX6FAQYVw11OfI8GcGfaN@lists.infradead.org
X-Gm-Message-State: APuU4Z+LfsGoO1OP9d7i99G7MdEW2niMaesDm1tSfQsis9sqDzKM9fSJ
	i9qt5x+rFC9jzF2RNrbcovzlv4bBps61XqO+QPDXVWOdvvNTNsVzTkGF
X-Gm-Gg: AYBFou3stcWvHvjUF4u0mu76Sqq75Dno3yWCHfrM3v4jexcx1U4uegYjY9AJq02wPVR
	fl7FW1uyNz54IXU//1inlCJkLrxeMHPFvQylOxH2FbE9pOZHGWPLk/wUsMfPxhWJT+GeDCGPUf/
	EZjywZnYUpVBgZq76529ALEjdZevA8nWoif55SzaGhF6QnBjNCd4uBQaYz30JA2Nlq0JGBZLtSy
	atqito7GsUpZ2nWm3yZf7ysTNj2mEXG7z/r/QaYIiJQ7pWSd/0qa3D3y2Sp80lYKxr3oiV+/fse
	d+AvbHO+MsXW5VyYVecHc/4qa4c+42tLJ42Cv/DIFDw7j8a2TSFZdWZQ7hR//dYI29RcpXveeT6
	BdMKuq8XFFIgbiYKKYwV5Jn5TOHW4C9EHfQ0EoIIn9snsEImjoWAW6l7BB6/m0Q2qImXCdKgSqg
	+FQluOAYllxj2Gdyw9cdyb3D2nTzAuA91ncsEDmr8RXYedOBRii9i6egg9apmPs5VZTRIDQRCrr
	Ql2n11Pu/nQJTACWtfG2rVPiJdWQSzNGOfJTFpW5i4MrTUjfmZHKImeIn3/iVxirC6W3rRhBqVf
	1xYsREqku55MTClsej4iUQQj6dVb+9CJDaYq1JyUI2duLdsEWjgtiR+qyJ9uGwspXN9AYFlW6c5
	NMw==
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr78879565e9.18.1794238901583;
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
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
Subject: [PATCH v2 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:19 +0100
Message-ID: <20261109154120.592392-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074145_717754_5DE24246 
X-CRM114-Status: GOOD (  12.65  )
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

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0


