Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937B606A6A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KJphIJcP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=soX8p3Zj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=; b=KJphIJcP1p/Bi5ibQO1SfeXXmE
	kJwOYH/tnurlL5NTeMnE4hkcKQMP8siK3Uw6HOJznqaf3Zmpp5BZSYO68VBjM6tE89u/FK5CgCyDT
	R9xi+iCJ5JURqt5RGLCJXRtNN4/i76H54e7GsubRveikujttjiJG3RXOnllMS655dmtz+mgjvLJwr
	eHn2IQ3/u1h3n/ZhAx+QbR+bG/Ld5Shnzqn/KCNcBGgPE/wxeLV6PzAhaCAzskrSN9hy0tnNEszW5
	97TpGAbFbCaomMuUOH43Ee9b72NeEDkKKuPnpvpK0XPNa+lHQbSNDnUbh6iTjEalx4/I0B/6LUB4h
	iQ4uzEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWhn-0000000GKRM-0sK9;
	Fri, 20 Nov 2026 22:03:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWhj-0000000GKQx-10Dm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 22:03:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11517615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212213; x=1795817013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=soX8p3Zj+CGie3w+cjk2lhv5VCtDLqmjeNuIq3BXoc+bLP3LvYRXAf3sZmHu8BFFlG
         wMMd8GIINGAueRQJ5Ww5T3Ce3ebL/v/bbWuDTKWINhFM6aWTibgIhxAHGUOx//9YN89j
         WDHdtKmWIBD7PglodiKJa9pBIm4XRY8yC8lSOnJZoC2buG/KK/UUtLCz59X7wDE9GVE8
         L2m9ov/tSLgtFMDj5eDHvkQSdW04h0JmsQJoa73qTGzvIb1nWOF/Jc2+nWCTPqDMd1ty
         B0AdDg05s9bXem8CGIu06hcqcvVhSHZUH20YWxC4BPTc7Cp9ZPhWyzjyE8OKfrF/RY71
         Qqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212213; x=1795817013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=PGs8/XMOoFxO54gokotYO2RtG2nyAoQyESy/HGlF3i7DAIPPmzzixvWJ5j5qzsCaQZ
         az0VrFA9lcqLncIr1hBDLc0Bap3hvYL+VvovhhD9rV8HtMLooY+zS9+wmqjnImDC9ZSq
         TANyaj3PP/HnMpDTuOM02xhWXxFR/AEAKX0fNMyA1M9wHwFp0h1nBjsBLE00bLaLNmIC
         +ew/rZ8fef8tc9duOlU9bbrehnoNPJOFqCDXG7WNmhpBni2jstMTW6KBn9M9IFS9MD2H
         US932ZR1g6SA4T2l+NUXgvT/9lb+mid9MCHaU3CpmLCJ2blKo/U2FLaIH7mQu1d70C+n
         HPVg==
X-Forwarded-Encrypted: i=1; AL+hErFUvlETz00o7rDceVuwjuBuGPp5RifM/siDGUWoo7iVM8wUTeoeEJLrH4AbrIgrd7sI0hBsFGR6EgmB2enMtNyu@lists.infradead.org
X-Gm-Message-State: APuU4Z/3KMY4eyzjmaV30k4E2rf/kn2B8J9xt3qNI+E6grU45bR1PSy2
	drKOtQ5SCTT5QTJ3CwtEKG87VFOJ0+KMv/49sL7peGb6PDLlUvO4b8GwI5W3ERr8ph0=
X-Gm-Gg: AYBFou39gzBrXQJMz1+Addg1OrB0K0P5BvRW9YXFgkKIOtO0SZPmI9m43bvLV/fEti5
	kympJeGCtBLoDltQPyizgAvHQ5chK07UozzsToanhCVTtT9PgjydF1M86TMfxCLGKvK5dD+pmcv
	OQMFkyEUdqLLFYeq/rfPi2WvKdDaf1U4+/1btS6iNXBnQ5J4Bs+QSfaw0hPVjI5kdR6m315Ih07
	mhQhLO9XtlWFSu3xvXla1FztgBx94jqqnyqtk5sRGh42+MfR463InW79PQtO2Or3mr7FUc048Lr
	E5S6HRGU+ljEX59TY3TND/HAEwrRVbiyNc35TgYGYQ+cTvyKomQ2b1omlYKaEWPW+hcAnbnbIL2
	FIEpAGOiA5rlhXw2ykKEMV7eJcwol3jlaPxto9QoTeV4j56yIL0VjDKXX3UdkB7WFQeOZ/BRW47
	3pOKjy1jS/1EcsxRNca7Yhy69gVINAq2AVCW+XsXN+lQhc+vvSw3syCs8T4MI7gjPQKEiPQWWbo
	gSyqmJD0JHjMsw/2vpNeS+xumGLLakFtxPGenIhM2q/pCHa6AOpM/xr5wJtnzrrDzBoZZCbRIaa
	pEwOB6pX6137Brpa3D4vGDnU0pNdj9evoe/rQmQh8fGMiJI17XJl1cDQmbxgxCo=
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr101074205e9.32.1795212212878;
        Fri, 20 Nov 2026 14:03:32 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:31 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Fri, 20 Nov 2026 23:03:22 +0100
Message-ID: <20261120220330.1067165-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_140336_262380_6431B935 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Add a single-pass csum_partial_copy_nocheck() for arm64 and KUnit
coverage (plus an optional throughput benchmark) in checksum_kunit.

On ARM Neoverse-V2 (3.0 GHz), this reaches 39.2-45.1 GB/s aligned
(1.8-1.9x) and 36.5-43.8 GB/s unaligned (2.0-2.2x) for >= 1368B buffers
vs generic memcpy() + csum_partial().

Changes in v3:
- Use a 64B carry-tree primitive unrolled 4x to 256B (~21 insns/64B,
  pure leaf function, zero spills on GCC 15 and Clang 21).
- Align @src to 16B for len >= 272, stashing the odd-offset bit in
  bit 62 of the carry counter.
- Add zero-length, 72/256/272B threshold, and dst[-1]/dst[len]
  sentinel checks to checksum_kunit.

Changes in v2:
- Drop the NEON path and separate csum-copy* files, folding the scalar
  implementation directly into arch/arm64/lib/csum.c (resolves the
  <asm/neon-intrinsics.h> include issue noted by Nathan Chancellor).
- Switch the scalar loop to four __uint128_t accumulators (David Laight).
- Canonicalize 0xffff (-0) to 0x0000 (+0) after csum_fold() in KUnit to
  fix x86_64 test failures on zero/all-zero inputs (Jakub Kicinski).

Link: https://lore.kernel.org/r/20261114045500.v2-1-demyansh@gmail.com

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 189 +++++++++++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 453 ++++++++++++++++++++++++++++++
 4 files changed, 655 insertions(+)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.53.0


