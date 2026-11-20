Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8460A5BC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2sLfHOr4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkhyikmG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y8Ts16+pEgKO3za6EY6j5FLRvh5fbwbzMTmSXwpDQqU=; b=2sLfHOr4wr6jam
	dK7LtW4unuZkRomGxMKe44jyY10f99p6SEk+0dI/wF+qDHj70flpqeF1YM6lhagFvAljy+tqQBqfs
	XwhXn9/OdqBCUdaWoI4hFl8A6Hem/kcSD5+p85VWqdFIwT9oPTqFYioMWsZeQTSedoHSE97n5SI2K
	QtPrPmexif6lyYgxrWg09djmNOi7x/JZMLMWV/19spOPf5v2UhNK50BNb5XpTZ8w4LmoHiY7MR8Q5
	yYysPoKC/7zjO2DlDAuhMAMBd6pZ70WubjlmiHDGqY4iHImP1ZjLiFjLOxwScC1CYZNYtSi1ONlam
	hW+C+OnOF2pzofR06QDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtJ-0000000F7ci-11Fk;
	Fri, 20 Nov 2026 13:43:01 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtG-0000000F7aY-0WvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 13:42:59 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-380c28f9e35so1879974eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182177; x=1795786977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8Ts16+pEgKO3za6EY6j5FLRvh5fbwbzMTmSXwpDQqU=;
        b=LkhyikmGvT0yQgV58ClQD4uPmHd1XPEmBkRtcDTtq2exxYxfCQVxCCVu/xGAcS4FUE
         hFOgenfD8wO3qdHdss+aO2EomGkWoLUNWPrpZSbdS8LdQuRExbOSwoL6Z9XiiF98O1Z7
         8YDE+HV6MhAZJqHuhTm68p2+IS7lVstHUPDC+2Az7ZopeWTHNzWHFsLIEgpMLtp8DiIV
         f9PO4CPN4mV3f7rJDBeFmzch62wy6XEZcfB4Vl5d80pRQlFzNVKsgalmcLlWaNkWd5mP
         OewfzLySmeV8tsRkME3WZ02ncfN/OzLdMwnX29puUo8G/OXW6OWEhXs25wrqs0Ok775s
         oW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182177; x=1795786977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8Ts16+pEgKO3za6EY6j5FLRvh5fbwbzMTmSXwpDQqU=;
        b=x9cCKYDlHAYQYnJVTc05BSsgVF9avs/GdCmFgbkNRfBHsFm41tDA7OupjSLb4SYJTT
         NTXmGWKu5R/5STeXOl5SC0cNKh4rO1dbb4VmiMipL8MnPm6TcAs5ZEC1+Dt6vstRiIJJ
         S6xS5xk1Hz9cLraLB5Q1nUbuaAyWgO/FckqO9S7A51et/6QHjkEpfK0bHJ0i/pdxMbdT
         IFIJWoCm4v38aRjhlIR4/usLp4Z5PrC2sK0ss/XmshH23+iRABJaHAvxkz4dOPZhhEsE
         oAtuJQrDi56fy2FvKk96jeO3wabSfGfWn/rW5RISMAHrQVEIIRYdLkVFh4crhW2tp7dv
         XQ5A==
X-Forwarded-Encrypted: i=1; AL+hErEn65Ob5bVSX0euFtvWQHw9v/4mghUpEqGtUkPNtGmCX7qg+lCUhqnLEkGhVpf6Ptls0cjReyV9iXdhCDv2NEyC@lists.infradead.org
X-Gm-Message-State: APuU4Z+nYUSogNVSDYQIuiXbEGSI2ToraamzJqZaBBAJ6AALh6R6J3Lz
	93qb9ERk84o/ReJqBSBGB+bfWpnZJDXH5QMbGeBvJfHQGQ1iQrPzyaoh
X-Gm-Gg: AYBFou0af+XST3J9MkbAZBBJayNgyMv4QNC4lxr+07SsRNpjOA9pgpkItLBxGbM9e25
	5yRLx7zsyjj8HPAPIp7oi8WFvBC0DkDkhnsHSbJmKTu1C5Vtlr7kJV/9qKMPU7Z0S3JIakySxDJ
	QldaAEqi73t2WevBNzi/MRoFiu8Oh2qUDony7pUo5idbT6su7gG16xQ9ITiBrkbAYzn0HwasXJe
	yZmQTFD4ppsvSg9kA/4hElFdyqFFdvyhLygCBuLGrBQpYx4Iydx7N/GESrGE0YsHebY/QHTz7n7
	2Fl+9NMUjAw1C7A25d/QKafDPySlmAv9b9akVHb0bIwkjk09GSl4C3wD9C2/12xdkXDNk41oznn
	FP2Qnvg5AsRNUsMSikCgI+EhtCg6oHxqBsdfDDcpkXd7gAmSLjBNIRn8GIrdHsLYgdaQnxFLWtt
	wkQ8kvJe+9PGNlyNeS9DEUIJn2DN/kKqb0g+e1mbmJ3uDsK5KKHjrgsnbxaVXO/8MaMUwYKphmO
	PoKpxOqZW0QQUw+JqYQY6UTdg41e0RrnIxK2XV8f+kLee+Fp7vOaG4JDFvqmKf2g9djtbyrWAcE
	0tMu1cEuK1G2Dx1isHkz
X-Received: by 2002:a05:7300:51d4:b0:384:fef7:5876 with SMTP id 5a478bee46e88-384fef75c78mr3949500eec.24.1795182176981;
        Fri, 20 Nov 2026 05:42:56 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9590857eec.28.2026.11.20.05.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:56 -0800 (PST)
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
Subject: [PATCH v12 0/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 13:42:50 +0000
Message-ID: <20261120134252.1036963-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120060931.711483-1-takano32@gmail.com>
References: <20261120060931.711483-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054258_241213_12DBD6E5 
X-CRM114-Status: GOOD (  14.51  )
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

v12.  James asked for the raise and nothing else, so the try/except
plumbing v11 carried is gone: the generator already names the file it was
reading and the exception names the keys it did not expect.

What is left is two hunks in jevents.py: _valid_keys, and the check in
JsonEvent.__init__ that every event and metric table goes through.
(metricgroups.json is a plain dictionary of group names and is not
checked.)  The test is jevents_bad_key.sh and checks the failing case only.

1/2 is the prerequisite James asked for: the mainline tree carries 19
objects with a key the tables may not carry, so 2/2 cannot land on an
unfixed tree.  It is the two fixes posted on their own, squashed, so the
series stands by itself.  The AMD half went into perf-tools-next on
11 November; the arm64 half is acked by Ilkka but not applied.  If your
tree has both, 2/2 is all that is left; if it has the AMD half only,
apply 1/2 with -3 (its AMD hunks are already there) and then 2/2.

Measured on 1/2 + 2/2: the generator run over all architectures, over x86
alone and over arm64 alone exits 0.  Putting EvendtName into one AMD table
makes the x86 run exit 1, with "Exception processing <path>" on stdout and
a traceback ending in "ValueError: Unknown keys: ['EvendtName']".

Changes since v11:

  - the try/except changes and the sys.exit() are dropped (James)
  - the message reads "Unknown keys: [...]"; the test comment says the keys
    a table may carry, not the keys the generator reads

TAKANO Mitsuhiro (2):
  perf vendor events: Fix misspelled keys in the event tables
  perf jevents: Fail the build on a key the tables may not carry

 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 ++++++------
 .../pmu-events/arch/x86/amdzen4/cache.json    |  2 +-
 .../arch/x86/amdzen5/load-store.json          |  2 +-
 .../arch/x86/amdzen6/load-store.json          |  2 +-
 tools/perf/pmu-events/jevents.py              | 24 +++++++++
 tools/perf/tests/shell/jevents_bad_key.sh     | 52 +++++++++++++++++++
 6 files changed, 95 insertions(+), 19 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0


