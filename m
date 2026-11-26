Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB2606A683
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jjbiTQgL;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mERueUIe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eUEVZb1YDhBA8GAjaFHvCoUiAR9/eGDsHJnVMEiM9Uo=; b=jjbiTQgLalVJ53JOfP5RD4jMIm
	Z9Cztq3/AcLgUbMfmaDM1nwuGN30yxtmnYt1Q9znZAcZbuGjmkwTpeELfce/C9H8vrzQ9onaO95LQ
	ygl2kSbHqkJfhv9gboy/MhCakoRvBlkrFImMB3q1Cavl/tDE88fRaoMUEjIxLqwLrmOxqMSCyNsfx
	X9ZYhykRQFKh9pXSngz6UpptgT52GTsIZF49rmGAOWfEwRf2js/0E1aAkaydqFwtDQzlB3eqjqLyw
	mJ1oum+zoxy1u+4O7WY72cKrpnp47MktI5qoUUjMmu33gejUB70dcd0pwOyDJBM70pVfZqCExsB8n
	kO74ySjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVLz-0000000CTWf-06pC;
	Thu, 26 Nov 2026 09:01:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVLu-0000000CTVt-3OeK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:01:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC9715A1;
	Thu, 26 Nov 2026 01:01:06 -0800 (PST)
Received: from [127.0.1.1] (unknown [10.57.15.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 145F63F86C;
	Thu, 26 Nov 2026 01:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795683669; bh=DxUD/H5AD2DC5jD6xe9eDES9JY6xbaJlksEqO8PUqwo=;
	h=From:Date:Subject:To:Cc:From;
	b=mERueUIeFMXLXid2rqFstv54X4yupDbIpMsBVTJnH0KurNtN08rr4iHtC4JlF8Oa/
	 GW33Dz9wyA/mQ0tWtAmr+QEYFyzVWXBF8hBAm09tnUvcledjjzkcDqG/V4Oi/rJ1JH
	 wE72VudKz+cAJdm//FNzBLI8g6QZlAKK+fRslPLg=
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Thu, 26 Nov 2026 10:01:00 +0100
Subject: [PATCH] arm64: smccc: adjust quirk id to 32-bits
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-w9-v1-1-b5fad7213afe@arm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3XJLXbPkJMMkM2Mj0zSDFCWgwoKi1LTMCrAh0bEQfnFpUlZqcgl
 Ip1JtLQBt+9r8ZgAAAA==
X-Change-ID: 20261126-w9-6cb1b6325f0d
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=vincent.stehle@arm.com; h=from:subject:message-id;
 bh=DxUD/H5AD2DC5jD6xe9eDES9JY6xbaJlksEqO8PUqwo=;
 b=owGbwMvMwMV42vNHWNlitimMp9WSGLLZvwab9Ataq6wJ0lA2qiq9YSR7JHZ25KbHk855XeB8e
 f3WrRMCnYzGLAyMXAyyYoos1xNEFvRFBQgWVGjlwAxiZQKZwsDFKQATYS7hYGgvW9Au7Felu0nu
 6VqP4tUuwsxHjPz9BYN4xRw6r8d5zEzuePWyosBy7Y0Tb0T4Jhj0Cucdlajd0eS4JG7jfM1baw0
 mWPvL/ZrSqFqoWe8ptneyvj/LXtfcsGutcU/e6LLbVzplOM8y+7d0dkDyUZMzHle/HtvntrzU+h
 6TQ4ZeQc3KmdWxkS/S3oY9Ui0Q+LTxZpeh1o2TBob6yu9iX/xVOunEySafVeru8Uv7WnvTwVvch
 aGfxG5ILgl2fNezNOK3StmyFrEr8dxaElHNx5oYWDZsXngnYsbWDbqr/x7WCuw6Vs2SOffBTf2X
 jct8WJJbczI+OH8+JGa3LaqBXXy93CeeeDXVugafm+kA
X-Developer-Key: i=vincent.stehle@arm.com; a=openpgp;
 fpr=D76014A08E5A501170782A6CCB49F85676A30694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_010115_214234_894EFC6D 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The id member of the arm_smccc_quirk structure is declared as a 32-bits
int, but it is loaded as 64-bits. This will load the alignment bytes
present in the structure after id into the high part of the x9 register.

This has no effect in practice, as the alignment bytes are probably zeros,
but fix the load and compare instructions for consistency.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
This was tested manually under gdb.
---
 arch/arm64/kernel/smccc-call.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/smccc-call.S b/arch/arm64/kernel/smccc-call.S
index 2def9d0dd3ddb..63ec546722599 100644
--- a/arch/arm64/kernel/smccc-call.S
+++ b/arch/arm64/kernel/smccc-call.S
@@ -15,8 +15,8 @@
 	stp	x2, x3, [x4, #ARM_SMCCC_RES_X2_OFFS]
 	ldr	x4, [sp, #8]
 	cbz	x4, 1f /* no quirk structure */
-	ldr	x9, [x4, #ARM_SMCCC_QUIRK_ID_OFFS]
-	cmp	x9, #ARM_SMCCC_QUIRK_QCOM_A6
+	ldr	w9, [x4, #ARM_SMCCC_QUIRK_ID_OFFS]
+	cmp	w9, #ARM_SMCCC_QUIRK_QCOM_A6
 	b.ne	1f
 	str	x6, [x4, ARM_SMCCC_QUIRK_STATE_OFFS]
 1:	ret

---
base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
change-id: 20261126-w9-6cb1b6325f0d

Best regards,
--  
Vincent Stehlé <vincent.stehle@arm.com>


