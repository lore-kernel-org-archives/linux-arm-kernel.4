Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A179606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ragt4OMZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KO2Ac8rw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7o7wf/XwLX8cONxvOHkzMOsn84EM2U61JcBTz69PSzA=; b=ragt4OMZ+8QcjkmAOyRxugq+x4
	aK0S3XUrj4BfE21Ts9xh39tgZ/RzU/OIa4Ce/+g6J0nuJdFKntY05OhkN/j+Sh9wIen7g/JnKkYqu
	m7QD3GnEiaBhrFHPYel0nZmzdanLD/ZquxDV2w3bL97NWHCRGgDv0gw9rLkyfaM2Gjr/nvPw2DUKV
	ae5KeCnPnd7nYqMgEoCT0Y9mKDa/IMkqZfO/eTnWce75yiKYl6U43EhYabeTSsGt6jL03LHO37w2Y
	rt9AnBRIxUbygU33WNENBXzl+CFTOzMr+acnzOW+ISuaM2Zagw5z95u3JbnGn3vSVtkSg9+4/L92j
	ohk3K+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbs-0000000F3FS-3Sq2;
	Fri, 27 Nov 2026 06:39:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbm-0000000F3DN-1lvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:38:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA80243290;
	Fri, 27 Nov 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761537;
	b=vjlGSyJbRMQE9n9K/vEW6myMhqoQ3VXrvBK106MhGmimZZYSh8jcq5eg7ulH3Y2pHFX+
	 06Wck/RD8Rs0yXje2l9qlHAbvywIilWSrXh5d0ulm4dwCRvSGZk4as3YgqLN8T36XAyvn
	 UQF6yOQgfRbH6OrMWaUdNFqcRcAxhD15Dy/oTHMWrMT++m3MR11MZV27pfk5TQirrkZqK
	 Ls76alX1uaVfdeNvxqItqSIytD85d4zq8nt6/p0iJT9f+YbUgOEyTT/Ph88PCvbcXnVnR
	 EE/DaXPkhWsVFpUTc/0sYITy+tGits0M55akwd5OTRNpPuDGcvVoLDiSsbXPV8803jw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761537;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7o7wf/XwLX8cONxvOHkzMOsn84EM2U61JcBTz69PSzA=;
	b=kHMbpMx6uJrepmHU+LAinJ5v8+hAAGarwNC4zj+zwLoL0d7c+W9Xgn3Smzjp6/0Pyxl2
	 BnZ0sS7GDThqIEwnpn8aHM86/UR3By+OhBkY05Rw+xjND3/UjY8n0v8KOG4/9iXbAnqbE
	 BqTqFjYJg/DTWzIOtixotJr80xOR3wMuqObe+jQhQEU0HvmEruwY5eXOIFqOj+/PtkdbR
	 gqJcKQbhhqoCWfh84T1Jnb9+UqslVbB9HULs52olxu5ZCdbNBt+RZmPaaU1zqyN9qlcls
	 rMH/wXxMJscX9QPTP0HuwyrLseQg5CLjQg8GTHJqMoCaKZspaErOBBT6yCnwvLL4roA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C8FE1F0089A;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761537;
	bh=7o7wf/XwLX8cONxvOHkzMOsn84EM2U61JcBTz69PSzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KO2Ac8rwA316ou6OzkV8jvxDGrZonWqRSYAHoYduw6UQo84L/KTOHFTchTNepMI0P
	 K0/rCmM0oZusw0fyeFsuwDCH27SowZ04acALnMH+g8VrrIi2Wr4bpCN93OeCK2IiP4
	 bWAp6GDptiB+ZB3u2ku1HLmzvyaZAGXltcQAIqsDYi5X7EFfx9eJvUNDN5y/fQDuST
	 JYcJI+HgXVh+wrp+emzgCm1Yac0SNyh9nFjF516yO5T8/cffY/rV4BWoMF/5X18Lu5
	 d7JCC6OM+zRUoAOImZzYGBdLqxZrWO0buN4kfP9KMlE42BsSHyPx60UyBFL0ddMhxn
	 LfwmR7Re/ZbeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E1364B5C0;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:39 +0200
Subject: [PATCH RFC 02/10] coresight: cpu-debug: Make the enable parameter
 read-only in sysfs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-2-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=S8ilSl3i/zzxTPiODOCucBWFSnR+cdlYr4OIODiodjE=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqgVMuWF/PGWT+AvTsqardj47+/nR+4lCX5hbnnMWf
 7gdKKTSUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACZiG8TwV3rmt9UpRv0Pd9Ws
 P7ztS/KNY/3+Vw88KTfNtmV8vCNBfSbDP0vN/9fiwxqPt7hFzWoov7lyH+capqehnkn3d52Vu61
 mzwoA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

A write to /sys/module/coresight_cpu_debug/parameters/enable changes
debug_enable but takes no runtime PM reference, so the driver then
reads the debug registers with their clock and power domain possibly
off. A later write to the debugfs knob finds debug_enable already set
and does nothing.

Leave the parameter for the command line and for module load, and the
debugfs knob for run time, as the documentation describes. A set
callback that does what the knob does would also work, but one run-time
interface is enough.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index edccbd2fa5e2..f9e6e344ed59 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -109,7 +109,7 @@ static int debug_count;
 static struct dentry *debug_debugfs_dir;
 
 static bool debug_enable = IS_ENABLED(CONFIG_CORESIGHT_CPU_DEBUG_DEFAULT_ON);
-module_param_named(enable, debug_enable, bool, 0600);
+module_param_named(enable, debug_enable, bool, 0400);
 MODULE_PARM_DESC(enable, "Control to enable coresight CPU debug functionality");
 
 static void debug_os_unlock(struct debug_drvdata *drvdata)

-- 
2.43.0



