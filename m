Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1FB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+9kiXMF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyG8I5DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=; b=u+9kiXMFIHDE746Z+aTv0e3uJE
	k+M3Zn7OY59xb8DAsnqnlH5bwIgc3UiPWICVTKr33aRiX+6MDDrQLT93Mzl7H9Lrt6CuQWwB/4XCo
	sqhr9qCHPUQkJhy/i9KkfCc6hYoYwITHQiHiOKB14eWFKmpANaRNxyx4jsc6oBjX8XuUq9GN47gjF
	Ok54BNKG1cU3KBTxIT5XBLspabIIVGRKKKJaVluB4+9wLOZ/+jRT7dJWgHPh7KtCiahQHKt0u/3YS
	nYvqUVPiE2ALP9mcOZlEje1a7EyCXS3pilAURN+bzj5ab0zxia7rSl+jN27BKh4Z2PKy583gjfimq
	whV5Xlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgdZ-0000000Gwpt-47yP;
	Sat, 21 Nov 2026 08:39:58 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgdX-0000000GwpI-1LQc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:39:56 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-380c28f9e35so2609805eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 00:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250394; x=1795855194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
        b=WyG8I5DCtFMyqqt4+rvFinsEdtNFDM59dhHqKZigfSvz5W+Ywb4Sh+bIKkNAKhNozY
         zUgzAl4bTlYXvhZCVLE5xGmLzKred8DeoVt40EQDdpeKE7ltZAVIu3rnKHOpN2gf2F2V
         qf0ivEBWAdfBcaei2XagdD9OkG6MFldOjCeEKAY/ZnGQeIprquJ++nX94izxZ7iSi3Yp
         Jbfya0w3BIrjUdRJKt/1AdWraAhFs5YPgBXZpj5bqubflR3PXw54Ygh9KTD5oQ7qjist
         MR1/a1aSS95PT33Tv/J1K2TaWLM27yJLVlblhwo1ZfaHInT1h3weSOAxsb9K9K4ejbKw
         HO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250394; x=1795855194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
        b=kJukfTcA//dt2ZhO0njCdGhiESR18p/u2dNYIPCx8UmioXlaSx9MCD9FFNXi9HLJES
         TWfPkSee44SpTpctSldBXI0Mmm0G5AsosME4e5LUgY8jEsDol7L5/9vYtlR/KVK+f/uw
         kLun29m/RduN3MM7n2UZv8oBuTjJp6FpvX2jkIJDHsEBHGo5W9mm5cdb9tCFhtSPs1n6
         PPFGbg79Cx3ZIE7VOd8QaGbcWuCF5JE9RCNmJgc7xGUnG2VHnBL5mFoOGt+SGTbyBlxG
         aNqBhrzwN5KZxmIsCBP7CQhNqNC2lTfIZuJ5h/J2sCpEmp6a0Ja2nsEu4fraeumlHM9X
         xsJQ==
X-Forwarded-Encrypted: i=1; AL+hErGvzlUkV+ADiI09DJ6KlCwpanSjUyrA4IsmMRqtFEmzSlsHHb9uLhfD2iwEDqosVnlWSF8USpgnEGnY4CIT3Oy+@lists.infradead.org
X-Gm-Message-State: APuU4Z+bcj66wdZ6TgC8P9bO63/X+jSqmLv0UW+ehrg9skEvnFCG4faD
	IH+JyVjUUAKDoH6m7jkXdYVIp0tHlEMV8fqzZatLVwziTqTqhShdEBF8
X-Gm-Gg: AZFdTZc7yW22+sufYeRLcAvhaWN1q9QKnzkMXsidZHBnRvghDm4jewWK+KGLzubV6hZ
	jW5IZ+WWP9AOnGlfnhewdwnedqZXpH0osf2WxE3UKY1ilHb9aRlVeVg4uTByQae/uI5chKf8Oj3
	A2xbCML4DkGmR8tM+q/fMVUw3ParTZplFtQ8kAmHZoohT0UxLAH/F0Dt+gBtrfj6TDItsRNmqeQ
	oVAhZkznYZNjcRMy9Y4aN+5Ekgwqc9p9L06lyIhCTIkrg0igMuzxorJDbYldC7ks8LU+Wg4MVU7
	oF2NzstPbBRqs3wCbH2+qQrohM2S/R8WT3wPYXRxkGUKe/tf4iy6HkDALQG9s0jBr/yBXueD1mF
	Skek53B9skLg0nwf/C9ZLV94MUp3WnJmGbRRgro/HS/lc4oQ36DNNJxDffemAje+DjrufcCx7zx
	DqwFwfoQBIt/nJjXDA+auF0mVvTKhlR74Ch6RCLr1yoHrZTRNPbL0rgMuSiP+r31y+4HLWDAt/L
	N3F73reoC2LeaRljEyG2tzleKM7Dln97lJj7/gakWXW++JQnFa/V5wQZ5Qx8DPDXPYBzskRWKya
	yULfszL9DO50dRrhboM0
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id 5a478bee46e88-3869ff18213mr549553eec.4.1795250394091;
        Sat, 21 Nov 2026 00:39:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:53 -0800 (PST)
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
Subject: [PATCH v2 0/2] arm64: errata: Fix two Kconfig column entries
Date: Sat, 21 Nov 2026 08:39:48 +0000
Message-ID: <20261121083950.1957044-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_003955_359649_8E350F34 
X-CRM114-Status: GOOD (  13.20  )
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

Documentation/arch/arm64/silicon-errata.rst names two Kconfig symbols that
no Kconfig file defines.  I checked every Kconfig name in the table: these
are the only two.

The GIC-700 #2941627 entry names ARM64_ERRATUM_2941627; that workaround is
a GIC driver quirk, matched at runtime against the GIC's IIDR and enabled
through a static branch, so there is no symbol to name.  The Falkor E1041
entry names QCOM_FALKOR_ERRATUM_1041; the symbol defined in the tree is
QCOM_FALKOR_ERRATUM_E1041.

The two rows come from different commits, so they are kept separate and
each carries its own Fixes: tag.  Both are documentation-only changes: the
table keeps its column widths and no build was run.  I did not add a Cc:
stable tag, as nothing outside Documentation changes.

v2: the change is the same as in v1; only the index and hunk line numbers
moved with the rebase.  One changelog sentence is replaced in each patch:
in 1/2 v1 called the table row the tree's only record of the erratum, but
irq-gic-v3.c records it in gic_quirks[]; in 2/2 the sentence about the
symbol is reworded to name arch/arm64/Kconfig.  Both changelogs now say
that no build was run.

v1 was posted on 6 November 2026:
https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects on
1/2 and 2/2 (20261106235616.1533003); please ignore it.

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and the reasoning, and I am
responsible for the submission.

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0


