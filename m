Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22120606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZ8T+1vC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTbUfU2U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=; b=dZ8T+1vC+Rf86p
	scvTZUSdnMvzgu0uGHK0yYtoH0dc+/yhIildG6PQ+eFlBSKk8okf90DPOxDw15vXoRsa7JmhDrGD4
	KWwFyYrjAZEn9NIK/prP4bJPMVBhGDcBMKdOEElLQG6lFVitJbfgs1aA23Q+uw/ulRztgqVzsKuMW
	cuCBRNGjcS7yuPqrqWVjpjkH4yOjW/tm7ZmveKDzI3t+GGOZRPnkqz/flMysESh+aFcEErJ3vvbHq
	amUgpPWP+b7V69ea9oK3lEiRf02NeVQh0kn0iPL9DSYDxmyeV8OD7xUHJt02rf+C5pWFdWYlt4JW+
	R5lUmMJRIXHq4BzLbh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9rC-00000009PJJ-1SN9;
	Wed, 25 Nov 2026 10:04:06 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9r8-00000009PIr-1rQG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:04:03 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-170135e43c7so8517168c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601041; x=1796205841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
        b=gTbUfU2UEGAYI2shjCp9e5U31bINidKaLiQnEw80nUlIttiLQL5OhmfC3/qhA/AwsR
         /wM9UJXbhZ7atHI0rdiyhZVy/iyLWjbrD4vhne6kcm9n/3pA5WR8FDqntSPTr2Wi9gu0
         a7syYV7EVjGXVoRXcrehi5lp+jv1OGla2Pj5PMRNzu+Kfu/rphlEP7nd5jAXgMYw4mv/
         9agVj63WQ4oPPoQPl76YiJHNoywCW92lXQfG5SW5xoIxP11wNdt4WxKQyyWMCG56VCVB
         HeSBOyefOegVVQtsg7WU6pHESleiN0EvdP4jssz7/WdUk1nOLoWsA2Tx4gWHnaaQqcPV
         z5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601041; x=1796205841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jY9qOc0xWy86TYB23oPhSaWC0qCicnAeytX8EZDNghU=;
        b=g3xoKrHwThTXqTrSDLx7aO/bcaLlBLpUM504zWXtard398X7jtmfGoDvOVtYan2/Bn
         G4UhT0EkiMTsOsOFgbZbL2yecS2UJHEcywC199AJuZyPkpVd0Q17D04hMCMwDSxsL9N8
         qqTmArCYgXwqq8+XhBkWwrtz+jZ2k7HdS1u3kohQrYf6rjhHrl2fr9L4Y2SaWErswKhH
         Dq5Z96VrgFgccfCSsbk23lJJO39JrQA3bQ7uF+CUdjk/zulf2g6fYK0DvWEyAFKaFRIL
         cyMQ2z86WFSNYC3kUBVkS9Tt0d7ZBTWdpmBQw/MwliJ2CwDakv6mIoKKXLFAduj7mVBt
         wnNg==
X-Forwarded-Encrypted: i=1; AL+hErGsZaDClE9T+AlsvHGKkddFSwgymAP3kXNUfM3n5OkdfAJB9EqJ0PdphnvbvaSsaXGWUyvwic1zWjD1jZxydOrm@lists.infradead.org
X-Gm-Message-State: APuU4Z/O41oNK0zFJcNMi+LlPYIOutozZxiZhxtB8gXfk2XCm7WnGTIb
	A2gTcviowxkWm0R41oLFsEDUkqvXglI3IqVgybsedLaqR0X7QHEj5cZL
X-Gm-Gg: AZFdTZdeSDBOJaXhMgmqRlII8LkGgQcGeZgjUmM8tnm1JgzZq28jwXCOBTIng2xX/Wf
	K3N1pmBASkECM4pQdMzGnIeo/xeRgf1wENlc4XFkNqflrvKDTyIHwxqlULGGxU6lBSo6daiS8hK
	KT+HY/lqA/0wh8i7aQa3uxwfxgkT4b4clnG9crLDsuEkZ1xGvAQJItOb724L8xF6x3PHQRyRkPh
	Xs4JozGUIjnTTZTTljh5ntybTMNCjI5kD+E/JBoXx1ddkLxdXRgaZk56G0aPCDuo6CtuOn20HrT
	17dTI34cCf8g73rXCMkrxZGXL49T1rdjWXSLMrw2KlynjKeXknidtp/c11kUB0Fs/hWpZ45eW4A
	jquMEw9aKlzdWhSDAScUwpSA3mrO876xjGiQakkZM6iBssXBJadvrKYVA1H8baEfmpN4+UaOuYa
	0r1LkW4kzuV/Ica2aB7yMllQcV69/DWkFcuGJIYoclmgA8OzFPc7z2cwb0Ben0qaHHcIIC65KTa
	91hRdpIhu+fvPxYzHbTLyupH5ysVoK3C9jIzxVvA5avAiIL0wkP5U/h5Qc7kKaaGcCP8axQe8yd
	bgZklthAs7Gbt1ADg0PT
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr16762572c88.26.1795601041141;
        Wed, 25 Nov 2026 02:04:01 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm33863045c88.11.2026.11.25.02.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:04:00 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v4] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 25 Nov 2026 10:03:57 +0000
Message-ID: <20261125100357.1937729-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111034432.2020955-1-takano32@gmail.com>
References: <20261111034432.2020955-1-takano32@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_020402_487948_28EA1884 
X-CRM114-Status: GOOD (  22.40  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but that file is not in the tree and no commit in the history
leading to this base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant.  Remove it and the link target
rather than pointing at another test, and give the commands to build and
run that example in the How-to section, next to the reference it belongs
to.

The edit and this changelog were written with the help of an LLM
assistant (Hermes Agent).  I reviewed the diff and the reasoning, and I
am responsible for the submission.

Fixes: aa1005d15d2a ("Documentation: arm64: Document PMU counters access from userspace")
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: drop the reference instead of pointing it at another file, and give
    the libperf build and run commands in the How-to section.  The
    perf test -v user step is not moved; it is gone.
v3: drop the v1 review history so the commit log is the change alone.  The
    missing file is stated once.  Raised by Sashiko:
    https://lore.kernel.org/all/sashiko-outbox-208137@kernel.org/
v4: rebased onto v7.4-rc4, with the Fixes tag and the note about the tool
    that wrote this changelog back.  The diff is unchanged from v3:
    https://lore.kernel.org/all/20261111034432.2020955-1-takano32@gmail.com/
    v2 and v3 did not go to linux-arm-kernel; v1 did, and James Clark
    answered it there.

 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0


