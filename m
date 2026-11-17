Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE20606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ue8adGRf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=E4AVYR+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:References:In-Reply-To:Message-ID:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VOSg3w5G8Xbnx2AKdYs++rrGHsDRyXjjTLHs+eSrkMQ=; b=ue8adGRfakJXA6
	ZhGb3eqsTuM56cl+6dS1nEWt9/ar6eXeow8WN31TK4qLqXUz9JfO9IUVLYtk6BRnSog+4Uh+NKI9/
	LDAa6HhOKS4HiqBr4a8DrqfsPMoGdYd8htUajHOdmsd5CSlPRqrOOH4vB+R3Q4Y/4GgNFhk/tSKE4
	m46nBR8AdKeb7tFzCpz+tCd7mUds2uvAN9qSvc49Rc7PzjZQcQlUlgAgpcXFxq34UODBVE/92ENf1
	mEZp5UibCgmkANOVrHFobRnUxOBBhU/peU+x0Pgj2vmvRmG9N5sHDu/z5Lx11BpXZF4EeLZEqTxiL
	y6aIUtZ3ono7x2xPm50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOIN-00000006o9S-34bI;
	Tue, 17 Nov 2026 18:52:43 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOIL-00000006o8P-0jBg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 18:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794941557; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=YoxvyI1geOb2qTI9ja9MrhbX+IWwUEfxKTEXMGDv7xQCDIp1OM4zee/lfXwYBJQoKcPTH7oASAU5HjDiGSBVKR3DymG5SxmIS6D/7wwHSQdaNWkVbnXCp7+aCtZyRanrlU9Q7S0tP/VR3Rc1UHLngb1OqBV0ZSK2KJxWuuDoEJ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1794941557; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VOSg3w5G8Xbnx2AKdYs++rrGHsDRyXjjTLHs+eSrkMQ=; 
	b=AzcPknis+mVeDZ1ywiPrgyl+JemHwuBpRxhOyOkVUt23gHD9PbF74/zGCnQC1cP5ZOsyH+NL/EzJdnXfjkO2MxMLVWa+NDmp6PPXVEVE8VDuoOCM9Pa6Z7vQBBO5c8p5r3MAGnQ6lt1eC1GPIjIBOnn3U/oOcB9m1g19yULjBB0=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=E4AVYR+k8RFH/HZ5Ut2t4WFWUPfq+5Yu7MGqtfGEHU7w10bHzjGW3kPOD6OYt8hJ/obMDXKfgCziyPyGPYmxzDBEoV+iYBDgxNjaevndWnGnywYZyV0zYgQB94NDMV6QJj3ln/TYmTwt56aSN/P55Cptebr0I+6YsBHfcMAuW+I=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=VOSg3w5G8Xbnx2AKdYs++rrGHsDRyXjjTLHs+eSrkMQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1794941556934975.1712581914423;
	Tue, 17 Nov 2026 19:52:36 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>,
 coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: coresight: cpu-debug: PC sampling via PMPCSR (FEAT_PCSRv8p2)?
Message-ID: <20261117-coresight-pmpcsr-reply-leo-2@iav.lv>
In-Reply-To: <20261117183241.GV9176@e132581.arm.com>
References: <20261113-coresight-pmpcsr-question-1@iav.lv>
 <20261113144623.GQ9176@e132581.arm.com>
 <20261114-coresight-pmpcsr-reply-leo-1@iav.lv>
 <20261117183241.GV9176@e132581.arm.com>
Date: Tue, 17 Nov 2026 20:50:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_105241_490342_98345BB3 
X-CRM114-Status: UNSURE (   5.87  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 06:32:41PM +0000, Leo Yan wrote:
> Could we explore a hook in the CPU hard lockup detector? Seems this
> module is more relevant to hard lockup rather than panic.

Yes, that fits better. The hard lockup detector reports a CPU that
missed its watchdog hrtimer interrupts, so it runs with IRQs masked and
is not in an idle powerdown. The backtrace request then names the CPUs
that did not answer ("these CPUS still haven't responded"). I would
sample PCSR only for those, from a hook at that point, and leave the
panic notifier alone. Does that sound right?

Thanks,
Igor

