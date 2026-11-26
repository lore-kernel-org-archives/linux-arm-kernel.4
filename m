Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F043606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 23:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1x+k6Xbu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QO3cCIVe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pC+WbWVslA3nmV8xzaJ+ixKFWi0v2A29SVH3GG/vGzQ=; b=1x+k6XbuXSO1BnHtxOF+li6T1H
	hg0jtRJLMYdTXeG+aVfFPruZ5RtWS8O41S6u8qrj+6whakPMKcG4K/uLPg37yUBvT+DkRupyL1G5I
	BCg3BBVBeCRwNCA5wXI9sU6wQzq7Xk3kxZjGtFODsTh8BWmbaCfboaxRSd7RqJmmWT+wwKLilVtHZ
	2+d1KU3fwiSWs40r5rojJPloEpo0LoS8fV5N8AsEZKt01sGaMeLsmv3bimnEOlHcoawKXwuC5Ogo4
	Fle7dg1iaGW/K8MudlrhEFKnudq9skM7QbIctitL+WN8oZRfpkT6zzLwiFv8miOUxOIgIvJ9pg0qG
	k3Ews6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWivk-0000000Efcj-2Vrq;
	Thu, 26 Nov 2026 23:31:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWivj-0000000EfcD-008t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 23:31:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so676357a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 15:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735865; x=1796340665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pC+WbWVslA3nmV8xzaJ+ixKFWi0v2A29SVH3GG/vGzQ=;
        b=QO3cCIVeIUVzhJo2tKJrfX20MN47bauFY4OT0kfrd2hy+LuZbMsC4F4jOamk68LSYT
         pE/U9yVylb02R0+IBAIpH0KE5KruDzMLV34Mb6FI6jlb+Z1/vwRUp9lF07ZQ6Zu4IcOg
         9CFiWwQUVeii+qureeMZO246YtrephwEBkXkDDer9ye/IyL2MAAGXhu66KFjPYRNby6t
         xTzvvA4zl5y7zqVYqotoVzzBxiXovCQdwlqon2TbPQFQhua4Ww9Laph765cyYdjghFVx
         Q21llWA4Vlnvo0ezS5Ift5Ss2m+TZKtFFSNsvOW3OQaBOYNGQSBIaXzKTBJPYXX3oAEr
         99UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735865; x=1796340665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pC+WbWVslA3nmV8xzaJ+ixKFWi0v2A29SVH3GG/vGzQ=;
        b=XW0T/nSG7YnkQFR6Z63xsU9kJk3DYC8hq35DXooI3sqQ1H/aKPZgJht7aiSjN+jGC0
         tlziT6Z98Sjb98znbDT+df/5jwuc9j6d6/q6J3ATUVapx9rYb8HNt5/0RM4odmb0ftNc
         7cbKD7vGMH7QeLlzQD17vTsd9w7A8i5s5xfRV5yOIS2nQeoX3b9IbYKhA89Vo5H7nzhC
         41VprR7g+gJOP1zRNuGt5igAQBD4NOlVG3MdGSI/2156RwAisMPGmkPhVaQ46/20EVa6
         qeyQlQgK6maOL8q3aOcghPVsNGUJOHLsPM0+Jo/Y9ZVINZcVfFSJ8vmYGertrnEf4fJa
         OlCQ==
X-Gm-Message-State: APuU4Z+q1acTQ4HyVgWPGDvH+sF83n66jRisjt5quAldhZffch0YnSej
	78IYoVzo9x6ax6Y+qUXvCqILhtHdbGDR/EMXMqCyKv8pDtfKvMuro/xpX7lce3hC06M=
X-Gm-Gg: AZFdTZeVRP4T2cZNGb412gf0C9guF+VELn2DQ3MebC9R3Zb22uN9hUFEYE5yMGI+qjl
	Yi8YxdoZWe0Z6ZqK8BLW45U8yDMIJHRb232IucUkTA36PExQEBLiigTSlzoujtmmJe/Wfvuiijh
	oJpnO2nAv5zLknHwaxTyOy+YlrNebb7KbAJOe5eyf8xZVcjAHCVjKOOdeE50aSvMwsjIYNkDTF4
	0NSOgYejwa6XesNMdY1G3WYjtezwyUwXydJzeu7or7hxDlL7I+izU4rO1VLlF06VGQkKiF5WFSl
	NqXk0Nm8iYwjfoFGJbDFhNHteXAtqYA981eLb2GwxndgEPnJ2CHXVCrnRHUnA0X9Q+QcbRaf4tz
	GONf3eIslfIjavDg9ReXvTNhjTElbJbwbgJjCNmXr8jZ0XMZZwdhFbjj03GEJwWeB9q8lxLG5yX
	6H8E+m8Mllb7Fe+9Z7NzUnXoKSKcQVFDTQCZ4jRzd6QmMxTYjbiLkuMDywGVdV5TT89o1VB4T8r
	g7LtR5w86jZEQFgRb+wAzhc9T8Sw1PD1awdaP9ih/cO5sa1qHE6aE9IPmpKgcuNhyRW27mP2HNT
	FE02lx0ZIAQ2J/kw8rh7iq99TXgtrUfdg0PxD0poitQzF2JGYw==
X-Received: by 2002:a17:90a:e705:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3b41c7e118emr21902322a91.5.1795735865583;
        Thu, 26 Nov 2026 15:31:05 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm15404974a91.1.2026.11.26.15.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:31:05 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] arm64: stacktrace: remove trailing whitespace
Date: Thu, 26 Nov 2026 17:31:02 -0600
Message-ID: <20261126233102.71335-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_153107_037937_90625FF0 
X-CRM114-Status: GOOD (  10.98  )
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

Remove the trailing whitespace from the comment in
asm/stacktrace/frame.h.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm64/include/asm/stacktrace/frame.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/stacktrace/frame.h b/arch/arm64/include/asm/stacktrace/frame.h
index 796797b8db7e..615c27d9a738 100644
--- a/arch/arm64/include/asm/stacktrace/frame.h
+++ b/arch/arm64/include/asm/stacktrace/frame.h
@@ -26,7 +26,7 @@
 #define FRAME_META_TYPE_PT_REGS		2
 
 #ifndef __ASSEMBLER__
-/* 
+/*
  * A standard AAPCS64 frame record.
  */
 struct frame_record {
-- 
2.56.1


