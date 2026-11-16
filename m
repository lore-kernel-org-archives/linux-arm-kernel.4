Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71A9606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qtWxlsk4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alVNNnr2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iUzaZQp5S4tbvRPCNxK/bmUolbaZVx4k2EZhZDo+zsg=; b=qtWxlsk4wa/lrx
	FrRlpKXFkwFC3JFIl/RC4eTKpIazdawVLswBX3gVEpQlerkxZ2MecLEsn2eclk6LiU/bmstbHdEDp
	/wYa90Z8g60wXy6bJjoFHk5+XpYo1G28gdqGuie4VE/0WmPa9qTqbtjUkbxnX8rD1ByhHHVt5RNGt
	fQiP2OSlnE5kD2+7fXyCqwxRi7a2wDzYgFCfLHad9b5oesvMkK4xFdIrSEdG/pxho6x876G0o6s0G
	D7FnZw3yIW5WqPmniS+i1M0IkQHMHi/UvrEu4XCrOE4Dfk6mJ1UsPeGJ7XY6/fetolyhj4gHhoT97
	iSXDMWHTwxH5+Cg3h3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYG-00000001TVB-0P6q;
	Mon, 16 Nov 2026 07:54:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrY7-00000001TRc-0Hnp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:54:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb61185057so10940805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815685; x=1795420485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUzaZQp5S4tbvRPCNxK/bmUolbaZVx4k2EZhZDo+zsg=;
        b=alVNNnr27YmSJqPK4Fz/qzOb6qQPV/yFsYcgVw9VSNu4g0vfqvsHy/x4OaXwiSUdyI
         CQ2N42EVZRsAlohmUr8FKfTYJPQxVllp4ARmO9ne8qEFocv377upXPu3I7mwqiMl/jb+
         Z3WKS5hwZEhrMfiEwi/L9wd6vMhK4lY4iwy/XJyRMPj0hTmL9S6rgJYnbVyM8SnTK4he
         jBlDl0zDKk30dEJLEoupKWVTnm+7zoOpZX5h46zk5PsaV2nGUYSfVDHDpbW0h8ki8Rk6
         w9vkmQW3t8/QJW4bVtPy50pOKmj//0UjCXbE95jMjaUWTCQGEgDf+ZVJCHXvZrsSEJun
         UpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815685; x=1795420485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iUzaZQp5S4tbvRPCNxK/bmUolbaZVx4k2EZhZDo+zsg=;
        b=E/ygMwM07wFxRf4L7SDEHbM5H5a/QoMz3rJv66NhSqf+DcpFV3SsjQS7m6hDnewfeL
         dIE9/LddCgQkTbpzC+roR68ytGMO7+IZ+Y5XLmxPRRCF+5X09YqYpQWaYgglmBse2Bhu
         R63prBjYDF82OI72hwoMYsgFAkZzWBM9/rxwkjXXCc9TAvuioXuYQU4do569+77fH8rp
         maG/4LKO+p87spHBn7pBl/sIH266cXIoN5iHGiR1mT1XaDEBPoluswtcfrmKu/Lrlnev
         y3ETO48GMss4lF/1uWRlB38y6J0ZtwSsmB5TTGiDnEiN7ySJQLiI+3Hx1Wphd25wNG4E
         76Ow==
X-Forwarded-Encrypted: i=1; AL+hErHJE5C4VjUbwDLUAEe9zfJVqNPtE4ig/YhWt1CFG6dQ5YK+O6y0XnQZ0Wsp3j/7PiVztD9hUopttu8/UnGxqppe@lists.infradead.org
X-Gm-Message-State: APuU4Z8m93Usp6tYJ9F3C46X/X8rRvuWh5Z5CsfAYRrHKWoOtsJJzX4f
	nHKK50qAmTQlFaOWaM94K0xZ5Bw/JCApNadv8Ad6fvaLC807pgA7pcbe
X-Gm-Gg: AYBFou0cZA4/4hlPhyqtu5gbfVX0f3cO2xoecXTbImiDmkN96pxEHM0iUJ3vHwj/PTX
	NywOn6Ulsik/tjPHxnVHKVCD7zMca9q6uLJI74qFjHCwceWwTk+7skTkIFDKSEtwK/hJy7hp6EV
	ndeJHKMjIfv6JgPIERzeA0CTwuwZFruS851Z29asJ9FPuK5sz+IIxbs+Nl/XGGjLGAFnVQ8B5D7
	cJpZySMblgVNLwyqHeqpIB6s6YTM+Uju4nf5Iff2XLHse0nV+SzWFHsFkuEV/0F6txgpMR4kDUl
	KOnFZ0FWNovy01mkenwq4Be5rcOmbsNNEWQCA+Pl/FEKrAGnvYR9vp5WLAs4Sk8AidMm3mgtl1e
	F+zj0gl49kuum/7BYYWYSCiegJEr4bzUz7vWYrUryP3q0LvrF8rqtsSo6z042QKndSJrWv9TEuD
	rFmRh0v8EmlmYbdfvvuCS63GIRLDFMfugfrfX95RpPDGaUqsSvIoDn8QtCcmIDGkBmT5BC0n/nl
	w+9NPfuFGwva5fkZT/QSnt1TdEGf2kV21/j4u9+z8GSkE57NwP5E8C9M0NeO/SiPwB2+uUA0Mk8
	aP0Nku01l6xBlP5pEwmj3PwkW+XFHD8EzFSB0Ii2CzJEHScPW5y1vaQ94bCTNZZenxDy2e7qShL
	NoNYx6lZG7i1SuCGn3zWILJxJNe9Htv1pPixr2mJD4qgx/XbgxuNuhRiCiPNnO6cWlsxvnvKCgU
	IzRx1Kug==
X-Received: by 2002:a05:600c:4e88:b0:4bb:7033:c936 with SMTP id 5b1f17b1804b1-4bb7033cd72mr46814345e9.24.1794815684668;
        Sun, 15 Nov 2026 23:54:44 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:44 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: Always inline preempt count and reschedule checks
Date: Mon, 16 Nov 2026 08:54:23 +0100
Message-Id: <80d8bdd8995a4b31a44e65bb9347b41c5be5226c.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235447_498455_E81C8A09 
X-CRM114-Status: GOOD (  12.84  )
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

The preempt count and reschedule checks are plain inline functions,
which permits out-of-line copies in instrumentable text. The checked
notrace helpers added by the following patch use preempt_count(), while
preempt_enable_notrace() uses should_resched() with
CONFIG_DEBUG_PREEMPT and __preempt_count_dec_and_test() without it.

Force all three operations inline so noinstr callers keep them in their
own section.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/include/asm/preempt.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd1936d..805f7b33baf09 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
@@ -75,13 +75,13 @@ static inline int __preempt_count_sub_return(int val)
 	return pc;
 }
 
-static inline bool should_resched(int preempt_offset)
+static __always_inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	return unlikely(pc == preempt_offset);
 }
 
-static inline bool __preempt_count_dec_and_test(void)
+static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
 	 * We must load the combined 'preempt_count' after decrementing

