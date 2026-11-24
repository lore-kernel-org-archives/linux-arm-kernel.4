Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A77606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADehiGSs;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I3cIDB4u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UXv2USDLjxCmkBT7t673t/L9uechNCEsT7mnauJfqOk=; b=ADehiGSskmtz6c
	YSO6D9R9P2gj+x2V+FYQXR9L50PYGnPz8NoOdjoR/mtvWy8LZeYOfyCOYa5SRQzJgyT/rggFIrCoJ
	Fub5UweHL8/rpVpouP0pXxSSPulLIjHQQcZrwrOizrYj8+6GCHptsKmOM0/i1rLcjldcJio9o+M/0
	ZUGMhpelBPEukFkUHeOTpTQZbfsQdYWMUGq4+YYAmo17JymGZu9aFbA0YTwuixU3kknJDc9v3zdUM
	1VJMVO8i2yQZs1esfZqlm0ZxDxcJDCSK6VJU7H7cm7kVk0Z4O/xYQ5gR1E4VZ27LQFRCM/zrRgGaT
	p7fHD7rLulE+KBlzxXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYr-00000007eOK-1H4K;
	Tue, 24 Nov 2026 19:52:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwYO-00000007e7f-0x17
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:51:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57986175A;
	Tue, 24 Nov 2026 11:51:44 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B4A33F763;
	Tue, 24 Nov 2026 11:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795549907; bh=jI3f070raLj7/k00GZw1QBRqUT86GTz73dk4UnjUdbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3cIDB4uhWiMlavHBp1Nyxq3mpjquLNcxo5Re1sIqaB5STCBAdqUeBWj6zBUV+y+z
	 UZu37heUAP1DJPKAwwhvkkp94NmcT5SKLgdDwHkxPw9UzUxHe0229qhG6AV4pZC4td
	 bi0APtjRbKsvgJXG6aClLawOQh2P1lyu8wMAPOwo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jonathan.cameron@oss.qualcomm.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v17 26/34] firmware: arm_scmi: Add Telemetry debugfs ABI documentation
Date: Tue, 24 Nov 2026 19:48:32 +0000
Message-ID: <20261124194841.1147072-27-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_115148_320304_59BDBEB1 
X-CRM114-Status: GOOD (  10.10  )
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

Add description of the debugfs SCMI Telemetry protocol ABI.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v15 --> v16
 - fix Kernel version/date
v5 --> v6
 - fixed typos
---
 Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
index ee7179ab2edf..b3e09142fa08 100644
--- a/Documentation/ABI/testing/debugfs-scmi
+++ b/Documentation/ABI/testing/debugfs-scmi
@@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
 		the currently configured SCMI transport for instance <n> on the
 		RX channels.
 Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
+Date:		Feb 2027
+KernelVersion:	7.5
+Contact:	cristian.marussi@arm.com
+Description:	A subdirectory grouping debug entries related to protocol <m>
+		for instance <n>. Each protocol owns and defines the subtree
+		of entries rooted under this directory.
+Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
+Date:		Feb 2027
+KernelVersion:	7.5
+Contact:	cristian.marussi@arm.com
+Description:	A set of RO files exposed by the Telemetry protocol (0x1B) in
+		order to dump the latest snapshot of each SHMTI memory area in
+		binary format: each file is named by its SHMTI id.
+		File is seekable and a seek to position zero on an open file
+		causes the SHMTI snapshot to be refreshed; file timestamps are
+		updated after each snapshot.
+		This directory reports SHMTIs for instance <n>.
+Users:		Debugging, any userspace test suite
-- 
2.54.0


