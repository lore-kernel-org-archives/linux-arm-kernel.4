Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C9A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PXFMDS1B;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeh7UyuB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=; b=PXFMDS1BdCFqJr
	oz+MaXdBhDUdMAnhUolBUnPcn07O5+XO1oqcMK0UVN/L7SjbcfS2Rwtw6GIlnHVAyvMbq8aGrKvRY
	YNLvoAlYyeEJZMo6nj6L1NGqKicww+h+53eG0ZRli3ZNgVerWboJqOSz8nrBipWZo1tZd8X0cGzGv
	JZ4jJNKoKZJU8VmTpj28oHI2uYa91BKgoPwH02LkiyO/sbd/rN8NY+QUHE/WlPyvbvn4u0QfewklB
	YxYfwY/+JlB+ZV4R637tZuba7qm0Sz8p8jlnUrPWJ0ySqQWdHBJ6Cst0DFW8CPIUHHogVP5IXc0lo
	6834qwMrT1o2+yHQUG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgdh-0000000Gws7-1T0h;
	Sat, 21 Nov 2026 08:40:06 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgdZ-0000000GwpZ-0MAj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:39:58 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-382f4710a17so2825973eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250396; x=1795855196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
        b=jeh7UyuBjMvyFoQdMOibjW03rNs4GyvfanBRHEzL29+Nad3GgWVS8tlIWDk82T2F2U
         WRAVmmHTIR1aSD0bT0t91wudmRwbtfEs1n1EqzfLXEFUqjEs3TOHDTL6LCTawrSQ1Zbw
         VPnH2aMZAzRuQPotMYpqba+qkd5wAHLU+L+OMxq8h/VB3FeTKh0xTl9zZRrowAad5a2Z
         yfwCOMbaDONgOnFLWF5792bybEecB8eaoisxX2tcebuHvpC1BU7EbeKLKCOZPUYmeD1e
         O1SS111aoFnZ+lPWOKQY4qMOsBYec8EfQYFl1piZpyDyZPByCYdNuVE+6MXxK6hQFYvW
         TL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250396; x=1795855196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
        b=2j7qF2pXZZMPCGQwGtnlCLe/C2qCtp1gZWDM7V5DGXHECHncgc0adpObhVPft+2tgW
         tsNPR9vZ6/0rFiXJbAu4s2NeTM/Ajy0mjPkRRSk5EtyxHCVlOqMFoHH0UZexv4phv/7f
         dDihV4fVLUjA2DiZAmSKmIPve0ewxmD0pSyEmwz0PlFwcvqpEh0ecgU16FgrPOEgbVXg
         +o+ZBfGyCQ3I7rn42noOL2VaHwViXGVMox6U8CRwb1ZCu5An3acvvfn36Zua2etnpJXR
         K2xxA1bwYvg5jPsmKWo1s1zx4eurWotQAEw+fKThnF9k9OdglBx075NzyXGOJPtgFTWM
         BmsA==
X-Forwarded-Encrypted: i=1; AL+hErE9thZdJ845JExU5b3W4EzDp+kYYns/FH3hzxOibke08j9GsxBWfsspH63mPTBXSfUASMNaZr9Aw+GD4SMb38/Q@lists.infradead.org
X-Gm-Message-State: APuU4Z9aMyEy4QuSc7KBPhV+KYimT2wlB60lcpaXt61262VAbHIuxI0T
	/n4lP6m+wvvXAWtodG2RT+sPly+Ho8Ijujfz+u8Sfk6EiArRuYFs2Tkd
X-Gm-Gg: AZFdTZePFNpVGz58LIOKLZ4k7sFxG3ie/ru23U/mjbTrj2sCARrS51ya3TohJabSx4k
	McquTELT7BuFgWVSNXNA9TMpmeDxpA3wFM5TFINbpsW38lx4j7mAKjm20eDHa8x39zBw29L0pVC
	nWC7+CNk7JnS9Ris8FuyZEFg1QYtmNfSAtFBtX3RAJ64jGYsxFoEwb8Anac3KMq03Eg4+6raFId
	npGgCa0+GjfTdJzE2X8AEwVuie3MxPQJ3AxnMhEk69OcwDgviGy8CeejXduT/P9N6gAcRNfJy75
	I5p86zIucpbpqQgYg3g3d/85mma9oueBpLks83PfYEvItUS7HFoAwejvtssjhY0s7oAuo2ifxHp
	xSK9/Mfq1uBI5s/WuV1fgvwulOPLaienj03pF4eS0tHMCGYB29zgyJwybrdEtASz1gS1p2c5Osb
	La2DkIIDLTFKP6GxGlE/mrkixbQZXXGaixNoAzsmd/TXe7w826/pZXcWmfDwqu5tH/2+x59k7sO
	JvgY/rsUXOmE1xDeau45JID+vbLTyU2jOZDHJX7m/bpaDR4BIjGMbIhC7Ex+5K5E0gStkOJ5qrn
	6chNK4Vey3pfAZ4NG+4Y
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr7474745eec.16.1795250396001;
        Sat, 21 Nov 2026 00:39:56 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:55 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Sat, 21 Nov 2026 08:39:49 +0000
Message-ID: <20261121083950.1957044-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121083950.1957044-1-takano32@gmail.com>
References: <20261121083950.1957044-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_003957_145295_E00EE6BD 
X-CRM114-Status: GOOD (  15.90  )
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
that symbol and no code refers to it.

The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
passes the GICD_IIDR value to gic_enable_quirks(), which compares it
against gic_quirks[]; the matching quirk,
gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
already records GIC-driver workarounds that have no Kconfig symbol as
"N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
likewise in the GIC driver.

Set the Kconfig column to "N/A" for this row.  Leave the row in place:
only the Kconfig column is wrong, and the table should keep recording the
erratum.

No functional change; this only touches Documentation, so no build was
run.  The change and this changelog were written with the help of an LLM
assistant (Hermes Agent); I reviewed both and am responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the change is the same as in v1; only the index and hunk line
numbers moved with the rebase.  One changelog sentence is replaced in
each patch: in 1/2 v1 called the table row the tree's only record of
the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
sentence about the symbol is reworded to name arch/arm64/Kconfig.
Both changelogs now say that no build was run.
v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects
on 1/2 and 2/2 (20261106235616.1533003); please ignore it.

 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index bffaa46c664b..4bb5707a880a 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -297,7 +297,7 @@ stable kernels.
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


