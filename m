Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF1D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fQCY6IIg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSLO6j1/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=; b=fQCY6IIg9BQhiDht89AmQlMwwf
	SRXEPSXGhXwdWFYHYI2f9zJO9qOMZHA9LzwcaXxJLHKsO0KTEq4lq8OfYyi7MWqCygNW9ACssM4h4
	ku5o1k53HuSbqrXJ0ZLyvXVq8xNP4rJ+jv0vY3JpAY/hiJbAHbSPU+XNGMQOKz3Qz0I1Yw7orMBfr
	7lYU8hJ1VZfYW4zsf7QX6c0TlXzZ6Eiy0PV5jGiNjhD+4Bx6uIAeYC/IihNBUeZyaDBs0SmIlflsV
	OYFAYTYqsHVF9sXQKTRVCPpWD7P9Q8FxyYF2YSx3a2qFnX0TRea5i2fOU4zFadGiFUvool4UTGsFU
	jiVG1AzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Hd-0000000GMz6-2pzy;
	Sun, 08 Nov 2026 15:58:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ha-0000000GMyk-2NCc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:58:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491971ac844so127680f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153493; x=1794758293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=iSLO6j1/u0viZxXhAQS/uw5qXJp2UTeAzYgjysaIE3L2PAXk4z8DeqPbpmxkFljD0B
         mljO71ebR/71UAi5BhkeT99RcfhHwaHQUDEi9+H23h1Qv5WU6tFdYKG/ovz0BmoWunEn
         iElK1aqyDB1vdIzaPN6lQAq2DQseWnxANDZWTy4yPPphMoF64+CrZ5MnkB60Q+N3l3Yl
         6oDQoLLeFI1pg2j2vmrNilMtkN55aNmUZET9Ve9h96m45B8VS7iLc5pOUTS3gQi9+sti
         uRUtQ9zn0nCYdotYkduIDhHgq+GhQ5k36/LlAvHKNezUcqRvJuC5uzbsxqngy1/OLnkj
         AZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153493; x=1794758293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z65ViVZ7QDcN9aUeeQCDhAMdMHiR8hItUu4lI1V7+r4=;
        b=EIZ8SdSeegsg+GD52a2EnvWwp0acdXaS+A/+DX6+MYDeyhPY0T/rDSIBZnSp9sZHfO
         LGuPrKb750J8PkV4lw+jB7KJMstUsE9keVYaC+gV0NB2jATgG/j4m4Jz+BTXVCvpUN/F
         LjASHJsoFMJVgZsVKDpplkHm5RY6DiYx519DzHhTjUwMsPy4zpVZ1dLa4HPr4C2MCcZI
         D9SkNq/UmGvnzh9av8GBtqTRkVpdftyIz7NWKRGGW3nQSYUK13Yk5074u6qvxApeJsiK
         yVGvPfTVpPAHEio03MfCoi1fCRpi1ikocHkj83uzlnN/UDkLsECNJP0okG/ESGAKiRp+
         DVgw==
X-Forwarded-Encrypted: i=1; AL+hErFtr5vcRALV5nxJGmBjtNQsQ4jiPqEdOdPCSMrxVGXsyrlUvOigwdUqkVz9e25/rwXVaf6SrrcjTJ6rQ/6S4P4h@lists.infradead.org
X-Gm-Message-State: APuU4Z9nkkM6pK7Dgw2aSdhBcrVq7g13GSDJsqKnPcBICxKN6Re8Lmbl
	CjoQ9Uz5QhG3UqTv2Z3bM3TtYQnpcuF7ARSI2lfa/91SvHCcQRjFQBHr
X-Gm-Gg: AYBFou0JTj3mfRui4sd3XDSSDn9ZgX4uhBJQGoDmtJ/+2TUiQZyWQolJXqSzCZltsQs
	yyoV9sy8ZLCixomC25uPeozQoKYOh2+sdSQSAtgmFCkb+sA1TNQ1G18GK9chxfUjxnwOrrpI44M
	3hlYSroz+yGvbgLxbHuaS+/henNoMxdbp4YB6zZKZR1h02LLrowiQzSWhP1yDhPeL+ObzpGkAMX
	6NA+oErLqaphpjtRp34UL/3TXqo3fvMBLF7vxyU1MqFP37o4hGifdj9RuMIyxMbaH9DQt4NaczA
	RT+064lh09mCBrqor6XqWQyeNBlqlKfuHeo/YaKVixsYQD3TYRLgTpawSrxfWOBX8NEEZjLSbmU
	tfYCmFI+IyzUN1f59N3XnsH4Hz/b9WWPdv45vpYWAlObjPCyR2UB97EUljLiYMbY+kWMT7Ot1I/
	bE/fz0E5Ac3l6U050wxwZI+6k3mpwiFTMheEfCwDSCp4J68FrYM6vd0sq9Fs+BlSLvB6xv1pA1+
	bOjwO/DynRnX462U2W5ewwA9teaNUasAD671bhtUQPrTfNUiEXTJ1MSaMIDdCfiapTO1O5vKrLY
	/9IbECFPM19tHoG/nhrAiptHDYeaHGSA5pzVUsY04KboKBQi3PEu7/UL8mzOINv0ozoQolyMoNr
	LWWsQJ1MUZg==
X-Received: by 2002:a05:6000:2303:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4958530ca7amr4049074f8f.39.1794153492539;
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the Allwinner B288
Date: Sun,  8 Nov 2026 15:56:58 +0000
Message-ID: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_075814_620571_3758542D 
X-CRM114-Status: GOOD (  11.21  )
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

sunxi-ng drivers describe each clock as a static structure, list it
twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
a table front end: a SoC lists its clocks once, indexed by their binding
clock ID, and the core builds the usual ccu_* clocks from that table.
Bus resets come from the gate entries, and clocks that a SoC generation
shares come from templates. Existing drivers and bindings are not
affected.

The first user is the B288. Its driver is 212 lines here, against 749
in the current style.

This replaces patches 01 and 02 of the B288 series v4:
https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com

Pablo Mazzini (3):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add a table front end
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
 drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 9 files changed, 1101 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0


