Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E6606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wQjhG8S;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iLD4jD7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7lgONjZFiLXDtIrsldE+TvTto8O30yy17RDXFSv3FoQ=; b=1wQjhG8SMp4QKGqXkqO+xioH99
	4MJV+bI3X2qWanhAshqAd38/V/T7jMBzqObhU+kHhkJA0vS6Bu0sDrJXPkCRRxUKbb2mRH/vfqUkS
	/mBCdkHbEkEvh5WptCxGQU50Grh3dvrJLahlvbcapjhsN+TejSFaGOM7jXwr7TDCtHMGpX3228Vme
	30yPsgYgjD5RkUO0SN1UL0btuhD+40rQZVLKOWTtMP7rH7m90CvoxjAvoTlRFoQHEKojUdJMKYh3+
	yp0aBv9WqvXa1OPy6jURcFlAhOrbtES0yNqDWdd3fQM8fgCLIsJ1aPIwxqbA/aKsnHFioXEDBzDod
	SsVY+sUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTK9-00000001Mg8-3IzY;
	Mon, 09 Nov 2026 17:38:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTK7-00000001MfB-1cjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:38:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0972C1476;
	Mon,  9 Nov 2026 09:38:19 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C8EB3F673;
	Mon,  9 Nov 2026 09:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794245902; bh=FkTeerMLWn8diaSOkXmQ1bD8fNgfv/VqdGDACq1nSb0=;
	h=From:To:Cc:Subject:Date:From;
	b=iLD4jD7sFvk9iG+v2SBkwlR+PPM3lgUPBA3h/BwGlh3NL0CPadzvFkRL0XXF7Hdn5
	 qaWov46eCeslIKlWnVOj4G1+Y2Oad8I+a0haJhTpfXgKHZHuD2umc2FKdNJSV6P8/7
	 irqxoPO4sgjy6kUZbg+4akpqWeqdG2B4E/iEzUb4=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH] perf/arm-cmn: Sanity-check DTC discovery
Date: Mon,  9 Nov 2026 17:38:15 +0000
Message-ID: <a1abc2ce99b91db64948cfc3b639c878f896858c.1794245895.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_093827_593154_C1AB2841 
X-CRM114-Status: GOOD (  11.50  )
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

With the device isolation feature, the control registers reset to
the "all ports disabled" value and so require explicit programming
by pre-boot firmware. Apparently if firmware forgets to do this,
we can end up skipping all leaf nodes in the discovery walk due to
the CMN_CHILD_NODE_ISOLATED flag, and thus dereferencing dtc[0]
uninitialised in arm_cmn_set_state(). While this should only ever
be an "early platform bringup" kind of issue, it's not too hard to
fail a bit more politely in this case, so we may as well.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 4779472ecfb8..d88339ecf672 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2779,6 +2779,11 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 		}
 	}
 
+	if (cmn->num_dtcs == 0) {
+		dev_err(cmn->dev, "No DTCs found! Has firmware failed to program device isolation registers?\n");
+		return -ENODEV;
+	}
+
 	/* Correct for any nodes we added or skipped */
 	cmn->num_dns = dn - cmn->dns;
 
-- 
2.54.0.dirty


