Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 00:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fevIzRkx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Tw6QA9lE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FzNyz7yhFcBQjfkQZoaz61o5ksLdg7kgJM8huxwbLGc=; b=fevIzRkxFslFa0
	XkyH4qqnF7Z1jzlnGSZPtf0YkKSWuBadwlny0Lxubls1KZpbmN9ibHB3QUT4biowplGq0/JNThH5D
	8RC00+dvVZDQR6zyas3Hf2mp62eNfmctY/fbCmI47uD3WfXasae2uBvL/hla75HWV4gp5jMXRXLU4
	nZtQ2Dz2DvcchTVUh686aJ+/ypPWFaaxMi7tvU+qo/JI0qivYgrwvX/CABEZ6JqJsSTUFNo0XT24S
	pRUYHcp7CEPMx2YO2nZimwluiGTF6pSlJQPfo2kqAVZ5Ccs6qo3Vb5fOwHGvDgl54row0ipLR2N3Y
	JKqA1y2gYXnr4TkZzHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Ji-0000000ErCc-1Lb1;
	Sat, 14 Nov 2026 00:08:26 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Jf-0000000ErBs-1lPN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 00:08:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794614899; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DrKnYk5/ce/YxEmKMgWHZSRMRfIag2BiQgXQ7cAnO26ZcEfmIjLhkJFrKafzGdtTJ05Cb4e2o2JgxSeDnJOrYLIizvRSKU9nwmXvuPX+n7DoB7C1bxMGQiSPM1iJAgYA1MFRST+VbUOLD5VcFO/7WahP2TyjkUIzXGXRJlU7yCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794614899; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FzNyz7yhFcBQjfkQZoaz61o5ksLdg7kgJM8huxwbLGc=; 
	b=PmhHZvRQCYuww+zOAwYMU6iXEmnwFUgvSH4RmLg532IqtS+QxbburtGqlFBF6Hs0kIedFFwA0kMr2JK/rgIrCZIZmuFriONCpURTZv5uMPfnLrMXGddpjf/ZiCP2yuKDwFcfupZ/ke/zHBk3Z7jQjVf9+DC065QrMTWvwwcaClc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Tw6QA9lEIQ7DnNYcjerjQZ5IPJ+NiMVrjjEY8XA60Y93oBSfPMn11b6HLL8RrC7izumbrekU8stiEAPxIOTn57kjZNI3iGBYJB//csjK8jayTshy5pQWsoC+t6AgxDr66KY0j847/I7MeaRDTft/05QXGcbgCSpFwncDaw0v/x0=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=FzNyz7yhFcBQjfkQZoaz61o5ksLdg7kgJM8huxwbLGc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794614897039526.1916855131218;
	Sat, 14 Nov 2026 01:08:17 +0100 (CET)
Date: Sat, 14 Nov 2026 02:08:16 +0200
From: Igor Velkov <iav@iav.lv>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, Igor Velkov <iav@iav.lv>
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
In-Reply-To: <20261113144623.GQ9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv> <20261113144623.GQ9176@e132581.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_160823_734270_D0561C8D 
X-CRM114-Status: GOOD (  10.88  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 02:46:23PM +0000, Leo Yan wrote:
> For example, with CPUidle enabled, a CPU can be powered off any time so
> it still race even move sampling in smp_send_stop().

I tested this on S905X3 (Cortex-A55, PMPCSR) and RK3399 (Cortex-A53 +
A72, EDPCSR, idle states with core powerdown).

Sampling only the CPUs still online after the stop request avoids the
race: a CPU that did not stop within the timeout did not take the stop
IPI, so it is not in a powerdown state; it spins with IRQs off or is
stuck on the bus. On RK3399 the CPUs found powered down in idle all
stopped.

EDPRSR still has to be checked, and PU alone is not enough:
- A55 after CPU_OFF on the crash path: PU=0; reading PMPCSR aborts.
- A72 after CPU_OFF: PU=1, R=1 (the same in idle); reading EDPCSR
  aborts.
- S905X3: once every other core is off, even EDPRSR reads do not
  return. With a stuck core still on, reading it from the panic CPU
  worked on both SoCs, across clusters on RK3399.

The cpu-debug panic notifier reads every possible CPU after COREPURQ;
on RK3399 on the crash path without pseudo-NMI it hit an SError on the
first CPU that was off.

So I would send:
1. cpu-debug notifier: online CPUs other than the panic CPU, read only
   with PU=1, R=0 and DLK=0, no COREPURQ;
2. PMPCSR when EDDEVID.PCSample is 0 and PMDEVID.PCSample is not.

Panic notifiers run after the stop only with crash_kexec_post_notifiers;
with a crash kernel loaded and without it, they do not run at all. Is
that acceptable, or would you rather see a hook in the crash stop path?

Thanks,
Igor

