Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509FA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c/5/zJtT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pLSKANXv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QdG1xkbM;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XypHC10r;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QdG1xkbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=; b=c/5/zJtTLQdZ+QZgR3zro9G3Ux
	0F77dbNlwDwFZgEJUf/EhlyK1SiMvkKMOaao+v1W9dSqqfyODBnWm3JOFDDJ9FoAXPuvhWHvcjiic
	ckWoTEbmAZHt0+lnQtdwV4L8HVHUgUs6ZGhyb/LhFjjxegmmZxX3TJDaho7s4bhVEZmYZvV4Bibtt
	SkKvPwQ7B8vmCivX/m/Rr1K039hQ9UdOw8Un2P4rs17XQr83+fv6jCOHP0L8n0WF0fQ2dPaHoUZsL
	LFtoI50PqVKChSLZhRg2NlzakhzExpOlQ6WlHSlJKRnwnCk4Xeg8L8dELGijYT4j61EG7GESr/lO1
	h6qxNQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW006-000000084yh-1Is1;
	Tue, 24 Nov 2026 23:32:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW004-000000084ya-2mBH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 23:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=; b=pLSKANXvgV74qPXxuRKmjqG/US
	h1od3ZFA4okeeVPEZpOrEqj2iOSpL1kF1EBJTOUuB3Lk0xFqPzPg1ZhZJHusDGq08BmSvRxn2wezI
	P3mdG9i38af8imp39DmK2+h2v2J265q96YId7+I4N3bQEYdJp0llbLLl7jJBXcKSreeraYOBlRQwA
	TZJOPqlhDNQG5+LPM+lXqox+/gEh891Dea3gYbz+OuyOW6mN+cb51ZyOSEz+SnW9TU6duZ6rdy5Is
	7uh2jhl8GaVJzchtUE7wlKNX5ODs+WDHVo/3kdQ+e/aVj3l+wZQlzGhNe9hZQehtCgt1aSZ4Fa6XV
	dM+tahjg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW001-00000004fE8-2Qa3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795563139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=;
	b=QdG1xkbMRSdflNGLhOV0Axzpi8J68Pq7AfOV7psfJxqrG7jDwT4X53ErUeodU4ru9dVKrb
	E0gZg1egSTfZtkE/0cyGSBettRoo5iGdZuRo8Z8Ue8iHx4s6YGE1ejwFmcCttw2ZkXK9Fa
	GTMWOfNMOio6TgeMN0cT+4+5qK7vwo4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795563150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=;
	b=XypHC10rP8cRAw/6WwKyn8pBNkoDx9/S9bhLMMIkOZxaalD2CCui90wQOvaMrIcWmg5pI0
	bLfvwwtsu9aMc+ie+ix0nMzRhPs9pqjtbxImxfIZIaD/fVitXY1zLh/6kBwMisvVnrJybE
	/Zu+stsJaTObnB0oA33Ak99D1Ya3nEs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795563139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBOlDD6px244XYB4qaQbHRXIwNQU5FJFtIEHzdxyeFI=;
	b=QdG1xkbMRSdflNGLhOV0Axzpi8J68Pq7AfOV7psfJxqrG7jDwT4X53ErUeodU4ru9dVKrb
	E0gZg1egSTfZtkE/0cyGSBettRoo5iGdZuRo8Z8Ue8iHx4s6YGE1ejwFmcCttw2ZkXK9Fa
	GTMWOfNMOio6TgeMN0cT+4+5qK7vwo4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-pWqOji_oPDew5nJUdOXeKQ-1; Tue,
 24 Nov 2026 23:32:14 +0000
X-MC-Unique: pWqOji_oPDew5nJUdOXeKQ-1
X-Mimecast-MFC-AGG-ID: pWqOji_oPDew5nJUdOXeKQ_1795563133
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 211D01954235;
	Tue, 24 Nov 2026 23:32:12 +0000 (UTC)
Received: from jhladky-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E88141F;
	Tue, 24 Nov 2026 23:32:09 +0000 (UTC)
From: Jirka Hladky <jhladky@redhat.com>
To: will@kernel.org
Cc: catalin.marinas@arm.com,
	kristina.martsenko@arm.com,
	luyang@redhat.com,
	dockseed@proton.me,
	jmario@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Claude Code <noreply@anthropic.com>
Subject: [PATCH v2] arm64: clear_user: keep alignment padding out of the zeroing loop
Date: Wed, 25 Nov 2026 00:30:43 +0100
Message-ID: <20261124233043.1289050-1-jhladky@redhat.com>
In-Reply-To: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
References: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: SZmqPpM9iIr36B6qmxnJpf9aIhE6D4idcqsz1EZBh6E_1795563133
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_233233_617407_80614B90 
X-CRM114-Status: GOOD (  13.58  )
X-Spam-Score: 2.7 (++)
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
executes however many padding NOPs the linker happened to need (0-3).
Because that count depends on where the function lands, unrelated
code changes anywhere in the kernel can shift /dev/zero read
performance: an irqbypass reorganisation in 6.17 [1] left two NOPs
in the loop and cost about 30% of /dev/zero read throughput on
affected builds.

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
Signed-off-by: Jirka Hladky <jhladky@redhat.com>

Co-Authored-By: Claude Code <noreply@anthropic.com>
---
 arm64/lib/clear_user.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arm64/lib/clear_user.S b/arm64/lib/clear_user.S
index de9a303..143d2f7 100644
--- a/arm64/lib/clear_user.S
+++ b/arm64/lib/clear_user.S
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


