Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2771B606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40bI8KAT;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=HG4M0Kco
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=91M3ZRzTa6r+vtYF4xUq8fttGYwuNmT1C5OHT99A86Q=; b=40bI8KATVOdGfp9goXnbjDk2hJ
	D4Y78wgnc7Ei8FTakInBnkFvBsZIZ0iuLhBAWq/HmpjUT8DxeRrRbRq3dbXYVvH0N+JuhBqVA68/D
	6xjvvR1XTSlAio6ckJW8qje64XrAmg3wahzbDgqg7yGtLfxVViqtciD2nQpPA291S8ekhR+s1diKG
	mBDnWoHY+cbXUlBKIhMSvs8QdEIQth9FD4vH7/HES8ByJpkQakVwO7d+v9Lb6Lp3Qng9757jQFvVg
	yREMD9sl9KOpFWku590A90is+tUAayGJt/uKC4h5ZWFw1z7DCKmOGmRsUIE8+ENAhW6Rg/D2gRg6D
	cF57gdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRryN-0000000D5ka-1xzX;
	Fri, 13 Nov 2026 14:09:47 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRryL-0000000D5j6-0evW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:09:46 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 549b5a75f;
	Fri, 13 Nov 2026 22:09:37 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] powercap: arm_scmi: Fix potential stale zones after a skipped leaf
Date: Fri, 13 Nov 2026 22:09:35 +0800
Message-ID: <20261113-4e14e563a1-powercap-scmi@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d53e10eb03a1kunmfd39574c48410
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUoYVhlNT0kZS05MSkpLSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=HG4M0KcoHMatbqoiBpR5vaR5b1PH1rT1sVRJEI7eCjcJqQFgIjdk1BkdbWdLItdQjr8b6kvfwtV/3DzoavR66zUWjZ1ACPpOoQHf0yDXQAWjnvg12Q4WBdrXJWR6eFRjmTm/AqHQvxaa1wlJZPVgGXUk0kj6wQ9wrP6bu8KGVqQ=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=91M3ZRzTa6r+vtYF4xUq8fttGYwuNmT1C5OHT99A86Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_060945_518779_C38F3D9C 
X-CRM114-Status: UNSURE (   8.31  )
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

scmi_zones_register() skips leaf zones that cannot be registered, but
returns the last leaf error when that leaf ends the traversal. Probe
then fails without unregistering the successfully registered zones,
whose private data is device-managed.

Return success after completing the traversal. Keep the existing error
return and full rollback for a failed non-leaf zone.

This issue was found by our static analysis tool under development.

Fixes: 3e767d6850f8 ("powercap: arm_scmi: Remove recursion while parsing zones")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index ab66e9a3b1e2..edc1e2823ec3 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -407,6 +407,7 @@ static int scmi_zones_register(struct device *dev,
 							       node);
 		}
 	}
+	ret = 0;
 
 out:
 	kfree(zones_stack);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

