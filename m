Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB876082BC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JyPgZPKv;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kLmvSZsl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J+GVWyh743BI2mtlZRPsjRNkfhIGk9NadaOmqEtxftU=; b=JyPgZPKv7912QyE/stRiScYLpK
	1DK/OTtiGjAPagAAOxJhyuxZYzI5+MInH/5attH+73WttUCFZ3Mb8QWNnf+g+g6DYkQe0baf6W8cK
	Y9EPDpJjsBOyhGkf1lbRXC4bsbjgPVl75zEdmvsRFz5URkZb640RKDkkhIe6iKc0KIGCXVKPKzXDl
	R2j25s1kr3SXCHzKFDB2eWvTG9wsypVMghPF6dM/TRafElOiBmm+CmIsKmmgATrwXHzBVF5i/QVxk
	SyvYiZGUqhOCGiV52JrroqiE0hnbxZCiJ0soGxJLp4QBTntDhVwwAyM977baSeBHfj/zQ6R/l4Mc1
	1RP3Z4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTk-0000000EumK-4ALp;
	Sat, 07 Nov 2026 15:37:17 +0000
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTe-0000000EujO-3fzZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:12 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c41b03cd1dcso155938366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065828; x=1794670628; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J+GVWyh743BI2mtlZRPsjRNkfhIGk9NadaOmqEtxftU=;
        b=kLmvSZsljP4rgShkXutvsj8tcvJE4dEnBDer97Vcnco11yRDLTil22p1M/chS6RDoG
         SdyDKYAkNrE0tT2i5FbOcOuRs639vPRuB/5XoOqNqys3z1JmE5/w4pPATH/JJNmoJWVZ
         gaKM9+6zX+64GBOaxZgMqCEWW7Fek9UXM8oTIhxIwBdMrCcIUMUDH0sAMpENVhrk904v
         qBl2Pk86/kBPLfXPRhpE03hkhRbJs+1J4WCyG/jShBExTWxUA9gIGirBJ8c6iSHRq4KP
         /NxLGX12yT0Sxth+47xd55Qg5rMEepbpKvBPjxCuFhaXMh8WP+Xjc247hM0+tiZC5wEZ
         99UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065828; x=1794670628;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+GVWyh743BI2mtlZRPsjRNkfhIGk9NadaOmqEtxftU=;
        b=tCU25irUnetln4KE02OZZRQxgEjCrxRbmxwc68idKIsSjSDLrAiGFfPfbI4LV1A1hH
         Bkh79m5EpNAw7y1oBOvzKwAtMrFFCxNgk7pfzQpJ4ncm7TvBc40SrRdjZMdf/Iig7XpU
         x7/3HzGX/M6uGGomyAZY4QhHhSD3WQE6YsmScejmSJds7svsS0y6K2l23A9LVRs0hLFZ
         K4JN3ODg+nTBZylxAkY4DLsM5uvtP9Qsyxs/ZvwHvS/6LZkx1ViRRfRjYWjKt2UobH85
         jFmjoqVF9TGNRN5RelB/wt7+xz/IT5gFHGpQGhTUauk5QtVQ4b5s9tV65cq7dQ1L5V8m
         /x8w==
X-Forwarded-Encrypted: i=1; AKwUvBx+XP8qR0wUigG+ROsn83QGXJrOCBPa6OYfUHTRvjRcC7NLp9vkpTRcEmQanxj5folX7gJMBVD9UdcJCXJ3i+x/@lists.infradead.org
X-Gm-Message-State: APuU4Z9EP+FMgkhh0d8k8tfz/R+yLg0wwKpCffBOZE4pX+KQsbNph67e
	DOmXK05Ctn/PeD1BdLOg64uLyUqrSUR7LtWxWVvwqrbyt8UZTEDuIYxCnuG2zEIqjdEAXNhgqUA
	yZw==
X-Received: from ejbo13.prod.google.com ([2002:a17:906:358d:b0:c31:7cee:94dd])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:fdcb:b0:c41:53a9:c65c
 with SMTP id a640c23a62f3a-c4d34c1fd1dmr423463666b.34.1794065828169; Sat, 07
 Nov 2026 07:37:08 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:07 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-1-d84ea5f30f94@google.com>
Subject: [PATCH 01/24] arm64: Fix lazy TCO clear when enabling user MTE
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Collingbourne <peter@pcc.me.uk>, stable@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073710_918623_52DC6B7E 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On kernel entry from EL0 with HW KASAN inactive and user MTE disabled or
in async mode, mte_disable_tco_entry() leaves PSTATE.TCO set to avoid an
expensive write, as it assumes that EL1 tag checks are not needed.

However, if the thread is in the process of enabling sync or asymm MTE,
set_mte_ctrl() updates SCTLR_EL1.TCF0 without clearing PSTATE.TCO! As a
result, kernel uaccesses miss tag faults until the next context switch.

Clear TCO in set_mte_ctrl() immediately after setting the task's SCTLR.

Cc: Peter Collingbourne <peter@pcc.me.uk>
Cc: stable@vger.kernel.org
Fixes: 38ddf7dafaea ("arm64: mte: avoid clearing PSTATE.TCO on entry unless=
 necessary")
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/kernel/mte.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 31f5c6b0510e..d1dd9b80173a 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -409,6 +409,7 @@ long set_mte_ctrl(struct task_struct *task, unsigned lo=
ng arg)
 		mte_update_sctlr_user(task);
 		mte_update_gcr_excl(task);
 		update_sctlr_el1(task->thread.sctlr_user);
+		mte_disable_tco_entry(task);
 		preempt_enable();
 	}
=20

--=20
2.56.0.455.g6c5a503b38-goog


