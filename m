Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCAB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kMdya6Yv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1oBa9qB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=; b=kMdya6Yvx72VQlfz0h6Lo7uJrJ
	RhUgDx695ajO4YVzwmIDQ0XKjj6BYCE7VYyRloTkbGAW4erlEeQVsF+pLbOu+HWF3sJ0kAfGTCkDq
	H8XhuVQFcZg8pBQOlGTYzNgq4jwTyfMTbUBaEqSJiETKLr8EyPH07zOvRanKrvQgpRNlLUli1TkAI
	AyiIs1EVMLOzdl6JOT1RF4lR0FijJME0jU5YpE1XabVe85nvtMHyrQ1fdmT8eDb0O8nD3cUKYEF/O
	H0bpKWL3O12zrqSb0PuP6m1cPpuqxWtTmfaryDRohxuAB69XT86bhcKvZLTyT5SN9snY/FtPpS1LX
	uu2MoVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy9d-00000005SYL-0361;
	Wed, 11 Nov 2026 02:33:41 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQy9a-00000005SXr-0Yd7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:33:39 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4b190cdc9feso1576788b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364417; x=1794969217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
        b=R1oBa9qBFryd3qD0gUqfCKQunHh5HZuE8LEq8ar29KY9MbYZSprJTPeZ5p3dKlDFfQ
         D9cusTNVnP7cDeqKg/Nl2btl1tr+U9Cd4EAYBCqziuquoXk+I7QMGtllyOMDLaSVo6Cx
         fUCH1IkbL5Vzsl4JP0Cg3uVXXN6+hdEyKQevEIqG6yMRmZwWGLvKhnqaJ7aDee6xKeCN
         dspuY4sq+HdBfFuooNW39eDNev+wSca2UjMVyVYprAb9LI87sTN9Bhp0GR/f/GHhF1p0
         vhyGhv+1woFjRQ2/A0P6fsHOqu0ZQsD/vdq1ZPYelJqVujlde8Ja7ZgHaaXsN2mMg8Kj
         XTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364417; x=1794969217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s18d0QtUAH5SO1XlwoaKN258QqfdDcIgzB60hufTnb0=;
        b=hZk/Wik19wM01JyMPKfALU5j+i6Du41aJuFaBxTc34hh664HQONMd+0xTzVaNdPiD5
         Ej5GDfRrar5/+FjfA0YXdApIrxP27LmN8393UnKtG9Jevq4U2OOU/6QmyPlCoZCXBRW0
         gsl59/37vgfQDc90nP24alxOomHqK2j3ca6wbRU4WC5edzHtHgv5EBDPndy1nhgnUPso
         A3by7JdAcij1chZ/QEO8oYX9Vwx/hYApg0qawsjaxTOBz+XHvmBJ5GvcDjjN3EPFIl1c
         4I0b0xHeRrogViZJNbfLGGUw+FU2clmGR7LpQ/BgNfgeGcv8cyAqTSKafd/40eLaAdHB
         fdlg==
X-Forwarded-Encrypted: i=1; AL+hErGNs+MUMCJ0GSiChfK/FE+14KKoNO+wXOxB0fG2e8Us4zizkZTy4V+YpPID88yJ07zGlGp6hlAbn4hp/zURr/cw@lists.infradead.org
X-Gm-Message-State: APuU4Z+WZ2gXgtWg+e2ZKTta6APwm7csAVB28GFLUiBxEUPwyZ+bztsa
	kU5wCPCNdklXxwJEb3M9X957NuEvfx58g2EdAjovsNIOU9ny8xjQD4nX
X-Gm-Gg: AYBFou3c2tf59yYhcCq4O8p8meFlvwn1Gf7ygiMrtBu/ywf8pVG8Dsk2ItBCBS/ZHZX
	vfLQK4W2q7eoxGn1zNlQSlbwQ8Kr1wVrmgX4tB9NSEkUehuwiJUUFvNKXiQuatIPgpHxVfrGU0o
	+wB6GWF3673pwSEA4yxZXdtm0+CadISquIU1SW2rX2zu5lpWPIlHcKkuT5BzmBCj5gV7EqVnbAW
	ts+kVCudYNQ/LcUpJRcIGZbtNQs+KUGaJzL1tiwHSiJQEOha/MDLEcFTJG8tXUOFCLootxC5k8F
	+u1tE8FsiPhcWy58S5BCWKnFPgf28gbTsi7EsYjRqAt/diQmDAip1Vdo1uexc87y9Uaupjdjv0G
	/TYsAzgBSpITfZTA8rfS7WyEEv7booWKfbxgetfRYNaE4QEzXAm502hBDRND/CrByBAAeRiq/1b
	goMWYDQQ2xSTAcweMDijz0bUL7kZPgKVB6R0hgAkO1wDIEFvcfJEmkDh+Qr/ykKMqpgmEaTp2tL
	w35S1xXivb/DpcOd4AZgUOJfWazLa1ttNtxqMpObCGo+wiwkbNI+/0s8nAni+L6iPF55T3cS8Xh
	MlgxydpsWK+0B4ZiJAWXJmVQcDifzmSCZ1dTeY89fhnWdPsLnyeIcGAjD0nLM1T5EWInMFAHQiX
	CaYJUF+hu7LI5GqvzCRHuzU1HW86UKlTksqvOp/ArWX09xCCUf22sl8qx0aHGZJBZHG6AkPl5f2
	AyBg==
X-Received: by 2002:a05:6808:138a:b0:567:e9b5:37b6 with SMTP id 5614622812f47-56b97c1742dmr835978b6e.41.1794364416881;
        Tue, 10 Nov 2026 18:33:36 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm4103177b6e.11.2026.11.10.18.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:33:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] perf: arm_v7_pmu: suppress -Winitializer-overrides for perf maps
Date: Tue, 10 Nov 2026 18:33:26 -0800
Message-ID: <20261111023326.70922-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_183338_174026_24F79A7A 
X-CRM114-Status: GOOD (  11.35  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The perf_map and cache_map arrays intentionally use a range initializer
to fill all entries with HW_OP_UNSUPPORTED / CACHE_OP_UNSUPPORTED, then
override specific entries with supported event codes. This is valid C99
designated initializer behavior (last initializer wins), but Clang's
-Winitializer-overrides warns about each overridden entry.

Suppress the warning around these array definitions using the kernel's
__diag infrastructure, since the pattern is intentional and widespread
across all CPU-specific perf map variants in this file.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/perf/arm_v7_pmu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index a1e438101114..9ac28c8adf80 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -146,6 +146,15 @@
 
 #define SCORPION_ITLB_MISS				0x12021
 
+/*
+ * The perf_map and cache_map arrays use range initializers to fill all
+ * entries with HW_OP_UNSUPPORTED / CACHE_OP_UNSUPPORTED, then override
+ * specific entries with supported event codes. This is valid C99 but
+ * triggers Clang's -Winitializer-overrides.
+ */
+__diag_push();
+__diag_ignore_all("-Winitializer-overrides", "");
+
 /*
  * Cortex-A8 HW events mapping
  *
@@ -530,6 +539,8 @@ static const unsigned scorpion_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
 	[C(BPU)][C(OP_WRITE)][C(RESULT_MISS)] = ARMV7_PERFCTR_PC_BRANCH_MIS_PRED,
 };
 
+__diag_pop();
+
 PMU_FORMAT_ATTR(event, "config:0-7");
 
 static struct attribute *armv7_pmu_format_attrs[] = {
-- 
2.56.0


