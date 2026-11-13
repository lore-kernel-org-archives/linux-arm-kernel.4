Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D1606A8BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYIEU//Q;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QGplaUZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jcVvNA1LksN88nh/Er3FQFE79HxWvLX+M8oefDd7Y4U=; b=vYIEU//Q9HSHARfwUAfofHwC/6
	CFeQcUPZduA/8Qof/uIossM223kr+kK351dfvz/ubep1wlrEORf4ZttYFGYlkVTeNLDQmdgGeAT+b
	pDd21dKcmYta5fJGqmZ16YIrwkY/W9ILwwA/pY8bf5lYvK74Lfwm3HwnsJdBDd89ORMfwFRVNWXiA
	3tQxs/5rXr+ugd0I1lekL0nipWT3jQNa72t8lajfFpfiyDIL+G/13DYeJl5n66SfKzK+LiMMVeJIL
	HpnW/zBl58ss3URuBfdTajq4VgF/L8bJWmrBz75ozwC/CPPr6Uh7WIEoGvbrC7NKSAgF6UOtS3aHC
	Q36c/i4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrf-0000000EahT-0fIf;
	Fri, 13 Nov 2026 21:31:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyrc-0000000EagK-2CeK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:31:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so691367f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605474; x=1795210274; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jcVvNA1LksN88nh/Er3FQFE79HxWvLX+M8oefDd7Y4U=;
        b=QGplaUZ3WzDip8zJPH2pt7+/xDuNbMrVYaW0CkY9DfNBfjoRBxq8Bhfjkx3MLXVOmc
         KcQsFRhWfc4XiKnaNbQgqpmJE6fkiMSicMyGYytctBBa5eAc3LpNYIqqk1gaFqJWLxqx
         icmkf/KUpb7+IZEmSp1ZPRHARmw9AWukZkZUEeKgzt3wxJNjnqAGmOGv21iCS6wPGmJV
         BvvFpQqP7yZH0WVQzx1wEpjJpFbtNRY66/KA9e8wRLwGBVWCp1ygiHfG8i7WizW+ERiF
         tiwPSHVtM0kKIDe23TRQWn5OZDjEFGFHCNStAugWY1a0mYPXv+p04aCGOc074NQoSaJf
         xwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605474; x=1795210274;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jcVvNA1LksN88nh/Er3FQFE79HxWvLX+M8oefDd7Y4U=;
        b=aWpk3qet+IddG19zQg8j4Czf97InasoGtun1jgvHoy973tmJwIazo3SMYys2+DQxuM
         FKngZKjBMsU1x7XNkZxBIN/iJlO+YV1+qc9znIi9mnzWvpjqtC3oEU1WI9lUA6QkRTaL
         mBYj8EhvO/Qc5clKT5+XDPXnzDQEXSktUYEC1sQS3abtKv+2ai6OKxFAl2QgyanfvcxJ
         2NArkutr8WXf7GlVGJqogINd6pWjKa2iy5jiJB16LYktVpl3n3lLhI1Itw00KEy5CnHJ
         BEsR7vwtR15MpajLVbpyPjnhkVUCmSA4/jxRGrmDx1dVYccTBuC/iWNabznjynNubCEn
         HpAw==
X-Forwarded-Encrypted: i=1; AL+hErETNtbUkh9fcYwTNDeqKGOe98+hBHu7uoBjPSz31sMEIcEyXgR239tWnfNj4/jcaUCOhZmO/s7HPbxh4E0vkNuf@lists.infradead.org
X-Gm-Message-State: APuU4Z8YZwSogyl8DSZ8ewebzoKuaRVZf2cvxlflaGJVmAX3kJynZvj3
	bdkICQAKAULTATcOdMRMZA5m8IUUvsOf5Ol5FLvQHz2FXs5KCg7Vl2QH7mr5fNdb+YwTZwGIixx
	dYFYvUp5sPg==
X-Gm-Gg: AYBFou28koQo7gYe0OD7mZ6AQIIh5/zCVM3cJ1e4beueGBj2zTwVVmPUvIpZIV3/v0j
	nDF/5T1YxFL4bTQKrwllJqDSD8itXKHwUzHeYxztbPPUxWKQV/NZ51PovkbQKJBxK2UBItRf3Ry
	guYpDn2eslUdA4CToUmEF9wtEaXjmGvr15K/1oI/oxWxYG6J3clwF5TYZD8fZa274RL7NE/nq1A
	yMAVg4MFJ0h1KjDf4sz8nDoDQn+elqe2iyfByubFgxJQLBU+fyE0QwTnBpNbB79YBbmqCtfw73K
	R6RfZAzOQfTlOrFGFtBiuAkBGHQXKUoc3v5czEYGcVbiWm4sxKcIk5j9l/9gyBrTBS85RapPfQB
	rdwmS07UROCK2Jga2J6m8E85hEqI29jGVzmkr3Mg/I6a85Qd5LvIb8tlG8nJTVbDxDnUEuzd3dm
	QdPe+ncWNtaMIN3xiLwWXypaMAe51+4xl68PHUzR20/vXmaDU2VopiMIMKtRXYcjsDH5GzHsMzY
	nWqj8m5cAX9KyFIurexpGEj1Q9dLuXIxKLXyIUZvkzU26mYn1CcqptpvAcMp5yE6I/elXJpNLTq
	NJqL4UjP+2Zse6k0gY+xuAQGlXGCO758Sn10O6sX7ZZNIfsdVVdW5KuHNfq27WMhNWLEPbN7VGn
	aZzq5oluqvZ331JETO9ao6RcbI1DF7g4DmlF7wvyz2WRk1gs=
X-Received: by 2002:a05:6000:25e4:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49c6b788c35mr8390429f8f.0.1794605473829;
        Fri, 13 Nov 2026 13:31:13 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:13 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH v3 0/4] clk: ti: fapll/dm816x: clock tree and calculation
 fixes
Date: Fri, 13 Nov 2026 22:30:46 +0100
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBQFr0K69pu2UlJceQ/joi0fqCCQFomGc
 HdbiIkuWL5k3sxMPDqLnpyTmTicrLd9F8bpkBBTq65CsEXYhFOeMcpSGNRoasBm7J2A4iFZJsG
 0DWC6AUxoSsJ7cFja12q+3rbtn/qOZoy6SNTWB8l7TU8sct+K2K1MDChInedGmEKIlF1a2ynXH
 3tXkZiZ+I+Iy30RD6LCZLqkpdIK0z/Rsiwfr7YkUxoBAAA=
X-Change-ID: 20261014-patch-ektor5-dm8168-clk-e426101415b0
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2296;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=eEMKCkSJZRXgEvsvPPTkLeYwfdGBsD85wJfM19/qpMw=;
 b=nYfXjSOrK0IvytX8ZmDY54G1+AthZRvB7qQoAfcIeKA6shrkMCKVrsoLXk6sJvHuDsGSbWnuA
 SrgM+duc8H+BWEYcmNr5U5KDYo7RPbkYIZhaSvQ7Anm/5NtMzNB03ka
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_133116_615534_636224BE 
X-CRM114-Status: GOOD (  11.36  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

During TI DM8168-EVM board testing we found that the clock hierarchy and
clock calculation was broken already on 6.12:

    main_pll_clk1       <--- main PLL should be parent of other PLLs.
       sysclk1_ck                   
       main_pll_clk7            
		...
       main_pll_clk6            
		...
       main_pll_clk5            
		...
       main_pll_clk4            
		...

This series brings fixes and additions for TI DM816x / FAPLL clock tree
and frequency calculation.

Summary:
- Fix clock tree hierarchy by not using ti_dt_clk_name() helper, that
  causes the first PLL as the parent of all clocks in DM816x.
- Correct rate calculation logic in fapll driver (1/2^24, was 1/10^7).
- Add sys_ck alias required for DM816x clock lookup, fixing a boot
  error.
- Add error logging for clocks failing registration to ease debugging.

Fixing clock tree hierarchy is critical as it fixes DM8168-EVM boot
failure in 7.3-rc7. These fixes are affecting DM816x SoCs only.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Changes in v3:
- Picked up Brian's review suggestions to extend commit message.
- Added constant macros in speed calculations, removing "magic numbers".
- Link to v2: https://patch.msgid.link/20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org

Changes in v2:
- Fixed off-by-one error in clock calculation (Sashiko).
- Fixed clock calculation also in the set rate path.
- Added Fixes tag to clock calculation fix patch.
- Link to v1: https://patch.msgid.link/20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org

---
Andrew Goodbody (1):
      clk: ti: fapll: Fix clock speed calculation

Ettore Chimenti (1):
      ARM: OMAP2+: ti81xx: use non-scalable voltage domains

Rouven Czerwinski (2):
      clk: ti: fapll: remove ti_dt_clk_name helper
      clk: ti: fapll: print clock name that fails to register

 arch/arm/mach-omap2/voltagedomains3xxx_data.c |  2 +-
 drivers/clk/ti/fapll.c                        | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: 2800868f63227c8237d70c41e70d441c919620d6
change-id: 20261014-patch-ektor5-dm8168-clk-e426101415b0

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>


