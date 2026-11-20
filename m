Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5A1606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XT8Gxff0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dlKfuBIj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pazKh6DOiqyGRyM8W6LynGdwm0L0tbIyWQaJbyYaTnU=; b=XT8Gxff0Wnk0yP
	Iv8E0AUk5prDaJz8eEs81mXgwr61DBeN/p3ab6ak+fMqe4Avp+RiUPl2sy+GXNp3CjpGTrF/9fhy9
	DW82KN588L6avkZCXTNRplQS7otrdG8JQMXL+P6A++B1TLkxJSpp/XRFXRdKTIP1oEHvTtoJVo4Z3
	rW5E2VXq4qOc1D3rPpjSBHoxM4u8RMpaOANuNJRuPRkRgr4X+kU1E9YkTeuDOhMhCQdIBCvu17Gv2
	cUF8/tkllOQztH5g3j/5NVZjvYTOlEJqDpqqaVkVMKMKLDSOsBAvp+VmLFmdPrcVo/aNrnN6Yrwel
	cNwwBUJxt0/JEeE7yI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHoZ-0000000E8Hl-1z0K;
	Fri, 20 Nov 2026 06:09:39 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUHoW-0000000E8HI-3zJ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 06:09:38 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-38587f3de36so572471eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 22:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154976; x=1795759776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pazKh6DOiqyGRyM8W6LynGdwm0L0tbIyWQaJbyYaTnU=;
        b=dlKfuBIjgAYswEXqO6uNM24FtQjx+mwA14O+KnzEJED4wIRrRCqO/4LA3wAXwLeBup
         9l8JBdWVP3C7/63usYy7xucuBFDqiRt+SK5PlnYYPzcxXLdm0nOZ2AvgIkX0Bg4RCKHB
         E/QwGOdLaDKHtmHtcJnuWQHzzbEG8sVUTJOneZmcKO2iYN8jEquc8FnmHDTeRF8zR65A
         Zue18tiMYWjb32b/iy9YYRs+W83kqbr1eCrHllLJCBD061uUnWCjR8gpnyfSdeqv+Uw2
         uBjg/mpfzBYLmFVy2peacdiBwRHsViWY3qeMIE2KTloFmrUf1xYvNJLYigorUjsAUn6e
         WJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154976; x=1795759776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pazKh6DOiqyGRyM8W6LynGdwm0L0tbIyWQaJbyYaTnU=;
        b=VRaoRHaSpRzqTemp0otKiC5oSPZjR1zFgtmBnp9SlHIpe9VncclEjOfx1q7lpe4XNh
         hhKwBJeIIrZBmrS5Zsz5LQJ4Xf4ZnRWNDYBsn1YPIcTzzsWMSAhNAggfzXk1f/xttBe5
         lzQ7yYTGPpUJuA8sNMIueIkGZz7phMy3GJYl1cQRSjnqOH8LrkxqVlKczvqw2sk/bj+D
         L8ztUYgYCSkVAQZmnmVp5TTn3ElTkK4QT/bru/NzKObK1OLKhAM3bP++bBb5Fi+pj9ox
         IAbTALF3lHJ4dxTkjfF5u9Be+/cq94W2yxw5KJzKoOEltPpv2iS3RxrJ1saMAA9OYsfn
         j+Ng==
X-Forwarded-Encrypted: i=1; AL+hErHApE9M89XYXKlyZbb8dPi2pxppbDexTJxxRBchqo45UKnypVMjGkHVqIPM5mTh2OoKYyGcucQVqueOSVVVRu0j@lists.infradead.org
X-Gm-Message-State: APuU4Z8UriVheR/2hX64P+yInlS4vDG/tMw/AeqYcqz7IpWzvKkdcFgN
	F25dSDUYyQ/H7MUMCOkEFuqHgsKwm6MGr/lx/9PZ9VT49zGczKiIWtus
X-Gm-Gg: AZFdTZfWmKRM4pPfbY5XE//EzsX5UJXBTtU52ZDFDVzxCqTWxffNl8+ywnTNSrfv4//
	ep+wvjsRMNe1G16flcAFE99GesCsZtDfXt8GZnBUyYm9HHpRu2IT1a8L54HHfMecX9tUM+h8T6M
	6bUafpPK2Gbj9TcOQZcgUGcpVWm6Bihd7fAbZsj0bTHL1bgRWY/70VuE8jeRZyd3do/gNqJKliQ
	yAU/20B+olfcKUduoBbk0TtPI0LxhiVtChkVtovW4cNeEY8tS9eqEj/xhv4Q9gtalIEZlGI4YK5
	dxZ1fk3yQpEtAyut+bTA3wUCyMVUHH4+AyFSrykBmyV1uynKmJ7SA95xhjNiIw/1qgUUt+4tQJt
	LxAsJyXrZxu2jVp3G/kofx4HFVrBoTbh32GeJ5ZzsS5sWmsjxgSQRDdhM5Rvq8panXUnv8HJex8
	uOGTk2ZQdRD9L6HtWHG30jQG0d5iiasVf5qp+0e2qlTgmp5iFxj4/7n+PA9xYlOuIsrCMjsaK7m
	3ELcwAr6BX2hPFQbi4cchXOtr07iSk3ULGOQLJ/BSnBvuQfWYrTzj5ctTFCfk1SsiljAa/Pq5QB
	0Gl4s6DR0tBFDzETUzMp
X-Received: by 2002:a05:7300:ce11:b0:381:6b5:56e6 with SMTP id 5a478bee46e88-3856f65aed4mr1730052eec.16.1795154975566;
        Thu, 19 Nov 2026 22:09:35 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm4609725eec.21.2026.11.19.22.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:09:35 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH v11 0/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 06:09:29 +0000
Message-ID: <20261120060931.711483-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113032927.634183-1-takano32@gmail.com>
References: <20261113032927.634183-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_220937_015437_F25B94A7 
X-CRM114-Status: GOOD (  14.97  )
X-Spam-Score: -1.8 (-)
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

v11.  The shape is James's: the check is not an option any more, so a
typo in a key stops the build instead of being dropped without a word.

--check is gone.  Every event and metric table goes through
JsonEvent.__init__, so the keys of each object are compared there with
_valid_keys.  No new option, no second walk over the directory, and no way
to run the generator without the check.  (metricgroups.json is a plain
dictionary of group names and is not checked.)  The test is
jevents_bad_key.sh and checks the failing case only.

1/2 is the prerequisite James asked for: the tree carries 19 objects with a
key the tables may not carry, so 2/2 cannot land on an unfixed tree.  It is
the two fixes posted on their own, squashed.  The AMD one went into
perf-tools-next on 11 November and the arm64 v2 has Ilkka's Acked-by, so if
both are in your tree, 2/2 is all that is left; if the AMD one is in but
the arm64 one is not, 1/2 will need -3 or its AMD hunks dropped.

Measured: on 1/2 + 2/2, the generator run over all architectures, over
x86 alone and over arm64 alone exits 0.  Putting BriefDescript6ion back
into one AMD table makes the x86 run exit 1 with "jevents.py: <path>:
unknown key(s): ['BriefDescript6ion']"; the arm64 run does not read the
x86 tables and still exits 0.

TAKANO Mitsuhiro (2):
  perf vendor events: Fix misspelled keys in the event tables
  perf jevents: Fail the build on a key the tables may not carry

 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 ++++-----
 .../pmu-events/arch/x86/amdzen4/cache.json    |  2 +-
 .../arch/x86/amdzen5/load-store.json          |  2 +-
 .../arch/x86/amdzen6/load-store.json          |  2 +-
 tools/perf/pmu-events/jevents.py              | 70 +++++++++++++++----
 tools/perf/tests/shell/jevents_bad_key.sh     | 43 ++++++++++++
 6 files changed, 117 insertions(+), 34 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0


