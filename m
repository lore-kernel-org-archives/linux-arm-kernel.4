Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xindpZW9;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=WJI3udqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4YqDcGEuaSb36r316ZVwy5FGXCUyHgkV+c2OUEDcpEA=; b=xindpZW9D3D2CbwYUtRB+o172D
	7FXkjZnMM8OiDY1lQhS4hHhjnoZJfQnKw4Q0Ung/t+Vm07pU8CeFONSgUMz/dlT7Nnx0DuPLafnXJ
	edpmmqv8PL3TNsovp87+uLgXDQwrl2Dm6DTV15R6IESLF6NP0ivfYT3bJ+OE2BX80Jn/TjaTpOvS0
	CXfkLomtgw+hSDScdj8/cxt50YxOWXCAH4tu0xd28n7wXd1OI3UjD70pGOgofC0G+9+GHWcOhsKJM
	sM+AMdlrd0ID25Rno8x1zbbA0IJZHsWDTA03NBlrBiSYDhg7HMSBfXWHKlCTFsLyDQ3t0nFScKpAc
	axxMtJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrvp-0000000D5ND-0s25;
	Fri, 13 Nov 2026 14:07:09 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrvl-0000000D5JV-16tH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:07:07 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 549b5a705;
	Fri, 13 Nov 2026 22:06:50 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] stm: Fix potential policy leak after device unregistration
Date: Fri, 13 Nov 2026 22:06:49 +0800
Message-ID: <20261113-4e14e563a1-stm@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d53b880f03a1kunm77b03e6248228
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUofVkhLQx4ZThpOH0geHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=WJI3udqYZzLZBQrdGbwBFX1jaUAYOIeLQHYmOg67TZS5luFWKQhwT6KysuieUWezg4T41ZjJC2zxQvSnOqbnK/nHQH4e1xeDmYWzXGLMFW8w6Frry66850NH9qaLgym92lMiT5o+pz0mQUR0ue7NunJKrwNZuomN1AkOq4SvWww=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=4YqDcGEuaSb36r316ZVwy5FGXCUyHgkV+c2OUEDcpEA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_060706_167011_808AA820 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A policy can outlive its STM device. When that happens, device teardown
has already cleared policy->stm and stp_policy_release() returns without
freeing the policy.

Only skip unbinding an already unbound policy; always free its memory.

This issue was found by our static analysis tool under development.

Fixes: 4c127fd16e6b ("stm class: Fix locking in unbinding policy path")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/hwtracing/stm/policy.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/policy.c
index fabaf4b14889..ec0c9f4d693e 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -354,12 +354,11 @@ static void stp_policy_release(struct config_item *item)
 	struct stm_device *stm = policy->stm;
 
 	/* a policy *can* be unbound and still exist in configfs tree */
-	if (!stm)
-		return;
-
-	mutex_lock(&stm->policy_mutex);
-	stp_policy_unbind(policy);
-	mutex_unlock(&stm->policy_mutex);
+	if (stm) {
+		mutex_lock(&stm->policy_mutex);
+		stp_policy_unbind(policy);
+		mutex_unlock(&stm->policy_mutex);
+	}
 
 	kfree(policy);
 }

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

