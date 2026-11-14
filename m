Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29DA606A8A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 04:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GZF2TjLi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KZ97FguO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=33fNufN6J4OClTS1Du1UDknamLb+kOZ8wd0azYoYamM=; b=GZF2TjLiXRU0bS3DMK/VmMIEI8
	fGmAST2lBaNfqO2onZDp5tGKoj4BrX8CwPpbEtxE+q1f659FWsQpsDbrSgwFwIbraoak0lUeNO5JQ
	pvUaeXJwibwIplqeVLTs9iiPsOKcqH6Gnum0Fm3+wsl9p2f3D2zqWASVBbqoHGaTHl46JALRzhe0A
	9VKnU1u9SvbAou4MnPrh1008fXQKOFV22ljzfP01k6WaSyYugpBCP2W1CCJVC9erQdjy5EEIy/iQb
	W0bLFWjXFj4iAeSrKDS8uoKOhIIErhAjUbjPYeSQOL6/hrCYmmgerxYVNBYMIxtXFJXkncbh/8Sl3
	47XxpyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS55K-0000000FLqR-1OGB;
	Sat, 14 Nov 2026 04:09:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS55H-0000000FLpw-32cQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 04:09:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-492690dd5daso1921634f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794629385; x=1795234185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33fNufN6J4OClTS1Du1UDknamLb+kOZ8wd0azYoYamM=;
        b=KZ97FguOLaeVnNpJgZ2O3b25BEXiPWe3nbl07+4HHaWGt3nFVPIgQzwbIbV3FUHYSd
         4Gc3SWRE47rGgRB9C3KRnNGdiTh9t0zVN98oa/Mcuux//w/rS/iMuUycTyMsCqy18CrV
         Ej9Imb9DFshLWtAe686zcDMn9MJr9NIOxd4y8sE6wlxnFPfkPivq19faLjuHiuQ2iIoW
         zzl6dtbtrcdQpUeWQ9+s4YN6gIFKBG1E7FGJOl03/9/UVVmRuLZK6R5I2J9Ch6YobgGY
         LvpXiy/2tr4ixIXArkZyiX1Y/29YXCrEuKIWPbd4EGriYPPc1JpQ7Cw7blw5XaLd5KQl
         lE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794629385; x=1795234185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33fNufN6J4OClTS1Du1UDknamLb+kOZ8wd0azYoYamM=;
        b=JvEPV93TDDfx8RQU9JvFaXpYJDMKXGp/T4loqsAeu2U8VSiTp8uIfBh/JNfcF9DOKn
         2h0ok//DSxToLJ9ajZy2jGUeDoABc9iSINDihjqzDVBD1tB+CbH3zcfApFO+Bd2rv0U1
         HpMIxVr8tfOcYS+Mbyspl0CxP4gmxrY511OzqKG6+S2k5diP8qSTDtv/0BndbSt+yS66
         WK+Txzp7v1rXiZSRHjGh5p678WD0L1K2BArKR1bjveVLBizmIFC3LW8Fefff1eV3PtbZ
         jIkx4F5Y65Ado24zujboEBWEkfOhFdmCyFbAP1C915Av+ld/CFW6kDkK87LH8CfvCl7T
         cMYg==
X-Forwarded-Encrypted: i=1; AL+hErHAweeh+P5k/2K44aYyU3wPA7wMyEyOz2Hgd9Ua8OL/Bf72N540Ao8u7kEkfBiTcF6KED1t+4y4IxOr5WXMXtTp@lists.infradead.org
X-Gm-Message-State: APuU4Z9Qh7hxADo9kVE6jut1/Aj2YkBqYikOBsnUO0ycjHzDwpi+Cv6W
	2JaaBzFo7FsgtonEAdpO2YisjPboGs8UkG3xzNvWh+U8ZsV19NdblrjP
X-Gm-Gg: AYBFou0HjtI7iin7L4dkAaEAi9Aih+ZMkGAeYQGN1OXjj59zrHDbJZ6kgOkyjLTF7rk
	mxb4fsGFpPxT4jtrj76pXL/J99LO1znRuAw9/24vW8qWCDE0t4BayTG/24GGiJSTT/iHizM04Xr
	xT7nbgRtDzjBbfw+V6KNyWiqpBYyWtIhbYi/ve+U8pt1/whdcTqxq74WLER07IJYcjzpFSNjcdO
	Is4ohdfx9ZQNG5ca5Gge649VlYpaD+DKHXcXFvQb8jp201+5OfJvlmZXX21RXQ/NfYjJEzj6m4n
	G9wTNjElaML0AKUQlAOwNTNoi5JAFduvK6+C+7Bka5qEn+jf9Ne7dYrJ9REk77jxufNUT7nRdfu
	pcDy2ZIP9z/D0mcffV+WGms1taop4BnASzSICQ9WFHG1OsIh4IoaGU99E2zt1dsuu/QypjG5JAP
	33vryBpSYUo9sdIwoNJimvJnQRfrwAw6Ru84+AdWz80O4N9OJWGSJxkVjX5VZhPFll4A3Ja6YI2
	ZGWntrwiNnN5/XIcbQOEeu2efK/YA1PbvC7h+krVbjNdoQNpM8rhM7obRY1uDXZzBzEMfkC7nLE
	vm66v4Tv5w7vDOBF4CphJJnIA+1XkKTheXEnlM8Kfbdd63OnV0sEZb1R2G20TqA=
X-Received: by 2002:a5d:5f92:0:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-49c6d4539c8mr9740640f8f.1.1794629385233;
        Fri, 13 Nov 2026 20:09:45 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm8488670f8f.46.2026.11.13.20.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:09:44 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saeed Bishara <saeed.bishara.os@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Sat, 14 Nov 2026 03:56:59 +0000
Message-ID: <20261114040943.219870-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_200947_782488_A552B4E3 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a single-pass csum_partial_copy_nocheck() implementation for arm64
and extend the checksum KUnit suite to cover copy-and-checksum across
alignments, lengths, guard pages, and interrupt contexts.

Changes in v2:
- Drop the NEON path and separate csum-copy* files, folding the scalar
  implementation directly into arch/arm64/lib/csum.c (resolves the
  <asm/neon-intrinsics.h> include issue noted by Nathan Chancellor).
- Switch the scalar loop to four __uint128_t accumulators (David Laight).
- Canonicalize 0xffff (-0) to 0x0000 (+0) after csum_fold() in KUnit to
  fix x86_64 test failures on zero/all-zero inputs (Jakub Kicinski).

Link: https://lore.kernel.org/r/20260927131838.6774-1-demyansh@gmail.com

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 100 ++++++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 410 ++++++++++++++++++++++++++++++
 4 files changed, 523 insertions(+)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.53.0


