Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC572606A339
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l2CVWoFe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=B7RH7xzA;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lhFgJKFG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:Cc
	:To:Subject:From:References:In-Reply-To:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=; b=l2CVWoFeNhJeKY8rPrZXGhppdx
	H4bJ7UbEj653/IOO5x1NHLHzvrhFABrAHVMjVoPFteuD0y5mvdMg9PUWlWe9r+WUKvgSNEdwJwRrJ
	WAoHVHVezzGoN4akKgH/05jiMgFv1VW6fMkzRcblB6aGhRfTxgYyRtRKI9hztyhtjLbByyNHau5kC
	xXE2d51ywGn4XWDJKB7KdYp5+r5nWlrixFhwOqGJ0e06m6s6L38hvdONPMOFKsoEBWVw3tUcTytuM
	0NE/5xV41QgZjnhXsEUpsvDjSvbL4cAZR+/iodsh9/ktnheduZNJTftXbcJm45DBVQ6p8LXL9JDU5
	9nJrtvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmnJ-0000000C5bY-1rRE;
	Fri, 13 Nov 2026 08:38:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmr-0000000C5Lo-16HC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 08:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Cc:To:
	Subject:From:References:In-Reply-To:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=; b=B7RH7xzAPsHpeDS9X6boXYNAxT
	onc6utA6CXuTyrHMCRqxJU3vzoJ0Zldcvh3AisEaJtNiRjKjMjgLeKzuvv6uM6RrDX/+0hOgijqsj
	cNuR/0ri4cyxyOJiTfFt6+Ck0cwOOmNPzCAHWKFt1F6awpnYM9mkKbvfyV6Zy0xivJVDLiUQrLgnO
	KEdV4Y5Hik4EqVhm5+KxEaZeVRRwP8MIcaQPx/hoDoKyNuD6+uXzEyoYa64BFyBMn4dB75RnSbiBO
	SMPSMzRSQ+IhfIL4yZLkVtV71Iv+U9JThMrN0pFY2jH/6pQYFFdfzvOL/Xi9CGjOCS5pp5zy3cyND
	3LG0GNnQ==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmn-0000000B4ng-259z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ed28bac8d7so2980585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559047; x=1795163847; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=lhFgJKFGlAfPgRWVd+F7X2GEpBQOltOmifpWluO/BVUCdupVWCwp6w0KJ6tqNVVy/F
         Zei56E5w5PsBGRa0XGleqyiC0SGXVszqEyMWs4EpQ2obIGxAidud4uUo/uuCzfiwC9VY
         D357Hnb87RIcMf7h0Jrl9KuZ8l/gBxRjmS5Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559047; x=1795163847;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=PwDrN7vFFjolziGQ98/eipVBp9+7YcBWLfCbgNTMvO2diixC18medm5CNUNZoZRHkI
         CWATWDGxC8oPH7aIILk5l4A29wgvd06QSpD3B/Noqqpf5zyQgTpMfuUCZUVqhBKTx7Pv
         7Uws+aUWWdLppOFLD0qgLJXYzyO0L7poQJNQW5sW+Y8JiC2U4uJgw8rLdI76QR/+m1Wg
         1G9Wxr1BWMZrC7fCNt8FRaZgoOsmPp8Lcm28Vap+Ts4jP5G3hj/6in5MMrvs4CDa2NYQ
         qNtkDbZMmxuGx2lFA4YifivkVdvobQ0uQ4UuO+15S1YcP2BsSuU5Z9pDx3vOp8jfrLUS
         bsOg==
X-Forwarded-Encrypted: i=1; AL+hErFhL0YrDIFCtr9VtxKVSfJ+JjJCAdduv8eUHKd7vD6ZQUUgC9Nu0k9w8x52JhpgQzEvEIL+K+Ty6PTFjY1UPhLr@lists.infradead.org
X-Gm-Message-State: APuU4Z/tjvI7r2h7bFj0gSZk5FwpPBy7K0kG9+ks4D5i9Oyr7vY8Olp/
	fxNaHogD682RaBBLWLysQ4MViqf1RHLmoK1OMOhbPMP4eJQKWaFbZYqMa0G/g7EqDHM=
X-Gm-Gg: AYBFou2epmVybAcdiAtFeVEjNtJyOrb2U1cY+UhRtRBz0OYbvms0GfwFFYS4R+YjJ0T
	ueN+XEXwYbkMxOQfS1u47RKGnnNH2TNArcLMsYSi3OrNAV3o4hBsrdG+3bmHTSWlBWBlagPDDq5
	ofNWYXsNRHRUNFWi0hF93q/qgd2ypMZemRB6beYL2cODLOOVLCx1Je0SYkLdjwLfIQJCnZHHfX0
	YI53X7/9H5rHcHOYlexHc7aG2Hc1ASXYpTPe0mgXFuXa1VWt/BDjQE8tnbGejp6wTNSDSUWxHsv
	Tu1D/e2jXfK+YxvWbApxgOStWbI0KKpgEQf4cPMKifhvjsshOij93/46tRzSepmAkh+0eJ7+YSY
	C3e+p9nfjd6qtgdP6YfjRY3DtV/A4K9ps2juYqUTyvv+v3b3CcZjIj20bCRd8PargtVgD8vtqrq
	VKUztSCuPyBuQ9IxC7pGtbyocmwblL+P3ms8gxUfYLoUbcvnixwjaenUwUOvMuMrL+Xzb1uDFst
	z9sJhdnez780gdi6vlY+8/zjxAMIHq7MVWA6+JFssD+qwOVvM7nf2QG1i6/xgN7t/ZghXE5Zbq3
	g2uA7pw+WMC0xncKuoWK3tNIEN1DLAFWvar5+7Ijs65fjeAPuhYN8HufZ0FQ42K8h05EicyeBlG
	+lOxK2feo3lqw8gTTvsTV+8i842AOOmApvvP1UJMGPLiwu5nica71q1J7cYNYRUcWjLPJHUwSWA
	ux+4kADDTCHlevFODjwyqGm2La5G1ZtyR7tzuSHl40s5wfSkXY7obegbIsg8nA
X-Received: by 2002:a17:903:9cc:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2edf224a995mr38643685ad.41.1794559047053;
        Fri, 13 Nov 2026 00:37:27 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e48e2sm6802375ad.36.2026.11.13.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:26 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:24 -0800
Message-ID: <a8bc6ee26d1cf35df5b0a13e971d3726a1a51042.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the
 scheduler stack end check
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083729_455460_75AFB03A 
X-CRM114-Status: GOOD (  18.21  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no existing test for the stack end check in schedule(), so add
one.

CORRUPT_STACK_END overwrites the magic at the end of the current task's
stack and then calls schedule(). That should panic when the check is
enabled. When it isn't, the test restores the magic and uses
pr_expected_config_param() to say whether that was expected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 2761685cf4f8..a39cde7495d3 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -885,6 +905,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.56.1


