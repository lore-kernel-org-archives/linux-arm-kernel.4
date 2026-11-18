Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XrIryNET;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITSJ2Emo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=; b=XrIryNETIgKs9Wl2nCAPO3oy1j
	qCRcCwPg40ng6v0DOzKBqBPBqpcB3wjLf9R+gp3aT9vwyNANUg8CQcVgnGUxjj5X379ci3LoLZJ8l
	gmUWedzFoR/R/BYyEAuUIjN2wUS8amQj2TK0QLSH/Wzn7HeDpagPbNm3u4UxeILxDFJloEXUXS8/p
	xmNqoL7/lDEQqmIFGFyqyLq4OaVAfRLeEQhZgXc3TtHQYFXNacrLbgI9AK1wTwTBMNsxgqD5FVqaD
	oZNpsfyDmDYoPSypPLz5k8j+U7aLlBrzKbGuq8ChriSfUZMT5btUFIkyH3RVxvCLytp4iY/R/sC84
	g5kzjHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiQm-00000009S0y-294O;
	Wed, 18 Nov 2026 16:22:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiQk-00000009S04-1UK2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:22:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so837279f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018959; x=1795623759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=ITSJ2EmoYqgDuf9EpgLppTqLA9bx3kCKsa/uAOiprECL3j9fiEbng3xHROzKIpRUv8
         pTET6D1qWlQmU+3A9ZtAi8V7CFXjYhMyjcrUd6x5Z8UpJW5NnWbi+UgjRUfxDaIjIbtR
         wUB2wSw8miMTFFBZ0BaaGtPTAkGwP2BuCcsMkHXSzR/hUMAvnuvwntZdnwvBZjC7Xq49
         ABbu94hnx8jzqMajHc6qca3am93SFa/9MU6y57TTz+SraDKaOK5J8sdxoa6Zyp0wQnHb
         mcsOl4v0GlW3O3SxsQGqCVvdgukr2/Xez9futd6hGpQ/SpuYzUNnuBCgSvLUEEfyGRXW
         CfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018959; x=1795623759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=DBlBjC0B9GWSXoq2JqVOE9/kzquhXPpWum0t3saC7SGtsEefc974iG6omZA2eBbeGv
         6SpYnSUBDXOMC2C2qbF8qpjgRjF4fB2EExgUb75f58mg1YgGgNprjkjW3bhFd2BXLnU/
         zqJe/zYMqhB0aEs/FO6rd2ARqAAd5cUNUX1Qa8HUVAyrwDkXQNfifJgVMU5WbYA2h2Ts
         cIUtTT0G2mrEI9ZaBL8woP4v9nQtS+cANqlpJCcd7bOpRrFIXx+BoLfNJNsJXM4btPG2
         rx3pM+Uhf3O/nTO54e/0y6FrVOMRdf8CNWfP7q9orbr/+5XlxKBlLfVNkp+uVsfmVDKk
         0+6w==
X-Forwarded-Encrypted: i=1; AL+hErFOKNbHjG+xH96inkuvtRuGP53sHLEWGMRErSlPa487/8Kn+hcrfmQ6dKZ6J20hBCUIdNlKKna7pMiWSQd9D0cS@lists.infradead.org
X-Gm-Message-State: APuU4Z8einRzPVNWCYhAke4G3P+yIh6a6uud73pi8FbWrRHk46GQatyJ
	r7T6aAwi+0+Cem6p7iX0VV5fqF4iEcc57JHT0q9uDKYQUtwn97c0iLnX
X-Gm-Gg: AZFdTZeichCPOhwjSUPy0uc4wQKazGMAjww8JyWf2SOneO7aCnP4/DKivY0zauvMGcr
	q6sTZ2m/fJW+I66DGxWip0bq3bYBA6hAaZ4iKeb4/mcTqITUlcEASutbp0Udq3W1nlee7NHMRFG
	Co+xjlnjo13VxMymG4G06rLuNF1vHaV3YMAuSZBYyIP86JdH5osJpUO5wejc2ydOEwnRZaREIfa
	kYEheW+xWlgNUZEN9TyeERYeshUffDLL+AtojZOC6SwooraHzWTTYemm0L7scd3UL9Ai3fXW+xX
	AngeHUG5EtauNXylBLNq2u5xJeh5ml3O1Yiis76/0uFwQzYvcE4T+775CA69lbHcdA0NiJzgOdm
	NTfYdmR87U2KcLUBHyGs3F0U6JglCL/gQ9xn4eVqv/iQ/v2iMKFk3fQnJb4hbCDk54DulFRy3Zt
	4MK5L7a6T7N73SJ7rhXCMu3lOBUAP9+sCGbop5Ky2CDLjw4t6SbIGV8efH2Y3CGn5PeFRIIUY7y
	dAVRWxWLLwgJdh6r2u0oio3KPfWKXMYjMWqZ4OjV6i8Dp3nLd1cassTKHNyFC66PLuBVAe04r8+
	z2Fzh9CH0MMsWHStLjobtnP+tUR77cMCCoBKbJrRq3pfv60gW/jmb0cth4bKKyo4ND1w81WTLEq
	tCo+kkeenmg8is0NwLm4QNHbNuiSv9TY=
X-Received: by 2002:a5d:6f0f:0:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-4a63c65829bmr5664866f8f.18.1795018959207;
        Wed, 18 Nov 2026 08:22:39 -0800 (PST)
Received: from localhost.localdomain ([2001:861:39c2:e340:26a9:c0e4:d23b:6722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5780458f8f.36.2026.11.18.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:22:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: use div64_ul() for the rate divisions
Date: Wed, 18 Nov 2026 17:22:37 +0100
Message-ID: <20261118162237.1664352-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_082242_417897_C1B0C212 
X-CRM114-Status: GOOD (  13.91  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ccu_nkm_calc_rate() and ccu_nkm_calc_parent_rate() divide their 64-bit
products by an unsigned long (m, n * k) with do_div(), whose divisor is
32 bits: on 64-bit it would be truncated. The N, K and M factors keep
it far below 2^32, so the results do not change, but use div64_ul(),
which takes an unsigned long divisor, as coccinelle suggests. On 32-bit
it is the same do_div() as before.

Fixes: e9d9dae0d248 ("clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611151822.QXTOs54d-lkp@intel.com/
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Follow-up to e9d9dae0d248 in sunxi/clk-for-7.5, for the coccinelle
  report of the kernel test robot (do_div() with an unsigned long
  divisor); squash it into that commit if you prefer.
- No functional change: m and n * k stay far below 2^32 for every NKM
  clock, so do_div() never saw a truncated divisor.
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31 and
  A33 CCUs) and arm64 (defconfig), no warnings; on arm the divisions
  still go through __do_div64 (no __aeabi_uldivmod). Not run on
  hardware: the generated code for the rates the hardware uses is the
  same division as before.
- Tool disclosure: prepared with Claude Opus 5.5 (Anthropic) as a coding
  assistant, from the robot report; I reviewed and understand the change.

 drivers/clk/sunxi-ng/ccu_nkm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index e5a8f22d50f5..a11d51dd0f2a 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -35,9 +35,8 @@ static unsigned long ccu_nkm_calc_rate(unsigned long parent,
 				       unsigned long n, unsigned long k,
 				       unsigned long m)
 {
-	u64 rate = (u64)parent * n * k;
+	u64 rate = div64_ul((u64)parent * n * k, m);
 
-	do_div(rate, m);
 	return min_t(u64, rate, ULONG_MAX);
 }
 
@@ -45,9 +44,8 @@ static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
 					      unsigned long n, unsigned long k,
 					      unsigned long m)
 {
-	u64 parent = (u64)rate * m;
+	u64 parent = div64_ul((u64)rate * m, n * k);
 
-	do_div(parent, n * k);
 	return min_t(u64, parent, ULONG_MAX);
 }
 

base-commit: 3f8438336a3b340ffbda9e89480630436423782d
-- 
2.43.0


