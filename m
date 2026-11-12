Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPXvOBky;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oQjPat0A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eNrLn59jam5c0VemG10EqIofE4QIArLNVGP54AO69YQ=; b=kPXvOBkyaDqh9bDwxnMAOc+Y8d
	uXNvTjoFDFho+EratCb2czSwQUf91OfhP99jBTGOQzK0LCDtTae25hcA+2LSPq3DCSiIUZprKvJ7T
	RVU1dzyMpP9bcZJZmd9EVN4egtYROwHBvEnwezfosE5BNtbl40B0dQ2r8yg/9zZAcETNQGZEK2Zks
	zXXhdxDlvj3806fum6HsmJhNpJ5KQmS/4vyycZtuzgEMJEZ6Sz/QL/+w7VOEco/rPVi4HmQ98moVa
	LoFW5Vs4ZQtb6XVWTTYk5JpKLGT/vM3QsbYnble+y+qc9WQ6kb0ggIO01t9/SOoSw1jtbud0ap+Xo
	uOF1/2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKNz-00000008UeF-2DfV;
	Thu, 12 Nov 2026 02:17:59 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKNu-00000008Ud2-30sS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oQjPat0AWV/TassFgdImPbiZIgPkf+m5NZ+FFEZ27MHZ5gb0t5G0EjgBmoyVVYzVoOY51DQORErtT
	 rLaG8k0XgvbEEMfk+18XdZQmgVPRin9ROmHnKu0V9S/pUgExhcI2BivkixyBLWaHkYTQKCxE/Xz90M
	 WR8X6vpVjU4ea6u8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af521c635d-a9080;
	Thu, 12 Nov 2026 10:17:42 +0800 (CST)
X-RM-TRANSID: 2ee66af521c635d-a9080
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af521c44cb-ee7e0;
	Thu, 12 Nov 2026 10:17:42 +0800 (CST)
X-RM-TRANSID: 2ee86af521c44cb-ee7e0
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] coresight: Fix fwnode leak on failed connection add in ACPI path
Date: Thu, 12 Nov 2026 10:17:41 +0800
Message-ID: <20261112021741.1803-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_181755_689507_CCDA7AD0 
X-CRM114-Status: GOOD (  10.31  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In acpi_coresight_parse_graph(), acpi_coresight_parse_link() takes a
reference on the remote device's fwnode and stores it in
conn->dest_fwnode.  If coresight_add_out_conn() then fails, the
ACPI graph parser jumps to the free label without dropping that
reference.  The failed connection never enters the platform data,
so nothing ever releases it and the reference is leaked for every
failed link.

The OF path in the same file already releases the reference on the
same error path, so add the missing fwnode_handle_put() to the ACPI
path as well.

Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 93c2d075c..6b7a87680 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -718,6 +718,7 @@ static int acpi_coresight_parse_graph(struct device *dev,
 		if (dir == ACPI_CORESIGHT_LINK_MASTER) {
 			new_conn = coresight_add_out_conn(dev, pdata, &conn);
 			if (IS_ERR(new_conn)) {
+				fwnode_handle_put(conn.dest_fwnode);
 				ret = PTR_ERR(new_conn);
 				goto free;
 			}
-- 
2.50.1.windows.1




