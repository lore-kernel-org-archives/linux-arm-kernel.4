Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CD7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RLN4k3Te;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFsEqIbC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=; b=RLN4k3TePEIxU0hh8Vc9IzC4Sz
	JUV9RxD9vt9L4ITPj4LGkd3z4StMZj9NxzL2HCctqRVr9bsjYdCreTFP7bKPJbfl/k0uGgBYXlsZj
	dbyqUsYyx8crVypbovGLCQZfQyQ8B/zQdNCr1vjVDlYAhgd2QkfdNQqTc3dXpvKs7F+zO/d04/837
	15DaEch1+WohPpZDh3DC45UgigbWZW4eTPY3FXyGZh+DLJ1Xa3JUe2+SYaZTP1E1Qo2cODqGi1AUy
	jugBWR4X3yQbwRM7Tjcj2R+K5JBVuBTzqLL0HXDtV83MvjhOJGhUaHtT2+p4vTIBbYoigiep0iUzZ
	OpBDsL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTnE-0000000Dspb-0GzC;
	Fri, 06 Nov 2026 23:56:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTnB-0000000Dsox-0KYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:56:22 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so676515a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009380; x=1794614180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
        b=wFsEqIbCTWekn+xe4issYV2/QObE3Y5VMp5VOP+kJEbPvSmaMZOfXFZqKQXWOIODN3
         uG1xCfiDP4ET3aZ6GadbqYmCIICqn5yxFv4FiL4gtTr17Gt6eu5WCO781PAudN8qyt2a
         fS0JjQfFrRscRheNOXa/xzSY1hqut1QIB2LrDTw1ky1HWkHlwBxkSYRu4TDQd0ld/1nT
         KwyGS7KUHagysGIp1v/b7rso7CwlRsaoe9y9v0r7NlnrT1F7a12PfZjFFaa3xMc0ssTc
         kEYCS0xTkb/x+4wpqLHsEAlJmAZsnEpVAFPIWfUejBpAvKdEzjVDpBO8zBOgtarVkMOq
         96fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009380; x=1794614180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=re+IWocSwV5c8ScF+wx81yfMha910y/RtjGSN1S+bq0=;
        b=biIaDu/5dFiGMT4WLGJQz00YetDYvPBGtYACXI11EtH5s/fwBT9Z/UHynbAdbOWoGz
         LdVjuH6RM6uK2rvyoGU5pdsa/xPgU4cSHbhN+J3VvnOWR9Q3+0jOtNsU2Qg/+692z/rf
         4tTDADgl3T1HYApG72aWKw6X8VR8uRB4yqka62rX1UlXkAp1eHXAkS4LGKuI1qAQ2yVM
         rumOQRDWSEG3Fl7lfSb81QnCkRPRAoqnb+z8mdidMXuJ4lFK0ug9lkz24eUlTnctr5xC
         isXRb2UQinu3lLGLiiOG+zYn0qZ7aiNNNVE3IHwkHVVMHqGXUJ+FJclwbFLeb1S5czl4
         xLMQ==
X-Forwarded-Encrypted: i=1; AL+hErEa9nOySlHPR9ingbWIemZfNrzrnacS3D8/bbKeaTwbF645fWwDsFoKXkt5pWDYcWqAz12Weykz0593BD2iNhyB@lists.infradead.org
X-Gm-Message-State: APuU4Z8CJSV/GeJ7lluAU50xwwrHqQETUQpG9wpveu0eFUBLPOexaJmF
	r6KyjiRdjH5ufnPk5ha0QW7Tf83TwgRAujtr2xWrQDfuTOs/TX9uxrpX
X-Gm-Gg: AYBFou3QcyAVHPx7EsN4ws5KF8F9b/rjl2PQXt38DQNpgjrwbw3XV8nenWFzdRGB4ss
	hfiVxv9zQdWLCiHclmK7X0O4kOKm5RfWKipLBPkToZBxobO2wAYb3vtE3oY8G/XyzCW6mGIDdca
	F21jUpcduwxLccZuata9MHGfSEhwO4QyzVedu3Oq2HlHxRibPHF0ffSpzfDupz9nldtXpsHzb1w
	/md15/EXDqc7SeLLeiUsvImKuIgVHuv+n2QKKddMtFeKDa1DnDyUK94gv3nZ9sb2dkI7aPlW04W
	YoLRj4waDxdaCM6uB6qbRuYhVP4tXG8cC+WwY45wchpZ4pwb8W9sbnBK6BCkCDzzry05I3HSrXa
	7k7NNKW//Ru0oy3BQXYCVlvgaTvbHdMez0M0L4CmKXSur4hEo0I33o4RkV4/czHavlYikHdw/rx
	hUGJCJFGPJs3V+6DCszBzESDofEIJ5WyvDcSSgahTnRzCyxS3ChnoAQ87a5KLR26XVXEqDSoyAJ
	nY3Sf2dAzgSyDmII7+dkikXomKoGEvuboNaV7uLKaNEDpJKvLdReUyxO7FKgz+TkVy0j+SrrfBg
	TMv5xBETyydN0VO03ko1qj0SOcdC64UTcxaoirR8Lw==
X-Received: by 2002:a17:90b:3dc3:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b0db71895cmr3876355a91.44.1794009380043;
        Fri, 06 Nov 2026 15:56:20 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:19 -0800 (PST)
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
Date: Fri,  6 Nov 2026 23:56:14 +0000
Message-ID: <20261106235616.1533003-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_155621_141138_98BF7316 
X-CRM114-Status: GOOD (  10.34  )
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

Two entries in the arm64 silicon-errata table name Kconfig symbols that
do not exist.  The GIC-700 #2941627 row names ARM64_ERRATUM_2941627, but
the workaround has no Kconfig option at all; it is enabled from
irq-gic-v3.c through gic_enable_quirks().  The Falkor E1041 row spells
QCOM_FALKOR_ERRATUM_E1041 without the E.

The first patch marks the GIC-700 row "N/A", matching other workarounds
that have no option.  The second corrects the Falkor symbol name.  Both
changes touch only the text of the table; no Kconfig symbol or code
changes, and no build was run.

TAKANO Mitsuhiro (2):
  arm64: errata: Mark GIC-700 #2941627 N/A in silicon-errata
  arm64: errata: Fix Falkor E1041 Kconfig name in silicon-errata

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0


