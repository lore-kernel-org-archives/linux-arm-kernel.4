Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5247606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g038oSiP;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BtdpBjRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4sVIUCg1mtIC2+ePCzasqMqC+eD9x9qRyWJ9jhjLIbI=; b=g038oSiPdbLjQszeNAJ3W5gttI
	9kV1Xirt4B1fkaA+7bDB6WjHZf1KRmIbt8TJWRrqvMK2iQVa0epmUYUfirBOQJFR/cmdfq167dcmp
	PaO2EMPtD1c9goui9xpLoXU2XFoGBMPq+rnGzxchH+VR2qKTPmUr/cQkudEJvs1pKgAzOfbCNLvur
	mBczan13sEBo+x/D+XpUdNfZ+loqif8oXRXsBUCz+Kai3sxJkrVRiMUn07aBjErcCEefHvhygCKrx
	cjaTSaklnIKFkW7G6vOJdKZ2kkoxg7lzM9wxNR2PD71X6dw8Bykbh8F71zZ2Njyux8Mqb5oF+paLA
	t8VrGB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiUL-0000000Evd2-1bww;
	Sat, 07 Nov 2026 15:37:53 +0000
Received: from mail-ej1-f71.google.com ([209.85.218.71])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiTy-0000000Euva-2Gqo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:37:31 +0000
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c429d9d05f0so166886466b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 07:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065848; x=1794670648; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4sVIUCg1mtIC2+ePCzasqMqC+eD9x9qRyWJ9jhjLIbI=;
        b=BtdpBjRz09cMADKoYY7kCwdEwC7ixtvQzzo5JuNOaGQS/AsB9DnNLX7ZAKjT4nEjgg
         viT8W+ON4hGY6JD80GGqvztAen4j5W0nv+iNxgQF3csrEapSNUXsfGYdfGbYaG3+cN8Q
         6B8085hdIUHfM/g8nYwqo1R5oXcRy4+mAxTkBh/wb6p+JyVBdMjaz5bqhYlOpupdw5Av
         db7weOVAvNwSGniWyDknr7HaCOpI+UOvgTLTkqJGGco/4zcb6P4ATR50YI9045764teB
         zZL65Fy3rtNF7J0zunFpBWXlODM7rOYY/E4DvhUoPAxqg5B1DiV08g76djRfsMe+2vM7
         TCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065848; x=1794670648;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sVIUCg1mtIC2+ePCzasqMqC+eD9x9qRyWJ9jhjLIbI=;
        b=HlOI8RkxTyUifxQq0rCJidhVdXOSVXNgtcPT8tys3i6mR+m1Ofgpja9s6+EnaEJaGm
         9/HtugjL0h7PBvHz3yqmoZm5CfyLIfKvkCMYh++UWH2EeuBcSp7wDEHYRHJuwW72NsKO
         Axwsmqs78ns0g3lwExSyp6JXruHilDPYoxXcy1nTQwd5L50kmoOxuU9b5wkoGbcDlp4P
         SZA5ikdRjF7mVctQ3fTbhqS2hwVDT/7ZhyHfJ3hIZBSiq7Os0ywvYidkCt2Gp718QUo4
         derOR6/ASq/pFrS4FeQJaOyzROOoQ+QUQFFTjeqaHwPlfzVb7SsMcggPW3izTGKCJA59
         dwRw==
X-Forwarded-Encrypted: i=1; AL+hErE+ufGWGoo1/BBuM18jy1FnvCERq4buXJLuVxuoKudwsGrsqSw1/KCOwyMXTmAwyyX6xgFpjVGZa1Y7XdEsmZ8F@lists.infradead.org
X-Gm-Message-State: APuU4Z9S27IENfFJ9ZvOPFrtXTFLLlu42J9uSo0+LddPvmM6Vsl7JQXm
	PrTydSWODzx9tSNHQhgZpJfmZkFypYeHho6CUlSZ4kIdfwmSM9mRhtH5L7SVBsazukhwJw9G9Py
	Gdw==
X-Received: from ejka11.prod.google.com ([2002:a17:906:40cb:b0:c31:b9d1:9418])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2d08:b0:c4d:31cd:9dec
 with SMTP id a640c23a62f3a-c4d34cf871amr442259766b.30.1794065847469; Sat, 07
 Nov 2026 07:37:27 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:20 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-14-d84ea5f30f94@google.com>
Subject: [PATCH 14/24] arm64: Add mte_{enter,exit}_*_{kernel,user}_mode()
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_073730_624837_F1855A47 
X-CRM114-Status: GOOD (  11.79  )
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

Abstract away and consolidate MTE switching code by aligning with the
concepts and naming from entry-common.c, similarly to the SME routines.

Define the helpers in entry-common.c, conveniently grouped for more
straightforward enter-exit logic pair evaluation.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/kernel/entry-common.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-com=
mon.c
index 11d3f888fcd8..fbf9bafc6962 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -25,6 +25,7 @@
 #include <asm/irq_regs.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
+#include <asm/mte.h>
 #include <asm/percpu.h>
 #include <asm/processor.h>
 #include <asm/sdei.h>
@@ -68,6 +69,27 @@ static __always_inline void irqentry_exit_pcpu_adjust(st=
ruct pt_regs *regs)
 	pt_regs_write_reg(regs, reg_addr, addr);
 }
=20
+static __always_inline void mte_enter_from_kernel_mode(void)
+{
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
+}
+
+static __always_inline void mte_exit_to_kernel_mode(void)
+{
+	mte_check_tfsr_exit();
+}
+
+static __always_inline void mte_enter_from_user_mode(void)
+{
+	mte_disable_tco_entry(current);
+}
+
+static __always_inline void mte_exit_to_user_mode(void)
+{
+	mte_check_tfsr_exit();
+}
+
 /*
  * Handle IRQ/context state management when entering from kernel mode.
  * Before this function is called it is not safe to call regular kernel co=
de,
@@ -78,8 +100,7 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_=
mode(struct pt_regs *reg
 	irqentry_state_t state;
=20
 	state =3D irqentry_enter_from_kernel_mode(regs);
-	mte_check_tfsr_entry();
-	mte_disable_tco_entry(current);
+	mte_enter_from_kernel_mode();
=20
 	return state;
 }
@@ -94,7 +115,7 @@ static void noinstr __arm64_exit_to_kernel_mode(struct p=
t_regs *regs,
 {
 	local_daif_mask();
 	irqentry_exit_pcpu_adjust(regs);
-	mte_check_tfsr_exit();
+	mte_exit_to_kernel_mode();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
=20
@@ -123,7 +144,7 @@ static void noinstr arm64_exit_to_kernel_mode(struct pt=
_regs *regs,
 static __always_inline void arm64_syscall_enter_from_user_mode(struct pt_r=
egs *regs)
 {
 	enter_from_user_mode(regs);
-	mte_disable_tco_entry(current);
+	mte_enter_from_user_mode();
 	sme_enter_from_user_mode();
 }
=20
@@ -136,7 +157,7 @@ static __always_inline void arm64_enter_from_user_mode(=
struct pt_regs *regs)
 {
 	enter_from_user_mode(regs);
 	rseq_note_user_irq_entry();
-	mte_disable_tco_entry(current);
+	mte_enter_from_user_mode();
 	sme_enter_from_user_mode();
 }
=20
@@ -146,7 +167,7 @@ static __always_inline void arm64_syscall_exit_to_user_=
mode(struct pt_regs *regs
 	syscall_exit_to_user_mode_prepare(regs);
 	local_daif_mask();
 	sme_exit_to_user_mode();
-	mte_check_tfsr_exit();
+	mte_exit_to_user_mode();
 	exit_to_user_mode();
 }
=20
@@ -161,7 +182,7 @@ static __always_inline void arm64_exit_to_user_mode(str=
uct pt_regs *regs)
 	irqentry_exit_to_user_mode_prepare(regs);
 	local_daif_mask();
 	sme_exit_to_user_mode();
-	mte_check_tfsr_exit();
+	mte_exit_to_user_mode();
 	exit_to_user_mode();
 }
=20

--=20
2.56.0.455.g6c5a503b38-goog


