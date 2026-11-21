Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B009E606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VJtf2F05;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbU+pBtt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=; b=VJtf2F05A3qaMv
	BvufGh4eMLeNrUUaxzlpMdKWKW626eOOCjbHrjD4scT/3gB0S+lKSQ1yg5gn4Cwbx+tSBtFO4Yrec
	7d4nmVaTuQlIQwTC74P0wCJIJBg5h0Imb18j3oQPNmeNONN3O8jf4BTWJ+iML4/Gfzt3StKMhdx8C
	S4ZTz1JbSjglhukW7h6/ZiQden8etrTO6JaMutGaV5atw5GcaC9oiSxbzupXtldVL2+0oHE+/SINt
	+Mw1/nOZKcdvgWoAJ6nNqOvvcS/bNJOgvng6vFitfehKfE5z5+7crumwd4czV/dpE8MhKj10KwUS6
	I8SRQgXLii7iMuiiMB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgdi-0000000Gwsl-1rHE;
	Sat, 21 Nov 2026 08:40:06 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgda-0000000Gwpx-3sxP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:40:00 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3869b68caecso887886eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250398; x=1795855198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
        b=RbU+pBttjJwkrLLyq13TEkHRN2cUFUm2JI1dKrdowDcDpbHrMlpXVYJMFbiUpt+hWD
         5aTZrECDWa5xHX6UsxvNMu4YaXlMk/hTmqf1sEouREpLf+4tZLrXFngNOdC7TUPOpYQC
         UOZCgC4yjxUcdvAa9/8ibIqt7bUA3P/51Tuge89ymImO7WvJtcsZ51bgI/DnNXNny2E1
         E2d2d4iUQOPmOE6kLhf9BzPqnvYR9kjIrAon0u+mo3Zor6c8JD0TQrErK7O/nWdhmJdh
         I9UpN1XyopMEYHJfcHuZAAQnTXxG1YkqKBXAMIqTfGEyBVHCjHZPa5jSHmdi16z+GjcW
         XQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250398; x=1795855198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnUmBWM7OQjc7vI6DcTZCPpSFxVlwkP7wP8mWeAtaQA=;
        b=2MY2YTMh05K4FMEvTcPvu97U03kf3bngn47ULKsf3haoQJtqMLMXj5s9E9WXitao+2
         /EjGY0IFdhcsQUTPmsrVCxpB+sVsFy0YgYZSnVBzsB+Mg6ciB5u644NpduRrPKADTHq9
         XJBJcl1uCdsu9om5IiHfYqRnEYzTFDllPHL3WKNPVFgqD/qHLO7ILQlvfWweKgHNqElp
         VGM5kgsvzvG4ayu0dmz0d06wYvn3sZdSW1bkSaAZgOMeCoOWivLlRT+74FfcGmBhLP3F
         0adrlrt+ryfs09dCo3749tTcrcp5lCSbLd+f0PGxRyTOQ3zQ7RvRI8Nj2lmFksCI2OH7
         3aWw==
X-Forwarded-Encrypted: i=1; AL+hErF5y4uvXeEwrnbJDeQycSixq9+oO3xh8H9Bkauc/P+QgA+kba6MitOHpEbuxk3y/EaDyg3gugoz+bHL8DoY0OZl@lists.infradead.org
X-Gm-Message-State: APuU4Z8jNDAcTT68QBd3KoLzhiScyoqIEfkZJAAlPukToP4ds4z/Vj0P
	uoTylphse56Qzgt9n5rNx1dLxg12MWLL4kuKMJO7sjfrg+XZsrkdCK0R
X-Gm-Gg: AZFdTZcY+WLh6Li+L2nmjGFCAuSFTtQvcTmK2267Dojtj20m2OQa/JtgatTUvGgIAWz
	/gsDqwkfP14+rNmDtmuCpBAh8GoLdoLZIAAWJ4Dd+gRdgTWWZZvzmCL67A4eRCmqDN2Oxy1CLzp
	6HG63X5RelP8tarKSJTJ8V4PPzb5voXH95agystDAx/okVbapxpZBXCPe5xwM0uzW82o1OiSj/6
	MBdXRNEI1OUne5Z3YWc47bYPz1FpOwxAvzn2aFT2+cDUIh/RND0NTL2x0vjBfEigDrGjt8tfCMP
	n085731kXXOnoQ9cFXojR5O2SS2q1ZEr0ysp0Pi95fNOyg6bKNkH7PFE35E4N+aUc0JnNqYRdIj
	IAMCec+E2gij6kLDKH8dBnz3TSHXONv3M5SDUQohm5RoqyMkDzqCurt3v3FhEJAg852Kj/9I5b1
	/94pG7FqzY0Z/eQE4/5WlGGbyqLtt93Xtj7cWQBZR5ZsDIjUar1VDsMsdeJuL/lcRdl29+99qGH
	FRvSz5NWmP2Flg9byoizPrr/OBqnafydII0jigP0uo/+nnI0EExFppenwLc+ZjqoBPAnGP8RiE5
	oCxBH4bJRSrSJbD/WZAwPeE2shzUPBXjzWOIId/HYQ==
X-Received: by 2002:a05:7300:6da7:b0:384:5885:2f81 with SMTP id 5a478bee46e88-3856c0c7c05mr7915169eec.5.1795250397903;
        Sat, 21 Nov 2026 00:39:57 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:57 -0800 (PST)
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
Subject: [PATCH v2 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Sat, 21 Nov 2026 08:39:50 +0000
Message-ID: <20261121083950.1957044-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121083950.1957044-1-takano32@gmail.com>
References: <20261121083950.1957044-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_003958_980754_74404DA2 
X-CRM114-Status: GOOD (  14.44  )
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

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
is defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  Correct the name in the table.

The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
symbol name, so an E-less name in the E1041 row looked consistent.
QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.

The symbol in arch/arm64/Kconfig is spelled correctly; only the table
entry is wrong.

No functional change; this only touches Documentation, so no build was
run.  The change and this changelog were written with the help of an LLM
assistant (Hermes Agent); I reviewed both and am responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
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
index 4bb5707a880a..cc7bf2b6a09b 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -378,7 +378,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0


