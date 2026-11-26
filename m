Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D6A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XaPFR5R/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R+3idTTp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UQkC8Tq1xe+vqF6ekMwTzZzbCpLMKq5QVP3VvlYU/kM=; b=XaPFR5R/h+m3T5
	AnOK+9lFq1STNHrUqNW3uIdV2BOw85nI/gKNqUj4HwrfI5Fn3+NyAoVw9AQEVmWjIvmBBVjqUNjSn
	TkNFCOeZwk35+thBOPvKVlJMxcRsOopYw7TY5CvI5WaYCjEpd3QqNn7C2HkoFIGNvg6z94Du1RidS
	dq8+PakctxDHy5ducMYms+tHF5Mvesdf/uxeHsAvULlYVdg2AAdZSzx/h/ty6kuYlCA9NUa3ucLVA
	pi0UlcHhv4ORdTjxQblMKuJnQXT5tDCv5sZbMNCCpl9Z7nvSPaut9AW7oRqqZbwoP1Qqf2QYsGATQ
	qZISmaQbJpTo1XYZsk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWc8d-0000000DsYX-1SfW;
	Thu, 26 Nov 2026 16:15:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWc8I-0000000DsW2-2pAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 16:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795709738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQkC8Tq1xe+vqF6ekMwTzZzbCpLMKq5QVP3VvlYU/kM=;
	b=R+3idTTp3INH8GuUmX0yHSDQCmyw3ppLGEO6bIBI+xqchT3uy6hSHFliQDlT1m3YgwvnGr
	tRm0yisqh+aJxkovVvKBPYc+ZvyUOmsD//qMBzs8Z245mrpTK7/949KEqih2InvFigvUkM
	cw1Uygf90aq3fDKHl81Jgx6I4Cu+D6M=
X-MC-Rep: binary re single
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-pCsuPvD5MMOkSc40pWq5yw-1; Thu,
 26 Nov 2026 16:15:35 +0000
X-MC-Unique: pCsuPvD5MMOkSc40pWq5yw-1
X-Mimecast-MFC-AGG-ID: pCsuPvD5MMOkSc40pWq5yw_1795709734
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D4CD1955DE1;
	Thu, 26 Nov 2026 16:15:34 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CC401956045;
	Thu, 26 Nov 2026 16:15:30 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Thu, 26 Nov 2026 17:15:26 +0100
Message-ID: <20261126161526.1745191-1-jhladky@redhat.com>
In-Reply-To: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: fdCAOJdMa8lfPAGdNG-RWHRqCkENojnKOURRUIXLL5g_1795709734
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_081538_893168_73299AFC 
X-CRM114-Status: GOOD (  14.02  )
X-Spam-Score: 0.5 (/)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
restructured __arch_clear_user() and moved the loop alignment inside
the function. In doing so, the loop label ended up in front of its
own alignment directive:

	1:	.p2align 4
	USER(9f, sttr	xzr, [x0])
	add	x0, x0, #8
	subs	x1, x1, #8
	b.hi	1b

The backward branch at the bottom of the loop therefore lands in the
alignment padding, and every iteration of the 8-byte zeroing loop
needlessly executes the padding NOPs. The NOP count is fixed at
assembly time (the assembler aligns the .text section of clear_user.o
to 16 bytes), so the NOPs have been executed on every iteration since
the MOPS update. What link-time layout can change is the position of
the function, in 16-byte increments, and with it whether the NOPs and
the first sttr straddle a cache-line boundary: an irqbypass
reorganisation in 6.17 [1] moved the function, and the loop's cost
showed up as a ~30% /dev/zero read throughput regression on affected
builds.

Norman Herms diagnosed this and proposed moving the label below the
directive, so the padding is executed only once on the fall-through
path and the loop body starts 16-byte aligned as intended:

	.p2align 4
	1:
USER(9f, sttr	xzr, [x0])

Measured on Ampere Altra (Neoverse N1, no FEAT_MOPS), reading 4 GiB
from /dev/zero, two otherwise identical kernels built from the same
tree and toolchain, differing only in this change (two NOPs of
padding in the unpatched loop):

  kernel instructions per MiB:	797.5k -> 536.4k
  throughput:			11.6 GB/s -> 22.3 GB/s (+92%)

The instruction delta is exactly the two removed NOPs: 2 x 131072
instructions per MiB at 8 bytes per iteration.

[1] https://lore.kernel.org/all/20250516230734.2564775-6-seanjc@google.com/

Fixes: fe59e0358d9b ("arm64: lib: Use MOPS for usercopy routines")
Reported-by: Luke Yang <luyang@redhat.com>
Suggested-by: Norman Herms <dockseed@proton.me>
Reviewed-by: Kristina Martšenko <kristina.martsenko@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jirka Hladky <jhladky@redhat.com>
---
Changes since v3 (commit message only, no code change since v2):

- reworded the explanation per Catalin Marinas: the padding NOP
  count is fixed by the assembler rather than by link-time layout,
  and the NOPs have been in the loop since the MOPS update (the
  irqbypass rework only moved the function)
- dropped the Co-Authored-By trailer per Catalin; for the record,
  this patch and its verification were prepared with the help of an
  AI assistant
- added Cc: stable
---
 arch/arm64/lib/clear_user.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/lib/clear_user.S b/arch/arm64/lib/clear_user.S
index de9a303..143d2f7 100644
--- a/arch/arm64/lib/clear_user.S
+++ b/arch/arm64/lib/clear_user.S
@@ -37,7 +37,8 @@ USER(6f, setet	[x0]!, x1!, xzr)
 	subs	x1, x1, #8
 	b.mi	2f
 
-1:	.p2align 4
+	.p2align 4
+1:
 USER(9f, sttr	xzr, [x0])
 	add	x0, x0, #8
 	subs	x1, x1, #8
-- 
2.56.1


