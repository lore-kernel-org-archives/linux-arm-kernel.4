Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D5606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JeiK2tc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gdpHpAwY;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RzfAdkd2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=; b=1JeiK2tcn8WIwpiUF8ohfTLWZR
	y29DBwUd0QPb237fyD5kPfjSwmpE6QtbsGDNEGhVwH9zj+DbEos5jfNuKfL6P2qtahjGwz3JbYKEk
	UlOibyVqVAPgxx4qlqLwtZdO2ZcRaKfjvDxmNXO2dnTeBOiacFEodj0Njw2GRH+Bq0b5iOj9b2ME+
	dD41+sh5lhK7oBJD9drH7CbmRKQQUCooG5BA5e3EpyRqtY2fvOti++td77Dxux6ukwf5INNujjo5p
	/mAPDpvJnhgaWNtwtpqEjXvyfkinhv9d5H5zmK5I1pCqosfPPHOGsj6o9j0xuKf4RsoAvCYY74loj
	oqvy5S6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCal-00000001Zt9-1dzB;
	Sun, 22 Nov 2026 18:47:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ0-00000001YaF-3zQy
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=; b=gdpHpAwYpcG55WlmQX50bOyZLL
	LwbKfOGYDHkEYDIGJI427JQ/K9JlFnKIi+9UUFH+2ym32Z02fdhUQJU3/jqIQpsmvoGPx+vgsfqsI
	UXTl+gmQktWxWueFGajZtozzYkY6UxccUQemx445tRSfKJ4Hi4565DEeGK+PQrPvPxbCAwRFT0K1e
	TGaJ7a3APQh7KAa0cfqHNhU2XxrPcrihyiT2s/rsSIcohfUI5+zTmyrKugqQYEsTrZ+k0bub3I2NV
	iL7paMHi1az62jxqD5Q6DLw/NFAyYX0l6TyrpwcYuamvICSjL0BQ2cjr58MP7ISeRGfRTih1s/clO
	mNWvTW6Q==;
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYy-00000002RGS-1J8w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:21 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so3582612a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373118; x=1795977918; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=;
        b=RzfAdkd22lpGdd/lti1zwkk2cITxtmco0zc6FQymChXSjcOXsrwT0G4jPDJRD1voM3
         bxc97/gHiWY6XWFZBnpAxZZRbQClisUYKHwapB1HFKdogI1KyqmaX5SBAkefx5/IQ+CP
         XYwjmoSXQWfNK2vwVqiwcPq8noi+2mmmi/JZkpsNjI6vimHvW9bgGSqPB+tlriB3f7dR
         NGhQ34kYRnmkunzwHA6+n58ynEixu/0JGZ3bsm//v7Xxc8Ph2SRJ9Z/3Vr4ATTGYBi89
         U+qOjn78cuDzTaLy2B2TzdA5d9o7P8RF7pJh6lMc3KSq4nTwwAoTJakhEd3kLmR/DedM
         +GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373118; x=1795977918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YD2Qkz46kmJnaOLt6bMlNGRTvVnPoZLyisE+0GvOE=;
        b=C+AifqCgOfcUY0nLgqOLMLFNQSf5Abs8BMLKl/D4/lMB80REJzgbGIEtpSZrVe4jxs
         ld6VaM05t4VqACfRrvO8zKYkdHe5ePyvRcwECXWOq6eyRMVIb8SA4oGULOB7eTa3rIIo
         FhztmyTO/PyfLH8utj1rzYXNQ3pVsVbe0e2wjMBXqBdeb9NA5Mt8qc/KTxqri1d4SDJl
         lvlMIhOmeR9FSsP+QhWTDqpBhHq8mbMcqOfIBnL5n5GQl/uKTq/hB4ce1SqEkutFw66O
         BlYI71VjYQchz4uiEqkt2M4nKA+anoULN+wABnmQg3SQQsv2mLFwZQ6kClNe7CDmjvYo
         /y0A==
X-Forwarded-Encrypted: i=1; AL+hErFc8adMdH45tuHafIaTrBAp8donfqwiURvpEzeRF9H7BuzCmJNu+QDpJV7edkORGiuibWtlPjJ0ZrE4K19XlzPy@lists.infradead.org
X-Gm-Message-State: APuU4Z9pTWqwXL3RwXRTDCoGo2ab6SIJH1wim3poBh2wu8u6HyGyywSR
	nTsWQ0guQxF+OLjedlxpKR+SKo0uUdKP6hBtwLGT3MDXLrBITW1Hnt8RHKFg9IZhIU5h+tw1sGL
	TK6uIJf+RPS1MT3qX2f2dPw==
X-Received: from pgdo12-n2.prod.google.com ([2002:a05:6a02:620c:20b0:cdb:928c:57fa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f8c:b0:3b0:b556:ba9b with SMTP id 98e67ed59e1d1-3b41c9b227fmr8076249a91.23.1795373117646;
 Sun, 22 Nov 2026 10:45:17 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:51 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-18-jthoughton@google.com>
Subject: [PATCH v3 17/19 DO-NOT-MERGE] arm64: Drop BBML3 requirement for HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184520_285170_33457855 
X-CRM114-Status: GOOD (  11.96  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With PMD updates being done with the Access Flag trick, BBML3 is no
longer needed.

Dropping this requirement vastly widens the pool of systems this
optimization is valid for.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kernel/cpufeature.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d241638b5143..6281769f4df9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2062,12 +2062,11 @@ static bool has_bbm_through_af(const struct arm64_cpu_capabilities *caps, int sc
 	}
 
 	/*
-	 * We need BBML3 to support Block -> Table transitions without taking
-	 * faults, and we need HW AF support to support changing the OA without
-	 * taking faults. has_cpuid_feature() checks HAFDBS >= AF, reading the
-	 * local CPU's register when verifying a late CPU.
+	 * We need HW AF support to support changing the vmemmap mapping level
+	 * and OA without taking faults. has_cpuid_feature() checks HAFDBS >= AF,
+	 * reading the local CPU's register when verifying a late CPU.
 	 */
-	return cpu_supports_bbml3() && has_cpuid_feature(caps, scope);
+	return has_cpuid_feature(caps, scope);
 }
 
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
-- 
2.56.1.809.ga0b61035b5-goog


