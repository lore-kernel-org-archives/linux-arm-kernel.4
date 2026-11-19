Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JyexxsM/;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny92pS8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wgoC6kwXy8A/C0dx8SZHvUCPruFTOKn2cEN7Wk/LnjU=; b=JyexxsM/bunyoLNjZ6QrHC56PZ
	9ORZKD5lKI8Yn6fpec/YO/ycVpyv4iLaNp39YQbT6LjwyCEydJZlN0yjW5Hs8+BD52aiN0Ny8M55c
	va8gmWmO5cYqbEvI/R/SUFQ8H93Tcp9lYSvHl9FUQGeRbLV3CH/5Bs9+Ub7+25vY4wO+pQ9x4HtpU
	uP2raSoRso9QfhqeuDuxo7JqHGKZwphgRCp3FdyzaVJHtxSh1+ePxzZA64b5odpNpmDFyuXTqO555
	fJQTVNI0TSS/eCU0yrJEWVFulHIeJlFxMLiKjfz0awxDMrGNkeiwimUQT3VZt5oMtFRedURK4rdkl
	BLJPEJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7Gz-0000000D5ip-0Upk;
	Thu, 19 Nov 2026 18:54:17 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FY-0000000D4PW-3CuI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:55 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-4cc89e86e9eso172783b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114367; x=1795719167; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgoC6kwXy8A/C0dx8SZHvUCPruFTOKn2cEN7Wk/LnjU=;
        b=Ny92pS8YdBeHBIuJK76igww+/YTldK9BOGKe1IlQNbfzo7uILQI6ZRtikAAV50QefT
         Q1eA77szXqwNH8iTNseXBT0kqP4BJIeWF4XUePcjjCJ2nSo0mlTmVkJurUPS2vu3NZlo
         lks76CYloN0mHe7TqpeLjUmfJHrk9r3Iay5+t9puPud2FRoaooWYrqjfiR4Ez7VlMZvh
         7/N0eFTtuVcLv+b4DtkbB2jDtvf9e8RDlT28Tr6jQClIZb7fGMu3FHcOfZjROxAg3VRC
         8rkcVScC9xn+CrGC2CTGranCRjLRdFQpFNDjykMROKZdsoFU40b5IwynU7B7StL9zSzY
         Xrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114367; x=1795719167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgoC6kwXy8A/C0dx8SZHvUCPruFTOKn2cEN7Wk/LnjU=;
        b=NGHqehRh5F7bfI1zjdQJsT+A0059GcoYmYJg2YsPoBk0tTU+/tMyITHqBVCzHmFSui
         e8mlypmxgodJRU25UYE4giCEDBAzTvfun/4fRI2HVMoO+J6jrvhhZTTU7Rh8jSFUtba+
         ZVJ03ogQ20UwklAQhJJcXMRpkN5Dl//vuOFh7RxEsgcThsjuu/+DTk3QjwLd11U7k+H7
         GrJTAr7OFIo+pi32dOa0uH/lZFV5VeUOVHSMa4YZDMuJF0bwCdQV7jwT4Ly0x2vOnzMy
         DhP+hafodedYcg84pT7X+VDJmKoF9haQ7qWs7WkZBokJtj3cYPHAH+NbW+dJZkW4HMZv
         xx9w==
X-Forwarded-Encrypted: i=1; AL+hErHztZqDxeOCVaMA3JcRjrYRK5dqQaMWNoVinWt19hzKeC/1avoroe1QgB9b6uE+YY2ojZwj20WzgeeyrWH/Blmb@lists.infradead.org
X-Gm-Message-State: APuU4Z8Z9k6O4ReBs5XgsBmDUFjwI8TJ26OkeM4Mlzwl6gco3H8Br9pg
	oQCYEEcaWFxY7WM58moo+5/7VHTKXia/T8mjUtsvzJPqqKyiE19EK7lTMXED/L4zXw6a5+n4WXw
	C2f5lk+08/32YTCwpBN375FuYMA==
X-Received: from iloo7-n2.prod.google.com ([2002:a05:6e02:6107:20b0:54e:86af:fe5d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:191a:b0:4d5:291b:b850 with SMTP id 5614622812f47-57a0c4b956amr1020128b6e.54.1795114366859;
 Thu, 19 Nov 2026 10:52:46 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:14 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-33-coltonlewis@google.com>
Subject: [PATCH v10 32/33] KVM: selftests: Add find_bit to KVM library
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105248_823686_EA8FFD0D 
X-CRM114-Status: GOOD (  13.90  )
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

Add lib/find_bit.c to the KVM selftests build using the same wrapper
pattern as lib/rbtree.c so selftests that depend on find_bit helpers
link cleanly when built standalone.

Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm   | 1 +
 tools/testing/selftests/kvm/lib/find_bit.c | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 17a4256e90819..79b67a86208c3 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -5,6 +5,7 @@ all:
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
+LIBKVM += lib/find_bit.c
 LIBKVM += lib/guest_modes.c
 LIBKVM += lib/kvm_util.c
 LIBKVM += lib/lru_gen_util.c
diff --git a/tools/testing/selftests/kvm/lib/find_bit.c b/tools/testing/selftests/kvm/lib/find_bit.c
new file mode 100644
index 0000000000000..5534248c663f7
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/find_bit.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../../../lib/find_bit.c"
-- 
2.56.1.708.g77570a6a1d-goog


