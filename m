Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046A8606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6zxzbhw;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TuJJp+Ul
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=; b=Q6zxzbhwCQnhyHWX14J3mskhiN
	ZxpFilDVyKrSPsFOc0Qdtv29khlqUpwX51qdCEJ88wnu3zGkfM6fX1Dqv07+n/Y93qFClNmmvRfJk
	RCr7oL5HKESfP+3UOcJ0yC5GpIzA5fl8qwqPYHIb9COuAJZfhIvMTe0JTScFd2+vuVUrLljiucuRX
	J4lRy6Iloo5wwmw286Jo+3YufBrOSMEH0Ivlzp4mgVh+1BDa4CzIlLIvzwecBamMOIkn2PI996ja7
	S/ysguXbZvs20jM+wk4cCcQg68aPBYlFITu2rAyF2Za9M+NZs1bypW108rXJKw0s/eqlARynlXvyv
	rKG/kqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTd0-0000000DsBt-19Wc;
	Fri, 06 Nov 2026 23:45:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTcx-0000000DsAy-1AEg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:45:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so945759a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008746; x=1794613546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
        b=TuJJp+UlPBu3MR7jZjeSRYPkj39KAaBMY8yEpEh3qaX/x6q8xrkyM+SrLF7be7NKno
         4D8xHEJYeNADL/HWmxq6PLKgcDX23yAi5T+l13X46s7pEaSdgOE+glKafaYnjPAcWiYn
         MCDh+SW2G8s1a60RZeskIWNO3f36XYXU2GqaorqCfBgxIbJ+eMDmn9/pzaFusxIK4Jex
         2T+sAPG6CjN4CtO1xDtZtarNpUKz3fOFD26Ho9tf1rWGnY0UYUTiQLhuKEemfsF5TC2A
         PbPTkD4TKmwfLGlEphlqY8FRDXG6KtQW4e/3zwmvlxpGjz5RvehXpj/gzp0xxA/rnlLL
         00wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008746; x=1794613546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
        b=iZN1ZhwGloxj/OtaOjF/9cWaYYlYuC+3wmMum5myjKTdIRL2Z+HSZLJ+fOU2bXu6Zs
         tbFzcLeBw9Q1nU6Epg2vkLgPdCI7tbpBd+jsbPNKsN0blKlFwwagj89dWo1+E8926VI6
         T+OrktuW79kOJRc/2ceJgf8lGkJPqSAckvq0MEkRaE46Xlvj8R4GMTR6jowQovc8KG5S
         iv0RZY6qV2xU95d06MrWiIoi7758nD4RJlj+w170qkrsmETQ989GAQU/rvltJluE2Iu4
         v4WNeGGqEeiB668TuFhAq26Rukwjfym5pm58vUwKBr1GMVc08nvZYMCYxuT+MIMLPtFW
         HCHg==
X-Forwarded-Encrypted: i=1; AL+hErFkFqIeG4dQTS6g8l3C1jwRDPSD+Kc/8zApmNGt83VI1cY8HA5Y//SFlLdkoRGx7DzI6ExwAbgdIDM0rt0PB6MR@lists.infradead.org
X-Gm-Message-State: APuU4Z/l0YGRfv8uO6djS88LrpSDqbNGCW1OFGingxZ3N/jFb2S1VbAy
	x/eoVCbp0Mu8JYFE1aVqdZp/dwVqt06RiCFligl4hEFsAqjCqV6DT0dN
X-Gm-Gg: AYBFou2pJmCuFLZy0bRVRRp2aEV5RD5Q3PMIjFwibsqo3C/g12asML6B8t5oFEWcbWz
	wj+SSEJt0ronJLvnjF/185plXtQBmjjUvZR5iBkx2HV/hfuDeLrVqyU9iMGKYlAHtOV9Wb6C13Y
	lviAyioMYP54fLHGphC9K4h67/ktekC246afZ6rd/GRlSkctfrU6RUKA6AgPrX1o2oIsei5qX8i
	vaPPpzSx9PlWgSgtNWdRbI2sdgQklrDfc8yigAk9oDTolyQcdUeWubXacgsZsFfghu6BaZaTqCR
	NaZXweINj+6tkVo9TM5ocS15YqWrR071UbD/BavJt6086TCgONqInCPxUtpmBwEBRBASYMl5k3g
	2o7OBuCDxPYZKSBmBPG6IQAfz6X/hIvS7r8P0vzK6uXOzT9zS7lRAs94u1NyZqw7JPCwgAj2Fto
	9prD9ESjEjAVfJKnanrM4KVz62Gdf7xyGf1XpohFX8z1WW1lEw0/V/vTG/MKaoSoYQxj8Rh4ZzN
	j5HhQVdm8zB0colZ8LZGMqjse2tOmJt/nUm97y590UWVE4p73NCVbdCRY0vOcbtjFZ2fTYJZ0WY
	RqwBn9uJFpWkkJdqIIQY
X-Received: by 2002:a17:90b:4b04:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b0db6d2668mr3884714a91.36.1794008745732;
        Fri, 06 Nov 2026 15:45:45 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:44 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
Date: Fri,  6 Nov 2026 23:45:39 +0000
Message-ID: <20261106234541.1474324-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_154547_529936_5C3B8F73 
X-CRM114-Status: GOOD (  10.76  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Documentation/arch/arm64/silicon-errata.rst names two Kconfig symbols
that no Kconfig file defines.  I checked every Kconfig name in the
table: these are the only two.

The GIC-700 #2941627 entry names ARM64_ERRATUM_2941627; that workaround
is a GIC driver quirk, matched at runtime against the GIC's IIDR, so
there is no symbol to name.  The Falkor E1041 entry names
QCOM_FALKOR_ERRATUM_1041; the symbol defined in the tree is
QCOM_FALKOR_ERRATUM_E1041.

The two rows come from different commits, so they are kept separate and
each carries its own Fixes: tag.  Both are documentation-only changes:
the table keeps its column widths and no build was run.  I did not add
a Cc: stable tag, as nothing outside Documentation changes.

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the
tree and the git history.  I reviewed the diff and the reasoning, and I
am responsible for the submission.

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0


