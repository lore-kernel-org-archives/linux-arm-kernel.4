Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dX4i4tZw;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvMWNQ78
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=; b=dX4i4tZwIhpMlj
	pgnI1B/xsGKD+XSHexQuYQ84+umWH7lwQhUYpyCu3l4rie/SNahhs33uGU4i3sQ8qIrdsToWEsdRG
	THq1aw4CGuIo0ANyEiW6wESbXQJXIZSAjynREmMs3UH0ZmdIfiNTpP0btIkRFCXIuWe9hHh0/cOI2
	sAQHXEO5SNmOpuhPshyLvgPVZkuaiIat77Ilo8IeqAXerI9hkLW2/sTiul4GW9az2v7THvpYKo36U
	/XCspfscsGdfq7MlBP/tdmDwUWrUEAlWXu2s1lY1mI8HPsKzRZvjuBiUBOGQBvTLNMz/y8gj4mnkX
	RKezvpLXJ4q87C0Mc6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTnH-0000000Dsqc-0kKV;
	Fri, 06 Nov 2026 23:56:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTnD-0000000DspL-2E3u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:56:24 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso962572a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009382; x=1794614182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
        b=FvMWNQ78+fc0tnrAAIpmkdAeH4WV7sgBaQBatF6k3PvODlTCh3bE27h5Ui1C+bcdpT
         nld/rq+ADlTcVkNZueuGOJe12Du81p3uI1dQ02Pw+tyw7/xtdyzqREtPyLTABW10m4fT
         meraTMLcADubVkIDyCh4A+HAFB+NVUMkzPpxIT/aKObe/E9tjDbOeMs/q+uyR31l6RU6
         v/ivCYKBNeHuyherZ2KDr2ihvoUiXadA93u7A0QJ1cYrvRRjvgVVPysrBBpKgrZ7VCEX
         p68F1CbaP0IoLMi1328HbflpsM8R9M40UP1YhcTf7GbvN5Qx8K92yrRF49oS4lzO/wxv
         p46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009382; x=1794614182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
        b=ehLzzH7lnxYycUBg7gzDF16hHEwUDDcUo3bF908kQcHe36e6hzHzN+TKiyboZdh4SE
         Y7mQoDgsf1p+gb5mkXXiH4Cc459p+uD3Uc9Q6bdoSCpha/yc1kL1tKs7bEK9fteDKxkw
         DZPnTMfCTjPL4PFDE8ul6V8XB2RvHOlph0LFIeVutxRNB5y/yzk2Rb1EmV2XGRIpJyOS
         1WqQt219k/n5Jo7NIxXy7CY3+/+3Zwh//JkCOE/9An75MWgE0EKVK4YNlIsbr24dxm6D
         //ao6xqnihp8bCBbEkqREMwRPt6Sisw1QGBhyX6FsGtfmG6lDuVL3BhIyJaMgY6ff2om
         Vu9w==
X-Forwarded-Encrypted: i=1; AL+hErG4Vujy/YYNDot+uhzHDtd1RwGmUGZwGpeZvZq4lCJRuNEcz8E+2wHddLhuKQOhjbC++nULdfEs4jkjZpZINlTz@lists.infradead.org
X-Gm-Message-State: APuU4Z/s5rMFPeEPg31JwTX6KmDwBZOo0IjvQ0oxGBh0HAh6EaP65UoQ
	5b9aqjQgWu1g5fCKJ8A6Sib9qHp3KURn3ng4stwvFWuOBxDoiFH+C8VY
X-Gm-Gg: AYBFou2Xf/63FKyavCvCu0sTBUj7c1/4CLZcGf5NPGCJnBLkDh1meaadwvJS5HfHZhj
	K2YNDEYiWwze1CjKIyKAVwxbb1+8rjsH+JQqqgC1dt7WA68/CZrueKrmhCbVRGQDDpOu+loB/S8
	eAjr62oz/00s5iABn072sLxlCU5CobsFCwJggyMMLhBFL2G20MsElkDQSVXWFTTrQtPOgzRIUTq
	IvIb3U+1atB3zeuasmSTax8r2qRUzjfeawcGoN5ShEhBpNRVTwxp6C4o5vCnI8lzLaUoj4VUrfe
	VNrOiPYR6lAKbKDLrH30AUR0MRSWB1dbUqMlmHJaFFNucf+6nyqlARXg6f6kQU5NgZdCMOXe5+Y
	rGEvgMS2Ng6Uk1PYdB2gHRBNmJTG7jdug60NeB6XXA7GEQhug9AAeFExlNn/ku96slwTsaAcnox
	jSH7rkRDyse+e3ZVNcsJcpuSWxQVgWQ9e9QhAIVbpHIraU5MF6xuDjAf3yc5Ll/9dOhFPTRRFaZ
	0c6GaAbRrMVNE1XmkTkKLQ/ipwV1IH8MZ9s387RfkXjz2F4Pfza8xRITV49+h10Lq63nq9kzrT2
	L35qZ8AQTXNF1lw/WPIZ
X-Received: by 2002:a17:90b:1a85:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3b0db6f8318mr3721226a91.29.1794009382537;
        Fri, 06 Nov 2026 15:56:22 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:21 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: errata: Mark GIC-700 #2941627 N/A in silicon-errata
Date: Fri,  6 Nov 2026 23:56:15 +0000
Message-ID: <20261106235616.1533003-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_155623_597882_E7D79A47 
X-CRM114-Status: GOOD (  13.90  )
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it, so a reader who follows the name
finds nothing at the other end.

The workaround has no Kconfig option: irq-gic-v3.c passes the GICD_IIDR
value to gic_enable_quirks(), which matches it against gic_quirks[], and
gic_enable_quirk_arm64_2941627() enables a static branch.  The table
already records workarounds of that kind as "N/A", for example NVIDIA
T241-FABRIC-4, a GIC workaround like this one.

Set the Kconfig column to "N/A", as the table does for workarounds
that have no option.  The row stays because this file acts as the
registry of software workarounds in the kernel: deleting it would drop
the table's only pointer to gic_enable_quirk_arm64_2941627().

Only the text of the table changes, and no build was run.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..afea5e57ab95 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -279,7 +279,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0


