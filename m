Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85037606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QcrtpNj7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=MeapWKPF;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sc2GBoic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=; b=QcrtpNj7yuPYr6G1Zayi7BLdX5
	xNcje/jgQXwyBRzLSnlHEQHhAd/efypQxHkJ5DAnfwI2Ywfj0tqf+xUiW7TPkZpEIlqCVo0M22V/2
	2lrJi6qs01tpZT+O+2H+is3KA8NBrTHu8Rh8ZRV1krByowk3E0jmfeeORpAczTYCYriFdg7RWO0jt
	TTdn3NVrL5X4tjxsnVAuRQL+ya0+G8WztLrUkBcLHns5a0Oo2kEPCAekO99DhD1//2DcMY0UL6hBq
	ep8AF14NcyWkQG4Am3zZbPV090D0UcDDd5QXlVQj719qJFKh9s/wweMEOzuNiVImyhZYSrJVB6tzO
	qBxg1LiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6LF-00000008cP1-3Msz;
	Wed, 25 Nov 2026 06:18:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JP-00000008ZGj-0mP2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=; b=MeapWKPFlSnljzGRnm+8czHz79
	61B+FmrG5FehaVR7p9Qvk3SNsl/lHJ/T2d+p5lPj4n6OYFvFLnRt1yzbp8J8n0eCwGtAxISCfsSsj
	/00cNY/gTBWcGpk/tx/8zyWL/uffEdz/XhaE99U1nMOHTaHyKInq8d9tw5AF3PknaIxNJ3GWJ531x
	avvutT6tamReaEbxopDC7dK7nGqwJFuEoQ0NgO7UkdRO0B7BiWNVPz61560EiYpoRyvOjkqN4eJcz
	AQx15y1hSbYvxq9o25sJW+EAVm3jG24j8xhF3fO24VilknfkzSHXM1Tg/V+oGB3epmrHbxB0oC1nT
	5e05jMWQ==;
Received: from mail-dl1-x1248.google.com ([2607:f8b0:4864:20::1248])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JG-00000005qVT-3O7E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:53 +0000
Received: by mail-dl1-x1248.google.com with SMTP id a92af1059eb24-1b587ffea77so325971c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587408; x=1796192208; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
        b=Sc2GBoicpP0fNA2GQJISiFkpc+lYyExQ7XAoxBXGOPb5wMR0z57+qhpAasrMf1BSSa
         Ob2PtTMB89mi0Q/eL0HHTDBYXV7QoySq40znjZSAH/0ZVBx/L4cy1i++P8qFbvmNAWpX
         l3oq4PORuwGzaoXtUp9A+ohzr8nxe+/OellVFeqsgv3ZgNQzf9jCFF8iNHPvldzX0ijj
         sahpNAD9w2iveOniTLvnI9uoiE+678HqqH45aNCgvaqjZDU3Xgv5s7AxB0M/JHjusBbr
         9In5w12Orobxu4fztgYzByZ7OJXLvtMd8YJI5mwxogSJkIeJ26lIRjxxRfmfEBCowRHX
         Pnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587408; x=1796192208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
        b=yNeQYxAe6INMJY/d/4Yn1odHPe5St2PKEDF7PGhoZuAwIzK16ym6Zl/o7hzKaaXPw5
         wUX4C/DlGKjbdtrS4Q+ruIcLfgzFUtBAVC1RzHKiIp6zRtaPVjuzJ25NEciiPRdG8t8t
         pEUjwyqMAWDE8xTaEsI5+8ILomswJeSxCH7bRkPBiLNpgG7miTXodG4VRITk05NxWEDf
         +wc9FIQy1h9b88NuNdEEyA8akBH4KVqWW/Zwb5kgdOMr3WXx8u6FXIgvZcfsSwq/qNgB
         R9k4abfkGFN7nyV3TPqNpETG0po4dk826l5Nnw9uv+JIGYxmOpdfxnh2s7eeawji8IlK
         1ghw==
X-Forwarded-Encrypted: i=1; AL+hErE4Ttz3iaOblPnqfwtAAUv02J0jRcbeNrDlPIFK43nQukpJiPplA70FYCpFamWqUUVFNbpcZhepV2PWJ53asb6q@lists.infradead.org
X-Gm-Message-State: APuU4Z8mHCf3XJ39UIMDPSwhfgpX9cocziiF8MtkrA6AAUXDqEuFt4Kc
	AY2AaN1dEpsobWnDs+0O/AW4troUNE8xfICukZo5RT3Q4PBW/EgZQyD/HAmtCeutcYaiNsn1jKv
	BXTpOUDhxGw==
X-Received: from dlar8.prod.google.com ([2002:a05:701b:21c8:b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:cc88:10b0:151:6e80:ba7e
 with SMTP id a92af1059eb24-1b5567dcec1mr15970822c88.4.1795587407220; Tue, 24
 Nov 2026 22:16:47 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:18 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-26-irogers@google.com>
Subject: [RFC PATCH v2 25/30] tools include: Add linux/uaccess.h stub for
 userspace tools
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061651_174604_2096AF8E 
X-CRM114-Status: GOOD (  11.12  )
X-Spam-Score: -9.5 (---------)
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a minimal tools/include/linux/uaccess.h providing a no-op
might_fault() stub so userspace tools under tools/ can compile shared
kernel code that includes <linux/uaccess.h>.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/uaccess.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 tools/include/linux/uaccess.h

diff --git a/tools/include/linux/uaccess.h b/tools/include/linux/uaccess.h
new file mode 100644
index 000000000000..5a9e6bf4cfb5
--- /dev/null
+++ b/tools/include/linux/uaccess.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+#ifndef _TOOLS_INCLUDE_LINUX_UACCESS_H
+#define _TOOLS_INCLUDE_LINUX_UACCESS_H
+
+#ifndef might_fault
+#define might_fault() do { } while (0)
+#endif
+
+#endif /* _TOOLS_INCLUDE_LINUX_UACCESS_H */
-- 
2.56.1.831.g720f3f5937-goog


