Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CA606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Enl7REQa;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DmNHNRbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p+Fjjmdi5J4B2FWifS6RftoxIK+iRHp+m6I2lL5hB/0=; b=Enl7REQag3zOo0
	n44EFb/PV91NdEtmz/gebt0jplpoWKJs3+m8fi4+am6YVw6uoKCwPhiWhBAHwjQTAHhcJr30niFGz
	oyzJuCSAdEaMZnJx+OheoGY7ZXgMDflAZei8WUe1O26GeMo1D2dDoKMYX9lVQHHyYLOdfDgw98oIt
	EtGbUgohtBxZ8+1l4fHYfTQpv7DkociHp1cD2v4ebfueTGposc09prw7L/VhdLQh0bGLmHnt7OKo+
	fViFOhMDYrJYlBwvT/zRkYHB0XQs7bxHFsr0HRhudXXPumGK6KN5rAhrblqvyKd7zjTjfatFBJS7S
	okIMuzgo/F1KINLuya7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6T-0000000HQeq-01Ru;
	Sun, 15 Nov 2026 11:08:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSY6K-0000000HQbl-2t57
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9E8143D;
	Sun, 15 Nov 2026 03:08:42 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D3EB3F632;
	Sun, 15 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794740925; bh=2FbQWd8+1RdCTUXDBA/AQ00/PGxMHoc55uKyePXnWLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DmNHNRbHnQzt3VBNgCI+olJ6UTmkBv1ScBnqVQw+73ClKFd+0gAqE3qeKSaishPDk
	 MFuSkn4Ask6INPqGxkwLbI9sJnwTScojYATQ+D05cJ0aaAF6g4tTe33TIg9HlShEHS
	 qXDWRJ0iYFNW6B38jiPRAS4507J7ak7YkONsH+8E=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	stable@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/3] powercap: arm_scmi: Fix potential stale zones after a skipped leaf
Date: Sun, 15 Nov 2026 11:05:44 +0000
Message-ID: <20261115110546.2344308-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115110546.2344308-1-cristian.marussi@arm.com>
References: <20261115110546.2344308-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_030848_762650_393CA8F6 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

scmi_zones_register() skips leaf zones that cannot be registered, but
returns the last leaf error when that leaf ends the traversal. Probe
then fails without unregistering the successfully registered zones,
whose private data is device-managed.

Return success after completing the traversal. Keep the existing error
return and full rollback for a failed non-leaf zone.

This issue was found by our static analysis tool under development.

Fixes: 3e767d6850f8 ("powercap: arm_scmi: Remove recursion while parsing zones")
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/powercap/arm_scmi_powercap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/arm_scmi_powercap.c
index 63a956cf8d2b..e2270476a98c 100644
--- a/drivers/powercap/arm_scmi_powercap.c
+++ b/drivers/powercap/arm_scmi_powercap.c
@@ -407,6 +407,7 @@ static int scmi_zones_register(struct device *dev,
 							       node);
 		}
 	}
+	ret = 0;
 
 out:
 	kfree(zones_stack);
-- 
2.54.0


